import { Router } from "express";
import { authenticateToken } from "@/middlewares";
import { getActivityByDay } from "@/controllers";

const activityRouter = Router();

activityRouter.get("/:dateId", getActivityByDay)

export { activityRouter };
