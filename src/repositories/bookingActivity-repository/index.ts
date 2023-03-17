import { prisma } from "@/config";

async function createBooking( userId: number, activityId:number ) {
    return await prisma.bookingActivity.create({
        data:{
            activityId: activityId,
            userId: userId
        }
    })
}

async function getBooking(userId: number) {
  const booking = await prisma.bookingActivity.findMany({
    where:{
        userId: userId
    },
    select:{
        activityId: true
    }
  })
  return booking.map(bookingActivity => bookingActivity.activityId);
}

const bookingActivityRepository = {
    getBooking,
    createBooking
};

export default bookingActivityRepository;
