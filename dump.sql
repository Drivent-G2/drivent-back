--
-- PostgreSQL database dump
--

-- Dumped from database version 12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: TicketStatus; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."TicketStatus" AS ENUM (
    'RESERVED',
    'PAID'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Address" (
    id integer NOT NULL,
    cep character varying(255) NOT NULL,
    street character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    number character varying(255) NOT NULL,
    neighborhood character varying(255) NOT NULL,
    "addressDetail" character varying(255),
    "enrollmentId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Address_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Address_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Address_id_seq" OWNED BY public."Address".id;


--
-- Name: Booking; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Booking" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "roomId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Booking_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Booking_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Booking_id_seq" OWNED BY public."Booking".id;


--
-- Name: Enrollment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Enrollment" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    cpf character varying(255) NOT NULL,
    birthday timestamp(3) without time zone NOT NULL,
    phone character varying(255) NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Enrollment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Enrollment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Enrollment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Enrollment_id_seq" OWNED BY public."Enrollment".id;


--
-- Name: Event; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Event" (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    "backgroundImageUrl" character varying(255) NOT NULL,
    "logoImageUrl" character varying(255) NOT NULL,
    "startsAt" timestamp(3) without time zone NOT NULL,
    "endsAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Event_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Event_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Event_id_seq" OWNED BY public."Event".id;


--
-- Name: Hotel; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Hotel" (
    id integer NOT NULL,
    name text NOT NULL,
    image text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Hotel_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Hotel_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Hotel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Hotel_id_seq" OWNED BY public."Hotel".id;


--
-- Name: Payment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Payment" (
    id integer NOT NULL,
    "ticketId" integer NOT NULL,
    value integer NOT NULL,
    "cardIssuer" text NOT NULL,
    "cardLastDigits" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Payment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Payment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Payment_id_seq" OWNED BY public."Payment".id;


--
-- Name: Room; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Room" (
    id integer NOT NULL,
    name text NOT NULL,
    capacity integer NOT NULL,
    "hotelId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Room_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Room_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Room_id_seq" OWNED BY public."Room".id;


--
-- Name: Session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Session" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: Session_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Session_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Session_id_seq" OWNED BY public."Session".id;


--
-- Name: Ticket; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Ticket" (
    id integer NOT NULL,
    "ticketTypeId" integer NOT NULL,
    "enrollmentId" integer NOT NULL,
    status public."TicketStatus" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: TicketType; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."TicketType" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    "isRemote" boolean NOT NULL,
    "includesHotel" boolean NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: TicketType_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."TicketType_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: TicketType_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."TicketType_id_seq" OWNED BY public."TicketType".id;


--
-- Name: Ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Ticket_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Ticket_id_seq" OWNED BY public."Ticket".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


--
-- Name: Address id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Address" ALTER COLUMN id SET DEFAULT nextval('public."Address_id_seq"'::regclass);


--
-- Name: Booking id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Booking" ALTER COLUMN id SET DEFAULT nextval('public."Booking_id_seq"'::regclass);


--
-- Name: Enrollment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Enrollment" ALTER COLUMN id SET DEFAULT nextval('public."Enrollment_id_seq"'::regclass);


--
-- Name: Event id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Event" ALTER COLUMN id SET DEFAULT nextval('public."Event_id_seq"'::regclass);


--
-- Name: Hotel id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Hotel" ALTER COLUMN id SET DEFAULT nextval('public."Hotel_id_seq"'::regclass);


--
-- Name: Payment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Payment" ALTER COLUMN id SET DEFAULT nextval('public."Payment_id_seq"'::regclass);


--
-- Name: Room id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Room" ALTER COLUMN id SET DEFAULT nextval('public."Room_id_seq"'::regclass);


--
-- Name: Session id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Session" ALTER COLUMN id SET DEFAULT nextval('public."Session_id_seq"'::regclass);


--
-- Name: Ticket id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Ticket" ALTER COLUMN id SET DEFAULT nextval('public."Ticket_id_seq"'::regclass);


--
-- Name: TicketType id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TicketType" ALTER COLUMN id SET DEFAULT nextval('public."TicketType_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Data for Name: Address; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: Booking; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: Enrollment; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: Event; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Event" VALUES (1, 'Driven.t', 'linear-gradient(to right, #FA4098, #FFD77F)', 'https://files.driveneducation.com.br/images/logo-rounded.png', '2023-02-08 17:33:38.898', '2023-03-01 17:33:38.898', '2023-02-08 17:33:38.899', '2023-02-08 17:33:38.9');


--
-- Data for Name: Hotel; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: Payment; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: Room; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: Session; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: Ticket; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: TicketType; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public._prisma_migrations VALUES ('e20118c2-03db-4619-a2b9-5b6843e695c1', '33aae9404e976450f09d32c6fc67583bb1a8089e4e8d3ffcec2a31ccce8585ff', '2023-02-08 14:33:16.616424-03', '20220519200857_init', NULL, NULL, '2023-02-08 14:33:16.585865-03', 1);
INSERT INTO public._prisma_migrations VALUES ('b624b60b-9d5c-42fa-bea9-b5c1ff3b3e4f', 'ba7c8810f0df555b56962c3041e14416cd17d65de471d78bf21b8b018bb49a42', '2023-02-08 14:33:16.640657-03', '20220521144316_create_session_table', NULL, NULL, '2023-02-08 14:33:16.61987-03', 1);
INSERT INTO public._prisma_migrations VALUES ('bdbe5f6b-835d-438f-8183-cfe809801205', 'ed1e5e8af722430f2786f7fbe89abebbad98939e43ba4c78628fbf8d076fa793', '2023-02-08 14:33:16.661893-03', '20220521144521_change_token_collumn_to_text_type_for_session_table', NULL, NULL, '2023-02-08 14:33:16.644193-03', 1);
INSERT INTO public._prisma_migrations VALUES ('76a82c1b-caec-42de-8391-7e4f5ff6f7b0', 'dfe62bfeddd8ab53b2e50e36708deeb340d36f5ad32cbf9d59932b82a696e3ac', '2023-02-08 14:33:16.699079-03', '20220521170313_create_settings_table', NULL, NULL, '2023-02-08 14:33:16.6654-03', 1);
INSERT INTO public._prisma_migrations VALUES ('5c8ca733-8cee-45f9-aa6f-4425c463d751', 'c14ccd3fb6c78d024941ecd61b4835ba1cb21b94dbb95abc4956009a794375cf', '2023-02-08 14:33:16.726701-03', '20220521172530_create_events_table', NULL, NULL, '2023-02-08 14:33:16.702477-03', 1);
INSERT INTO public._prisma_migrations VALUES ('3a121881-d243-4050-b1bb-22c93d6571f6', '65a9f2d4602ec7b7b1fd2eaeb169ca528cfbe59b2f4d51e3b0344056c956c756', '2023-02-08 14:33:16.766383-03', '20220521191854_create_enrollment_and_adress_tables', NULL, NULL, '2023-02-08 14:33:16.729683-03', 1);
INSERT INTO public._prisma_migrations VALUES ('903dbd4c-82ed-4051-a337-3d7aa49566fa', '1b637140d19eadd7ec8189e3339ec6350847ef801bd11d8d91968b9f80bd2f6a', '2023-02-08 14:33:16.824197-03', '20220521192104_rename_address_table', NULL, NULL, '2023-02-08 14:33:16.769228-03', 1);
INSERT INTO public._prisma_migrations VALUES ('3712d66f-bf20-4aad-8c72-fc97438a6234', '4eb3418748144d88b6ac75bcdcf91027282833c012f735f4a91edd6e6ac07ec9', '2023-02-08 14:33:16.860624-03', '20220521192311_change_address_detail_column_type_to_not_requerired_for_address_table', NULL, NULL, '2023-02-08 14:33:16.8284-03', 1);
INSERT INTO public._prisma_migrations VALUES ('48743ab6-f6e6-4448-a447-7c750f35387f', '3e0c34445b4f7f94fe19a01c512154b8f34472d49516ae6b02367d712acdaef6', '2023-02-08 14:33:16.880148-03', '20220522143837_change_user_id_collumn_in_enrollments_table_to_unique', NULL, NULL, '2023-02-08 14:33:16.864077-03', 1);
INSERT INTO public._prisma_migrations VALUES ('1c7ca7f4-d250-4112-b6c7-f5daf9319005', '6620ae7b3d99518f4fe80a866e0a0d61c6d5187a178fe1ed11b5cbed277f9691', '2023-02-08 14:33:16.900985-03', '20220525152602_change_enrollmentid_on_address_to_unique', NULL, NULL, '2023-02-08 14:33:16.883092-03', 1);
INSERT INTO public._prisma_migrations VALUES ('bb60c0ff-3cee-4d09-9c8f-caf04ea4e7c1', '6bcef7c515c59372d00f9b79372c19d324dbb14e13e3b02f40d5f054ff7a1c99', '2023-02-08 14:33:16.948051-03', '20221116174837_tickets', NULL, NULL, '2023-02-08 14:33:16.903676-03', 1);
INSERT INTO public._prisma_migrations VALUES ('9e435cb2-d281-427d-911e-373fdd37a781', '0c37fd5dd680bb428544370252cb1739b590659b9c5102aafeaa10ea75a5df58', '2023-02-08 14:33:17.035548-03', '20221128215237_hotel', NULL, NULL, '2023-02-08 14:33:16.950845-03', 1);


--
-- Name: Address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Address_id_seq"', 1, false);


--
-- Name: Booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Booking_id_seq"', 1, false);


--
-- Name: Enrollment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Enrollment_id_seq"', 1, false);


--
-- Name: Event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Event_id_seq"', 1, true);


--
-- Name: Hotel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Hotel_id_seq"', 2, true);


--
-- Name: Payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Payment_id_seq"', 1, false);


--
-- Name: Room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Room_id_seq"', 1, true);


--
-- Name: Session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Session_id_seq"', 1, true);


--
-- Name: TicketType_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."TicketType_id_seq"', 1, false);


--
-- Name: Ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Ticket_id_seq"', 1, false);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, true);


--
-- Name: Address Address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT "Address_pkey" PRIMARY KEY (id);


--
-- Name: Booking Booking_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Booking"
    ADD CONSTRAINT "Booking_pkey" PRIMARY KEY (id);


--
-- Name: Enrollment Enrollment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Enrollment"
    ADD CONSTRAINT "Enrollment_pkey" PRIMARY KEY (id);


--
-- Name: Event Event_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Event"
    ADD CONSTRAINT "Event_pkey" PRIMARY KEY (id);


--
-- Name: Hotel Hotel_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Hotel"
    ADD CONSTRAINT "Hotel_pkey" PRIMARY KEY (id);


--
-- Name: Payment Payment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Payment"
    ADD CONSTRAINT "Payment_pkey" PRIMARY KEY (id);


--
-- Name: Room Room_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Room"
    ADD CONSTRAINT "Room_pkey" PRIMARY KEY (id);


--
-- Name: Session Session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_pkey" PRIMARY KEY (id);


--
-- Name: TicketType TicketType_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."TicketType"
    ADD CONSTRAINT "TicketType_pkey" PRIMARY KEY (id);


--
-- Name: Ticket Ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Ticket"
    ADD CONSTRAINT "Ticket_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Address_enrollmentId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Address_enrollmentId_key" ON public."Address" USING btree ("enrollmentId");


--
-- Name: Enrollment_userId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Enrollment_userId_key" ON public."Enrollment" USING btree ("userId");


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: Address Address_enrollmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT "Address_enrollmentId_fkey" FOREIGN KEY ("enrollmentId") REFERENCES public."Enrollment"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Booking Booking_roomId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Booking"
    ADD CONSTRAINT "Booking_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES public."Room"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Booking Booking_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Booking"
    ADD CONSTRAINT "Booking_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Enrollment Enrollment_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Enrollment"
    ADD CONSTRAINT "Enrollment_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Payment Payment_ticketId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Payment"
    ADD CONSTRAINT "Payment_ticketId_fkey" FOREIGN KEY ("ticketId") REFERENCES public."Ticket"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Room Room_hotelId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Room"
    ADD CONSTRAINT "Room_hotelId_fkey" FOREIGN KEY ("hotelId") REFERENCES public."Hotel"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Session Session_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Ticket Ticket_enrollmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Ticket"
    ADD CONSTRAINT "Ticket_enrollmentId_fkey" FOREIGN KEY ("enrollmentId") REFERENCES public."Enrollment"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Ticket Ticket_ticketTypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Ticket"
    ADD CONSTRAINT "Ticket_ticketTypeId_fkey" FOREIGN KEY ("ticketTypeId") REFERENCES public."TicketType"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

