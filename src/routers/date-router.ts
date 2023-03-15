import { Router } from "express";
import { authenticateToken } from "@/middlewares";
import { postDate, getDate } from "@/controllers";

const dateRouter = Router();

dateRouter
  .post("/", postDate)
  .get("/",authenticateToken, getDate)

export { dateRouter };
