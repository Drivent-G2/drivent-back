import dateRepository from "@/repositories/date-repository";

async function postDate(dateName: string) {
  const date = await dateRepository.createDate(dateName);
  return date;
}

async function getDate() {
  return await dateRepository.getDate();
}

const dateService = {
  postDate,
  getDate
};

export default dateService;
