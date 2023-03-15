import { prisma } from "@/config";

async function createAuditory( auditoryName: string ) {
  await prisma.auditory.create({
    data: {
      auditoryName: auditoryName,
    },
  });
}

async function getAuditory() {
  const auditory = await prisma.auditory.findMany();
  return auditory;
}

const auditoryRepository = {
  createAuditory,
  getAuditory
};

export default auditoryRepository;
