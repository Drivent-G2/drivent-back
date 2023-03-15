import { notFoundError } from "@/errors";
import eventRepository from "@/repositories/event-repository";
import { exclude } from "@/utils/prisma-utils";
import { Event } from "@prisma/client";
import dayjs from "dayjs";
import { createClient } from "redis";

const redis = createClient();

async function getFirstEvent(): Promise<GetFirstEventResult> {
  await redis.connect();
  const eventCache = await redis.get("event");

  let eventFinded;

  if(!eventCache) {
    const event = await eventRepository.findFirst();
    if (!event) throw notFoundError();

    eventFinded = exclude(event, "createdAt", "updatedAt");
    await redis.set("event", JSON.stringify(eventFinded));
  } else {
    eventFinded = JSON.parse(eventCache);
  }

  await redis.quit();
  return eventFinded;
}

export type GetFirstEventResult = Omit<Event, "createdAt" | "updatedAt">;

async function isCurrentEventActive(): Promise<boolean> {
  const event = await eventRepository.findFirst();
  if (!event) return false;

  const now = dayjs();
  const eventStartsAt = dayjs(event.startsAt.toString());
  const eventEndsAt = dayjs(event.endsAt.toString());

  return now.isAfter(eventStartsAt) && now.isBefore(eventEndsAt);
}

const eventsService = {
  getFirstEvent,
  isCurrentEventActive,
};

export default eventsService;
