import { Router } from "express";
import { authenticateToken } from "@/middlewares";
import { getAuditory,postAuditory } from "@/controllers/auditory-controller";

const auditoryRouter = Router();

auditoryRouter
  .post("/", postAuditory)
  .get("/",authenticateToken, getAuditory)

export { auditoryRouter };
