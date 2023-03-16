import { prisma } from "@/config";

async function createDate( dateName: string ) {
  await prisma.date.create({
    data: {
      dateName: dateName,
    },
  });
}

async function getDate() {
  const date = await prisma.date.findMany();
  return date;
}
async function getDateById(dateId: number) {
  const date = await prisma.date.findFirst({
    where:{
      id: dateId
    }
  });
  return date;
}

const dateRepository = {
  createDate,
  getDate,
  getDateById
};

export default dateRepository;
