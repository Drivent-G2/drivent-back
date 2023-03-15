import { notFoundError } from "@/errors";
import activityRepository from "@/repositories/activity-repository";
import dateRepository from "@/repositories/date-repository";

async function getActivity(dateId: number) {
  const date = await dateRepository.getDateById(dateId);
  console.log(date)
  if(!date){
    throw notFoundError();
  }
  return await activityRepository.getActivityBy(dateId);
}

const activityService = {
    getActivity
};

export default activityService;
