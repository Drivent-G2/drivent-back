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

const dateRepository = {
  createDate,
  getDate
};

export default dateRepository;
