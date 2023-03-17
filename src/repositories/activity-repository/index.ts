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

async function getActivityById(activityId:number){
return await prisma.activity.findFirst({
    where:{
        id: activityId
    }
})
}
async function updateCapacity (activityId:number){
await prisma.activity.update({
    where:{
        id: activityId
    },
    data:{
        capacity:{
            decrement: 1
        }
    }
});

}

const activityRepository = {
    getActivityBy,
    getActivityById,
    updateCapacity
};

export default activityRepository;