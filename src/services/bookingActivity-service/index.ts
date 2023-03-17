import { notFoundError } from "@/errors";
import activityRepository from "@/repositories/activity-repository";
import bookingActivityRepository from "@/repositories/bookingActivity-repository";

async function postBookingActivityService(userId: number, activityId:number) {
  const activity = await activityRepository.getActivityById(activityId);
  console.log(activity)
  if(!activity){
    console.log("OOOOOI")
    throw notFoundError();
  }
  const post = await bookingActivityRepository.createBooking(userId,activityId)
  if(!post){
    throw notFoundError();
  }
   await activityRepository.updateCapacity(activityId)
  console.log(post);
  return post
}

async function getBookingActivityService(userId: number) {
     return await bookingActivityRepository.getBooking(userId);
  }
  

const bookingActivityService = {
    postBookingActivityService,
    getBookingActivityService
};

export default bookingActivityService;