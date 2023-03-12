import { PrismaClient } from "@prisma/client";
import dayjs from "dayjs";
const prisma = new PrismaClient();

async function main() {
/*   const user = await prisma.user.create({
    data:{
      email: "aleatorio2@gmail.com",
      password: "aleatorio"
    }
  }) */
  await prisma.hotel.createMany({
    data:[{
      name: "Victoria Hotel",
      image: "https://www.google.com/imgres?imgurl=https%3A%2F%2Flirp.cdn-website.com%2F7f7b6d4f%2Fdms3rep%2Fmulti%2Fopt%2Ffachada%2B%25281%2529%2B%25281%2529-640w.jpg&imgrefurl=https%3A%2F%2Fwww.vitoriahoteis.com.br%2Fhotel-concept-campinas&tbnid=f92vTBnBJjHuYM&vet=12ahUKEwihlMKHzc_9AhXCMLkGHWURAEAQMygAegUIARC8AQ..i&docid=rexGFVhh8j1ApM&w=640&h=508&q=victoria%20hotel&ved=2ahUKEwihlMKHzc_9AhXCMLkGHWURAEAQMygAegUIARC8AQ"
    },
    {
      name: "Malibu Hotel",
      image: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fassets.hyatt.com%2Fcontent%2Fdam%2Fhyatt%2Fhyattdam%2Fimages%2F2017%2F08%2F29%2F1013%2FGrand-Hyatt-Rio-de-Janeiro-P443-Pool.jpg%2FGrand-Hyatt-Rio-de-Janeiro-P443-Pool.16x9.jpg%3Fimwidth%3D1920&imgrefurl=https%3A%2F%2Fwww.hyatt.com%2Fpt-PT%2Fhotel%2Fbrazil%2Fgrand-hyatt-rio-de-janeiro%2Friogh&tbnid=KHMsP2i9M7leSM&vet=12ahUKEwjYm_7Yzc_9AhVZM7kGHYF1DJ0QMygFegUIARDnAQ..i&docid=xoemK_WASTLdHM&w=1920&h=1080&q=hotel%20&ved=2ahUKEwjYm_7Yzc_9AhVZM7kGHYF1DJ0QMygFegUIARDnAQ"
    },
    {
      name: "Caribben Hotel",
      image: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia-cdn.tripadvisor.com%2Fmedia%2Fphoto-s%2F16%2F1a%2Fea%2F54%2Fhotel-presidente-4s.jpg&imgrefurl=https%3A%2F%2Fwww.tripadvisor.com.br%2FHotel_Review-g187525-d264506-Reviews-Hotel_Presidente-Benidorm_Costa_Blanca_Province_of_Alicante_Valencian_Country.html&tbnid=Cx0DZvuCBEn2sM&vet=12ahUKEwjYm_7Yzc_9AhVZM7kGHYF1DJ0QMygBegUIARDfAQ..i&docid=u1F_3dUAk_6DcM&w=550&h=367&q=hotel%20&ved=2ahUKEwjYm_7Yzc_9AhVZM7kGHYF1DJ0QMygBegUIARDfAQ"
    }
  ]
  })

 const VictoriaHotel = await prisma.hotel.findFirst({
  where:{
    name: "Victoria Hotel"
  }
 })
 const MalibuHotel = await prisma.hotel.findFirst({
  where:{
    name: "Malibu Hotel"
  }
 })
 const CaribbenHotel = await prisma.hotel.findFirst({
  where:{
    name: "Caribben Hotel"
  }
 })
 await prisma.room.createMany({
  data:[{
    name: "1",
    capacity: 1,
    hotelId: Number(VictoriaHotel?.id)
  },
  {
    name: "2",
    capacity: 1,
    hotelId: Number(VictoriaHotel?.id)
  },
  {
    name: "3",
    capacity: 2,
    hotelId: Number(VictoriaHotel?.id)
  }, {
    name: "4",
    capacity: 2,
    hotelId: Number(VictoriaHotel?.id)
  }, {
    name: "5",
    capacity: 3,
    hotelId: Number(VictoriaHotel?.id)
  }, {
    name: "6",
    capacity: 2,
    hotelId: Number(VictoriaHotel?.id)
  },
]
})
await prisma.room.createMany({
  data:[{
    name: "1",
    capacity: 1,
    hotelId: Number(MalibuHotel?.id)
  },
  {
    name: "2",
    capacity: 1,
    hotelId: Number(MalibuHotel?.id)
  },
  {
    name: "3",
    capacity: 2,
    hotelId: Number(MalibuHotel?.id)
  }, {
    name: "4",
    capacity: 2,
    hotelId: Number(MalibuHotel?.id)
  }, {
    name: "5",
    capacity: 3,
    hotelId: Number(MalibuHotel?.id)
  }, {
    name: "6",
    capacity: 2,
    hotelId: Number(MalibuHotel?.id)
  },
]
})

const RoomCaribeen = await prisma.room.createMany({
  data:[{
    name: "1",
    capacity: 1,
    hotelId: Number(CaribbenHotel?.id)
  },
  {
    name: "2",
    capacity: 1,
    hotelId: Number(CaribbenHotel?.id)
  },
  {
    name: "3",
    capacity: 2,
    hotelId: Number(CaribbenHotel?.id)
  }, {
    name: "4",
    capacity: 2,
    hotelId: Number(CaribbenHotel?.id)
  }, {
    name: "5",
    capacity: 3,
    hotelId: Number(CaribbenHotel?.id)
  }, {
    name: "6",
    capacity: 2,
    hotelId: Number(CaribbenHotel?.id)
  },
]
})


  let event = await prisma.event.findFirst();
  if (!event) {
    event = await prisma.event.create({
      data: {
        title: "Driven.t",
        logoImageUrl: "https://files.driveneducation.com.br/images/logo-rounded.png",
        backgroundImageUrl: "linear-gradient(to right, #FA4098, #FFD77F)",
        startsAt: dayjs().toDate(),
        endsAt: dayjs().add(21, "days").toDate(),
      },
    });
  }

  console.log({ event });
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
