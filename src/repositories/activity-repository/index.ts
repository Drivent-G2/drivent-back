import { prisma } from "@/config";

async function getActivityBy(dateId: number) {
    const activity = await prisma.activity.findMany({
        where:{
            dateId: dateId
        },
        include:{
            Auditory: true
        }
    })
  return activity;
}

const activityRepository = {
    getActivityBy
};

export default activityRepository;