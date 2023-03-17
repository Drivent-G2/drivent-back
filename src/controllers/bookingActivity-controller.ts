import { AuthenticatedRequest } from "@/middlewares";
import { Response } from "express";
import httpStatus from "http-status";
import bookingActivityService from "@/services/bookingActivity-service";

export async function postBookingActivity(req: AuthenticatedRequest, res: Response) {
  try {
    const { userId } = req;
    const {activityId} = req.body;
    if(!activityId){
        return res.sendStatus(httpStatus.BAD_REQUEST);
    }
    const booking = await bookingActivityService.postBookingActivityService(Number(userId), Number(activityId))
    return res.status(200).send(booking)
  } catch (error) {
    if (error.name === "NotFoundError") {
        return res.sendStatus(httpStatus.NOT_FOUND);
      }
    console.log(error);
    return res.sendStatus(httpStatus.BAD_REQUEST);
  }
}

export async function getbookingActivity(req: AuthenticatedRequest, res: Response) {
  try {
    const { userId } = req;
    const booking = await bookingActivityService.getBookingActivityService(Number(userId))
    return res.status(200).send(booking)
  } catch (error) {
    console.log(error);
    return res.sendStatus(httpStatus.BAD_REQUEST);
  }
}