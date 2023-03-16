import { AuthenticatedRequest } from "@/middlewares";
import activityService from "@/services/activity-service";
import { Response, Request } from "express";
import httpStatus from "http-status";


export async function getActivityByDay(req: AuthenticatedRequest, res: Response) {
    console.log("oiii")
    const dateId = Number(req.params.dateId);
    if(!dateId){
        return res.sendStatus(httpStatus.BAD_REQUEST);
    }
  try {
    const activity = await activityService.getActivity(dateId)
    return res.status(httpStatus.OK).send(activity);
  } catch (error) {
    if (error.name === "NotFoundError") {
        return res.sendStatus(httpStatus.NOT_FOUND);
      }
    return res.sendStatus(httpStatus.BAD_REQUEST);
  }
}