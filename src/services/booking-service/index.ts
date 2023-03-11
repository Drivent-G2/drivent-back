import { cannotBookingError, notFoundError } from "@/errors";
import roomRepository from "@/repositories/room-repository";
import bookingRepository from "@/repositories/booking-repository";
import enrollmentRepository from "@/repositories/enrollment-repository";
import tikectRepository from "@/repositories/ticket-repository";
import hotelRepository from "@/repositories/hotel-repository";

async function checkEnrollmentTicket(userId: number) {
  const enrollment = await enrollmentRepository.findWithAddressByUserId(userId);
  if (!enrollment) {
    throw cannotBookingError();
  }
  const ticket = await tikectRepository.findTicketByEnrollmentId(enrollment.id);

  if (!ticket || ticket.status === "RESERVED" || ticket.TicketType.isRemote || !ticket.TicketType.includesHotel) {
    throw cannotBookingError();
  }
}

async function checkValidBooking(roomId: number) {
  const room = await roomRepository.findById(roomId);
  const bookings = await bookingRepository.findByRoomId(roomId);

  if (!room) {
    throw notFoundError();
  }
  if (room.capacity <= bookings.length) {
    throw cannotBookingError();
  }
}

async function getBooking(userId: number) {
  const booking = await bookingRepository.findByUserId(userId);
  if (!booking) {
    throw notFoundError();
  }

  return booking;
}

async function bookingRoomById(userId: number, roomId: number) {
  await checkEnrollmentTicket(userId);
  await checkValidBooking(roomId);

  return bookingRepository.create({ roomId, userId });
}

async function createBookingArr(Rooms: any) {
  const roomIds = [];
  for (let cont = 0; cont < Rooms.length; cont++) {
    const bookings = await bookingRepository.findByRoomId(Rooms[cont].id);
    roomIds.push({ id: Rooms[cont].id, guests: bookings.length });
    if (cont === Rooms.length-1)
      return roomIds;
  }
}

async function getRoomsBookingByHotelId(userId: number, hotelId: number) {
  const { Rooms } = await hotelRepository.findRoomsByHotelId(hotelId);

  const roomIds = await createBookingArr(Rooms);

  return roomIds;
}

async function changeBookingRoomById(userId: number, roomId: number) {
  await checkValidBooking(roomId);
  const booking = await bookingRepository.findByUserId(userId);

  if (!booking || booking.userId !== userId) {
    throw cannotBookingError();
  }

  return bookingRepository.upsertBooking({
    id: booking.id,
    roomId,
    userId
  });
}

const bookingService = {
  bookingRoomById,
  getBooking,
  changeBookingRoomById,
  getRoomsBookingByHotelId
};

export default bookingService;
