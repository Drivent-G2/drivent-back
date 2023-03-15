import { AuthenticatedRequest } from "@/middlewares";
import auditoryService from "@/services/auditory-service";
import { Response, Request } from "express";
import httpStatus from "http-status";

export async function postAuditory(req: Request, res: Response) {
  const { auditoryName } = req.body;
  if(!auditoryName) {
    return res.sendStatus(httpStatus.BAD_REQUEST);
  }

  try {
    const postAuditory = await auditoryService.postAuditory(auditoryName)
    return res.status(201).send(postAuditory);
  } catch (error) {
    return res.sendStatus(httpStatus.NOT_FOUND);
  }
}

export async function getAuditory(req: AuthenticatedRequest, res: Response) {
  try {
    const datas = await auditoryService.getAuditory();
    return res.status(200).send(datas);
  } catch (error) {
    return res.sendStatus(httpStatus.BAD_REQUEST);
  }
}
