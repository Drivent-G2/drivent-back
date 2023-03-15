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
  await prisma.date.createMany({
    data: [{
      dateName: "Sexta, 21/03"
    },
    {
      dateName: "Sábado, 22/03"
    }, {
      dateName: "Domingo, 23/03"
    }
    ]
  })
  await prisma.auditory.createMany({
    data: [{
      auditoryName: "Auditório Principal"
    }, {
      auditoryName: "Auditório Lateral"
    }, {
      auditoryName: "Sala de Workshop"
    }
    ]
  })
  const principal = await prisma.auditory.findFirst({
    where: {
      auditoryName: "Auditório Principal"
    }
  })
  const lateral = await prisma.auditory.findFirst({
    where: {
      auditoryName: "Auditório Lateral"
    }
  })
  const workshop = await prisma.auditory.findFirst({
    where: {
      auditoryName: "Sala de Workshop"
    }
  })

  const sabado = await prisma.date.findFirst({
    where: {
      dateName: "Sábado, 22/03"
    }
  })
  const domingo = await prisma.date.findFirst({
    where: {
      dateName: "Domingo, 23/03"
    }
  })
  const sexta = await prisma.date.findFirst({
    where: {
      dateName: "Sexta, 21/03"
    }
  })
  await prisma.activity.createMany({
    data: [{
      auditoryId: Number(lateral?.id),
      capacity: 100,
      dateId: Number(sexta?.id),
      endsAt: 600,
      startsAt: 540
    }, {
      auditoryId: Number(principal?.id),
      capacity: 30,
      dateId: Number(sexta?.id),
      endsAt: 600,
      startsAt: 540
    },
    {
      auditoryId: Number(workshop?.id),
      capacity: 60,
      dateId: Number(sexta?.id),
      endsAt: 600,
      startsAt: 540
    },
    {
      auditoryId: Number(lateral?.id),
      capacity: 50,
      dateId: Number(sexta?.id),
      endsAt: 720,
      startsAt: 600
    },
    {
      auditoryId: Number(workshop?.id),
      capacity: 10,
      dateId: Number(sexta?.id),
      endsAt: 660,
      startsAt: 600
    },
    {
      auditoryId: Number(lateral?.id),
      capacity: 100,
      dateId: Number(sabado?.id),
      endsAt: 600,
      startsAt: 540
    }, {
      auditoryId: Number(principal?.id),
      capacity: 30,
      dateId: Number(sabado?.id),
      endsAt: 600,
      startsAt: 540
    },
    {
      auditoryId: Number(workshop?.id),
      capacity: 60,
      dateId: Number(sabado?.id),
      endsAt: 600,
      startsAt: 540
    },
    {
      auditoryId: Number(lateral?.id),
      capacity: 50,
      dateId: Number(sabado?.id),
      endsAt: 720,
      startsAt: 600
    },
    {
      auditoryId: Number(workshop?.id),
      capacity: 10,
      dateId: Number(sabado?.id),
      endsAt: 660,
      startsAt: 600
    },
    {
      auditoryId: Number(lateral?.id),
      capacity: 100,
      dateId: Number(domingo?.id),
      endsAt: 600,
      startsAt: 540
    }, {
      auditoryId: Number(principal?.id),
      capacity: 30,
      dateId: Number(domingo?.id),
      endsAt: 600,
      startsAt: 540
    },
    {
      auditoryId: Number(workshop?.id),
      capacity: 60,
      dateId: Number(domingo?.id),
      endsAt: 600,
      startsAt: 540
    },
    {
      auditoryId: Number(lateral?.id),
      capacity: 50,
      dateId: Number(domingo?.id),
      endsAt: 720,
      startsAt: 600
    },
    {
      auditoryId: Number(workshop?.id),
      capacity: 10,
      dateId: Number(domingo?.id),
      endsAt: 660,
      startsAt: 600
    },

    ]
  })
  await prisma.hotel.createMany({
    data: [{
      name: "Victoria Hotel",
      image: "https://lirp.cdn-website.com/7f7b6d4f/dms3rep/multi/opt/fachada+%281%29+%281%29-640w.jpg"
    },
    {
      name: "Malibu Hotel",
      image: "https://www.ahstatic.com/photos/1276_ho_00_p_1024x768.jpg"
    },
    {
      name: "Caribben Hotel",
      image: "https://cdn.loewshotels.com/loewshotels.com-2466770763/cms/cache/v2/620d6d91270c8.jpg/1920x1080/fit/80/eb7551cd93224863612f7472c55d933f.jpg"
    }
    ]
  })

  const VictoriaHotel = await prisma.hotel.findFirst({
    where: {
      name: "Victoria Hotel"
    }
  })
  const MalibuHotel = await prisma.hotel.findFirst({
    where: {
      name: "Malibu Hotel"
    }
  })
  const CaribbenHotel = await prisma.hotel.findFirst({
    where: {
      name: "Caribben Hotel"
    }
  })
  await prisma.room.createMany({
    data: [{
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
    data: [{
      name: "1",
      capacity: 2,
      hotelId: Number(MalibuHotel?.id)
    },
    {
      name: "2",
      capacity: 3,
      hotelId: Number(MalibuHotel?.id)
    },
    {
      name: "3",
      capacity: 1,
      hotelId: Number(MalibuHotel?.id)
    }, {
      name: "4",
      capacity: 1,
      hotelId: Number(MalibuHotel?.id)
    }, {
      name: "5",
      capacity: 3,
      hotelId: Number(MalibuHotel?.id)
    }, {
      name: "6",
      capacity: 1,
      hotelId: Number(MalibuHotel?.id)
    },
    ]
  })

  const RoomCaribeen = await prisma.room.createMany({
    data: [{
      name: "1",
      capacity: 1,
      hotelId: Number(CaribbenHotel?.id)
    },
    {
      name: "2",
      capacity: 2,
      hotelId: Number(CaribbenHotel?.id)
    },
    {
      name: "3",
      capacity: 1,
      hotelId: Number(CaribbenHotel?.id)
    }, {
      name: "4",
      capacity: 2,
      hotelId: Number(CaribbenHotel?.id)
    }, {
      name: "5",
      capacity: 1,
      hotelId: Number(CaribbenHotel?.id)
    }, {
      name: "6",
      capacity: 3,
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
        startsAt: dayjs().toDate().toString(),
        endsAt: dayjs().add(21, "days").toDate().toString(),
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
