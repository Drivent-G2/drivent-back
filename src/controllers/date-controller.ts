import { AuthenticatedRequest } from "@/middlewares";
import dateService from "@/services/date-service";
import { Response, Request } from "express";
import httpStatus from "http-status";

export async function postDate(req: Request, res: Response) {
  const { dateName } = req.body;
  if(!dateName){
    return res.sendStatus(httpStatus.BAD_REQUEST);
  }

  try {
    const postData = await dateService.postDate(dateName)
    return res.status(201).send(postData)

  } catch (error) {
    return res.sendStatus(httpStatus.NOT_FOUND);
  }
}
export async function getDate(req: AuthenticatedRequest, res: Response) {
  try {
    const datas = await dateService.getDate();
    return res.status(200).send(datas);
  } catch (error) {
    return res.sendStatus(httpStatus.BAD_REQUEST);
  }
}