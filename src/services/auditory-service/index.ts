import auditoryRepository from "@/repositories/auditory-repository";
import dateRepository from "@/repositories/date-repository";

async function postAuditory(auditoryName: string) {
  const auditory = await auditoryRepository.createAuditory(auditoryName)
  return auditory;
}

async function getAuditory() {
  return await dateRepository.getDate();
}

const auditoryService = {
    getAuditory,
    postAuditory
};

export default auditoryService;