import { cannotBookingError, notFoundError } from "@/errors";
import roomRepository from "@/repositories/room-repository";
import bookingRepository from "@/repositories/booking-repository";
import enrollmentRepository from "@/repositories/enrollment-repository";
import tikectRepository from "@/repositories/ticket-repository";

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

async function checkValidBooking(roomId: number, hotelId?: number) {
  const room = await roomRepository.findById(roomId);
  const bookings = await bookingRepository.findByRoomId(roomId);
  if(hotelId){
    if(hotelId !== room.hotelId){
      throw notFoundError()
    }
  }
  if (!room) {
    console.log("Aqui 2")
    throw notFoundError();
  }
  if (room.capacity <= bookings.length) {
    throw cannotBookingError();
  }
  return room
}

async function getBooking(userId: number) {
  const booking = await bookingRepository.findByUserId(userId);
  if (!booking) {
    throw notFoundError();
  }

  return booking;
}

async function bookingRoomById(userId: number, roomId: number, hotelId: number) {
  await checkEnrollmentTicket(userId);
  await checkValidBooking(roomId,hotelId);

  return bookingRepository.create({ roomId, userId, hotelId });
}

async function changeBookingRoomById(userId: number, roomId: number) {
  const room = await checkValidBooking(roomId);
  const booking = await bookingRepository.findByUserId(userId);
  console.log()

  if (!booking || booking.userId !== userId) {
    throw cannotBookingError();
  }

  return bookingRepository.upsertBooking({
    id: booking.id,
    roomId,
    userId,
    hotelId: room.hotelId
  });
}

const bookingService = {
  bookingRoomById,
  getBooking,
  changeBookingRoomById,
};

export default bookingService;
