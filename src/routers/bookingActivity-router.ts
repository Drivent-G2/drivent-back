import {Router} from "express"
import { authenticateToken } from "@/middlewares";
import { getbookingActivity, postBookingActivity } from "@/controllers";

const bookingActivityRouter = Router();

bookingActivityRouter
    .all("/*", authenticateToken)
    .get("", getbookingActivity)
    .post("",postBookingActivity)

    export {bookingActivityRouter}