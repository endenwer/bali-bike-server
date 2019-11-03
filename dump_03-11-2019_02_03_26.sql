--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--

DROP DATABASE prisma;




--
-- Drop roles
--

DROP ROLE prisma;


--
-- Roles
--

CREATE ROLE prisma;
ALTER ROLE prisma WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md57a3bffdb5469ef18ecee3d975f56e59e';






--
-- Database creation
--

CREATE DATABASE prisma WITH TEMPLATE = template0 OWNER = prisma;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Debian 10.5-2.pgdg90+1)
-- Dumped by pg_dump version 10.5 (Debian 10.5-2.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: prisma
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect prisma

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Debian 10.5-2.pgdg90+1)
-- Dumped by pg_dump version 10.5 (Debian 10.5-2.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: default$default; Type: SCHEMA; Schema: -; Owner: prisma
--

CREATE SCHEMA "default$default";


ALTER SCHEMA "default$default" OWNER TO prisma;

--
-- Name: management; Type: SCHEMA; Schema: -; Owner: prisma
--

CREATE SCHEMA management;


ALTER SCHEMA management OWNER TO prisma;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Bike; Type: TABLE; Schema: default$default; Owner: prisma
--

CREATE TABLE "default$default"."Bike" (
    id character varying(25) NOT NULL,
    "ownerUid" text NOT NULL,
    "modelId" integer NOT NULL,
    rating numeric(65,30),
    "reviewsCount" integer,
    "manufactureYear" integer,
    mileage integer,
    "dailyPrice" integer,
    "monthlyPrice" integer,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    status text NOT NULL,
    "weeklyPrice" integer,
    whatsapp text,
    facebook text,
    "onlyContacts" boolean,
    "addressLat" text,
    "addressLng" text,
    address text
);


ALTER TABLE "default$default"."Bike" OWNER TO prisma;

--
-- Name: Bike_areaIds; Type: TABLE; Schema: default$default; Owner: prisma
--

CREATE TABLE "default$default"."Bike_areaIds" (
    "nodeId" character varying(25) NOT NULL,
    "position" integer NOT NULL,
    value integer NOT NULL
);


ALTER TABLE "default$default"."Bike_areaIds" OWNER TO prisma;

--
-- Name: Bike_photos; Type: TABLE; Schema: default$default; Owner: prisma
--

CREATE TABLE "default$default"."Bike_photos" (
    "nodeId" character varying(25) NOT NULL,
    "position" integer NOT NULL,
    value text NOT NULL
);


ALTER TABLE "default$default"."Bike_photos" OWNER TO prisma;

--
-- Name: Booking; Type: TABLE; Schema: default$default; Owner: prisma
--

CREATE TABLE "default$default"."Booking" (
    id character varying(25) NOT NULL,
    "userUid" text NOT NULL,
    "bikeOwnerUid" text NOT NULL,
    "startDate" timestamp(3) without time zone NOT NULL,
    "endDate" timestamp(3) without time zone NOT NULL,
    "deliveryLocationLongitude" text NOT NULL,
    "deliveryLocationLongitudeDelta" text NOT NULL,
    "deliveryLocationLatitude" text NOT NULL,
    "deliveryLocationLatitudeDelta" text NOT NULL,
    "deliveryLocationAddress" text NOT NULL,
    "deliveryLocationComment" text,
    "dailyPrice" integer NOT NULL,
    "monthlyPrice" integer NOT NULL,
    "totalPrice" integer NOT NULL,
    status text NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    "weeklyPrice" integer NOT NULL
);


ALTER TABLE "default$default"."Booking" OWNER TO prisma;

--
-- Name: Review; Type: TABLE; Schema: default$default; Owner: prisma
--

CREATE TABLE "default$default"."Review" (
    id character varying(25) NOT NULL,
    rating integer NOT NULL,
    comment text,
    "createdAt" timestamp(3) without time zone NOT NULL,
    "userUid" text NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE "default$default"."Review" OWNER TO prisma;

--
-- Name: SavedBikesList; Type: TABLE; Schema: default$default; Owner: prisma
--

CREATE TABLE "default$default"."SavedBikesList" (
    id character varying(25) NOT NULL,
    "userUid" text NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE "default$default"."SavedBikesList" OWNER TO prisma;

--
-- Name: _BikeToBooking; Type: TABLE; Schema: default$default; Owner: prisma
--

CREATE TABLE "default$default"."_BikeToBooking" (
    id character(25) NOT NULL,
    "A" character varying(25) NOT NULL,
    "B" character varying(25) NOT NULL
);


ALTER TABLE "default$default"."_BikeToBooking" OWNER TO prisma;

--
-- Name: _BikeToReview; Type: TABLE; Schema: default$default; Owner: prisma
--

CREATE TABLE "default$default"."_BikeToReview" (
    id character(25) NOT NULL,
    "A" character varying(25) NOT NULL,
    "B" character varying(25) NOT NULL
);


ALTER TABLE "default$default"."_BikeToReview" OWNER TO prisma;

--
-- Name: _BikeToSavedBikesList; Type: TABLE; Schema: default$default; Owner: prisma
--

CREATE TABLE "default$default"."_BikeToSavedBikesList" (
    id character(25) NOT NULL,
    "A" character varying(25) NOT NULL,
    "B" character varying(25) NOT NULL
);


ALTER TABLE "default$default"."_BikeToSavedBikesList" OWNER TO prisma;

--
-- Name: _RelayId; Type: TABLE; Schema: default$default; Owner: prisma
--

CREATE TABLE "default$default"."_RelayId" (
    id character varying(36) NOT NULL,
    "stableModelIdentifier" character varying(25) NOT NULL
);


ALTER TABLE "default$default"."_RelayId" OWNER TO prisma;

--
-- Name: CloudSecret; Type: TABLE; Schema: management; Owner: prisma
--

CREATE TABLE management."CloudSecret" (
    secret character varying(255) NOT NULL
);


ALTER TABLE management."CloudSecret" OWNER TO prisma;

--
-- Name: InternalMigration; Type: TABLE; Schema: management; Owner: prisma
--

CREATE TABLE management."InternalMigration" (
    id character varying(255) NOT NULL,
    "appliedAt" timestamp without time zone NOT NULL
);


ALTER TABLE management."InternalMigration" OWNER TO prisma;

--
-- Name: Migration; Type: TABLE; Schema: management; Owner: prisma
--

CREATE TABLE management."Migration" (
    "projectId" character varying(200) DEFAULT ''::character varying NOT NULL,
    revision integer DEFAULT 1 NOT NULL,
    schema text,
    functions text,
    status character varying(20) DEFAULT 'PENDING'::character varying NOT NULL,
    applied integer DEFAULT 0 NOT NULL,
    "rolledBack" integer DEFAULT 0 NOT NULL,
    steps text,
    errors text,
    "startedAt" timestamp without time zone,
    "finishedAt" timestamp without time zone,
    CONSTRAINT "Migration_status_check" CHECK (((status)::text = ANY ((ARRAY['PENDING'::character varying, 'IN_PROGRESS'::character varying, 'SUCCESS'::character varying, 'ROLLING_BACK'::character varying, 'ROLLBACK_SUCCESS'::character varying, 'ROLLBACK_FAILURE'::character varying])::text[])))
);


ALTER TABLE management."Migration" OWNER TO prisma;

--
-- Name: Project; Type: TABLE; Schema: management; Owner: prisma
--

CREATE TABLE management."Project" (
    id character varying(200) DEFAULT ''::character varying NOT NULL,
    secrets text,
    "allowQueries" boolean DEFAULT true NOT NULL,
    "allowMutations" boolean DEFAULT true NOT NULL,
    functions text
);


ALTER TABLE management."Project" OWNER TO prisma;

--
-- Name: TelemetryInfo; Type: TABLE; Schema: management; Owner: prisma
--

CREATE TABLE management."TelemetryInfo" (
    id character varying(255) NOT NULL,
    "lastPinged" timestamp without time zone
);


ALTER TABLE management."TelemetryInfo" OWNER TO prisma;

--
-- Data for Name: Bike; Type: TABLE DATA; Schema: default$default; Owner: prisma
--

COPY "default$default"."Bike" (id, "ownerUid", "modelId", rating, "reviewsCount", "manufactureYear", mileage, "dailyPrice", "monthlyPrice", "updatedAt", "createdAt", status, "weeklyPrice", whatsapp, facebook, "onlyContacts", "addressLat", "addressLng", address) FROM stdin;
cjv3bpprw01lm0783iaw8ha9z	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2018	\N	99000	\N	2019-04-30 05:01:29.935	2019-04-30 05:00:44.348	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bppnf01ks0783rfjg0mlj	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2017	\N	95000	\N	2019-04-30 05:01:33.58	2019-04-30 05:00:44.187	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bppou01l20783evkuybhu	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2015	\N	65000	\N	2019-04-30 05:01:41.037	2019-04-30 05:00:44.238	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpppi01l70783wlj7cec5	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2019	\N	\N	1650000	2019-04-30 05:01:44.679	2019-04-30 05:00:44.262	ACTIVE	825000	+6281338286581	\N	t	\N	\N	\N
cjv3bppr001lh0783efzcme6q	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2016	\N	\N	1450000	2019-04-30 05:01:51.04	2019-04-30 05:00:44.316	ACTIVE	725000	+6281338286581	\N	t	\N	\N	\N
cjv3bpps901lr078390zqvghl	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2019	\N	\N	1650000	2019-04-30 05:01:54.952	2019-04-30 05:00:44.361	ACTIVE	825000	+6281338286581	\N	t	\N	\N	\N
cjv3bpptj01m60783ps9b26zp	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2017	\N	99000	\N	2019-04-30 05:02:04.685	2019-04-30 05:00:44.407	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bppty01mb0783bd5ktk8k	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2018	\N	65000	\N	2019-04-30 05:02:07.623	2019-04-30 05:00:44.422	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bppuo01mg0783cd7q2qvx	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	\N	\N	\N	\N	2019-04-30 05:02:10.433	2019-04-30 05:00:44.447	ACTIVE	\N	+6281337305970	\N	t	\N	\N	\N
cjv3bppvz01mq0783q87vx56p	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2018	\N	65000	\N	2019-04-30 05:02:17.45	2019-04-30 05:00:44.495	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bppxf01n00783t2zb3i0d	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	1	0.000000000000000000000000000000	0	\N	\N	\N	\N	2019-04-30 05:02:23.803	2019-04-30 05:00:44.543	ACTIVE	\N	+6285739309041	\N	t	\N	\N	\N
cjv3bppyz01na07839xvat90g	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	5	0.000000000000000000000000000000	0	2018	\N	200000	\N	2019-04-30 05:02:30.001	2019-04-30 05:00:44.602	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpq3701nk0783p14gsknh	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	10	0.000000000000000000000000000000	0	2015	\N	73000	\N	2019-04-30 05:02:36.043	2019-04-30 05:00:44.755	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpq4301nu0783xvj1o74j	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2017	\N	65000	\N	2019-04-30 05:02:41.653	2019-04-30 05:00:44.787	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpq4i01nz07837zy45hrk	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	1	0.000000000000000000000000000000	0	\N	\N	\N	\N	2019-04-30 05:02:44.168	2019-04-30 05:00:44.802	ACTIVE	\N	+6281337305970	\N	t	\N	\N	\N
cjv3bpq5d01o40783eijgbluf	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2019	\N	\N	1650000	2019-04-30 05:02:47.66	2019-04-30 05:00:44.833	ACTIVE	825000	+6281338286581	\N	t	\N	\N	\N
cjv3bpq6h01oe0783ijm3jzou	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2016	\N	95000	\N	2019-04-30 05:02:53.371	2019-04-30 05:00:44.872	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpq7b01oo07838wqtq87n	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2017	\N	95000	\N	2019-04-30 05:02:59.934	2019-04-30 05:00:44.903	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpq8601oy07836b0y5qb0	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2017	\N	65000	\N	2019-04-30 05:03:05.165	2019-04-30 05:00:44.934	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpq9901p80783ll8vp7s8	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2017	\N	60000	\N	2019-04-30 05:03:11.128	2019-04-30 05:00:44.973	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqa701pi0783zqczh8od	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	1	0.000000000000000000000000000000	0	2017	\N	60000	\N	2019-04-30 05:03:19.606	2019-04-30 05:00:45.007	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqb201ps0783pnwsksyl	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2017	\N	95000	\N	2019-04-30 05:03:25.929	2019-04-30 05:00:45.038	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqbr01q20783jr8medti	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2018	\N	65000	\N	2019-04-30 05:03:31.537	2019-04-30 05:00:45.063	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqcr01qc07834plxjgfg	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2016	\N	65000	\N	2019-04-30 05:03:38.624	2019-04-30 05:00:45.099	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqdj01qh0783fhdyx352	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2016	\N	95000	\N	2019-04-30 05:03:41.876	2019-04-30 05:00:45.127	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqev01qw0783tqgx5fue	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	\N	\N	\N	\N	2019-04-30 05:03:50.461	2019-04-30 05:00:45.175	ACTIVE	\N	+6287860983348	\N	t	\N	\N	\N
cjv3bpqfc01r10783zj33txlr	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2016	\N	99000	\N	2019-04-30 05:03:53.726	2019-04-30 05:00:45.192	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqfw01r60783l4rhsgo8	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	2	0.000000000000000000000000000000	0	2014	\N	\N	700000	2019-04-30 05:03:56.548	2019-04-30 05:00:45.212	ACTIVE	350000	+6281338286581	\N	t	\N	\N	\N
cjv3bpqh301rl078313uposes	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2017	\N	95000	\N	2019-04-30 05:04:06.011	2019-04-30 05:00:45.255	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqhi01rq0783xhzto7ti	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	12	0.000000000000000000000000000000	0	2017	\N	103000	\N	2019-04-30 05:04:09.89	2019-04-30 05:00:45.27	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqiq01s00783enp9w5xr	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	12	0.000000000000000000000000000000	0	2015	\N	103000	\N	2019-04-30 05:04:15.987	2019-04-30 05:00:45.314	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqjj01s50783fbmaj839	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2016	\N	\N	1450000	2019-04-30 05:04:19.554	2019-04-30 05:00:45.343	ACTIVE	725000	+6281338286581	\N	t	\N	\N	\N
cjv3bpql001sk0783g9ka7dw4	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	\N	\N	\N	\N	2019-04-30 05:04:28.809	2019-04-30 05:00:45.396	ACTIVE	\N	+6281337305970	\N	t	\N	\N	\N
cjv3bpqln01sp0783lcgthgke	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2017	\N	65000	\N	2019-04-30 05:04:30.937	2019-04-30 05:00:45.418	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqn501t407839wafew2s	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2017	\N	65000	\N	2019-04-30 05:04:39.729	2019-04-30 05:00:45.473	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqnn01t90783tbqn3ipy	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	1	0.000000000000000000000000000000	0	2016	\N	\N	750000	2019-04-30 05:04:42.477	2019-04-30 05:00:45.491	ACTIVE	375000	+6281338286581	\N	t	\N	\N	\N
cjv3bpqo101te07830oubmrkb	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	2	0.000000000000000000000000000000	0	2019	\N	\N	\N	2019-04-30 05:04:46.152	2019-04-30 05:00:45.504	ACTIVE	\N	+6285238181380	\N	t	\N	\N	\N
cjv3bpqpb01tt0783qzrxjtdd	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	1	0.000000000000000000000000000000	0	2016	\N	\N	750000	2019-04-30 05:04:56.255	2019-04-30 05:00:45.551	ACTIVE	375000	+6281338286581	\N	t	\N	\N	\N
cjv3bpqpo01ty0783ncljs5fc	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2016	\N	65000	\N	2019-04-30 05:05:00.038	2019-04-30 05:00:45.563	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqqf01u307832e0f22pd	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2019	\N	\N	1650000	2019-04-30 05:05:03.195	2019-04-30 05:00:45.591	ACTIVE	825000	+6281338286581	\N	t	\N	\N	\N
cjv3bpqrz01ui0783zogtnn9t	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	12	0.000000000000000000000000000000	0	2017	\N	103000	\N	2019-04-30 05:05:13.641	2019-04-30 05:00:45.647	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqsb01un0783eue2u2p9	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2018	\N	\N	1550000	2019-04-30 05:05:16.724	2019-04-30 05:00:45.659	ACTIVE	775000	+6281338286581	\N	t	\N	\N	\N
cjv3bpqtm01v20783wjf2aw2y	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2016	\N	99000	\N	2019-04-30 05:05:25.661	2019-04-30 05:00:45.705	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqty01v707838f7lb4wf	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	5	0.000000000000000000000000000000	0	2018	\N	200000	\N	2019-04-30 05:05:28.383	2019-04-30 05:00:45.718	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqub01vc0783jf2v8bwr	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	1	0.000000000000000000000000000000	0	2016	\N	\N	750000	2019-04-30 05:05:31.058	2019-04-30 05:00:45.731	ACTIVE	375000	+6281338286581	\N	t	\N	\N	\N
cjv3bpqvm01vr0783clzgrbis	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	10	0.000000000000000000000000000000	0	2015	\N	73000	\N	2019-04-30 05:05:40.934	2019-04-30 05:00:45.778	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqwf01w10783z79yu39t	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2016	\N	95000	\N	2019-04-30 05:05:46.37	2019-04-30 05:00:45.807	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqxc01wb0783254fbpee	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2018	\N	65000	\N	2019-04-30 05:05:51.973	2019-04-30 05:00:45.839	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bppny01kx07830d3p3y93	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2017	\N	65000	\N	2019-04-30 05:01:36.973	2019-04-30 05:00:44.206	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bppqj01lc0783s8cpyzkg	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	2	0.000000000000000000000000000000	0	2012	\N	\N	700000	2019-04-30 05:01:48.221	2019-04-30 05:00:44.294	ACTIVE	350000	+6281338286581	\N	t	\N	\N	\N
cjv3bppso01lw0783qbtrabce	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	1	0.000000000000000000000000000000	0	\N	\N	\N	\N	2019-04-30 05:01:57.892	2019-04-30 05:00:44.375	ACTIVE	\N	+6281337305970	\N	t	\N	\N	\N
cjv3bppt701m10783xoufzgfr	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	11	0.000000000000000000000000000000	0	2017	\N	70000	\N	2019-04-30 05:02:01.766	2019-04-30 05:00:44.39	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bppv901ml07835qo44x63	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	1	0.000000000000000000000000000000	0	\N	\N	\N	\N	2019-04-30 05:02:13.498	2019-04-30 05:00:44.469	ACTIVE	\N	+6285739251899	\N	t	\N	\N	\N
cjv3bppwp01mv0783aps82zsb	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	\N	\N	\N	1400000	2019-04-30 05:02:20.674	2019-04-30 05:00:44.521	ACTIVE	\N	+6281916111600	\N	t	\N	\N	\N
cjv3bppyj01n5078330pxq0wv	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2017	\N	95000	\N	2019-04-30 05:02:27.451	2019-04-30 05:00:44.587	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpq2o01nf07837tf5a8rz	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	8	0.000000000000000000000000000000	0	2017	\N	\N	650000	2019-04-30 05:02:33.067	2019-04-30 05:00:44.736	ACTIVE	325000	+6281338286581	\N	t	\N	\N	\N
cjv3bpq3k01np0783qqnxw4qv	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2017	\N	95000	\N	2019-04-30 05:02:38.983	2019-04-30 05:00:44.768	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpq5q01o90783n26ra1re	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	9	0.000000000000000000000000000000	0	2013	\N	\N	550000	2019-04-30 05:02:50.432	2019-04-30 05:00:44.845	ACTIVE	275000	+6281338286581	\N	t	\N	\N	\N
cjv3bpq6z01oj0783lwboewvp	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	1	0.000000000000000000000000000000	0	\N	\N	\N	\N	2019-04-30 05:02:57.114	2019-04-30 05:00:44.891	ACTIVE	\N	+6281337305970	\N	t	\N	\N	\N
cjv3bpq7o01ot0783suelekmb	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	1	0.000000000000000000000000000000	0	2015	\N	\N	750000	2019-04-30 05:03:02.484	2019-04-30 05:00:44.915	ACTIVE	375000	+6281338286581	\N	t	\N	\N	\N
cjv3bpq8r01p30783dvrhkuhi	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	12	0.000000000000000000000000000000	0	2014	\N	103000	\N	2019-04-30 05:03:07.947	2019-04-30 05:00:44.954	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpq9v01pd0783dhebzu0x	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2015	\N	\N	975000	2019-04-30 05:03:16.626	2019-04-30 05:00:44.995	ACTIVE	485000	+6281338286581	\N	t	\N	\N	\N
cjv3bpqap01pn0783h4p67yno	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2017	\N	95000	\N	2019-04-30 05:03:22.661	2019-04-30 05:00:45.025	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqbe01px0783086by0wp	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	1	0.000000000000000000000000000000	0	2016	\N	\N	750000	2019-04-30 05:03:28.703	2019-04-30 05:00:45.05	ACTIVE	\N	+6281916111600	\N	t	\N	\N	\N
cjv3bpqc301q70783vbtvmga6	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	\N	\N	\N	\N	2019-04-30 05:03:35.034	2019-04-30 05:00:45.075	ACTIVE	\N	+6285739309041 	\N	t	\N	\N	\N
cjv3bpqdw01qm0783ob3t9vn1	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	1	0.000000000000000000000000000000	0	2017	\N	60000	\N	2019-04-30 05:03:44.47	2019-04-30 05:00:45.14	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqe701qr0783bxkcwclk	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2019	\N	\N	1650000	2019-04-30 05:03:47.484	2019-04-30 05:00:45.151	ACTIVE	825000	+6281338286581	\N	t	\N	\N	\N
cjv3bpqgc01rb0783gy6qy1zi	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2016	\N	65000	\N	2019-04-30 05:03:59.405	2019-04-30 05:00:45.228	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqgp01rg0783gj1loj3a	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2017	\N	95000	\N	2019-04-30 05:04:02.656	2019-04-30 05:00:45.24	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqhw01rv0783a714v4tm	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2018	\N	65000	\N	2019-04-30 05:04:13.375	2019-04-30 05:00:45.283	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqjw01sa0783iika0vvb	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	\N	\N	\N	\N	2019-04-30 05:04:22.482	2019-04-30 05:00:45.355	ACTIVE	\N	+6281210462721	\N	t	\N	\N	\N
cjv3bpqkn01sf0783gz07oh7k	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2015	\N	\N	975000	2019-04-30 05:04:25.649	2019-04-30 05:00:45.383	ACTIVE	485000	+6281338286581	\N	t	\N	\N	\N
cjv3bpqme01su0783qpwmd0na	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	11	0.000000000000000000000000000000	0	2017	\N	70000	\N	2019-04-30 05:04:33.303	2019-04-30 05:00:45.446	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqms01sz078354rghwe8	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	\N	\N	\N	800000	2019-04-30 05:04:37.053	2019-04-30 05:00:45.46	ACTIVE	\N	+6281916111600	\N	t	\N	\N	\N
cjv3bpqoe01tj0783pgtug8ov	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	1	0.000000000000000000000000000000	0	\N	\N	\N	\N	2019-04-30 05:04:50.073	2019-04-30 05:00:45.518	ACTIVE	\N	+6285739309041	\N	t	\N	\N	\N
cjv3bpqos01to07835k14eixm	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	1	0.000000000000000000000000000000	0	2016	\N	60000	\N	2019-04-30 05:04:52.975	2019-04-30 05:00:45.532	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqqs01u80783i6uyijk8	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	5	0.000000000000000000000000000000	0	2018	\N	200000	\N	2019-04-30 05:05:05.555	2019-04-30 05:00:45.604	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqrg01ud0783dek8dqgp	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2016	\N	\N	1450000	2019-04-30 05:05:09.752	2019-04-30 05:00:45.627	ACTIVE	725000	+6281338286581	\N	t	\N	\N	\N
cjv3bpqsq01us07835szghyiw	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	\N	\N	\N	\N	2019-04-30 05:05:20.1	2019-04-30 05:00:45.674	ACTIVE	\N	+6285238181380	\N	t	\N	\N	\N
cjv3bpqt201ux0783s9n7rtat	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2016	\N	95000	\N	2019-04-30 05:05:22.69	2019-04-30 05:00:45.685	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpquv01vh0783mbkym2lw	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2017	\N	65000	\N	2019-04-30 05:05:34.651	2019-04-30 05:00:45.751	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqv801vm0783qaykyd5h	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	2	0.000000000000000000000000000000	0	\N	\N	\N	\N	2019-04-30 05:05:37.364	2019-04-30 05:00:45.764	ACTIVE	\N	+6281999275918	\N	t	\N	\N	\N
cjv3bpqw401vw0783320jmah2	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	11	0.000000000000000000000000000000	0	2017	\N	70000	\N	2019-04-30 05:05:43.289	2019-04-30 05:00:45.795	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqx001w60783d0kr9uyo	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	1	0.000000000000000000000000000000	0	\N	\N	\N	750000	2019-04-30 05:05:49.01	2019-04-30 05:00:45.828	ACTIVE	\N	+6281916111600	\N	t	\N	\N	\N
cjv3bpqxo01wg0783mzbod5oj	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	1	0.000000000000000000000000000000	0	2018	\N	60000	\N	2019-04-30 05:05:55.744	2019-04-30 05:00:45.851	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqyn01wv0783qeeec7yy	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	1	0.000000000000000000000000000000	0	2012	\N	\N	575000	2019-04-30 05:06:03.877	2019-04-30 05:00:45.887	ACTIVE	285000	+6281338286581	\N	t	\N	\N	\N
cjv3bpqzi01x50783cssbfsge	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	9	0.000000000000000000000000000000	0	2014	\N	\N	550000	2019-04-30 05:06:09.635	2019-04-30 05:00:45.918	ACTIVE	275000	+6281338286581	\N	t	\N	\N	\N
cjv3bpr0d01xf0783ftkdzjg6	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2017	\N	95000	\N	2019-04-30 05:06:15.04	2019-04-30 05:00:45.948	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpr1c01xu0783c5sq2uc9	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2019	\N	\N	1650000	2019-04-30 05:06:22.725	2019-04-30 05:00:45.984	ACTIVE	825000	+6281338286581	\N	t	\N	\N	\N
cjv3bpr2c01y40783ps5rllcz	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	11	0.000000000000000000000000000000	0	2017	\N	70000	\N	2019-04-30 05:06:28.948	2019-04-30 05:00:46.02	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjvcbaikn02fn0783vgm9znvv	itagKgJhTBPYZWjGJpe61AsdDY53	17	0.000000000000000000000000000000	0	\N	\N	300000	3500000	2019-05-09 04:04:32.938	2019-05-06 11:58:50.759	ACTIVE	1500000	+79117091129	\N	t	\N	\N	\N
cjvcb0ce702fi07839ukbdyt8	itagKgJhTBPYZWjGJpe61AsdDY53	15	0.000000000000000000000000000000	0	2018	10000	400000	4500000	2019-05-10 11:43:59.762	2019-05-06 11:50:56.19	ACTIVE	2000000	+79117091129	\N	t	\N	\N	\N
cjv3bpqxz01wl078349h7rej4	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2017	\N	95000	\N	2019-04-30 05:05:58.408	2019-04-30 05:00:45.863	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpqyb01wq07834r1vmkc5	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	\N	\N	\N	\N	2019-04-30 05:06:01.411	2019-04-30 05:00:45.875	ACTIVE	\N	+6285739309041	\N	t	\N	\N	\N
cjv3bpqz701x00783mdpkiyfx	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2015	\N	65000	\N	2019-04-30 05:06:06.69	2019-04-30 05:00:45.907	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpr0101xa0783kwzaglpp	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	1	0.000000000000000000000000000000	0	2017	\N	\N	750000	2019-04-30 05:06:12.602	2019-04-30 05:00:45.937	ACTIVE	375000	+6281338286581	\N	t	\N	\N	\N
cjv3bpr0p01xk07836owa16d9	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	11	0.000000000000000000000000000000	0	2016	\N	73000	\N	2019-04-30 05:06:17.554	2019-04-30 05:00:45.961	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpr1001xp0783v4gn81iz	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2017	\N	65000	\N	2019-04-30 05:06:20.185	2019-04-30 05:00:45.972	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpr1p01xz0783f9fao404	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	4	0.000000000000000000000000000000	0	2015	\N	95000	\N	2019-04-30 05:06:25.569	2019-04-30 05:00:45.995	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv3bpr2n01y90783cycc2s4c	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	3	0.000000000000000000000000000000	0	2017	\N	65000	\N	2019-04-30 05:06:32.574	2019-04-30 05:00:46.031	ACTIVE	\N	+6281237628584	\N	t	\N	\N	\N
cjv6qm07l02e10783rqxc5gjz	itagKgJhTBPYZWjGJpe61AsdDY53	13	0.000000000000000000000000000000	0	2016	14000	300000	3500000	2019-05-09 04:04:18.643	2019-05-02 14:21:04.016	ACTIVE	1500000	+79117091129	\N	t	\N	\N	\N
cjvcblpvz02fs07835dzlj1mo	itagKgJhTBPYZWjGJpe61AsdDY53	16	0.000000000000000000000000000000	0	2016	\N	300000	3500000	2019-05-10 11:44:10.478	2019-05-06 12:07:33.454	ACTIVE	1500000	+79117091129	\N	t	\N	\N	\N
cjuatrcyk00e207837d2i66jn	7j1ngZ8JSAV8b67oRVvomW5mRZo1	4	0.000000000000000000000000000000	0	2018	4200	140000	1800000	2019-04-18 01:34:39.971	2019-04-10 06:20:35.03	ACTIVE	980000	\N	\N	t	\N	\N	\N
cjuatuita00e70783hawnpvxt	7j1ngZ8JSAV8b67oRVvomW5mRZo1	4	0.000000000000000000000000000000	0	2018	4200	140000	1800000	2019-04-18 01:34:44.792	2019-04-10 06:23:02.59	ACTIVE	980000	\N	\N	t	\N	\N	\N
cjuausyv000eo0783ad13z9tx	7j1ngZ8JSAV8b67oRVvomW5mRZo1	6	0.000000000000000000000000000000	0	2018	3200	80000	1500000	2019-04-18 01:34:47.163	2019-04-10 06:49:49.687	ACTIVE	560000	\N	\N	t	\N	\N	\N
cjv3bppmj01kn0783qg1p3jxe	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	7	0.000000000000000000000000000000	0	2017	\N	\N	650000	2019-04-30 05:01:17.95	2019-04-30 05:00:44.155	ACTIVE	325000	+6281338286581	\N	t	\N	\N	\N
cjvbzkgrw02f50783oie9wts3	itagKgJhTBPYZWjGJpe61AsdDY53	14	0.000000000000000000000000000000	0	\N	\N	300000	3500000	2019-05-10 11:43:50.266	2019-05-06 06:30:39.596	ACTIVE	1500000	+79117091129	\N	t	\N	\N	\N
\.


--
-- Data for Name: Bike_areaIds; Type: TABLE DATA; Schema: default$default; Owner: prisma
--

COPY "default$default"."Bike_areaIds" ("nodeId", "position", value) FROM stdin;
cjvbzkgrw02f50783oie9wts3	1000	2
cjvbzkgrw02f50783oie9wts3	2000	1
cjvbzkgrw02f50783oie9wts3	3000	3
cjvbzkgrw02f50783oie9wts3	4000	4
cjvbzkgrw02f50783oie9wts3	5000	5
cjvbzkgrw02f50783oie9wts3	6000	6
cjvbzkgrw02f50783oie9wts3	7000	7
cjvbzkgrw02f50783oie9wts3	8000	9
cjvbzkgrw02f50783oie9wts3	9000	10
cjvbzkgrw02f50783oie9wts3	10000	11
cjvbzkgrw02f50783oie9wts3	11000	12
cjvbzkgrw02f50783oie9wts3	12000	13
cjvbzkgrw02f50783oie9wts3	13000	14
cjuatrcyk00e207837d2i66jn	1000	4
cjuatrcyk00e207837d2i66jn	2000	6
cjuatrcyk00e207837d2i66jn	3000	7
cjuatuita00e70783hawnpvxt	1000	4
cjuatuita00e70783hawnpvxt	2000	6
cjuatuita00e70783hawnpvxt	3000	7
cjuausyv000eo0783ad13z9tx	1000	4
cjuausyv000eo0783ad13z9tx	2000	6
cjuausyv000eo0783ad13z9tx	3000	7
cjv3bppso01lw0783qbtrabce	1000	2
cjv3bppuo01mg0783cd7q2qvx	1000	2
cjv3bppv901ml07835qo44x63	1000	2
cjv3bppxf01n00783t2zb3i0d	1000	2
cjv3bpq4i01nz07837zy45hrk	1000	2
cjv3bpq6z01oj0783lwboewvp	1000	2
cjv3bpqc301q70783vbtvmga6	1000	2
cjv3bpqev01qw0783tqgx5fue	1000	2
cjv3bpqjw01sa0783iika0vvb	1000	2
cjv3bpql001sk0783g9ka7dw4	1000	2
cjv3bpqo101te07830oubmrkb	1000	2
cjv3bpqoe01tj0783pgtug8ov	1000	2
cjv3bpqsq01us07835szghyiw	1000	2
cjv3bpqv801vm0783qaykyd5h	1000	2
cjv3bpqyb01wq07834r1vmkc5	1000	2
cjv6qm07l02e10783rqxc5gjz	1000	2
cjv6qm07l02e10783rqxc5gjz	2000	1
cjv6qm07l02e10783rqxc5gjz	3000	3
cjv6qm07l02e10783rqxc5gjz	4000	4
cjv6qm07l02e10783rqxc5gjz	5000	5
cjv6qm07l02e10783rqxc5gjz	6000	6
cjv6qm07l02e10783rqxc5gjz	7000	7
cjv6qm07l02e10783rqxc5gjz	8000	10
cjv6qm07l02e10783rqxc5gjz	9000	11
cjv6qm07l02e10783rqxc5gjz	10000	13
cjv6qm07l02e10783rqxc5gjz	11000	14
cjv6qm07l02e10783rqxc5gjz	12000	12
cjv6qm07l02e10783rqxc5gjz	13000	9
cjvcbaikn02fn0783vgm9znvv	1000	1
cjvcbaikn02fn0783vgm9znvv	2000	2
cjvcbaikn02fn0783vgm9znvv	3000	3
cjvcbaikn02fn0783vgm9znvv	4000	4
cjvcbaikn02fn0783vgm9znvv	5000	5
cjvcbaikn02fn0783vgm9znvv	6000	6
cjvcbaikn02fn0783vgm9znvv	7000	7
cjvcbaikn02fn0783vgm9znvv	8000	9
cjvcbaikn02fn0783vgm9znvv	9000	10
cjvcbaikn02fn0783vgm9znvv	10000	11
cjvcbaikn02fn0783vgm9znvv	11000	12
cjvcbaikn02fn0783vgm9znvv	12000	13
cjvcbaikn02fn0783vgm9znvv	13000	14
cjvcblpvz02fs07835dzlj1mo	1000	1
cjvcblpvz02fs07835dzlj1mo	2000	2
cjvcblpvz02fs07835dzlj1mo	3000	3
cjvcblpvz02fs07835dzlj1mo	4000	4
cjvcblpvz02fs07835dzlj1mo	5000	5
cjvcblpvz02fs07835dzlj1mo	6000	6
cjvcblpvz02fs07835dzlj1mo	7000	7
cjvcblpvz02fs07835dzlj1mo	8000	9
cjvcblpvz02fs07835dzlj1mo	9000	10
cjvcblpvz02fs07835dzlj1mo	10000	11
cjvcblpvz02fs07835dzlj1mo	11000	12
cjvcblpvz02fs07835dzlj1mo	12000	13
cjvcblpvz02fs07835dzlj1mo	13000	14
cjvcb0ce702fi07839ukbdyt8	1000	1
cjvcb0ce702fi07839ukbdyt8	2000	2
cjvcb0ce702fi07839ukbdyt8	3000	3
cjvcb0ce702fi07839ukbdyt8	4000	4
cjvcb0ce702fi07839ukbdyt8	5000	5
cjvcb0ce702fi07839ukbdyt8	6000	6
cjvcb0ce702fi07839ukbdyt8	7000	7
cjvcb0ce702fi07839ukbdyt8	8000	9
cjvcb0ce702fi07839ukbdyt8	9000	10
cjvcb0ce702fi07839ukbdyt8	10000	11
cjvcb0ce702fi07839ukbdyt8	11000	12
cjvcb0ce702fi07839ukbdyt8	12000	13
cjvcb0ce702fi07839ukbdyt8	13000	14
\.


--
-- Data for Name: Bike_photos; Type: TABLE DATA; Schema: default$default; Owner: prisma
--

COPY "default$default"."Bike_photos" ("nodeId", "position", value) FROM stdin;
cjv3bpqzi01x50783cssbfsge	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_e2b06157-92e8-461b-a9d4-77bf3e362ad2.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=MMUnEWcVxFeoMtzLseKDotEw2TxmQlUqyMqzRagzuLAp%2FUgTnGprjFqhrAtVs5WY7pBkTywhLeKOnTczrLcNikRNqpDmQ9XGXhqLd0%2BD%2Bsd4VabcvkjNUzyXNlLH5dSVJ8mE1%2FmaFML%2B0Ee5VKliQOxyLq767PAIv%2FHXXpjX4QUtgRwcxVVKC6t8Jb2tul4yF5%2BsSM%2FoDmy%2F4W8Hfq%2BH%2BN53C1JEsmG2Me7RcPkEGKOaH0PG7I5LWOcZUGy5OakM8rTUX20%2FvV56LK2hhaRrPw2dPLCAdbW5R1OsklY68vCvFseDuDc4QyVsq5HfQlMF886MiLbZYMye0I8B5iu9Ng%3D%3D
cjv3bpr0d01xf0783ftkdzjg6	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_1cd8653c-a195-4cba-8e2f-10078e9d5130.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=CWTGeookBtRuGmhnPWLL8ARWRW79hJZIIa0ANlvFc6OCrXbWLnHhCodzswSnxkNGVrYr6tjIO7JFbhbOxSGsQ05yHo2X3jp86zMhSOiUyTiIgqTFM71qvajTc1ENbtb0piDHaPGsPc4GO5XjI8%2FvHwPUd0ITy%2FVbT54YlU%2BF0rOIMYfwP0K9NGrjZ%2BMSEK%2FZbq57nUyFIGl3rVtmpY%2F4eUOtlp1dsCoD8AoGeKev06ybEVBaeoW0xY18OyAn4ZnvPu5aJWi6QAfFHJhFU2zlLr9lkPssW3ny33UrqqcyYbzLKdne%2FAZnAHsNn%2BG%2B4PsSD1wPZXLUz0S2C3y3pUksJQ%3D%3D
cjv3bpr1001xp0783v4gn81iz	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_b532caf0-936e-4318-b120-3c702b5c8273.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=ofrji%2FkJEiwMCSj4goMt2WAfsHBIkfcZl5l5eUySYsA3rzv39xAnkHTu4Gk0sMlMM%2BfmSerAg0S7OfYwlwq6BAb5WYrDoMQZPuVFLmCLTr699GgS1iIGpBCBcJe1%2FAYwQEsoYMy5fHNnePGtLOvuMIvSPzq%2BpMzzJwAAVm0VkM6bcNww846s9W6lLCMzYk%2BvAZZ45b2APCsO1D1nvDsKDCWTCDf6K1juUE3QLuADTotwUtSICT79kTrOLnYjJ0q4x1IU9MhfT%2BtDVNq6qJ2CL0khUDtH4QvuJPTVJ1ZudrEqgJS4MeXl3pPAjGQzA8N6gU7sG%2FmxKu1C%2FhbGpuSDOQ%3D%3D
cjv3bpr1p01xz0783f9fao404	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_e2e056da-e6f3-4c8d-9f80-bfc7cb7c83c0.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=vDhE8E%2B6pZ%2Fp%2F88tvdNPn5i%2BPTtFtC%2BOXTXx8RwJcZxcs6S4AZOdShUKYBa%2FZegrRJEXAfkUPot0ArQ%2FuwlmCaIeab0%2FPdnnt9gEcyUAKbxmy4h28VCQfERo07VWnRqfLkecAgLLcotvDYzpcLWQinDZjQuLaAwcmWGsAeqdsXRkAclYxujbUGkvV2tKcC%2BQCXdpm6POGygyYE39%2FUZpqo3rxK0qzzF975uI28deZlcksvUHEGe1nhVsIMUm4zeV8Hu03dtrXfcUonpbt6i6mJh8TORWBBlrZssis5ABQZfYwpEjMVz9Gx8PufZjDj%2BHj0znSclCNM9YxQapatJXMw%3D%3D
cjv3bpr2n01y90783cycc2s4c	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_9e2c047e-e655-4b95-98c0-bc651170c1c2.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=A2vDEnMkPPs08uwlQQsWOFL1psIe5wnVVV2Ay1Bo5aCwQrwxvP5MhcTlb9AkIKIMWBV3DTSxrvtZyJ%2BSNuWC3vSqMjNURdgq6vSlNZcrj%2FLUBMvY%2BlV6uh0LSJIPtcPEfVFuuANxIlZkzx9eIc0dKPudcFioscVnaddl6WKyXBjZ%2BsfzwkidcnjYfQD47%2FtTIFdX4x1zpVhwluu6wGh3o7g57rFvc%2FL%2FARIhbrlB%2FHQYNqulme3CixygyrTZqLETkqVHyKYAMt84N3oVtQ7THbdHEqUHSmn8YYsnEW6xO6SkRexnHyrw2TgQpcDHd14QOKnOiHcuEoVGa5q7hVZ9MQ%3D%3D
cjuatrcyk00e207837d2i66jn	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_d6f3bbf6-bd19-4e00-a6b5-5bd79f1d17d6.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=sBxqZkzkwltd8Q0QB3lS0hAiejOU1abdj17p%2BlNGj1dNOdPJJHiExEesoEcnpV2VNLxI1k5Ty1WxfLOIoER5gM71MCXlMagzX%2BZBoL2vMdZFi4SOfhtghW3lPUiG93UpSRt2sp6DMODQV3NIQxKxAN0SBS3rdr7JcZn4XVSgQ9qdvYtNlVhXUTFGYdYlysq%2F2pANiPkXsDB4GX0%2FFrY8QjtNpxRNp8eP6o3iB0eCCrwhXCDXcElAxPxcShmfNRA1HbVJbG%2FIDqHW2YPHhFv7Srq3z4LD2q1UnKwGJNpVOUicTXaNWED2m%2FnlO8PHyJ004Grny2wKJD21vS7eVN%2FQgA%3D%3D
cjuatrcyk00e207837d2i66jn	2000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_c29b3a85-163a-4be1-a0ac-adcc2adebfd7.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=QZECmrw5plsrmyXFr6TNnRivA9HpBom7IvIkmfzb23PM74kEPS%2Bvts4TKEEsRNLnwSU2SQO%2FOwK2RLuMehm3GxY3PIbvw7DX2kc5lwflVC254UtM8NY483wSayrSGsNzuTO37nqyxDai%2FdNG4pBm%2BLZc6dWv4IUoRFNfEyTlghKemBiSzmUpr%2BTqrV7xQVlvvrftmFsyPGjqmWjWmBbbAMQj6lhz9hNkpA4J6N3x%2FKacbXDVE1Zm%2FXWypS6us3mW%2FUM7XEeJIJFaV7UHF0vN9YRD%2BB%2BiD9whFY29vGV3%2BywMczuphEb3MwqN7HZFGc4XcMiOKRb0PiCHz8%2FURhZqeQ%3D%3D
cjuatrcyk00e207837d2i66jn	3000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_e8204d40-8418-456a-abff-363b60c9cde1.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=dGjIhTYSaLO7TKyNqe6PxsLbwuGKG1FnOO6DYZwuxMTdwXw13MGgVugHB%2FT3tl8ioklYCo6O6OwatnIK5Lwa0bYdngSQCPMPc0DxCeIPD3iDtYUGAsWJiv%2BJnuNUzjwLbFgKu9hTorSkfmGBRpQz6WwwR9E1Dzp6a5%2B%2BSavkYoOHDiMBg1Mu6N%2FveGpblT5dFG79KI0wOZGu7FF5j5szUty5Z5x5UAdIfZyZol7oWFSB6bGtljvFk%2F5em%2FS17j7XqnKV8iuMCtyg8C1K5GSFf%2BXbwNR3rsKQtCDRPZFWI4dnQC3LEN4mQ%2BSNFD4w96PQbK%2Fg3BBn3YGd8N5pj%2B0p1w%3D%3D
cjuatrcyk00e207837d2i66jn	4000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_9ce5822a-b610-425c-a2b3-d6f78c77f1f7.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=cAJFQSfsyYI14ZROLKRNGdXIrKSOpunTI7lhMvMH06JU8ol%2B0jPzyvzXmnmo3s9CMECHN8WxObnLaI1ptB2SghgYJeLAKmmnK%2FXb8tqDkJF%2BRMYPRxxxaWtiKUeeJc8%2FGVhECExQeoH0ga5ruqMAw8voVlwy4RD0PNFhxPsO5VIZIjqerEhDx0b5YHS11c4TX4q%2BgXw%2B4vQ5zmd5md2EkKBSvYHL0OghewFOoQDV53Xt3Tqy%2F9pf5GIZ08UCyoH1A0vW91eoJVXWIqKjvF67709nTjWl9h0kp1pU5OT8sC402jq4g%2Fo4ut9cJ%2BXsZ2HNnn0xPoUzVqTVr7PqMJ42sA%3D%3D
cjuatuita00e70783hawnpvxt	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_35988b1e-99f4-4609-aaac-a1694005c102.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=RRrPOkNVfvCaSwa4J%2F%2BndRP5madA3ZLfaCFzd9mLdUl0XZITvz95QYVZ2G9rZKbqkv2EPgTbVwk%2BG850vmW3TFWYvI6Pbg27NKvAdG8%2FkgmlO6S0Zz%2FX9yFAqd14p29O%2FgEbj3vUYw4w69ZwKQ1psDhen2%2FXksBFDoRWSr3MPKT9t3uvR7Ks8jAO0iNu0GDyT0h1ilkXX776NvJDbpMqBP6Xw%2F4pqLIuFk5g5R1riw1XG6e%2FJrCaV2zxmzLCVp160cL%2FgGb3QSaTgQFIRxp67ZNfHTubZpSQvQarrNSHf3WWf7yD9t22qLtFmDMVpPizzvzupUdW%2FurGYDwtZV5U9w%3D%3D
cjuatuita00e70783hawnpvxt	2000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_193accf0-c5ae-4b71-8219-484f03f85134.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=VQvpqBMM95nVbXdF6jrNqZk4wtXDDyz4Pw0aFh10%2BPSGYOrliQAbp4VowXTQ4u1h3w8yIw3ekbeT4xTaL28iOoJ3QDha9lM%2F6jxakUk0zMy1N2BI%2FjVXAUvquwm85VaIC0AkpIU2PexfFZuhsmHv9AF4%2FebBQNZTCsmNOK9XYG6yneM1%2B%2FcC4MnqOmBwjEeqVy3KuRqYS95CeUuAEA2DaA%2F07KPsNCxVj3M%2BMLQwifs7x1rbpqq1KQgUYeBfGquazlNBNSA9qjMFxgu8uMeaqoB%2FccXScaOqosW%2BXyHk6OuZbRZLwDHqCltX%2Fgr61Ovc9PKoxR%2FMx7TFVar7b4hlQw%3D%3D
cjuatuita00e70783hawnpvxt	3000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_ea8a6cf4-6405-4cfb-aa02-7ff404bfb0a7.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=AAB0cV4XcJ80QtaoAHwarkmyJYw40aJ95qtH323SDW26mYLLA0319Cyq6Df32QAhnUHKS7BnF0AUAZQDle06R%2FqLVe6hqQ9IW3jI4seNnDKKeMLqVh1I4mImxlWOJExPo6wjfUrty0%2FmrQH2bOhw%2F5xl31paBbKOO7SVw5%2BckdV9ViY9DOf9F695OGmrX6k%2FDSiuNRf9AtT%2FvXUL7a8avMKCXS%2FhIBnot%2FgCTfnV5TZXsGSEkr4AY%2FmuHn0aNNfccAaH0PVEbP0YlVPa3BJcSOOXXn9g4IbOuyJH9iW5RdmafLNrbYAo9UjgVoqvQe3jn8EPHR2n2Geql2s6tBlFig%3D%3D
cjuausyv000eo0783ad13z9tx	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_adc53158-3ec2-41b7-8ae7-b270831b0119.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=SD9Yxg2f%2F5v8Z80esw830hcQWvWaSmRcZj%2BXGqSHVPASxTvByUcW7Xhs7QPPT4PQvA8k9EJweuhcnEpp472xciQ%2BhiUtHJcZ5jWcGqqPNVv30uyrYXK1OX2ESj1qiKyf4AK0hiQFwjl1eoe35lpht3wHrzMn3fOz6S2IfRX69Bo8xk4%2BAIFcymbyeFUQ4cxHpYeBQusbDoylhtwe7em5ctTHs9JiChyjpwhWSE8%2B6TGrxEWJep86wtLpgI%2Fe9qdB7dqkY9cRsJy1pWkjtvb%2B%2BH4xdmdWcEG9w3i9VP40mF0P33enohsfAbIgpxuuORVi6XmjIyRw2yLsfXVsGklrMg%3D%3D
cjuausyv000eo0783ad13z9tx	2000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_3a26dc64-bc9d-47e4-8c98-fadf4574b534.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=x1SYwkliR3jfIXRc7YOhU8B%2BAXjwq5v9GGi%2F8chGR6QBCVA%2ByZQuOUx6Ty2RC1IvP%2BeroATXcRu1s1R8OIFZsUOpoQOPuKQoWa5A58sUyhS8b22L2LZKv20CBlNeIeyVBgDE188AaLnGb%2FW0Lx9hkpuL%2F%2BXXojs8As%2BgR789e57HexL4c0J9rYk%2FpLCIMrxsY2f6GjRFJMsjCe6EK4PczfnAMCyyuT6CiXN6GWTzAJ3RHqkPeMfgcJqthv%2FiIsi0Q92%2FWHdXOF5WZcgA3VGriX0OKdsIxicwHCQUtcBu4gIOFZA%2BIMSGr6hbv04qyTPDnfmIaam50iAqs%2Fxdpm90zw%3D%3D
cjuausyv000eo0783ad13z9tx	3000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_60567e8c-33ad-4893-8477-2b505d8149c8.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=OwrvN7Ed0kIQMbfJrxyIos3gz2L0SMZl2YBSIjuGHXG8cJHtKiJIi00xRZ8NYTa6vq%2FtX8IFjrkRXVLpA6vIfgtnUoX4k6NC%2BYSAD%2F0OquLkshMNUGdfYCGxj8JWzSP2h8BqFvrKvWamAYkyKPFyrfFBD5DhbMXGUVRrXBKrHfReslV2i%2FvHRgTwbr000bqpquW%2B1or2ovXXijSySZSHdaUVhau3dKMQaiRGz0RrHDakwvFyNmg7riRYDW5MkRG8%2B0IYGPRbhwuie%2F21hlsFsO0gMPRo98uUUvYiuJVHDweQ%2Bt4R33NKSi8a%2BObizVaiHRlx6VWR48ZXUnLzLGkptw%3D%3D
cjv3bpr0101xa0783kwzaglpp	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_e909ca6c-168d-4cd8-a2b2-2fb8d9192c13.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=IIYPSJER4o9Ce46heEYSpoKoHIC4GkLt9u2MTWbKiY%2Ft6r2AvoJBRz57O4r5Lrm%2Byj61pOGKGoKjHz5DD1z%2BU76TMJn9SiSZvhxcjmYvhpwjhxRgd6XoZOYvFiQ8wvuldi%2BFKZ3B5MQFVR%2BmlbXVnl78mOclZkgQZY613Wg1vKmwjs9kytIbAkBHH3znd6opZmhw1sdipyYoZgu%2FUa8490X%2BZwtgbckRdH9xoheIdBo6w346yaTa7qMdczguEMCZwkJLW%2Bwn%2BJ29okYURWNZXABgaG9eOWccYwHs67r5rd5%2BbTCp6SwyB2WxT9SNbV3qN0pt06XJMBFKSupl5r1Nrg%3D%3D
cjv3bpr0p01xk07836owa16d9	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_317e6170-398d-47ed-89cb-5cee9acf2ddf.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=oPIRgKaEbjTX0Hg0oFLH7%2FWZmCc%2Fmr01VRRAp%2F5c0HW%2FW2lTXrF3eNRGQTTVXpHMrM69q4ccmWrPMs2CaRhJ6Xof0tUPDv3N99LCaH%2B92Vqt%2BPQeVR72U7QBJuCAJwQYxq6USZRVpELRiHO7Oki%2BbLkZz%2Be2DySNrZKSYS3%2FTfWR8H4zIzGLdBFwBZaxah427M53syWY2v%2Bu61zk%2FUb0%2BRaQXmzUyt%2BxzZSfZs8cQpdgzgcY7%2BSSQNkwvXhBlERaJBEby1z59o2UXngCABtMPgxF63GD1ZUxX%2FzWIpvXgjTjn3onTgilcAYrVxPg5qH6smM8C8IHBbGkO4GQIQbN%2Bg%3D%3D
cjv3bpr1c01xu0783c5sq2uc9	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_9bf29edc-0803-42ab-ac28-da2d13f6525f.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=P7MxANR3YGNvwYUq67yR%2B4KTDUbG7ugn6ZJjjVR9dC9aZDwJESAtbuqJF1Tuw7qbb20orsCMgtHJEkG9Aznxncmt4v%2BlEoVUz9Pp2%2FpeRBNc6h2StUOIcFAoJpJ%2BoAZwv9lDwihlpB27gsidhiAq5%2B5qGTkiShgMMQo5TKwkJCqmAiGTLhZfJuq%2FC4Q7CoKPM2P%2Fi2OyDSoLbIjmvK%2F2tP6rFXZvQruajKhQLbWGOGWt2%2FE3qEEbvI2iWv4fGrql2%2F3fr54ZhudMS49qsUZxMIzp9bu%2F0gcSp96IsgK7TvlFvTOxycFRlVjpfX82QD4CE34myKZrZQCSe2hnXf%2FiEQ%3D%3D
cjv3bpr2c01y40783ps5rllcz	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_1420807d-1e57-4e84-82f2-8195b1a15c6e.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=YwZkIIEmMAfVn6JknTvGzx1vqTzlZgyenpTgZjWydgW9SfB2%2BYuWcHK9dh1ma8Th0VdgjMC3V29OG38zpXQcJ1fyddqogpz4KPY0F%2FH9kVdUXWLnMZqTA2uODfSl5Gj3x%2BQG4IKHIbesjj0b5owIags74q9ee4XEUcM1lMxQt39arlI3AcVDSCtCEcTzvr%2B4HyvEhwCORLBR5ha5m5TRmZeFdNL%2FBDof9EnNZBPfkQRUh%2FvMkLcKy5Tyor8yhPdhwytKFW2KW7HorcFvdRH%2BnPJHjwRSp3XMEy9VbS3QnRyCe%2BDHwPHNUSzDlI5iUBsQJsn3ZaSSWYMuljSDxjIYQQ%3D%3D
cjvcbaikn02fn0783vgm9znvv	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_2b8e16e2-c466-4f40-9e7e-9d9eb39fd2c2.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=p7f75WGwu%2F8dmpASP2ncurzwxs35wVDl%2BUzl%2FCJ7uUdXvfVfkspEHHPKaC3ndonqYD5PWqq0Z%2BeApU8LOUBmfFj%2FEImb5BCYKtlk7Ovle7fpXoL%2FyMwXntidnRC4PND7NhUyS0hP5L9See9RPJiCg9YWB34%2Bi%2FwKlfq9ahzmIvQu4yIBfHoCQ8WJfRTBcYy%2Bv598p3JkV832Nspy9B0YF%2B1A1vecJ16k3J%2B4eSjVaVpJnIDnPxDbgKVmD6BjdNyHulAr9x8DkCHqj8l44fSIM72z4bq%2FZ%2FKBAMom%2ByR6umA19Bz9xxBnZ4%2FWoYnj80z8PZzEqMLyTT4BLmE3%2FRuSIw%3D%3D
cjv3bppmj01kn0783qg1p3jxe	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_d51b1060-6d69-440b-9ede-c152a15ae7e3.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=IzqRNS96XPelyITS35ZIWFPaunjQPGDnRS5kyeDnIvdpinuyPkmy3DACs1vMaBaxVLZtlIxgdQNjErWPdGG1fJWLAS%2BjH14VVnUNmLhd4RkvqsUpaocJ20yFrtbEeVZ0QG1xKNtljNlRES%2BahzFCyAwUz8H6yXLkEVu5phiCnvO5gDn3%2BwxobvU3iC5F%2FzRYhZBFNyQYcfbeBpeLvyB8VRDluXHA63e%2FrOMnW0RxoMJM4oQjwQAROX8niI7LsP29fjgm5unjiQOn4lXPDdNptzvtk2SRfYSmwbBuvWeL4IGs9Egj%2BEb7KVvsWYsiyc%2B0OzHdq2wuXzMIV2bf4lwNsA%3D%3D
cjv3bpprw01lm0783iaw8ha9z	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_ba2b378c-e06a-47c3-94b0-d4d39247ed01.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=ercC%2BmmvbyzY0BAR2E6uobWxb2ta%2BtA1B2Nv4Jl0c4dVPIFJM4RBpAbUnoxZW8epMt2pYkq711lZhl7fcwS8EKzvKLjP7cbr0Bl6UfQTNHwVo3p7CfQPlwryYaTktZyllwevU9OwNdBcZ6fg556S8m9m2BemUIcIKNRHlDxaPOPHISZfZE%2BlHwpg7qq%2B447joI46eTUsuS4tI33ZVnD2S9lVV4p6HGoYT9kz4qUM6HO9bp3urVqcJj4wsKmuVeilG6kDdGW6QqxfXGFY74F4EUrJcLLsb%2B6Q0fOaRKICQuQMK0Ki7f4EDU4pemKixKK9%2BXehb9AHV6Cv08p2SY50OA%3D%3D
cjv3bppnf01ks0783rfjg0mlj	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_ac82a8cf-a712-4a14-b870-e812756e508f.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=A8xpfRxKrW8kJ6oCeYagjfgMtvVS9ccFJMzpF1JBRjvcXE4DgdpYuYsVt%2B%2BhFIAC65%2Fvh%2BF9bSJ4QN6WbeGt2fhgjv3n3DLQrfodngbNOE7tGt2HK9F4OTSliqF0VUHQJcw9i%2B%2BUHeGqR%2FGjS8VPyBpTYsX27VbugsEZFabSzZlrO6GKZ%2BXJDaTUKlQfVva6mXVu7H4ciqntX3Mze9MvVig88%2BL5K%2FZUA1ZQHHKe6AvzlTIDON1i5w8IsaFKWPyR0dUda%2BHXsg8rfviRMlCvk8vi2%2FFEmlIoxM9EJFgrHZGHCM5sjYX1bSswiAFk4Ia5yuDfTBAqtRtDDb240z0fEQ%3D%3D
cjv3bppny01kx07830d3p3y93	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_ca3d0ee5-ff20-41fd-a70c-59798909ae70.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=SObjQNw8RwmsHI6RAgkeJbN4Gytlbkst9RuXILCifn62y3uQBHhy3VFJKySo0NSmCtUA%2BOOtTynEynkVT9R1ayjvfj8aJ4JvplZM2ySScJrezslnV8q7dRVAlq%2FSmq9Mpca7E95VADkHXD5wL6jiNM5ssaZC1PpO%2BxJDC0N2sOZ53o%2B1HcYjlKqOcCV76UQZ%2BT1xL9C0JzTQidKZTrR0ZyqI3GZpU2n6nWrSBIVGIN5AbArIKegzzdzKKqShbIHMNiWt5J3sSHyrA6j0dKgzAOprkIT7uPT6w%2BI34HvlejPoV3CS3FkBB7aMgDXIFPNAIDYzIH7qJtOyNreB84kphw%3D%3D
cjv3bppou01l20783evkuybhu	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_9ac82e62-1589-436e-ad44-af9c35130e38.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=En1CuKywW3GmVc7ioXRD3zNG6P1yLQ31gHVJABbZ1JqvYN%2BR8c6tt4mQ04OdbujfKCxK2YYCvkrHqSuj4CwVqIpFjCGiyKVcHJT6AU%2B9TJadPQMAymLh%2FuBQGx8JmCSrX2cq6OThH46oWfpe1VV1WQ2cmS6gbOh0QM0NZh87jSLrPqpmCQnsYmW%2FtttphhozZ3Y68m95mT%2BHHOWWMv0lcISPA2PWdiI6jMUYnDgcI7xxg5Ez1Fx7Sep31K%2BHmpRQs5xhFqxtqYynmRzFeBW7z9wFdHBM6Afo0PDV6untcG9IraSN5sCI%2B8bUSUhPcoPvOmkIcnny0SD%2Fd%2FWPT0%2FzTA%3D%3D
cjv3bpppi01l70783wlj7cec5	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_08c777b6-f481-4de6-9654-87efb4e28ff5.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=pvZIlB3jCwH%2FZRsCiYDv6YxvYMLiGJDbEmsSO8onKoWR2PdqWZ%2BabyqM3eYdgxhjFBM3yHQKri5o%2BzpAs8HZRmKaqfuiuvvs4j%2FJZZEXXW8hgrqWFPpXCeloGZfR9VDStxlDomlNQ9y1szuNVuKBVM%2FW0h3rhoNrQtGGG%2Bx7DhEJiNgfZfzcEQ1f2X76tgpeOQ1eoGcs%2FLmTfqfcLbks4gwt91iUybIzP4ElGiYQXpAi2dxB128yjxkwTwsSA3miy3t%2FmqJ1s06szQzDClI%2FwfTVnyHvv9SQMSdEaRmlcHr66j%2FA7jjvdg7IdhaND1wZrhbRCYOuMFXNhcnve%2F9I5Q%3D%3D
cjv3bppqj01lc0783s8cpyzkg	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_a149bbca-2f9a-4e20-9eda-f5ee05f6e6b0.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=DMMBi40je3VlOdxz2c32EwMOARmzJQtA0pRdhMSSM5xKcVOMjxFG1enSZdT6lnxCocxyej1V0eZJSEQKnujdzE7ELniUjkn3T6MSrQGpMWtgNYdGR7E7cDmLKLeC7d%2BLHkehgZlJWhZn9Dg9W1DQUKof3ndWyip2aL73ECsaXUE0JgvGPMl9XohFUgVOREWQ2SsF2UYv4RdDy9L0ZSKlBwGpK5cw4pz5HFCkpv0SbW7kUPQfba53vyYheN2m5c85MEkDRKcC3GLWBpS989R7K1NcnpL29C3ToAhxG3NmgByq71WZNpHucQy5Tt%2FzNiRE3I%2Ff43q7vCl6LDt3Cslneg%3D%3D
cjv3bppr001lh0783efzcme6q	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_7620207e-f0e1-4c0f-a10e-0be838d79d4a.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=XH3XFe10pw65j%2ByWJL3xfyuP7%2FkxHL9NKu7ntbwzeA%2FZnFHGxLhaT9pAo%2BxG1GQiFA570zStSgLDEb3f1%2FTV3VFLTI3wsZGSdF%2BCzeMZpuYLvXhHuHP26zANC%2FCIOo70m7Ix%2FQ7oqLy6lt3h6KQfUQOgqT6h8IG9cxBOWMD2%2BD5OWh5FkbkYuKBKwsERXEYBjaUghd6wTF5NEI1HYsoi6bjQ%2FsOji3LAFKmnDoTSRUM7ClrdQjewMnVdQO82VSGp%2BwVdLqsVZMfbGKdeVVyUN3yuc9I6bMFh%2FqlM47chUOrzjjbJ49rDZYyJaNgY0sheIV3hD4PLN4lMFxn4Vrjeew%3D%3D
cjv3bpps901lr078390zqvghl	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_068ffdf8-5fda-4095-834a-ad7381e2bb7b.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=guHXjItfQU%2BDveI0GuadDiGB9JfbaCvRVHSEMEcw2t4I%2FqtQ9Sb%2FoOhO38BDPW5IeqNyF3aA44lHkqo2%2FIda%2FBedmZvINnbUxzk1Old%2BHqqGs9VUmdSUxiZy%2F1B1eB7d%2FKnV0Z%2BWLv8PUSPO1OqoLfAW3%2F%2FS%2BxKZXyuwYOtKzJWEZSANVfRzJKA8gd%2Bru9snWSNR4Vl5FEhO0kGZ9qnZn73y6w3jG6UwdsG9TZXVCOoI5SzICjyoRu5NJjs98GWEtg%2FFuLMT66G9aqu2NB%2FftJojVD13tia0kQcGeEvvE9pUcX%2FEddCoOeJlzWvEX6D3f6bMYIK67pFPKdV%2BRYnA1w%3D%3D
cjv3bppso01lw0783qbtrabce	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_05e37fe8-3f61-4ea8-9938-c2d3b19536f5.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=LNXtIsqaOqAC6VyV%2BP3pG4g38wFcLxIICmcxEoKA1%2BRDz7WEZq6WafOnhRO8MlhpAgv7%2FwxFcBiIC80EpSkWZDlbvh8cav%2F5UOXLSTbLOxqnA3nGLFY%2Bz24caCvPf5A%2BANTi9qOHt2RNCnJoMx2ScOGjJNE6927GYii%2Fua5ml%2BY3K6TtbTnxatSSgw%2FG6mOZwsbYY3CsE2c5mou9AQQiRRIAZhKTsCZmPdMdu0QB1AHaIfRlycY%2BVTXbNopG0Xv2%2FJ6TFcm%2BLgfbnY4MzZAPaF9Ttg3SPL%2B%2BU%2FeyvHHFFykzzU30%2FYKsg0gAfZs7T%2B17ms4XbkQ9O6SROV8CWGV%2FzQ%3D%3D
cjv3bppt701m10783xoufzgfr	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_9e3a5b99-48ba-44e4-91f1-023c369f5c2a.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=eHZm6EUENRYVWJGhye31N1JN5pjTpESMnc9316JElV7mIpEglnewru1Lj3Q9w6zHkeD999BITmsI4QdOe6DQUPCjd1xNGCdJo%2F3TXshH%2FBElAsNX0RwN3ZalSA4XZ3dcNVsPgB%2BRByiteU9a%2FLojuwm2ZWRqqHCUveyUVGpT28Hbha2LBuynlOMLsn1RUeNLkvTx9j5LSLt0qjHD3Sn6mQoRY5zBvRZOAupKjDAv9%2Bv6ycSZTRdogTcLQ4DKgNHCsrU%2Br3f51V%2FvleBuqoRcL1SZeftVW3P%2BsFbhpD1zckqdxS%2BuJyejPDYkAyOynWIfCpzl7pVnrfEK9xAqYPqDiA%3D%3D
cjv3bpptj01m60783ps9b26zp	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_d1e3a218-1674-4e47-a683-87d218dc04be.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=aKbPZ8s1UmZRP5un0mVDgw9l12PM01zpbA27jCNSg%2FMDszMLxqtcs64kaFh92f2368hoKce4SJu3Qwhq0x0%2Fyrbc5hOkp9sPjjPyfmjWXdjVhLhLDmmTHjtmsVuf8i9OckmgH%2BOwQu3yCFcDOP7%2BJG8heCf2RrQ1U5BizmrFDjVdsESIX87szOLaA5w%2BFikoiss6C989eO9yKEbyHLIQtzBngkTt4Kvuslp3zU2ePBaS7anp5QIwTWow2MmE3FV5yXR%2BeJaH964oNLOjZb3sosNIR82%2Fj%2B21bASmm292odE5uOgUR2RhFfC7uRRmQ90%2Bb1D1l3PO7KLyX9zHeA7CLg%3D%3D
cjv3bppuo01mg0783cd7q2qvx	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_fd584e28-c135-457d-a7b7-0c7145244034.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=Ksj8MGm7bXGwQqlezCITugx1GELG9pkGtWzqm8LRbfVgkbL8u2fgxHbuE7SoeH5MNI66l3OzJyq%2FXlILLveUAPRHatIXffguJoU3VP8rrWNBZrpgXqEygU58OUVKRP%2BHTghbl35wwYBxkQrBlV8rJicWz5NYd74ZQ5kL7clPkijOVMOpvBlzV3ScO8SM0bl4R13NV3Dc%2FvKNIi8YXrJIfrGp4ONYNH5LWVh3S9xNg79HTWlxmTIm4Pa1gS%2BHpj%2FIFy21FstYCcQ%2FuG6lsqzeObaRmVSCBLp5O3OG7Ky%2BxifEhnQFp5aK%2BAKXsqWN%2FtXeNY6kqRi7HTZSrrne1846Pw%3D%3D
cjv3bppvz01mq0783q87vx56p	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_d1cc1c8e-6f36-45c1-b3f3-510dba7c0308.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=cq8eti553ErJ%2FFFPJ0QVd4jSEX%2FVDAhWzlHcwi8wOq4A8t6LrzhX3yl5HGMH%2BBTJaMV8GZgnxi17%2B9UsPr1zNxDH34Nu0wIQV5R16LYvOhyeNNN8V12NhyN8RfbLaJtg3TDEIjaKVfKOMIMxjf6b4quicQqxPVpxScQVO3g68w8TO9yKZbRU50zZefy%2BxO0lEH1B4EYPPNpGuq6eetvCCnI96jkjeMZCLTrsOzcSSAgGoxP%2Bl%2Bkju6Yim6SsSpe5A5kW9h3ilQzh9ruWCuleesSp6C72o9bCmIbbu0Wic%2FrzSJ9pWEAJGs%2BuUjnbvZ08jL4%2Fnz8EUqT2FLBt3y00YA%3D%3D
cjv3bppxf01n00783t2zb3i0d	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_482e8f07-b11f-44ba-871a-092659e3fa95.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=ZzqpgYoWC4OsGE54QfLkTNc0U5VeuxtVTHrpUF8dxNzJtWNbO8XwOWsQaWShovSsMQr5JzL7yqnQhGhsMu5gOCWsd8w0UVztTnCfzVc9NjbtsfLCLoMqEAHCbbJOQCQH7Dq45f%2B1lSUOAo0jTETFQ%2BnJaTXzNDASdTuf%2BjUjYl10%2B6qsCftKc95B%2Fw9RwTS%2Fsw2YvaG9rJevMlJgpXvnZxr4jPRjoNFXTg1xTGt3fq9ibw7P6ql9YO2a%2FSrBOjli8oJ1mHyhBPukebnT0VgCW623k7fgOrC%2B5YOVFQEHriFf5X53GDsL7dazKANecfa0K%2FaANaCnLnAPd%2FEDHBHSJg%3D%3D
cjv3bppyz01na07839xvat90g	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_d7aab3eb-3753-4407-a3c6-c1d931286845.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=LVyu4PDU2SDF1%2FQ1gWHKempMiCqROPNIwKZXNmkKdI6fjqFbawh4KZKes31D%2Fz4tCawUCca363mhFo4P8kOojoBMC2szdaBMntwFxYEptU8dKTWei1OPQdIPeIJF0ZvecZFNXMyANxUYRHnqZf5ghQM%2BcdeUJFfzm%2BdWyIh0%2Fh66EbyfF84OWO3gTdGab7KyMOAaZuCw1HFOsmuDkDuwcm5k5IWRSU1YuiCf0fbRKxw4pN3Rxp%2BEc9JrKmvoK%2BYLezzvlAXZlAogcrMT%2F2dZa7LCluJsV1aIFOSLH%2FoMhZk3ymOBuLyA4Ococ33LQYcb56KV8ACaw3P%2Bu%2FDfjPqCCg%3D%3D
cjv3bpq3701nk0783p14gsknh	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_55c22093-b16a-492e-aef4-7ba6ed548437.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=wZYAnt2xmWXkjlPviAgBS%2F8M7UNYPcUJcDsemm20SldqDcpuw4JabKTQpEYBSX9CwNFF%2BErWTorSGpTYPJ%2FCLVh8wUAorWb%2FKu0ZsuCrNGDUw4ewob%2FJuD13YvD%2FwtSDMWCJsjmnd5uJrfHHYC9lGAJ2%2BppBN%2FjAFUm4KgnpPrAZ4QOF%2BFeScHhVzVspdlE2VJnMAt02bb9iv5b0Qg2aKPuTL55KgRP71sm28I6vyL53%2B%2F7%2B8HCQQMdr93N8ZdKRIwhXOTKxKc0W2hkrBVRamX%2FUmwD3GBhI8YPK4Y%2Beow2hnzJZK9TyuBU2svrE8nnZu8CMZ9QJ%2BeM8xHKbaUmb1w%3D%3D
cjv3bpq4301nu0783xvj1o74j	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_bb94cbbd-5750-427d-96ae-13736da23c3e.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=V2teGOgqIvFXNkFLzp1dM8gUFSRdMlP20PknZ7HTLczkPyyHYSYKA0MbBR8TzuMc2VFhWfNuvDyIK2V3aZiXtN7V6M1B6y6BOZyg%2Fb8H7yqGJTJlJnhdEMr%2B6dh8S26EbgunP9qWT6xgUW95m9%2BwtuecXnAmffK5Ce5H%2F37moyGaje1euYZIBDywEvgMmvY74g%2BAzBiKzDOjVFpWSFjnuN0KCVeTwC0mH7eavify8swazaeZ1itfO6HMsu3dVdphN00QTxEebKeja7ClhsYHnSYPpM%2Bu3uXJOnpSakcyLisnobNPINl1NvPA1ala9XpJBtmp%2BgMIhYBozR25nktTnQ%3D%3D
cjv3bpq5d01o40783eijgbluf	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_d43923d0-9b68-4db7-8cac-413fa09954be.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=Hkjh5t5Eo%2BMiRj2ZHnUBBRdVRIindrBaoCCRRjZLlce02lsZke9Q6jgYIdAWKOvG4PIo2di08M8bntTzA5dHXt0P2UccI7yuq4TssWni5SZli61amaMZiMX2%2BJMh6dhpTIHBT%2BTSX7Q92V88HmoZGL0gxGqJw77yHq%2FLRPj1rZCFTxuN99BoqEsfAYjvP173H1XJSuaYYRifijeHKLjb93h1OOTOLhFutKltfyNUw8v6tmZy8bpI0qOpWpZHFNRThK6j8%2Bgv2GxOSuAtsEgqAUANWVsIsgqFAL2guUjGz1RqsfKzrXspOd8AbnEyXVg2t47nLx7Lewz8gloSh6fD8A%3D%3D
cjv3bpq6h01oe0783ijm3jzou	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_d5bcb8e9-2906-4be8-af8e-1bc8ca7be8a7.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=xE%2FERPW80OFgO7eBt%2B3yoTuhXvOvZFU7TIJlm72knZreOJbEFkoT6uTzb305rV7rneAjUivr4Dtp8OQhIfDICzqI4EPgehQjJw2r9B0AU8hdmmi26EbvKHoyIsn%2B70dgxW96yQ22qkUXKj36wknmM8G0%2BlKhR3b3uobidqXFfto0iESEzIW16dBQHx5riTQNEUGQwmdLU0QkAbBjYCj5AuNLGJmYaAhvg3%2Fm1UsJOxtkB%2B8s1x9dN6yVvaTRcS1KVP45MzT8kk9L7ddzJxLCel78cFa%2B6%2BgWcRSuH6iGNgUWvd0YjE64YBLAxd3rTLqBmzHqXwPStWlsQumFqOsSyA%3D%3D
cjv3bpq7b01oo07838wqtq87n	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_4166ef47-b545-4850-b13b-1ee976f2be34.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=uF2FOvOv5SbLKObBqC2aujUjd5EGOM1TePp%2F7%2FcqGmagWLCaNHmPr%2BA6It3dC94cCsW9Csw5UGmAerv6rRdN1c1ngl%2F9GcZW9IkKEivqKjF6eyBTEoDWj4Mg%2Br3RL3ydeQYWJWKCzBqeU3lfaCGh7ifwMCing6XJl%2BH7JUAiTRBYdFSBZvClfchHeIej%2B6tIgDkjKtMbHvV%2BKGoAEMb5lWiKA2wWJZOwnr2cRUHE2a5%2Fb2cH98NjF%2FV9%2FnMIfM7wakpqTBjf2j2o7mpmo7rCH%2FARuhiPlv05bXPBOu4RX1ithnfzE0tDdHW%2BO6yD7OFobHNu8CFZQv%2FTMJbSxx%2BHwg%3D%3D
cjv3bpq8601oy07836b0y5qb0	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_6994396d-bd1c-4de6-bd8a-26fa97f09004.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=QTdMhTwiOVcVXvPm4VbNA6DQOj2SFfhdnocoFS0XreOxpxRzoUcLIMlW873e5Fl1VHfI01wQsN%2FVthGniXAffFHvmx3cdhtDV7%2FWchoxT7wYT%2F8%2BNx0HjMg5sErYx3L10pcR0HEiZIp9G6ToP4xZ%2F91LqmB1qwenehvFKbcJzU%2FQJFakyGiySv%2FRhtjupznDV7AAjVB9WJHzGviEflioQRyJtEZJDZlOAyhA5orqUKK3XSp9BUQI998LjOrD5AqX9An6yf7hUK5daz0CjPtSnSQB1vyDj7Yw8mUv1GWoCrPUO73wK%2FcY70vs4fT2GkftPcvD%2BxbVPUPA2jhO4%2F3l%2BQ%3D%3D
cjv3bppty01mb0783bd5ktk8k	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_60fee7d4-5b41-4f87-a7a2-9bf217d0d5b4.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=WLIu2jQm%2BCzq3E4L7rjK6rQIzmBPnULuR5KaTmKvx68XqS%2BmzlzLdVi%2BVADD69Y7MWx65GtLPvvnsakpnaiJxlAjosGAubFKeOB3C0zaAiBCzLHnD5tSArPPjDQ1JfdiQZf0kI39MGlAY1UvDNKTHkUqSuKFGjQ%2BXZYg5NdFzzROxjnmpjKz3UCqDPaowvE2fY8gHnec4yk67ITabmAqPnW2L2ZLgOtClrh7giQSBcJ7SvVQABzKh5KJb66rNKHsMSeY9%2FvsjUwdESA65rEEeZmCnxJVXsRcOplJTvPMOWpLVmvO1bDibMyKrJuewLT%2BXBYho7dKT%2BvMLQeAbfKJUQ%3D%3D
cjv3bppv901ml07835qo44x63	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_1734de97-d7ed-413b-bd11-3114163dbb78.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=F3BfIoPTnDKnD67QJ2JBgloQINqcd8eDqs7le3%2FRsC7huvhLccVwQNVNx3LGn1BT%2BA6XL34NE%2BxNlwgY87scQmn0Six7pjQaGjqSlOAuPZUD%2FUE3kXylwOj7EN9lCWAJR68s4oOcL77S8pM2owRHKiIcZTE5MGRQrL%2B%2Bq5PkZOJpyELW8aVx9rffjyi%2F7c%2Fb92gP4rUeWM%2Bb3zqrWms8AsyS9Vw4BchrjlsuA76WqOPu0HDvakrXEz2dkrtQsX7cc0ip41f4DCwBwtbY8h9FI293NH8dcyIAfJd4aKaUzHC1Og5IpF88%2BuO7TCBZ9%2BrMcITDRKXYk7ZvunK7cBfM8A%3D%3D
cjv3bppwp01mv0783aps82zsb	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_5f078f7d-2891-466a-9e02-5b81c0b47450.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=aDLNCoXo8HOFyPltun3vSs%2Fvwe5TOuJF4z3vhZSmOcwcqjnvE5FYauxd7Hb2jiXGd68CwzxXSOFI9kfsb0l2XTdSbLuqX52QJwLW%2F9yAKWWxjHlSYwm9JHR32GLsXOkDPHCA5FCsEoM5YPRJPOPeGPiElWJ5t6FMOsvKw75B7bEbA34tNjLKFkDA6NdQw49qGFHmqYHXMPWYv6hZ%2FgkbzakensHRbglvDlGEZMWLNrkWB%2Fbi82iA4wzJGas2KMPzmfOUyOtfMwW5IuSOEiZ%2BrhMCVrs5o%2BVL1l%2FgmE31aET7aySa7oUS2Cx2c7hhgNBEdixuy77sJMRCnXUZB9Uu4Q%3D%3D
cjv3bppwp01mv0783aps82zsb	2000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_c291f68d-efc1-4458-bc08-3c47975393c4.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=rtBV7ZzOYcN0zkKXzkqv2n8ww8giADaJoB9Xvljm4dOyp8TY0sxlaARwY1tk35gfL1bi4Zz4j2Wm63klifXe3wlb5hSiyaRLzLQ1pD7pqRvYBqOs1QhsSyyBDgZuNsC53GGSTEjZzWMTOmVcXRJz2zbfBRkOtSUEzg87QHG2t62g2xl0ZkTpfAu0Pl2UKpwjJRdhz%2FP3B5XEOoCvYQUx8AmeGPMMnUz3mMkYI9INRYx%2F%2BZRN6Ys%2FMkakFR4xOT%2BlTAsQ%2F4juGZ%2FZpGqURIsR9QG9dCrwajhonSj6j%2FFiAGK9LF3nYG%2BuSUFA6SRv3i%2FKcAbuLzpDMqzNffkFVA0slw%3D%3D
cjv3bppyj01n5078330pxq0wv	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_7b3dae93-434f-4265-af69-b434fa431949.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=ZOqLwhOce05x538L%2BqVeAQm9aMmJfW%2BmsRffF2FCCx2NIzw5GaGnhiFvxEDLia%2FA6OGbTxHUM0lYvlgn6Cq0rwxquhqUr6ApzaaNv3pxANtBLPGBiF837EhPDSzGbA%2Fi0hyIxEUB75JP1QDx944BEqVAqE1dRoe1t%2Bx0Wfup17X7NxGqvSlUrg6ujpv%2FeQa74HpAKe2G%2BteQ8Ht00YHEJIHPz1Z2bi%2FRO%2BmMRqhw5bhKijhMzbK%2BRgc%2FTToLEnIK28mgisEa4sukDRLNQMV4FIGANG9LrDAVAvKu2iYHnpONK980kmb0XtTRkVcMwChGuJb0k09MKKIgACrkteebgA%3D%3D
cjv3bpq2o01nf07837tf5a8rz	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_ccee1b7b-cf19-4ffd-95bc-14d20b386258.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=s2E3%2BfIW3RV82%2FVCYEMli3xXzvF8IZQ9seAepK6f8pmU9hWBfpaMegGGI%2BmHGKcWEGnf%2FFtyYxDwsb8IpenEsbDdOgD5SchD99IG3ppr00YSSpjQM5MVlcRiiGw2XKiZLCUyEhCDNovfu2SWR22spJWlQE%2BJ97SUPlP8Cq0Zl45P%2BJaB6HAL69pkjxJ%2FqPQLI4F07qyHdoUn0baf4kOJxYwC0sklSelNqK6Q0XKfn8pOKyA8vt5CkP%2FiKIGpD2mBzh%2Be2fojaeX2bvq2B8Sd0HofU6FV67eBqixpeAvefH3IHpk7mYs5YSiyp9VzgOMhmPEFZTNFGM3B%2FyFiekr0zg%3D%3D
cjv3bpq3k01np0783qqnxw4qv	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_ab8de596-5683-41cc-9ea1-88b92bfd9740.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=oDi1i9CM4%2B19BIZUrXv5YUtJgO6Y3q%2FUriTwD9%2B1nRc3t3xH0E5x8W%2BN9J4zYROiOkI26hojlt4NUwQi1%2Bn8Lvv0qf4O7XvqyBukyr0YVTxw9MteGpgKs%2BQw8iZOkE8OwfislfYFCzxqHzaWT8LB3%2B%2B39CS4rBAIhSeg6y2ZYa94jQVYp%2BksNdyMb1MiQkLMnZcUUa6z%2FX50ewSFGLF%2FyOh9fvkIiNPfkgv8PqLNNXg%2FjfCMUELeyv9Hqx%2FUyatV36P1%2BJdz0GEiZ3iNlvBNwQsmqZmZ7g43wDQsgNaMyLU6ujLTdD7NAlD%2BYfp6K8VETnajKoiI4HHv3zvJzw0U1w%3D%3D
cjv3bpq4i01nz07837zy45hrk	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_454e3ff7-354f-454e-afdb-f6d0962f3781.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=Utq4Ezmxz35L5LNp3JdCVBPtdsu3Sg7xjY0BIVnETNFD%2BQER9fsV5xgghEp9YQlWlktZQdpBmxhoDPnqPOfscQuLkQ9mNGY9MqWDZDs6aE1J0eNlzTvSrBsJZ0GRfIC33JJvCcZSX0L8XB9%2BHEvitcXx74tQkusDKJDt%2BobjcYzOfN8g1pssL7ce9pFrKAGloxy5FATaxdjrbrH1zZiciCLc3Ha1dRXUfcGWtIbFOBawwNWtX1pGYYdGTV5EFSvGlKVcZj%2FxPIx82AlwGSZQib0TKESdZ7Sr6%2BcnnGnKrjEydkegEq6sQNFpyE4fxwSAQvCjj%2BGwj6xSQvAzDjQSSw%3D%3D
cjv3bpq5q01o90783n26ra1re	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_ca9b0543-dd3d-49f9-b156-68b02be498ad.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=sh7A4exYXmN3Esj00C00oQN6UKIb2FVMLMCU7n40DzDxmwtK6QYaQtu2ebh410JmqKzvhNCbakHKL3EMBKkCn3yt%2FLvgRybVxZlZ9taVC3qnjrlTBCy6LibYIomBah8N3KVBqgxitQIjRVTvdu%2BOOpHC8bYjrNp1Z9zmOa5j3v4P%2F36Hg%2FtwbH%2FHLQzAvqqdfDnAmrpghrqRpzFCGLDOnLT5SnCxMR806vwZ3GByzituzCgNxSOQIlq9Gpjpo6DZbk6ld7fnJAVgz73IwjEgFBMUisqBxkNva%2Bu9qqKeLjw3M9GxBiAi0S7zhKquloHVNQ7BYrpGbvrJnMWH%2Fot5ZA%3D%3D
cjv3bpq6z01oj0783lwboewvp	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_d0124be1-62c8-480e-b850-c0162b5debbd.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=cPragV4gnCJIiFzZoQTwRZ8J3wJoZxZUO6w3btNLKEVvJHt4z%2Fa7zfwYMzkL1Uus8%2B6PYBgBO6wAvA5XPlEPXvjNCCvoHgQpJuIHBcrDI2QWz%2BgJv7JtP1KXVx2%2FFshs%2B%2FWBam%2FqrXw%2F6ALzzrZUE5RRvxSVld9gTFdhF9y%2F1sdabxmvh4eY5q5X0Cmm3LNRL4v6wLF%2FoWFrWs4N%2BmTeItyhcorXJILhPxcW%2Fu0llAV4ftigo%2BvwC%2FtaAEeD%2F8zXNi9uJKmc07rKrEpCmj665f415bbD%2BYh%2FQeZjll5TW%2BXsJoSdvHxICE77emsbV%2BKe9VGPt4R5Z6t5BZ5gvgBHQg%3D%3D
cjv3bpq7o01ot0783suelekmb	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_8e4196d6-78dc-4bcb-a63d-473750e08bca.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=PjGyeLAt%2F37Xb8nxQv0odGXwRIyVvpJgBo75mUXo5ZxfAhIRHFoocCHMPA3gPFm%2Bszt%2BsFBX6JzbG3%2Fie3nr5XLz8HTmY%2BdW2T243OxNdTmJ4SyZwXpRijqEBVr6qnUHeVRE7UiZjyIWHG0%2FoTmRL8kYzazQOwWBEPA6W0xxycbxTlTtf8BYs0zr57XQ9ly8Wge4S99FKWQqxX3hDtfJGAvGRP2vRZFQvqK3DlcAKFg39llz0ufw6mQvJUtjsAWUfTAfUaA%2BQyKFXrtQX7n%2B76Tn8Uzx3QeKKH4Zcj0Uc6KYnlxVrfopPh7KObkSzu3fZ1OyiKUcgifENshKy%2FK1Lw%3D%3D
cjv3bpq8r01p30783dvrhkuhi	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_81ae2578-5739-4a5a-86d4-d380441359bf.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=CeG8jwhW2KDv6JI%2FbFXzXYNGr9p0bBAOca%2BLrH1TVx0iNIY9xewK6OAEDlAqE8wuoKz6NbpPGFOEUwfmh62Ry5jeXUQulRdXvvCWIoKUYKZbJ1GqVtupaVuxqrAVgqRKEjuLWCWAaKoO%2BsVDQfYrg5r8blgGmPfxcj0oRAiJbgpsqtTZ%2Bj5PxDDxRTXD5f4gUNmz6DoDRMFDzOs6TX8L1z0nSf7gSf93SLA55%2BOmKA6m4JvIuaW1kIh8TTUbCVV%2BHMJT76fFxhih80OEgT5bWuZP9N5rdPR0d7LyImPqUhR9TworD9dNoxuDQSnL7AYmG9ucI3SqZml9PBbFPsMIJA%3D%3D
cjv3bpq9901p80783ll8vp7s8	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_881b2a74-3275-4e6c-beab-99f9420ca4f8.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=aD0dtDO%2FWSAESTprcIrTWWMf4Ss2a6X6xgNox%2Fv2F3Y9hh6enx959x4zP7GW4EXJL%2FdL4hYEe0zL0jIN3Vi4Lbew9XO9PtjMHS9sipZJgXIKXOHvIv59v9QQ89cSm4o70PWgV1OdhdzAVApoOXGnCrUhs2ff9yKe4zfLUVAMr%2FhzPYbNxasA5Kuf0%2FOjCX2xYFnZB8%2FeJezxRcqnrhXNqVkuDR8QqEYMxqniPhpAr6pPlG9%2B6ZXO6Vo0d35zjiw%2BZRn1ugpz8MBxvApqepXhzniRDo7m2BP4terA5I%2FN3OGZulLnb8GBTerdV7OB9zd8viRsz1KFSq3IufdEzWmWQg%3D%3D
cjv3bpq9v01pd0783dhebzu0x	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_1f28e0e6-d009-4fe5-8e9e-a599b7dbc711.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=ViaTZHwj0IjOncRnhY3Whmyh9tUQhoP0b0ed8kkMA07jJRY4OxeCTTFoidd6auUJJ7vDJEAZDSAYHfvKedwcuNsuuiW%2B5gHGQ0VisLax%2FB3orO81FK9g%2F4a3yGmmwz8do%2Fg7pAieYYFcWX8a5t8IzvyrNEQOWEh3JxTlM%2BQW0HG%2BcRP%2Bw3Z6FuCwcfkgJBJ1us3SoXlyATHCrBLHQ4Xm5pUf3xip5Ja4iNFsM%2FihqR6GrPQGP1w6g1YQM%2FqTHFh%2BxdnMCEfbeMBTuasLQzFBmw0gBDzAZ4xvQW58CVEu1H8Vm5Pto8ZfOb0R0OcPZuzEXU%2FYpq044ubzWNWvrSF3aw%3D%3D
cjv3bpqa701pi0783zqczh8od	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_4de35f5f-560b-475d-a419-873f66ff1a0d.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=J0GOpJpg%2F1K%2BMJVi8mM1rCbS%2Fhowy0cYzxIdE%2FZiCmPNFZHoxveSi%2BADqRE2%2B2O43DHuwjqJUTnSfWx9%2BfHyL4fxNbdrpXkyowJt3jl8eXPcldBQx4u%2FjnJ3kyy1QxiRNMpkYuwVhHpoNIu0iFfxXQEFAAhmyTbtLTBtpa6fFzj6bR1Zjni6FZcnJNn%2BNwlTaPZKS5vhB9u8pYQr5QdiT9fWh6fAuSckQqoYCPFIRzcFhlwFps1VWclOvwT5HTEUySoxJ464SFXKO0hvdqzLrv56vypu%2FIpNhbLbFAoQsvI1KI%2BrtXLnOaJFSPQwmjZU%2BjK1vsZXy7qfzXwHLxZBiQ%3D%3D
cjv3bpqap01pn0783h4p67yno	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_17049fa1-36a1-4e88-86f0-234329e83de8.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=iHH1lCvs%2BeirUl50YHc6ImUn%2FPM%2BxdKwBtq0jSNbb%2B06B4gS68AHrwng%2B8hQtSbNUE1Ec3Gki3S9uC6vs8N8q8h0uveEBJHmWWK%2FrYrz4IWptYCD8TSRHiiqBmtDmYVYDuXxCmkbWcFUp5UmVk7QrnPOzTEUP1X1xmcKy74sjWA70dpH28gxHK4uBw3%2BbUpCg6v7epO5ybuCq6hAf6MQqFUTsCZXLLBZ%2FMALYMtlMiZBofbqy%2Bv8PbPxAUKetPb6qD2VTE879ff0cRTM2RXdd288EOBvRCmwGMHilZICRdMWJwroW6HYevR5DFBNrZz3i%2FD4WGAoqc9LDugpt4jgag%3D%3D
cjv3bpqb201ps0783pnwsksyl	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_8a19770b-2265-466c-a388-98ff01067701.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=Z4U4jlomjNHK4Fd7CI7yUo26iBwMsI%2F1tBBjR7U0yawDArd4f0LVMoWjXmSnoEm46hqmJiHRrDn2pTyAxNwu6ZttDPu17jifdQrU0NfwS6mdukUpXSsLwSVKko9vGcAclLso8ZiiAO3UZwAm%2BoVGA%2F%2BNmCb0MC8y6AUr9y2SGSF8hbLXcuphEzzzz2sWpFNup21PhCWcMMmcuX8vIwhSYO0pD9wNpPfCrp4c3gYsf%2FEW2yG3%2BlfsTqSMX1%2Bjlc2LFayZIF2jBDUFlydsG93IfxXDvD2K02S4ivxK1Qdlc9qBvQRaVhWoW32KnBn6mSt0Mg%2BqsVh6d2YIBFASySMfcA%3D%3D
cjv3bpqbe01px0783086by0wp	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_94210e57-a0e0-4545-b72f-c9a954c65bd1.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=g%2Bsng3fdaleGjsvhKJljaN3cAONa8n%2Bt8OjGUeLwSZnQ4fey78aQ1pV%2FZUu4NFihpAeIiT42g03vkIdR54Gxkm9xIg%2Fmp7YGcp0DK%2B8dFsL5Qi1GorvcTL7cGY5o0BJN0QYw9dJQzRBKLzZJmu8c01h0l4t5PDNXNwF352cf8h656LhvSGVCH%2BRztN08uO%2FlLxa297XP%2BU9IL7iksEewcIai4zq%2F6zdwZh8KaUuZX3R01kAGu%2BZ86O%2BMb%2BZhIxMvmJejMVVJ3%2FBh%2B19dJtyGWa8u4cgfIWfLaXE9rQaLHm%2BjPyBVGfSwYzNE21ZegPGbwWHIqd%2F7aqsCRDC6hupiAw%3D%3D
cjv3bpqbr01q20783jr8medti	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_75bd5639-5fb3-4d50-affd-5751042027bb.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=P1%2BAo4Wj3pbsKJOox9CmYMC5t3%2B08Xs3ucvYcBeQB6hHMr44PnhJNCRM280Qofa7hJaXMCB7ad53YnkFTOiAmMzDHWCMxyCfFrQ32ViZ9SlooQsHd8RYhEKuIdRVXhyvvDaXXXQKJ9XokYqMUhF3%2FlzoSiQOt75heQ8mmbq%2B0whS%2BAlnDHpa%2FgCjQ%2FIwZcuwgd99fqF%2Faa5ylq74OKhd5t62Du%2FB5ai%2BWQJ8NLSMeH5%2BlfFXQ1rGRM7z9FxcmAOk%2BqOaO6G3gckm%2BCw%2FrmWezzROyOfg87x%2F99IsWoTxm7%2Fe37dQuV3qeMW2NT3dxdcl701swZdiJ4V%2BSpwilmXSJA%3D%3D
cjv3bpqc301q70783vbtvmga6	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_79ebf379-7247-4b70-8dc4-90f592d5cf11.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=a8t%2BgbXnkonJdpacYVnTzTHxoyFMxNf7XxXpy88PF2v7iOj%2F7W7pK4Vlo5GfIFZmH9dQnpWJ5HKTHjr8tbZjkZbj2wQs1m3XkA0TpYxGajXzsLuw7D6IcVxU3KZMBM2kQ3rtJOjb7frl5SyEwj45YH%2FV1URHcjB1HVQvQPXARyKNQ%2BPTrbKVd9EyjXFMj8kwWNvOB%2FQF04AfGGz3bAFIJdx8TqDkpHyqTauIPgI4BH5uNLo%2BvTNxWX74kGbuaXkAZxT%2BJW2dtdmq%2FeYC%2FAqRRi2e2jByAgUN0JTrkPq5jrRVfVoBu9OXEICOMpmW0Wc8CDE7RNZqnMF9jE4%2BTfWF4Q%3D%3D
cjv3bpqcr01qc07834plxjgfg	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_4d6a8818-c8bd-4416-b0ba-933c065fceb8.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=sH9HL%2BpUg3c6%2BjKozi2YYBTYY7niLHYs2CJ3GKWHGcSchwmUUvfCaZmOB62utyjpBkjW%2FtohA4fp29MFFQgWHNUOjKr1tfokTnj6%2B1yZobhlu8zlScHsGU4JomYXSRtXWd7gXUdl6bVX%2BOHysYTsHsOkj2llfuLdvbp9IN1e1IyiohaNjYL0Hn1htO3PrEpWkjr%2BS2iZViCWbbaKO69OydOSoy4UZreNZ5Tc4Crdo59U00ZzbP3wMIcyO2olgYzlE%2FILvcMJJvSyLyJ44%2FX2Q4pg3f271sBNrt4Kja4uGuI4i8d0nd4opXZVewkMwVgUIOC4gFSSjVgPXXgM4r0zPA%3D%3D
cjv3bpqdj01qh0783fhdyx352	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_6f545c6e-4c04-43c8-a848-055814209b1b.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=icCWWpiJMVWE86TIKUN6fhZIpWey6OXN6xFmH5QH4%2FRoop6NjXB7htDksFEJK%2BF9J7sBQgr5GE2dwkGJlnVe%2Fr1gqB%2BgOQN6Aw95TPgFwjci7Cju9flGYUCn%2BpcJ4iWO4H2utt%2FsYjUgTZTf8zQAJoLTeuFohHH%2FTaND1pPVwuTh2SPoAOgZiLkuJUM0hhG0kFnkz3zm03hTk95RJBiuwakphUGLHGNgB1i5bUBJ3Ft0GXsGURZ4RD0ElmOj9P27MJP4boUjNEY9NX1%2B5gMVbBnPL0%2BMlKlD4W5brVnQSa3FPVnq%2BV4witIOAYtWC0nJg1GaqhQk2NALevExf9kUPA%3D%3D
cjv3bpqdw01qm0783ob3t9vn1	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_461d4cee-9ced-460f-8788-51631c41ae7e.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=hZVap5MzpcDtJRJzWCh%2FWjhwoRtALyEao%2BTDhVmJxRmLfadPcWoB4ZhOmCmOZ6Vu37%2BOnASSb%2BcXBhOn21heUS94KXcpRdY39f3YJGN%2BtKhOlUChzAxLTxzryswqrffdQiIxkKJcwnv95hDwWn%2FpvhbXNBXo7fKUhrudXZRZCRWf7P5DAT8%2FLzsNofOesiz0W0RPAMJGClSFltuVX0ytwxD4LyaX%2BLDp53RPwozU4Hp47zuTRGLT%2BPTCskQLoi4UtRn85NmFGDkXIMYrUEN5f8c0tWKFthIsYrOuOd3T0cIzzPpdgXyxmXOKYsv0odAuSqbIJRbm5CqY5yEfH9LtKw%3D%3D
cjv3bpqe701qr0783bxkcwclk	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_6e5adf42-6123-42fb-bf92-8eb8ea01ff7a.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=aArlBVzS4s%2BDaoJLAZC%2FjvHuKgV884KJGqqI6w66sYarvKIkq7nmwH2sD0nYUjgsQN8t49CJI3p1kMg16QRCJ2nWbqJ7NYt5iyago7g8NDO1nV7C6YqUNHXq5p1mqY0jo%2B%2BbH7I0GoLZLe4Dwv1nxYfQ51dTmUF3eijj9EqJo0wdo7paFT5sOLRlLawDUty99QUoFFxUDoTyYUMj8EGmkWyVAR1h5ftbb6Rr7kYtNcvfQ4XLjAj0aXX7wOo%2Fd6pEQnsy%2FyXS1N97QZlZ2VzhiE60gQ3zA3D2X7FkhcpkJngckXajOOVlCECr0acA3GTvOC4GJS%2BC1dUG7%2FKPHJVR0A%3D%3D
cjv3bpqev01qw0783tqgx5fue	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_ec82cd58-b7a7-48b5-806e-9f8a1bf0f5a5.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=IGmxqafMQLZfMi7qGH3l485zRXiz44wvPVCdcQO4Y9Plx9UtWBEUNBBz%2B2jS5WinfWMIhda%2BA%2FuNYG5xHzwXFWUo%2F4hTSHXs6ywn8M%2FkjMVAbiU1lxB9rMfmCDpTE%2BwfzhG26vfA348pgkchZGGLWddywAfOXKn%2BI578KvccrKJyeL1coTLEfWcH2KlIk8gfeO4YQYHp%2F%2BF22Pzxj%2BRVumhuB0BGu9mmmp%2BxKiMSHPhJ4Yhg%2BmFaCi5lxu28MTeKupqJTyfvmPlAhYoN%2Fux%2FmDoMQLC9T3fErXkXMfjyqkXutlEnx2xyEvooCDzX9tdgI%2FZ5qazBQEmkuDQXPk6Jrw%3D%3D
cjv3bpqfw01r60783l4rhsgo8	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_77d03ab4-4442-47b7-abdc-8895be9ae26c.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=w0PkxIToVOXDvjkhyscGqL94B%2FMiR53M%2Ffsx5iT%2FrSfMrLEZU2fPJl9Ie%2FsCeTY3UEwRdhNVO%2Frsvi3CUGpgKIEADAgmP4GlrS5wHa3wxH7rWaooVO7IjQYmvet4cfx8k%2BBYlmQ7JYToR66oY7JCHp0savv2jMBHPqPa%2F%2BMmeXFOWvzRaYAkBVuXQbJPno7SdukmvVZj8HgMGPJAMjzkPQg%2B2SqQNgf5TNUDZZUY88c3Bdm8Og7%2FSF3Ee6UNp%2BvSJbmrDZEHMeyedNtMvaOFCqfmzQRJl9cDe3LKS4FH8%2BYUJX4unBWSZuTrQGG5ijieUCPgoWJYwMej3P63D0g2gA%3D%3D
cjv3bpqgp01rg0783gj1loj3a	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_8ef4248b-616d-419a-8277-085b4bd551f2.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=ARz4rGoiwTaIOS2UPNynAF1ZNpuh2MnoVbDHn4iGvKteujki3ZV6wZrhSu0EpFG0QmE49TCdpebZ6YiM3rFafb6QLfch8uVu7oGGyl6sqsdgP7CU%2BCGPhiYrJX5sJsNrsUkW2aCDpQ0aplJJuwemoRxGh6Q0TB62b9oNY44xJfMTNgcs0nVwCn7gIs%2BUDLiUpNMB8NmZj%2FLqKefFj7%2FBq50pQHRbkRHgd7udqELSoKTQYO3tmMtXbZ1xkzorEkVCYSQ5TyCdLC2kdR0pfS%2Bu%2FCK0sFdQxah6282YYmNLqgjRjG%2FUJDM%2F8mKW5Jygv5UIRJjKZTALvIGrW23bSNFY0g%3D%3D
cjv3bpqhi01rq0783xhzto7ti	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_3a489765-c49f-4d45-951f-f4439d3bfa29.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=F610PGfZSjYAgTDc2Dh1tcjaLTfyovhI3JHNrL2quhpU9Zzt%2FU6j%2BkeK8P7gAKxL3h2vDeTJghlrxDpMbHWLurKt91jmU2TSZbOHx3Kd8GdrHfh4%2FQsM4SoT2ivPaJTxPybW1BLqElI7lKJG7Gk53KK3hJyBTm5eqY9%2BN6QJuFssuXMFWjWLMN9XllQDGTvNBQesQ0OeMw%2FpGsXFn9hgOJ49zSDf573AeadqiEUFIT80jJzgtSpKzFODbP5DxLsCInMzZ7dUA77i9oogs7Bh0LHancsGQo%2Fvz3xG1TRT3VMBRDXOP0UqTVNjKSnySg4%2Fa6JFrNUVBkCSCPK5u1c63A%3D%3D
cjv3bpqiq01s00783enp9w5xr	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_3e008374-be38-468e-9ba3-f0b53a7454d0.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=i4YwkjehH3A1CghYaiNOksbVzm2LiDzEY6iGQ4pzZvZFTnTxiujLq4pF88tUDxBBEEBy73UHcZg4QP5PPUHYy8MkcmjLiEAbyCfNBtqgUZZF4jIu8326SlpRAsLvfee7yMnXXVPbjVPs7ZHQ3FnQ1FeMbaEQHzEsSAbXE8%2FIzM41rS%2BYVRKXp9uPXm%2Bmi2Rw4qzfzuyp3FXShRROOJLb0ifINTYCJwyIrX3tIWR%2FTmjp7YsGRogxWmmXNUwjATtRrIao8dnCvc8FDkUadhKob5zaYZmQKoyYAkA8wH7OOZRv8iIb7ZxL1nxCAJ%2Ffa2oZ9z9m%2FqNrKlZWluc2R0cTlQ%3D%3D
cjv3bpqjw01sa0783iika0vvb	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_811306f7-0dec-4e0c-a109-79837a2b5a32.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=TkkURrJLL4b%2Fy7XbcRYzw0mNYXCuRLww3THW%2FMIgQBLYyJqTWqHicdkW4pIB26H5vPXgGIe6p4P4g0XpjxqqDtqf9ucR%2B5RZ9ruuB5AlpPne%2BHJgHOpios8w9lI%2Fq61oDLgwy%2FsSEOTP5t0nXi4xTm6osBchOik9JxwZ5HrpfoTPpY2SYaZwW2UzwdLYzo6Ym7m7Bh4Y342xH5fzTLCwCG%2FtfBNzbpnt45UT%2Bl1rVP0pjJG3t%2Bsdmc%2BhTOkLFrwIsW4b8xU0F5LNH0bOZeZcHkDugu0lGBGki%2F8jyAUAxQRob1HoltKD1VMgXPcTR7JUGGJBczUzE3rU1SDhrRPetQ%3D%3D
cjv3bpql001sk0783g9ka7dw4	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_2de06264-372c-4232-8ea5-0fe81c240b2a.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=a%2BGcobs0kaaJExUQb4fJim7fhu%2BlruTISuq9Gi4QWB3qOngE%2BPV8M4mSWpjBFJ6NQKYid%2F2MQgRv31DincrRlQq20KxQ5hulGLldMU9BUwctcCNlELtsuc4EJff9AVVqD6YW%2BGKwW%2BO%2B41zL0rm7gOWIfFEtz5p%2BcMFa%2FK6BHIER7zb10IYYMY7NzmyzpBrrnmFDbEKSJiA%2FpMSxLmvCI04uHn0GNUDCKGKBWd%2FldjKorMkBxthtwjX8DLf7vFwjdKqJdLOff6G7TkeOqrtjsIdqWjl%2FqcAgKkgeL%2Fwg3JmMOSGbDDUnd%2FG4uQG6epuuBnIeibrtt%2BXSVVzd9lm0tQ%3D%3D
cjv3bpqme01su0783qpwmd0na	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_cde8bd21-2e3d-4973-ac61-84a2d4d24b4d.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=xD3yT3sFzJe6KcXDgrIbELJIFry7yoKTOxwRfQsSLZE1VOgDSRVBDc0i3vQcr2uQtgfUu6RQUPXYU2WUgGWfX7zg4OVlZX9FApG93txOLTCv3KyHBkoqKEuq%2F3bK0TYUkoIVRchzggIvWk3wCRAq%2FRxxN7vsPwsZCr529QM%2FQqxMSBhY0DK7tdxoSNLg3zv8eJJ2JptvOk%2F4A9gzVFgPfJ%2BEYemdkCNfBJ5W62gPpMQmUgjL%2F0qoHO8QoGyQ4ECqWl3x9mqaKcws9lT74UD5CU48PpwR%2Fpq30uKKiLsHYUyy4Nh2yBP3O2V8FMmKNo7pQDavoQEUxikbqctVZOCJLw%3D%3D
cjv3bpqn501t407839wafew2s	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_b7ab816b-4a57-46b6-a61e-a839eaa92413.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=ycq6FRj1ITlazwPtInIXQOuewrrgPb199MGr6XytmtnX6GvbbrJBRayFr%2FSCs%2FXwOxsPgIiU75VRBo9%2F4zzc7b%2F7HRfk92QFj3RNYdR9r8Q%2BxRWDBb%2FoUTx3NLK7wXy1%2BrRwjK2aAJZ3MB%2Fnb7d2kKrZwYn9zKJp3qj30dVhgP5cRmIHGOF0EJ4xA7O7uzUONNSvtvnILBU1sLMyDA5GjI3trhdfsHovsw5wSmD3zUjOc9YiUmVmbeR9gp5S3ZXrYH%2Fmhbrm%2BmIL9zgivPDNkJz7iS4hd03CtgmsJuXMrElb5OlA2JEHNdkRnSIb94%2BXt3FOFUNMNclRp9IYKv%2Bt9A%3D%3D
cjv3bpqo101te07830oubmrkb	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_eb8bced4-1cdc-4829-9fae-4ff489bb8ce5.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=EfscoWp6IM8Mv%2FZRCqTUVqXRJ3ARIJpRAvYVAUoJKVH%2FS9T3n78pRxDxAQy4iiZWCbAPQxLmE6%2FgSGx1ghRcwa9T3LdviVnuz2GVD5iUAdi41gjl%2Fv%2BCRuiMUQewd2kWPdDANpdvDuR3WdJaACLmLfBKPE4%2FuiN0%2F1mi5r%2F0DGzTuJfxk0Pkpz0Vz5O%2BCM9fKjpME1E4%2BsuHerkdqDmxq84fi8mwsjvGMaB7R%2F6wdisrGYyVTtSzaww9p7ffjGeMQ4OMdPrUdMiJgk3t%2FC6NgTaHKzL%2FlLJtWfmEt8OhL3TvADQeEvU49Dn%2BpU1T6Ix%2BVONpHO74c%2F4z5Z5AEeQpRg%3D%3D
cjv3bpqos01to07835k14eixm	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_b403dd07-4323-42d0-a744-755952a2fe88.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=csxt65A8M5Sd0l3ak9W2p%2FNpFmBUBPIm9jQ4GHX%2BMGVsvvhfg04DHsEPE5yv3VnQQyK%2F1y9xbzH1wEnUMXzySB1uMcAFLdSgLVLFZy8ghKHnq9NDdUQE5%2FKraZua0v78UTKAe54DSINJrK4vksi6v74wFJC5DKq3J1UlaTnva1AT6ufpjJDYmVcP%2BVqfLJZoDPs1PHVRm0LBTidUtWfprmTECN7EqAfCLyYAHsVjoLhY5rTstquykofAnvqUD%2FFGxF6NHuJR0trcX5z2rRTYm9ppzjNjtGUfzsbVEYBAaR%2BG4nzhG8umEzCSYg7U64JrWKz7dD4Ih5Zcx4bwDMfDSg%3D%3D
cjv3bpqpo01ty0783ncljs5fc	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_cddc607a-21cd-4125-8cd4-62afe7354fac.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=Yeh1HQuqEiZdCQ4cYAg5FE0P1KpXyfk%2F3zsoULKQAAohVMSM2IoakyDDubyQqYY7lYzjDcV4usly2K74uUuDzRmyr477h5BoqCRZ2FJOC3qAOyGMTLJ6X9GJAlceAaei%2Bx%2BRDdOCcqN74BSutO5K6zxM1Omr9dLvmRFEq%2BG9qQzd%2Blpg9zP9MmUclJwoMwRZj4X4g%2FBTdyANYJff1f49weKWlavLD6%2FFALD5B5zOvAGmAo3%2BSbGgn0Y%2Be1XACxKwtkKZ05V2DPhuENDx9WWj%2BlCV4yy7n0vR3LEXyJ8phnaguUEHvj%2BYYPWVc8Rt8UkAHCzD371VtjDJ3iZJ4x7muw%3D%3D
cjv3bpqfc01r10783zj33txlr	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_a6b6e2b5-d679-4a1e-87e3-42420f22b1b0.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=dZrTKPhaGBs8p2WLdrjflPLQFsGTQ8Xh6PAsjaREDCRokKNImeCoMPgGqQGWrheX2nymmsoibeyylJz%2BjPTwEs2zKsFg4%2Bu4NOpgHdtGnFC7WiVPNOf9yFeIjtgJWhERrDR6iKcsEaSYSTRbPOeoUPElgai%2BxIvAZE95lNxMD227AuEhrW8aMvznjWaNhOcTIHJQ2vnEBlKjdLfH9R0Vl7BMNZqCVr7ghCJiRqQ1xsoGN37HirOa%2Bh8VNeuGl6l6wmrwP6JUmCqSiyjrXMOBcjntgXBL93fSmT5HqxDx2xDbzXsC5AaBniZSaxTqCeTfRprFUzy7D9%2BSGlP9E6s40g%3D%3D
cjv3bpqgc01rb0783gy6qy1zi	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_ca5e26b8-a919-4b7f-8d9c-26180a948ea3.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=nlWO0v6TXlLGfxAcOIr5frrBf6dtoiVNNOB5KxJNVMo826LGJiSVuUJETab32dGd4d4O6N6O%2Fr2AYsyVG%2BHBgzfojpWCLsdtCOYizqyfIxclEb86EJgJ22aHM7cmlnLsZxdjNmhoyW0LmoQ1PktqEuh%2FnEH%2FUcXkY5RQ%2FHj35gVP558bCw5zUS1nRPJ%2BQikktMMvr3nd8iguNV0k%2BPpY6vtrKXGjeGulE1BV9eYupiToQYTEknuIUF989nrd2%2B6MvV85675Jh9lxo1TNg2W6LD8ivyClSlF1JB7t%2F8vK%2F%2BGOhBfl2FaLB%2BZheX7RfiCT20%2FQ%2BSnFmaIroTgxlazxQA%3D%3D
cjv3bpqh301rl078313uposes	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_c12fb7a8-0d92-4753-b3b9-05bbb153003a.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=zDOtX0keDDQxJ0%2Bn1zu%2FNJ70KblIrooLkZUn7btoik%2BSJhybEdSwQTQfnditQG3IX0v%2BGKaFSL4qpPipxs1e7cmpmfAooWHnzuTUablvCj86Xc1WNpW2QbTm3gZaEq8YZ94LQx7GThsyQettN1xRUi0EUhtlCuI%2Fd9%2F0eGmpU6aDRBIUzErGZRRav%2FTZpBygVzg9sjIuftkOwvGAdecBtgHrDnCPAyFhXQJAOct4rx0%2FNiaznnRfK7%2B8FEkCXzEoJuK3IN1Lq7pg2%2FUhmMJuWMMra0%2Fd%2Bmz%2Bb%2FOEMGXx0Do9q9A6cbEbdkKOWQP9lHOOMw9jass%2BbjXMDXa%2FON8GTg%3D%3D
cjv3bpqhw01rv0783a714v4tm	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_b3f9f2a0-fdaa-44be-949b-7bbe365222e9.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=R0h0FG%2FRQjx2WAyhLksqJmnxg1HoABbjwQq3dnqXRMEIi%2F8etUkrH7fBOH0haVx7FAOjxokvcL%2FSF6qRbVmdfSw4vBim%2FPyWhA%2FMfTzHRcgdKzFSu88Pk4wd18JxeXqZj0YDNXyE96QLXVt6DK4FJoEBuWjIQenwRIszfBI9b3oOR09GE0U%2BdJvcwrwA2xCPwzIvTktIv6hGdhgaAG0rFNzVs3Hq6Tk4AonMl2NR%2FuGPSFm3KhPKcTHL8U%2BVJrcPq%2F1lmiB4MxuhRiEwW1bTJ4KSEFxkO%2FVjMxaakcTFZpX1FvUIPTOGJb%2BYG8o2qzSynVxb0pwOE3a1rdu5FGKQ6w%3D%3D
cjv3bpqjj01s50783fbmaj839	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_ccc628c8-b506-445b-ab2d-da42e6fd9245.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=DOdeh%2FegHzo4YA0ZCdLJ8X2haiVt5ouEQ9VKV6xCcKZigIQxCHsXL1yb4Ey67rGX3G9QteNchRH%2FNTjp%2Bu%2B3Neudqn2q4iTfsStnm33fo6cEt2RkMLmo6ju0YxSEMAJsjSdJoZQcoSXcuH65gjs5TBS1rvQlQprpoBVpIqTXDn2I%2BlR7HOg3vmTIhW6kVB255zB%2FFk5fZ30fnaJDRmdZKDAX3XkiexU3nhmFszZBa%2By464wzTkLEcSUC74bx%2BpehtXYDWoKklBuE%2FAqobtD5j%2F4tzhZ4eOwC%2Bk8IVH1Kk2V7WqCAqfZfi3e436v5QDpwl7VvL8EtH6vJ310bbLKK1A%3D%3D
cjv3bpqkn01sf0783gz07oh7k	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_ba5590fe-4f07-4fc7-9265-2b15bc514ba5.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=GG1MyU807Z4DYa3JkLmuZuKK8D%2FBzyYXNDNkHhm6WaiS9CRbTgSR2PV9cYFPWuB3qUgQLAywpDjqhZV%2BLvb3iMDKeku6oHGxAbc6uHkPO9%2BvLaHZb3dO9FJVJ2g35%2FrEH3KW11VJSlImT19z40WECn3CvsMva6Nxs66CRieZSny%2Fu9grY883V1hy65D%2FBzyv%2BAlctoLbtgsb7QWsddaQEIuWdmPdSq%2FKhH8%2Fu5WFcLKHK%2FLyx0VjNDbv%2FxiAI1K%2F%2FajO%2B56QC8exQdlTOzbZa%2FinlHaq6owqjbwpmfe1w4ujLXYZYL%2F40XdEKUtmG2CGNa3hAjBlKNTHhscxWgnZnw%3D%3D
cjv3bpqln01sp0783lcgthgke	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_0a9154bb-64a8-4351-b8fc-7aa8a866a15e.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=LajTmsctxKDhQ5sdeP8W9R9sax0AUMhPFpjOyA9qq1pJXTNcCf1AQ4FnK%2BsdlFM58DxioFvbfsxE%2BF63qYoRUctrqorZXlAVoBrjgYRAvPlLdOOF6DCMI1TMoOPxn%2FaudtO22knw4NkcZC3fCvFta01p4uPqbTaRf5NxyPfpYhEhiJ4hnX1ZgujwZSNeGWHyBnGWlu4dUqcQ5oQD6Gg%2B1yVf1IOCMhHut1RE%2BlBXA2ZAh%2BZXCbNYwmVyMYhBGTuj04%2B3VikHhQx3LWSUYjexi93RdlFEu30VVd2GqG6Ri1T9RjiAIIyV3XdkpzHCA5UO%2FxSd%2FBpsR1kYMtCWZ26zbw%3D%3D
cjv3bpqms01sz078354rghwe8	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_c635d86d-5c18-44cc-8e6f-6e4f8a6b61fb.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=dxxC80jxDK45it3RLts0Kyctshzzyyx8r9Qo2OFeDZpL6Vm6Ih8yJL1PiL0gqnV0NotVpGaI%2BdFMd9gIal7yqxe6uW4robEn6SVsZ4rOrRYSizpvxUKNcTpkiViKxt9VbvENyumTEy8VyIJSla2g9GCAyFE4btK7gC5gsv3c5ZHh4t4WB58sjJ0htX3HzGHX64EAePSk0HcyP%2Bhf6Qxtp7e0BIEcWyn8idKHx3Tx%2FLMjA%2FpACAzWu17KODv6oHz4I44zBlKVhD1Lf6EMSmscKoYNr7PE4%2BBBbTznZiYysKlgZKI6sFtgXh8shaG4RvMT7RS0ynlImg%2BznK5gp5zaJg%3D%3D
cjv3bpqnn01t90783tbqn3ipy	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_6a7f943f-b9b4-45cc-b546-7238a646314c.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=rD3Fa7LZzY5vPf4bbsiyHsuWPG6YyccR5egzEDnUwQlCr6eqYa82l6tQMo1o1IWWXqZdDdylvpM1gMGKVZBL0pFKVPX%2FRMluHgo8V%2BaJfUUzPlLVM8KkCNIe4nX3DnY10pbb03BgUi%2B%2FqPX3xtBHCL6o9REqjv3BRKOSYTvEFjFwDyxFcTyo55pxHnALZeCEAw%2B2rnIUENqV1812jEmtC6v010MMdjzCKJUQWgEjPfnVceIaV5SpcYPDbTV%2Fse80tJ8sQY%2FzXr9enNr3p3PgFJdvr%2FHTpxOUnEzzowmPWrp%2FO8QhJAEmdt9aUJwE9KuooY3GMGfCZDLouYxxVM5cBQ%3D%3D
cjv3bpqoe01tj0783pgtug8ov	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_8a2bce09-cab6-4525-bfc8-7de08fc681b8.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=P08Mz5rniO5CMy8X2hutjcc9%2FxWskCB9HWvOA2wcxojT6qrO8ACtQDnvMaEahTi3plI%2BX93gwpqQCrXJeFYQ2BahRQZT9AALdUYP2tkw9v9DWoh6ZFgIdQacSfWI1%2BnOEj7hNkKhZ%2B3goA2SiBZoSF%2BYLUsxHNhnUJMEzl74yJ6sZXeh8abqcXb4kWrIQq8n7YhrtOmtgM6jfhpstJ6e9kH4yWMRpRDujNJFkoBcEyGzUZHU2b5KOgmuEqFqz5dAV4paprtMraMp299JCy7NXtv2ipathm%2BwnaTnWmlxMqRqr0g2jZgXSMpLzTmuQSJzyxFgHaYdbbsg3%2BqeU9PKSA%3D%3D
cjv3bpqpb01tt0783qzrxjtdd	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_771cfaba-a513-40fb-b920-1c5ada04aa51.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=EztfhCy6QoHC8bngKrO3KXXLJb34hK%2FYGsH0IV3Q%2FSi0xNld8zLVS7XHbAvYinTwqi%2FA718%2FdzXDlrVo9OdfvKJx3%2B15zIWGixIljwFB0vasvHgYbabgWaF231aAHGM23KEgUxtQPgMWUEJNk7FatB4Q2YODDnZbICq2AhGnFXd6MxJ1S5%2BlE6NMGIx49gw9LojZGLNthNfVjp0BAvfi8KL5yLCKT0o%2BgSQjekn%2BrQjC0xY4xGBUeMOu6I70Pi%2F9D6jUWV%2BZL8lfoPFHwhPOOliwKc%2Bp%2FJgHC8UmYCJQHHl%2BfuZQt2zPmzXxERWmdIZruYJ4TjXYxyOPPLfdmixu%2Bg%3D%3D
cjv3bpqqf01u307832e0f22pd	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_c5955b98-ffb5-42b7-a50a-4235bb741888.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=twxhZv%2BlO95mcntHL7Q9iJhP7ESKQGEalDuQO6lQ81DoeMgujF7kou%2FN1m4lTkZuds6IOd%2FPG1Pw%2BR2ZleOtecK0ic9Hmbhvrh60CLtJTSIDMj2Djl0jcGo%2FKbDIvjR%2BtZYNszhZZ0ayU%2BIr580FzGDiHC9KVeHlREK4GpxiRz%2BdptOFddYcol4QRPCyohaNxFnYMOFr75odLHhIo2RNFJ%2FTHnrJwS08407S8QIytByNRaxsRBvKj2X9MOd%2FyKftAkEGaJWMpJNjMm8HoBmyHc4u%2BgQ93pywYAuFZ1%2BG%2FMi3c0r0IV%2FkLy1YF3hoYdROEyhHKD61mnvmmjCBblnM7Q%3D%3D
cjv3bpqqs01u80783i6uyijk8	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_e5aa6dee-f9f6-4ea3-8920-73d038e51080.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=EUl7Xz8YlQAwzT15fkLMvgC%2FoLcc9EfQ5Q2xYhQWI2sGzjyosdvSQ2GM7aaVdHz989dhjSAgM82K5TJmj6YAz%2FRd%2BIlj7OPylMIcg05QMOlonFAw7Dwtcx9au7SDU4filt8szNYyGDGh%2FieNLxdQb1DPLQIQjxa5GSDNQlUcPUxiagvsO2Pd7Hh1Jv0j63sdc%2B6zygvxXiAt5N%2FDwk4M3Bgcm7OsfnVyVZL19%2FstJZbvo6lUc9C8bSeET6MWodtPCZPky6LYH5OYsXsZnTN1oNydyZkt15gXhkbCWUMIZcM15vUAzy2FJzDHfGlrCGzs3YbXNIJekdRSoFUH0LIUFg%3D%3D
cjv3bpqrg01ud0783dek8dqgp	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_d4bf0696-d096-4a9b-8cfc-7f26636409d9.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=ss8ndPchYZ7mMjMTDHWzCwBAPyFXl62HbGzYPnkWBehVNBx%2BSQ8GY%2Bheto0Hjcclre8RG%2Ftxygd%2FpS16sRLf25j5%2F2rWMVMYkbZV%2BSZxT811gaNgYbfZBCOS%2FzIhl5n6bJiPZFZLJkAwQTnUvNpGr9xUDgdvL1VUsTZdkymMnC0VnNyoddaCOjnG7nsvHGPJvXBSRVOZyhGoCFRRD7QEl7pnzg3Kbfc5nrmpVU8cIBn5go%2FpcLRiP28GfW%2BgZorUFkxvFpt%2BW3GneFDfjdf8MnyylZ5ILqcAVRMuuLRgQS%2BM2rTOr6%2F3NMep7OjtMe%2Bwn8JEzKevJAhIV0BibUP25g%3D%3D
cjv3bpqrz01ui0783zogtnn9t	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_ddaf896b-3a9a-4c57-9347-d5f76bb09ce0.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=F%2BXAvFuZ2fVQIcOGuwgiBLLChszOTbkb%2FMlJN%2FbC5mGIhIGT7Y96NXGPfQJ5n6%2FhIV1HK5F%2BhteFNz9bSREf%2Bg2zup4IH%2FjPh37mgoY%2BqS5hblJ050Kc7eLcJvq43udrs2CVvl45mYJ0Eh%2Bl6s5UZHkRTAfQswz%2BQIPtWv%2FVJq8yWCgSKNgDXCUxn80eelDzGoeiixL%2BzUqoNTmlrOoc7x1I5DxTLdiZd%2BFry8uteppNbQtp%2F1D1cBDX6K2OJzYWcGYktM9db44GArU6uEPwTjdAR2JM8bJzCYyfxiq%2F79jBxgLLPChpXWwTrCcr%2F1Waj%2F7bT55PuqG45HqeUBkgIA%3D%3D
cjv3bpqsb01un0783eue2u2p9	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_d231eb43-e195-4d80-a335-e18d7abae891.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=wyUs%2Bx3RgpS8lcTuIKXeHcPs1N6%2FtzgMlN2fkZhH7ybl19vXrdtLA0dDveh7H5cxJhuY09vUGbukkRSX60DUxRy%2FyvYZOh44lPI80sD2sCqKqOTmhRFJrwvDUppv7tT5ICA5oSdy5jsAmTuZvzHbUZwwB5b0VCA8I0JuwegOJ39CX8zwQ%2BcXtmRGNtrSJ3nfmeYzlI78XjE72MVNXpTZhFZZWIgEqBUZTtYamsSriUaaXB1g8%2BZAW5C3puGzzZx3GMgLukwDEzdQtBZhedPXzvfrPZJliX1kkvJnApnVfE1gz82e%2B1UOGqXcvvwt9YofZRq7sy2hww4EVOrUYIuZ4w%3D%3D
cjv3bpqsq01us07835szghyiw	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_3cca5d0d-e34f-406c-810b-d74857a4d9ad.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=KfcA6XMfiKjz2Stj073QAit2%2BNzzR7Zo%2Fa9vWvzlsFKsnPrJekFIwr74aBGATMBuSKlbp9Y9MtQtTm%2BuvviLd0L0oy%2BAtLojQ5WBew5YBibcUU%2BCRagE4qoL9tsiS2ED%2F0BkFf6MQm3AYv9cFFN6NAn7y4XcLE8d8i2BIQ2fgWTPkjcTHka2aMkz46H4jx1Ryu64xQKcWVPXGzWrYSw%2FyBmVuLcID8icRmVco6ucbkdg4vvNK5ibjTvPFxzA8PKNxRwBa8IJeJgHro8z%2FFBgtweFfe9E2ADKdDwnis8WB3w%2F4Fh60vrLrA0b8NivjDNGBG962XkxWh8MWESW8iFmDg%3D%3D
cjv3bpqt201ux0783s9n7rtat	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_57fcbc13-c417-449f-be0f-385c51152293.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=AlAB9iI%2Fb8gMK4O3TIiOLBtAS0iGGhlarTKBolpZPkszmvk7%2FvafcM4y1v9PzxQKozqC%2BDf1qT1jVbzlqXQgmfKY41tAYm%2FsuC84xuQlaG6mVGtezNZ%2BM0gqj8de1kbt7LMOXTpALPuhSF%2BCxgEaNzSobp4EGTpnQFRjsMtZsMsltMeAZavVG0pj%2F77mEkZzARWbFAorgW69sEvv%2Byb3M5%2BtS2bCtmPv%2BrWAZ3MKGR4QFoqVeXjgWHmCF2YI7worMV462l1IN1O6RP60nYG%2FsCx%2F02jfrBpTZEed1ewCx7eRUIG3GVKC8lIqldR%2FCq0jGpyYvMLnXKQR%2F7%2BMhoD9OA%3D%3D
cjv3bpqtm01v20783wjf2aw2y	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_5024d2c9-385a-48cc-8b9e-a69952b97fb5.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=MCAFo52%2BvA83map%2FGyUm9vnzoeJU3io%2FXtgbxmYo6C5RHzMCdJgJ1pRwyucQ7BBks0j0G9tvRfDZpBxqhx8Sh5oIt6rLSshdcuJLLcU4OENzvygC3QihP3gjv4D0nLLECQqt9v2EgBSsdPFWYIVuzrVWesvom57uybb2CbbPDQYyaSvbZl%2BSdkf1hg2AqWUJih6PpPS6cgYVBQmd%2B838Lejl5LbMrVOF6oK3MPdyan2RH%2FB4WV9ZyOojwvWQjgAzoCcZ6oWlK4shoUmuh6UFyp9cDmuLph5MUyvVnGPRv9iD3QRb4sQiacppeyknohQWTkF0H6Z%2FHMe26jBpWOcgQw%3D%3D
cjv3bpqty01v707838f7lb4wf	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_e83dc02b-7626-4db3-98ef-347ed7683ab1.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=bjKXFRCegVxqIPVBqqtf7%2B3Y%2BTE3Sy3QK6kaV4nfxRTQ54%2FFlNI%2BWfoTlB00Q7MlwzjY%2FqHrpqqWVHFYc7YpAqP4o%2F3FyTuReC%2BKK1UOLeAKt6pdJtTnrk3ZlvCMbSihW8K7ifvNMJznFgERroddaI0gkM0gzVNWjWLDlJXyaLWemiy4oWR080J1fcqshjY2x9MBsXBvjhP53aIQdLpQ6SA8XrKbWT%2FT8%2FTWLHzmvXy%2Fn4UrJs7zYcI6u%2FE0CxG4ujtN4ExHtaVfodz%2BZCVU9v%2BwMcfjDgHXnNNSrFfhNd9d9ctZERNdyvbEDzMLvpYpVqphG7960vzgCT%2BXvBTlXg%3D%3D
cjv3bpqub01vc0783jf2v8bwr	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_7a96d276-bf81-4bd4-8340-fbe8417af104.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=z0z5ZChFLFIQuJixoC%2F2dn1k3Y2on9Wi6QpL8%2F%2Bekpm03QaUvLozDqaHe77CChPmlNheESINnyJdlemafwIa%2FqsAzq1q7wgT7TVowrw63BYlBW8pfpoJ4rE4q%2FhTMl3CZR5FuDG0kzV8kG0KHojS%2FTN7L4h8FJe%2Bv%2By0wRmmH%2FklYLzKNQoU65t%2B0Qh9SvJ6GCiKf70A2QurwHPauUeQycFwdxkfk9d%2FbQ%2FLQJv5AdggpqJVSLtwZXESZTEvISR6hdz2pOSYzql6JyEIdIrldCbFi%2Br6N64%2BliGgT2jOuh6xNhTPeWeC%2Fzxljz8uk7CW3ayYgTErpgh4qHqreagWYg%3D%3D
cjv3bpquv01vh0783mbkym2lw	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_e1d5e2df-e143-4710-b296-4e17b3b2807e.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=G6mC%2FzLt08hgiaSRDKWNTNLHTKo4SCkcXqih%2BKxH2nntbVEus7wi4tyxgRO7mbm%2Fh6pf0POdD1Kx0HDxwQcvKC7S3xelCVOluCafNbvllYQ6lcaGpbE%2B5gCRGlsSo5JzXyKlamsmyNs77QhsItj45gNhCCzI2BlmzD2wY%2BYgj3kTh8sP8Hljql%2BYYOArI1B9pq2oAY%2FbwlY8yEh%2F%2BAMkyqsuAgBQmV9%2B%2FdUGdgFXiQAZxYClZ7QwybbxOagMc4a%2FAJBp1LAqWPcbRzQKBqBOCn6A7ozseRMDIZ7ZBSvQlYq1Pcwfrt0Og%2BY2xb1zZHDvNpWPkAEYEGxHVrAQYH%2BIkA%3D%3D
cjv3bpqv801vm0783qaykyd5h	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_25f83762-d71e-4d07-96de-3d99723708c5.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=zX4ui0DWBVjt9xqMTDOiB0vBpaZf0Suov1HCV07ZlOVYCmA%2BFt7hEFeUhZiZEI3N73pOR7Yn62o1GUZnBq7sDyB1oEQ49P6cAjR2gVxSFUwFIBcHJupx0Drqwp9tHRE4ezIev3n%2Bxej1SSDLWoziuwd9D9kZp%2BcsVniNCAUAY8fHX11ON2M0gIAOr1ZPR9eWUG2uHllIKdnu%2FgUDAytXjl6t0koaFN3yYwF02wYN6RBUGxiWVxLK53sWgFCJflBWjsq89%2ByroJtWwbgR8v9UXKQ6QpNKZFgA%2FisZGqBUkASFfxx6e156fg4mMZtLkt%2FmiW%2FxjJGYk9LY00lNT0O4tw%3D%3D
cjv3bpqvm01vr0783clzgrbis	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_e7db04ce-0408-4f35-87d9-2f6f473ac138.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=VAsbjgop2L8R0hCuMvH9vbHEA5emRcf7quSW%2BeQZL7kPofAGscnXE6C6aR2Hn17FR%2BvY5L%2Bp9z37wNnzk4GN0n6QKJhm0OLFkQ%2Fa04e7wci0G5KcQJ0pMQ3X6S8iPFRy2Yv%2F5qQ5PMBtNUGzmUCul0yExo%2Bk8oCWQv5Gl061YGrb%2B8FyVPYM11h6JiJOeA3UkApPBux3ZUbu8kivicg8U3h%2FJ%2FBh4W95Hw5rh13SQIJ1j6l5IkT5tFBAhHkftEuX8kI97aYF9FnD7ga1I4VlhNBFpiDY7GVrMu6WbNpOSYFEFe1JchqmEbU4rV1ZegJsZmydBlL%2BzolCdU285z6QFA%3D%3D
cjv3bpqw401vw0783320jmah2	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_c67ca237-d831-4f98-a060-f48d3ecb8956.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=kC2UcTv2zbTL84jaYCzHJB1juW8EfvJpBcdV2EvxHAJgsp3C4ciMZXdQGuy766QJgpW0qaxnJkczIYjrPe6601Y%2FbTBiiigxtCzUJg7rsrtk%2BRgSBJ4AmuOfu49kX6IatrU4IGO5P7bGDZGTSBGDfPGq0efAUmEJWIHCJxhuIfHxIq%2B1qTp9rmy3PD11C0XkFn9%2FdjHTCiqnPPI47cLf2gYBZfE6g8toJt8nw9b7tiO%2ByCCKbb6l8DO6sON6GQjuG%2BsvmTX6ZnL10Qitml%2FX2%2FBrcne0BD9kgKIj28ZiTxAV%2FSxUKxU1m2YGaJyoeFOir%2F%2BZp4uDnJO%2BfT3GYXVKaw%3D%3D
cjv3bpqx001w60783d0kr9uyo	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_aa4d2459-101d-431c-b6c9-e65eec77259f.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=pjdfLvIMhjnxIGGctaQWn9s68y%2Bv8K4Msn8AoSl23ixpoMQKSkMfONCkuAtyClRO6ppsmtGaKjQc3bsoV%2F0oWFJThqvnfIbiOngiowz4meKSH3UA79k2o4XP2QEY9xqF6y1INnsuJeOJUuNbA%2B0ESKK%2FztqSIR8px%2B17aaHqGBBmBOdqCYmtGVSBGeU0GG9z1oIWjkt5mhfIRhK46NMI6%2FkMVEv0TFsTfUGtKgqK8ChZlaF872ktjignkKHN7OrmL4Q1ukQ8SOWOud9OMka8cDRBqULaKb24iqXmuikuJJHyDHgB6mfsjgeIyr4ouciMS5k3vPhoXrSwB6ReqtxyFg%3D%3D
cjv3bpqx001w60783d0kr9uyo	2000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_8e6b9c78-f9c0-4ede-86ca-c682631eb8b2.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=vG4gV3p8pWgJU1dZeBTAn1SuHCHycOfqArEPT3C5qzA7WhmcJxH3ZbBNPArxnqAYyHN%2B42R0u7RVSemREymf8MPtRqEfS1y9iqEn0HpjWYUIIDVeY08hhWXnoq6XnGpwlB6RJBcJSdNIiNAOxIyG6MtinU40M4ElH0vaxTdPEUt7NzcelEtsLcMOM%2BpaLRFOh6Br1vQUdrk80HfiCBximcZfJ2Q8Yw5%2FpEeNJlCBd9rYFjkdKMzcSxG52ZBCgA1N%2BlGIsHNPHbhHIielK%2BsyVpk7RdlpDrRxc%2F84lg3JYJggsWlMC6l83R%2FRCRIC%2FyOtaZjOlC%2BxFqBJBwvKDlAkrQ%3D%3D
cjv3bpqxo01wg0783mzbod5oj	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_89835e7b-98f5-4a8b-8d1d-f26b59d8c3d4.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=tP3SiNECTuORjuIFSd7Om%2BdjsoQ0w%2F4Ck4E1JtaxRoWNbgi%2FDOQCg8eag3NyhwCBA4%2BEZPajx3U6ZtWAFkZKeuhARINIWW5cJwcQ9hy6vgsCuzpPIUtH1I5ZIlIIETbH1L7qzeiNM0B7ruqdkeqhHuc8LZzG1OMzRtRtAb3%2BeaqNLbQXcQgZuoOFolNJetNbPCwXDffrlgeqsS9kFXL1Y%2BhfC9ye63Keekx%2FFf4aa2jXTqR4%2BC8tkq4HWpMVdGJqC6XhQG6rYyVkmY03vZuBS2wGhVa1E2fHjznEQi1vBAgdY%2BtZfh717zDN2nZoD34G%2BAyf0w8Utzu15vkWE8%2FZ6g%3D%3D
cjv3bpqyb01wq07834r1vmkc5	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_100e1f9f-e602-4514-8d98-f3247ab0cfe6.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=lxYLZ5LrOqCujwkNgfjfLTEdDMSVwaYWEh7ErVB%2BWoQ4X44037NshRHhTxK%2Fq%2Bza2sdqI4mh5uqBr7aUy2ch9O63n1G%2FeIYNcWE1onEOdGVV4ll1zXxPaO2eGpawpsvbaCh4opx3BYYnOrDK9nYcN0CYGKumfjVrk9wVBtTDMvutZV3OtJvPX%2F%2BMT1a40WPJnZbYiniJqzIcffFbcQwP1MAMvfTY8UWW4Zf6W781a2b13TFfYERwO4G0YaFQLyYQWXTrwf1baDL0DKh4khbeo13Br2QYeDBuVSfDxphCqRa8Jg21bVUT12MWZh6yf0LC9SzRoJDretH4%2Fhz%2B9Kfgmw%3D%3D
cjv3bpqz701x00783mdpkiyfx	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_7dbc810e-47e8-4c9f-9cdc-c836a4c3b9ec.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=Mk7PiHKTjtj04K4ggsB7mM5eGQwJg%2FuC%2FJKMoA4up3nnqXt%2FhH5lTtbMmQ1uFbG6DsMMrvgZcWj4sMGSJsC9wbsZH4FqhK2nd3IHlmLfmqhv5ilK9QbOL9sxGeq2wW6BuDMvbUFEbOuR7%2BDWsnppzl4mdwFTD9TRrFREfjnSG7QHEZWawWinm1kHD4frURYZuw9j3Md494jJ8XCLiW7RZZNV9xrhTEKk9o80V5NYScsSSDw%2Br6EbgOreUGpJ2pSmZUg7IdZcYdaVcwL1%2Fzq04u2qjMaXWJbaNbHxJetvRtRhe8UORq8ywgk6tJWwu%2FMOEpjRd0wgf4uyqS7XfNh2Mw%3D%3D
cjv6qm07l02e10783rqxc5gjz	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_d0620a67-58fb-4932-941f-b20572e51aab.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=LtUkMDm373h3PHmY7uPM6VdcAvoNUaCT4CjX3nivYn%2BSMyurn4FXrwpAb%2BNYsqQYO7axl8qJaBwIOS06YCMgVYGohwzInm7CSk6iQUpMAnO7piwwda7zzHORkDwERHsFPXehzEfsXbC6BQlDlNNHOx%2FV8VEQAkuKCcpSbp8mRAAY4QY8i16nZzedrhxHEdIPJtQvdkYrf4VfGx6FQRwpoMV3aoPjxLEKLFZ%2FWMrdLEuJwXGA5XoCCxLyLlJupVG4QMLUKjKg8wOcDAIuw96uOFg2Fd8KxvF2QAKJGxgc%2B94lGY41l25jt5TpHYOn5XV1bfG9wbD3ZHLDlybXC1TiKA%3D%3D
cjv6qm07l02e10783rqxc5gjz	2000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_f01a4c66-52d7-4aad-9256-16d98e3230ba.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=w%2B5MHTc6ggN7wGB2fUBXbbJHBs2MTuJejhI02YwMLR2WuPxw1Fib%2BDNZ4VceKrvdI1W7srfr9DtcazZ6hCnxD6spvJTSfxj%2BiQcNNm2M85FsHfOPJhWlJFR5J%2FHiar9z8NKgGGHfcOpEMwIIeGJ5iUeqpNsfh%2BQK118aH0ZlYBZR5rAPzRKNMRrNwES9WWkDFY2fdSi%2Bry2%2B5TY46IRk%2F8J7q0t3tPXETfqsNcrkkV92EP1ULFXI9DcGL2Qjj3IRfvUIMPycKXb%2FS2vA9ggK7scAIbBVnQPCptBdD1fKj3nDVqL5nAcYh1cSJHboplwfiZBRHdCIige9CcJFb1UC0A%3D%3D
cjv6qm07l02e10783rqxc5gjz	3000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_9edd204c-36d4-4a3f-9b43-c566a7f56e9a.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=PoWg0ide7IzdDrtPy%2B%2BSuA1Q19g5XBJXgOt%2BnM6DayTC9IwUVbHVzLr4PSuMRFsM8hQTuvi3MLCEP2rcJZ0Wb5ZlvQ8F%2FNhrihnty9DCOhWXFxZFvu%2FVnkKuZ%2B5VcAvf3iTcqOP0IxEcFL1R%2F7VlzucU5b96tzckPc4ybIwZ80Ql48cZa0J24VOUmocqsMld8xVmBI2rfr9LNBgEDyHUVqamSy8h4it78uHf9s6PgnhnjUcyG2wr0ni9nAtiE932pK5xhgCogVtlbhfnjXx0oHSNC6gCRq2xZ7%2BZ8HSdn2PvoKoReLAd1dnr7uuC1LRTTvsp3p4uuKcR4CXEr44ckg%3D%3D
cjv6qm07l02e10783rqxc5gjz	4000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_30706935-d0e9-4652-9cf3-94a026e02857.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=SX2POQoVXZzQ6TsyKZXlX0NAzcQ5djwvPoeLKojic5uKxhSbbgvgqBf%2BwOupAxY7tzgzG%2FcUKb6yXMMplOwsEcNjx9gwqE98wIv%2BnqgKXDbk71fsLHIe%2FD25%2Bk%2BaHB2J578J13FAb9JO19rhgzWmtJ2WGi4AVeK%2FIaHgIgbipzANGe8Bkicxll9a%2FfVartt%2FxL1N%2F5k%2BpCHowEb8EkNtYtuYkunF%2FuYDkIHge0SplbObkFOXU1YQzFe10xeqI%2FftDnf%2FFBV9nelWqXmyV0nCpSkMlGDFhBciTC1baXedWAWfM1qNxylYD%2BRx6%2FWA2sR5YCA0U1jpF9I2ZbCAiQ5V2w%3D%3D
cjv6qm07l02e10783rqxc5gjz	5000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_85d43fe8-7723-4ba8-a22a-561824b72291.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=RbkmEuxTDTh%2BU9LMUU8%2F4dUdBecBngPOlzeyn7iCp2w0KPY74%2Bkq5eG0zVJvXwS2HNIS4ybFbYawfqAiDh5AVaNdnscnOWjeN1eX4HdHx0SNmYc1aAFk4Kmr4kKbdB9jk9WkfApgBnHaaDW6eSosGrw4lH4NOy5THlrCIHZq%2F39f0%2FkB002XAKkeR1BemiX62YTl7ruf2lx2jhgWVabqgfYfeNBMnQlz6rXrgXOvA7xY4YWBy8wjU7meJULCnfcMyRRaOSB919Ck9QULuV6asiwlYjJ6WY93zRtQEUEaxaZDO8O%2BDibhXgC0XW7XeuwfNx9zz1IhvX%2BhncuCealE1w%3D%3D
cjv6qm07l02e10783rqxc5gjz	6000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_11c2c3a2-0e1b-433b-91bb-7826356690a6.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=OLAsLY6ls14jiGS%2BVJ4DPkoholggzlhn1Y5XmZFrK1b55JL3oSVbdWeYCGBgHA9kmhSQkokvid2XXfI3G7KGI%2BzLhnxldAi7tQGxs5tdOZLbgdyhKoeMdzGDyUkXQ22EaaWJHu5o0ExWf4irlG3PfvHlhIkKo1e3JcGNN2oBCo6poDZhipV0blc8pk9tsibjXCXeuXWdck6jwSSkb95M6ecV4EtlsoT61ypMI8rypQOFhHkgJHzaL7Ijw7Hw1Ao%2FF29TU68Je2%2Fy9zSNi%2BDuAQ5auIuBcHWhmZfKa%2BZCqXO6HJLvEAdhRVa2aaaf9FmotmtUfA3jOkDwaWjcXg2Qsw%3D%3D
cjv3bpqwf01w10783z79yu39t	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_1fd0aa31-1185-447e-ac8d-ac024c0e4510.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=hPKCG1mx4GD3ybVqeG2yuhIytSsSmGdAPunLEJMmMkGqSUrTE569tkXTxSeRK%2BbIYd9UdyHczApGaRBN%2BIN5qiBeyIkRV8cjyUMIaS3sDAi4Tw7bMhG5Q6k%2BZFIw1246aRqgxwLUsrvcFmzEvRJXWVpCFH7b6fJaW3IY%2FwvnPKn1w41tW0TahrKd0Bu6ZSMPGTeGOL0Tm0624rAHoM937fiCCrruLErCdk1JLUL8LPPkj2nMHYJBSUI%2BeFCxhRNRiXRG9EG%2FLG7JN24aCAy%2BbTPUFfV8IX8a4Yx47CcTAlZiPqs7rUAHyb%2BhaBhQ536o%2FKC7eAO4E%2F%2FNSnUsL6kBwg%3D%3D
cjv3bpqxc01wb0783254fbpee	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_d0eabd58-f52c-4da2-adcf-aa02c03a0a60.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=aGyZBaMkAUbpfAnQsL%2F2gdDbR31XQqAjsEsrDT5lkA23lYgf8SpFu%2BdzC4mzlKtkr1bijTVrc4NFkmqblmY8YGi%2BqRy%2FeyZpHrYwifTEDwRpqQH7FDqCWtLGVyFX35WZ44nDiLOJAnCpw8BNclWlLQyMoG7pgi4iCWG7LaMtvi3%2BWMm0v8xw119grWiG15J9bj5hwnMj%2F4JsYg4IQ%2F1BRb2Fbzs8uQj76q6o%2Bl%2Bs76YfcnnTNFXWxfZkJCR0TaKeLYNZED4%2FP2zIzJtiTPdzzovYx4cXqka9J8EKw9FRBz20V4%2FNXl2dUnqVGQ3j6JpgWtqUFAW0X%2Bl6tKjpTY23fw%3D%3D
cjv3bpqxz01wl078349h7rej4	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_e45e5438-c0f8-4b15-ab6c-35fb2a42066d.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=l%2BFytCpxnVmxCB4XhTlnpuYY9INSiUKEW6EODo0FWbNjhxIfLUQc6X%2F1Nq8rtwtpONGMpEJM8AV1YILdHuAOzcgkQJMxfhdoi1KZYAbVVpxtdO3Zsbr8P7wgrwlviFKBOIwEvA%2B%2BewteAhgzBUUp14vscwJpRm7AjsckLrn6hComDVBYED9n5tyMPeV%2B6%2BMBHhReYs726u7vvexFnP8vR8%2FDra0WSrPLm%2Fvqvlps9jphyLDRHiL3SeNdiscOVLQEbKBZ7H9Dvwh0cPskvY2%2FLY8mh8SAxgueMfHFioojCpoJqAPXk3q5bcr16egU05aYo9OwapFRYoqWbU7TwZW85w%3D%3D
cjv3bpqyn01wv0783qeeec7yy	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_0f5ec527-a98a-4490-8721-7510dc1a25a0.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=AQ5XQRFH4qONHXvFdSV7tGZJQvW1CdgTxehOxkFURcJxYtPTRbgS4wcMNcpbsAMuSwi4QBFRUEYN7mU4xeJx3XzY61QB%2F8UCFQK3eRYOFAKlG8Uu9n%2FQMXKukXyt4EKVrZrC8zUp%2BDErCjXI2XCVRsk6jtXClLkal8fA1l61pa5qQeCOGq1MTpLFODdWvRqiPQwFroKat0nP0zveB6elBfuqYUKH1rOsbIs62uCjOyZTrXVPQjgMAvTuJu%2FqIIVantO423Uuq2XxVHqjc9cXWe4iN0nWktdh0YU2di4%2Fx3fmz6R%2BXDL78MGhO%2F59re3gQP%2FhaAsuk4WmHnI2bU4Vtg%3D%3D
cjv6qm07l02e10783rqxc5gjz	7000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_5c202858-7207-430d-8739-f4275d4ee8ac.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=qGLt6YUiZArQKlAtrmbGflXacbsm3H2DwOdwCuRj1HeckkrhC0YWoCgjg77xUjr3H7Eu4Ihf0dYlcOJJjJ7f2v3Sasckq4E9q%2FCksPj%2FAIWJC9wY3X8KdwsHiOPgloizbvFAY6L1gp%2B%2BUA1idvcPy6DU5CapZF3Fq8sPhyjy5K6q%2B5QUE5tm5ahK0Tq0K%2Ft0iBbz2VOYU5xogpnLYD7CQNtrIbBEBtI7FSRV11bgCHjGO4K9VBSlH4VitZZh%2FWxsDLhn26UvywuvLxJwYzylVGiWga8UXbvpG12wYiU4pDBCdDNNWNguTsUkduZHMkFRJpZ25eOJYNe2MjuBKhJowQ%3D%3D
cjv6qm07l02e10783rqxc5gjz	8000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_a6a5b30f-036c-4bb7-8b1f-f55e5babba19.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=KNjeiYRQXY55m1j6Ou7YZMeQI%2F826fKzNSsf5kI7mV75v6HqYcyLmIGA%2FsNUpGDmbU%2Fhsv8y1ar4wbH3z1DMprGDNYxbt7HrMEZEoklI9NGagnIgwE7Rq4fvfVmgUwegp0aX4Zx6N8YXiBod4GYzdJhtuXs5XZdXbtAsUpyrHmP%2FPj8K2UkPiYVTlyw%2BJUpTFhpopVtYK4yOdbjDZfyb%2BcQyjil7fjoF4jHih9oOUbuIGok7hVdPQXhgtxe5oATJdbXnAIXSTuLOS6BOXp2I%2F3SsvbL388aIxkrEAw4F1%2FZNcnbmqRiLSETwPCee5j8wcIeZrUXS92GvamzXXlb%2FeQ%3D%3D
cjv6qm07l02e10783rqxc5gjz	9000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_654956e7-72a6-4244-8aa2-a357be16584f.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=cBohU525mZ1insIgtIzh3OGBHp3h8avwIJ0Mtnson2eebNu5YtTU3B3taFue3OK1fhSrl%2BZD4Ph6Yt8MyyJcp5%2BhqxhT3u0OAQGWEw1rfuRNp5Jb54Cpb4YIi9hpJnIC26bXfAELqpM5WYoITELtazunppGRc4T3V3cLYjjsAym6mQb7S2mJ4%2BYKCziNicPaWCyzvO%2F681VU%2BPPP6Mk4XelanzyiTzDHmUTm09irCEWsqevyaH52UrESPIBvEDi0%2FK2rolki79EAIgO2k%2BQhtKrUVj7GADuhrBTqA1GVAVz0xcbyTgLpwL5u7kU3lgARdyTAfBT6rlWjoU0UHqbKrA%3D%3D
cjv6qm07l02e10783rqxc5gjz	10000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_03c278ce-283b-420e-a17c-8143c0aa3b95.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=PTBsCsEYcy9tncHQmt%2Bh%2Fpc4a1flzc3xOd%2B1q%2Fpg%2FhZ%2ByIV91iVymsZaROPQHPrK%2BFB2IV9PuPe%2FonenaZCYP0nFV%2FcQcmTVDIcfAYzONzlU9n9qp7Anl%2B1LiOQwQzCMsKyOJl1ccF0SlHiz0juJUz8E0bSyg0%2BiTJqpxzKYJ2BwYUhGw0DxSPWAvjYbXRfIO18GRIt6lkf0njg4IVckEGj23pNLk%2FEm50XsXXENoLdmB4g2G%2Blc2wWxffxDeptm36DEleRvc504jImsFk8zbep%2BZXX621OJ1I8dZzULwXWBF1QomXsskUkT03fEhLwDxkmsynm8Qj63A1nvPp%2FaLA%3D%3D
cjv6qm07l02e10783rqxc5gjz	11000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_a69e3bfd-4fde-4475-9cc9-461b659eec37.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=xp904igBdUgv1lYYCW0hlA4djDSkE4GxuioCU%2FUWWqWFM1DJ9s8mgY3IG0hfKW0oV7OdUvRQvgwuCrQySrxxKmrbNUP%2FF0hmgBAgX%2FoFJftcIy0fzSFDUE0KIF0Av40bV2hHpDpUTshRFsEqVKgAJ%2BgyD7UfhyOtg4QIsNQWBQftXWGWF%2FrdfO4IF4vVdH2SJeSiP8cX9Ru8a3qYYTZlxh0f5v4tXppcR7JecIldbCUyzhzX%2BCthDA%2FizzlnFbEAppNI7ZqMpcSZoBi%2FDuZnOEQX9PeQUyyP4BY0BRBRsjGZfmwBXPGIo1ZLf60%2FaYLgk0%2F2bbVATmcEWJ1g4LvfUg%3D%3D
cjvbzkgrw02f50783oie9wts3	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_285aab3c-9bee-4081-ac50-5f95405405ff.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=kK7FgB8ERtkPnFvdXjW4U4ruNidJDLu26VEqtC3mahRQniLjboHMmdeEVkHqBP%2B9OY6iEMNCzwNOZp1v2dNaI5g38niS7vwN72RiWNp1tfTV5DoV3nA7YvbYKDzY8gaYLCRfuI0zOmcWQ1S2uMDXWh0DPaIqygdFic5s%2B%2Fgv6plnCIRj1axkec4BnYRPbXFIS%2FUiS3T3Bjb2FUZQXF8DY47PlX962PiZCUxrAiYlxKEDZC%2FaeQnkLIfE2PzO6cZCIOHN%2BPPERgAX5u8HuJc1gnGh6pRXNF6NjLiOwZqCWOlFpVgsftK%2BegMjzdOuuh%2BFbpIfP4Qg%2BT%2BZzmwPi9lHLg%3D%3D
cjvbzkgrw02f50783oie9wts3	2000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_64afd656-6ae7-4649-ab82-4326a92ff193.JPG?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=ph9Xhy1LOt5aqe9KNmb6UiSttdlhMp75c7qD%2F1n9j63CGmmzXcYNNutSSmcLNzTPcOeDRhHt94%2B9rcu%2BlFN%2FvW6432knKV%2Fh8BhMyu3VjFUuOmuVrNvoJYoI%2BvPr7vQM76AE8YvswUDqduR2Ms6Hga5KcaoILe3anMcoVR7soY4RiUK7X9KhQYVbC13krfwSPHQrNjRvQmUdXeqbcmxte7INOI7jlLsW2VxrvtPQQEInYYejSywIzNz6CMhoz4rggsjhZDWijlJShWiI49xeVDkHlov7AKySLDtLO6DpsA2aerLabwr53Q%2FCiZ2uDw1bNul0m51C%2BGd1ImnLEvmz8w%3D%3D
cjvbzkgrw02f50783oie9wts3	3000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_29b9e334-7c7c-456c-8c74-9d5e7d608334.JPG?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=oX519%2Fq09K8oi9DCv92UfzvIzfK4Un9QLRMB1cQ75KgyT7ODNBebFJCYYyJ8vei3uCVr8keDB8kWxRCo0YIdAQ9EY%2F7KNpFzrgNed5CtXM4y3J%2F%2FA242k417nE2fTjUCBtKTGsSarwdXDSr9BySF1pNovlUFjGPwlFHTl%2FexVoZl2xXdqHpMLD9EaTrKoGa52Mse8wfSe2Q%2B7iKoKTMlKF0EZDCOP3afzeiyFFDuWmVoUpqq2CRvNpe8mUO2zfTeaFpzQEwabAG3xeY1QTBOwPLuLiXVs5CqdE5kHwjxgTZY0BBBYKGXYE2gUtmsYGvpskeSibeQgPjQ%2Fy7K9P4LfQ%3D%3D
cjvbzkgrw02f50783oie9wts3	4000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_f622f500-beaa-418d-84d7-e9f75f3efda5.JPG?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=vLH%2BHey9JXgG9tD2tymEZE0S%2FEu9K5BHCeKrZ4luVz%2BIar1He0Y31yvhGI87ue1uxdj6IPSRb02pbgy0uj8QAfCEgk0bDX94JojRmHY6PLGs8pv31DhR7XvF9KQ4XZMt6xmyBxGCv7GKs6sQIt947pXfMmxGuUPMXQljM04aSZXfrDWKJW1hg5V1Pd4nY67HO2kfpbdyaznFH%2BmcfpHG%2BEsy9m%2Ff0MZwk2217%2BluYExhuv5NMBGU%2FUM7w08Nx5109RYdsBtlbALUDINbFsLzFUWRE5nxEEDRUb9cHC%2Fj9nWm13MqVqjwOQ2z800pE9CEb5VdwUIfzaR77HPEG2uyig%3D%3D
cjvbzkgrw02f50783oie9wts3	5000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_9fdaeeb0-8088-4b68-802c-db9e65d7bfba.JPG?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=a98OLHdDG9Bde12td3yuls02ptwbFxozKwKYYmYchnlih2WrVyUguX6stDWbDHNCcs4T%2FE7hbgXpDoYWwGj%2F6Ct9PQ2S3R8%2FLJNbdjIxO437xKlS18hjrFppkSHBfbvnyj8FrPbAVoLdJfmkzmFnT4tVomllq0GcxQEoauyaQZn2haB8Qz255ryl7EZuQHVKX3gZOObGEWSGeaxNOckkRVPZR%2B95IEDYlDLsazhQIRTaRtiurIkMRoWPamZNZ7HItvSDHMPW6X52qT8kkdbZS%2FYSd%2FwGqcCLCeHUJLzQM%2FECnT2SEMkWQtYGWdy%2F%2BK7pGpiXPIEIwNeDAymeFAv%2B7A%3D%3D
cjvbzkgrw02f50783oie9wts3	6000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_b9b2406e-cf0b-4543-adff-4b891648a10f.JPG?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=hlDSofP4nT8IMJtiCmFiUNvVXkURqu5qm51WaaeVxV3SzSNW%2BJCTqvYnW29jUT6%2Firl8daOgI77%2F4p5a%2BtJ6PVlPEPVC3Wu%2FIFDqMI3tl8YIMsvLKk9qIPqK9Jl%2FrlRrdGG6cJocf9lRluP70kZL31Emtoq6zr1Iyj65SR9fnQ3RcfRI7EO23ihKkLXsaglMUT%2FQDy0EFrupOM%2Fh3Md4aFCtw3RcL%2BeMb5CefmAzzIalbGdwjGrjvRRx2NsuGbBeOSQo8XpkYZRQxzBOjsFo4kv61j4l2ytRa47E0F7h9%2FdBiO5lW5nRYH1JULTPPFXJ%2BF2FjJ8prQggVDlcOtK9uw%3D%3D
cjvbzkgrw02f50783oie9wts3	7000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_c9a18529-030d-4027-a253-45bf6e16cabd.JPG?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=V0D7HBw9KzAxgTF39yHwn4igLcbOZZYaUtPQb2OOetXKALr5ZTdmbRsZ2R30pMqeuTxXXUrVUqe%2FNYGmR5bRDbDU96VXg%2F36ipv4mpMDThrIRXKgQwdV5OpCReyXEz9H8DnhdSaljzJniIHu8fsr9N%2FkC4jyolvKklUq%2F7GXJFnfmPzJ6sTAFopSER7rvvzFrLIWi%2F1MgLeZvIRGHi3NI1hJOLrmSoc7mt2pHJCC4eFs1sVINDJgTkjnf0JEiDRRKwz%2FOJgWfOsti8EZsjR4mKdg%2BWgwEsllOkhtSP86byr96j%2FOaDTX470EWDC3HfKs0J6nXvbs9F5ns0imksEujg%3D%3D
cjvcb0ce702fi07839ukbdyt8	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_03ddc750-4450-4eab-95f5-fa0a3b31e5c6.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=vgLWZh6rr4RA2pTMcxBomwY%2BwSzVUvjDxih3wVp6KU0aUEMeT1KHsC3IFM4nSB%2FgjPJ7qlRq6OotHENIL3do08t7V6pn58wdL7BlsDXuPmekABfpIDB9iFgrAyikPyWFTe5IMCJXL8wivE2ai%2FfOoz7NcoMleHYnsqc1H4Ej%2FPvS2HS0xqowe1T9P7K%2FOY9HE5IQ%2BUGQF6Lu4tcEbCtadUrxRA5Y6BsLftQmoRC6Gslm%2FHGlFXsrBWISXm0W33CCopljKtGFAJlhdXEcwiLpvsOsbEtvExcp7%2F59i5t%2BoRXFdUCNtgM46mdzPxhOwTRoymNoPMjd%2BUuWNG0edfDG%2BA%3D%3D
cjvcb0ce702fi07839ukbdyt8	2000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_21047189-fb04-43a2-b860-9763fa2fabba.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=fgyMxBNfIkkDEJvMVfHDoDZPcR%2BVZ3jBH0%2B4bqjxE2xfSra1nhYLup77CeCNATVLVpMn1e3YT7PhnkpfKEy3K90CWRMt%2FldrFYCVHZJx%2BvyrSVP15AE7S8kYna0vQMKVhgryVYxG%2FnzeijF8R4kmSMXcCMcwso8ow2FsQsKvWQsVwIrtQ3J8DnveqlcB1NIqdbmiDtIzeO%2FYvxGgUqzoXVwaCYA9oq6ghIEn3tslj5E2n8SU7tV41kyRgGvssj%2FM71xJQSHc9h5kocuJPJSIqjyE0r7aOMK6VJ9CYBrAEKgw8lJyrZR4PURSrax3BNBac8hzTrgYpFOtEYLbjzfwpA%3D%3D
cjvcb0ce702fi07839ukbdyt8	3000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_93394030-693d-4476-9dba-76c1cde55269.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=WJV8CYFqIvHXGruSKQ9ZST0T8XPsdTu3cyZHOi7QelNskIKV5g1kzIYxfXYvqIqH3eZR1iHinmNW3zIUPO41tIK3ZRUrEqHN%2Bn%2F7cYp01oNp1wnfraD0740QMiX1cFfMf7ubaHDwUTX509GIIjggh%2FXeUY%2Bjmt5KptD0Izgp7L7ptKihk%2BlsrKqf6%2BKF%2BcvathamGv1kH0HWVVNYYNC4n8dT2O1u7feP%2B7BypShTDUmYLl4ZU%2Fn0A6zVnu7kxgnhWG2M3W5sm5nNh%2F3TzXWKLfz4lZju651%2B3DKqM9W5P2Tw0sL0zZvmhXlBX0%2BBHEN%2BqK1hcjSjNqR7v4YQvMswNg%3D%3D
cjvcb0ce702fi07839ukbdyt8	4000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_f1c7033b-0e64-45f8-ae4b-23fa8d1c6139.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=gKGdq32vp6bLX6WRI0%2FnIjanvuExIIDRC7o1fd%2BsO5oljzDP0bTNuujiEUye9j9tg1ykoGDIJEPcLvxzDK1Bg73mhcWLHGHNUbIP%2BdUP%2F3u91BZ2STWc2bOIBX3%2FkhMczWA7KTRAlvzu3Yc3xKwr9%2ByQDaNLbEl36ln8qIWDfSlm1IeCWuuKW5rkCUjyG%2B8gKD6Vw2tSzxIW6Wd9PlotVTRAlvaBttzEhJSpomaTiGBULkt75M%2BqHYUo%2B9MzyHwcTAl25%2FlacENWJiYnk6H%2BIdiIQt0IGiaXHfoi86DYYf%2F0QJaqQyf0Mcb21TF%2BiG2adbew9hS5KfDRLrxdLRzyFg%3D%3D
cjvcb0ce702fi07839ukbdyt8	5000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_701da365-d622-45e0-99f4-b1c1117fdfd9.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=DnlbhPIiYyQpGK%2BwWg%2FKcsyCdYV5spl%2F0B2gKVTqL2VTzhXHJVtm52SBlbBLyj6%2BhH%2BGFOg29QGu3hXaQ%2F76WLk0yD3oOgMPlOT5g4E4uU289HH6cltVYgGCraCOnHQvDFLyaGp0aGhRqjVmYToCMuB3Q1DnJumWehe9J6hmW1y2LRup7ViH5vcNAWnkOHAR19Lqot3a8fmlayq69shMkdobyPtLY16cvLK%2BA%2Bm8yxVIR7%2B8vuAm6J5PDXfMhrE5BE%2BdKq2F8LQEoGjzRsO88HWpbVWdWJeeYM1GC4FbfcGfocPo5XinwlsZnvYCBsZD%2FCPmWxtCUzopwcI%2FnDWyLg%3D%3D
cjvcb0ce702fi07839ukbdyt8	6000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_0c54b9c1-8bc0-4e11-827d-4a6dcd4e6ce2.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=mAfENtTQhb1KfweN8CghYFZxRvSq3i2xXuWVeQBEk6In6rVVSiFU1NHeuXw2mV2Z8v1tS1Kj5IuFMvm8dVigPSQXgIx0D9BwjqtY12kEA22y%2FipzEdBpo7Z5Fe35gvufeHW7XvuQbPBH8zvXa86IgVaMkaovZofRpOUsc0f5nxnm0sOZAQiPDDvkKB9ke5lGwebcGuwX7s4EssVq8gfaCOaJAws%2BtGFt91RX8cGILn7sCc3M%2FvkjEd6gbl2yK59HX%2Ba2SFsKD1dDcsLSURuH2yi57BIQIuSeFRcaeyVBmHG9JFSGZZc5vxuCis1c5qXMZSMoCAe1SMjY7DD%2FdT5QPw%3D%3D
cjvcb0ce702fi07839ukbdyt8	7000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_fdf1e965-bd66-4a68-8689-983b662e3890.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=UCWsm%2Bdc3fezydcLzzNI9uCWGcKS0oQzETYdEDlc8YJAlkOOuKvFGqZjY9RqAT1En9bVLyCC0Z0TU3veDe%2BbDIZLwMvR8T83pJREDCF8%2BAiFX1UcKItgr2sndW2rU%2FU4Jm7T4Hfl3torFARdg48ARE7M%2FnrSYkFFZ3Ae7F5NhHGXfH1BrPbxl0U%2Be%2FLJkJqMFzdOIBdyUgvNos6Z%2BML80GYND2ZiuKAVdyKnWyjxV97hGpR%2BaNN8Ar6l83l%2FA6h9zkMTaMqqwNjxI33jxdTVs5%2BP7JA5E62m%2BVZo7%2BueCrxz9OaL1bz19y6E9FPvIqYl%2Ff96yCUbA3i8yV9JZ26AKQ%3D%3D
cjvcb0ce702fi07839ukbdyt8	8000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_8c285aa9-2d21-451d-8f76-28e941bf1ff3.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=c6B4ZlnKw5XPuI6noFbuOQeUcjxomJbS7Ka0rJUIXPm5Ah9Y5c5pqM65wrLWxDWArlquk%2FNDmvbu%2BEnnp%2FLxPxQMu%2BpSKlbC5tN3cGcw3A5tdH9op5UKNYFirw0f876%2BWJvxI3JckL5gu50fSR0uVQtKRBI1Zl86DfhrOzeskfTT9RPcY1f5v4tJvw55v8DIjAupbM3kX0B3dDeWYnXRv40MhyotbRkAWjnp5XmkBNpb2xjvGSYyuFeneDGUoof%2FNtdK9R5JFXWPMaLW8v3AoVA8m2amsfybaTBUDcnwQ%2BsKN8dpwXrsBwj31mD%2FJg19BHnGdJcDFab6bjDjL%2F8gog%3D%3D
cjvcb0ce702fi07839ukbdyt8	9000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_9e25a547-9bdc-4aac-8c76-bcc65f1a1a53.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=sUKuUSChTBNGYXmtJGweScQhonM%2B8mpRUCHW4NvQCzSUCpIbrkSFbsV4jD0W6hGUBug767Kd0KQASgppoiITPdmLb%2F9y%2F2VvadfHC7Y97OwIsiL5R5TS7VvPU%2FQJIMaolo1v1kR7m1vccbdnO4HARcFScnMCWpNkF6UsRlNl4DxZmwF1nyYRUsVpJxz68n%2FWQT6Ap4zyvFSUTdrAQVsuxJqazPSvk1punfoX49wSQI6gaTl2k6m9wDK2p6KFgOmHHBz7kXQhVPEE%2BHyZJYGVwuY%2Beag81pfxg2oLak0JCy23rj%2FI9gmO1pPAZxkIy5vbwve%2F3bHRXG3B00LW%2BWUfLQ%3D%3D
cjvcblpvz02fs07835dzlj1mo	1000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_35058f96-d9bf-472a-998c-fe932a681535.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=vCAHtlppXDoNXXlnoGtO%2B5OHTsJEb4UA1oUU%2BWY%2Fy0ROMZec0eBX4PYkondVF06W8pbaBsx6x6R%2FvnsQOrqHmKSlwYLrUJb1XvtNQ%2FPQuGuwZt3WCQPXvDxsLtuEjDlQLREytYjtFOxhDNsVKxtNYItLConXJTZf0xVaMxeV1n1WnJIBrwTcKnV3%2FsU8ZP554u44x%2F%2Bk%2F4U57K9xnXqkOXUH88TZoVq8k4NOwxacHLnKMtvmSQ7NEtmUFGtOJScANg0NFIUYQAQrUhxR1GZ%2BSdHvrZW1Dn37%2BledvKgGPS2AI%2FRg6wfRg0CuZsq7oYA%2FpzrI8PRJW8Nt13NBqNN25A%3D%3D
cjvcblpvz02fs07835dzlj1mo	2000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_29639ebb-0206-4d37-aa1f-699e301264b3.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=SXGFuQu%2Fw%2B8j2FHb50wOCgFVB7EM4B462m5jB7X%2BnqfQ58SrsBVOkjzsUyxiyfpDUWX519lw4ri3JPvwxFJf1PGINaI3Oec21OoCHXmLZrC0gUTk9LZSdRHXmlJBkJQKbWPzz3UnkJWvpdZVxvcc%2BDGqh0phpav%2B0LP7SMuigPCU3BzO0osHNsiayOKv%2BqnF9RoSnX9a1hWGYMqKR2wodPCW%2FlxqNFRc%2B85o%2Fm2SDUBFhjSZpMG9rdWpWWGpzTC06R3ZXD29j6SEeHoraNfbmDaWLwlJeG4W1EW7M%2F1qOOyqAGUYkIEkHcWyLhifa7Pv4eEHLVQHpCHwW9QMozRA5A%3D%3D
cjvcblpvz02fs07835dzlj1mo	3000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_1ec109d7-daa3-412e-93a9-20eb0fa3eea4.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=lg%2FAErKI7DTJkhRU8AqaHZETrCGJ%2BGB07%2FR9avQFYadhaOW%2FEJJ%2FMgKVYQNirJJnwfzbni3N0Oj5ftm2iDoICHJKP50%2FZ3b3GTAWEdSC8crYkmzvhbx686rI4zaPI1fB4Pe3TdOC0vzLIFW3I%2Fi%2BL4Jhp%2FUxsVvEFn8ZphNCU8fQ2yOST3MDv%2FhU80qDInEpU7luoA7SqoTJf6r3QoxahoU9T8N8%2BMVt%2BLAoxPEWqnArU9GEaGss7ommsrYg4ctH5WDJPcLUH50KH8ZZvdHgcbL77GXBscqNxQbnPMmy8m7FtHOYfuDbWTt%2Fe%2F0z8FhnWlKKZJuZAaUzsaoVbxJ%2B9Q%3D%3D
cjvcblpvz02fs07835dzlj1mo	4000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_28b2f73e-624a-49f5-b68f-06b3bfc723e8.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=gB6spIUTHoY892nbDh2uqGNLv2MhKTFDBM6DzXllkBBtTDn8fm6EvgiZKn42Gl5LFyodI5y1rxfw%2FJzcKF8Al0YNbPJfEL0krtsyK4wvgXOIgJkj1Adh4BNrV9CEFkfekx2l6iMHYwz9ua5tjB1muzHliR1tcEqSFoqTHrpGzY4Leb2548sxbOGhLy9dFTdKRJ%2FLoY8dC9Vp9LfHBN6%2BjrLFbfjqSSN0M229aFGXIW4CvOeDt0OSgAYvVQnzJW9IJRA%2BOJAH6boZKw4ozyBXvVfhuiLyr4wOWr5GqJKsIANUVZkFVmU5n8dhv4aF8EPww3mFBNYPMdw9erUgxNPNaQ%3D%3D
cjvcblpvz02fs07835dzlj1mo	5000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_cea9b060-542c-416f-a51e-fa51679d3a48.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=L8xkDXCe9dkDEoKTGLuIZsqZrhj6HOsuLYC2Zyc3yOhZL5bYOsjkek0suRnSdbfh8UMFAQ%2FG1mCf3%2B5LwYC%2FbeLC%2BzJFGiauvN5Ql%2FDKngMBQhNle5i3S0CMNrXxNItYAqFN6MM5f%2BWo8nhOArPCMFy6VgGITptsnmg9Plj2gFg0mm9E4kw1jXqEoAdtl%2BpWq2nwEp1rmEHsKqjHe%2Bc0miRPJYoI4OgACnpnWREIuAo2jL5KHSPpoZUxLSD%2FsvpznWf3qWWYQFx0UL0fC59GhbtgRJ7MeNGEe4eCs2G4dNucEPozTcjvI4PYnSoHMpV8Suor%2BLM6I49oTLQuqL667g%3D%3D
cjvcblpvz02fs07835dzlj1mo	6000	https://storage.googleapis.com/bali-bike-app.appspot.com/bike_photos%2Fthumb_d5182229-b72e-45d4-b301-df20ef4f8423.jpg?GoogleAccessId=firebase-adminsdk-ec1mf%40bali-bike-app.iam.gserviceaccount.com&Expires=16730323200&Signature=s6%2B0EKSAbTjLIqcXi7o5bnQcpnAwwrmc769PQtmGbVXYJjY5VcyFmGDxejMZQl34JP4hg0H9bQ3KcAKYwEA%2Fy0NQwMUradCBbb2IehakVyFKOJGDHPYfJYo50SdI71W3%2BN7uGNN8QRCsI9LoEt%2B7eAZ2MUs%2Fi%2Fs5P%2FyfmMvM%2BGvcqxm%2BiflgiqOw8lLsrFsagTfFQU%2Be%2BdPM4dA2fr510TuK3kqd6cvnklskdLUGPGBnF3v7TaXB5HEZDZVxLyRr61E70UQntG5C9kdXAFRW237PyILklUR4O18G%2FGVm03GgmsjaaCDPIgUkauiEvwoAuRitunbYRaN%2BtagHLVo8%2FA%3D%3D
\.


--
-- Data for Name: Booking; Type: TABLE DATA; Schema: default$default; Owner: prisma
--

COPY "default$default"."Booking" (id, "userUid", "bikeOwnerUid", "startDate", "endDate", "deliveryLocationLongitude", "deliveryLocationLongitudeDelta", "deliveryLocationLatitude", "deliveryLocationLatitudeDelta", "deliveryLocationAddress", "deliveryLocationComment", "dailyPrice", "monthlyPrice", "totalPrice", status, "updatedAt", "createdAt", "weeklyPrice") FROM stdin;
cjutfdo4p00l10783y5e1r84j	hTBT6SFIgeQVyYYpdDnOBPaic292	KB4mSnVk1ZbOYOIM6OvYd4Nwbpe2	2019-04-23 16:00:00	2019-05-23 16:00:00	115.13802733272314	0.006821528077125549	-8.652517979304587	0.009347180891554174	Jl. Subak Canggu No.2, Canggu, Kuta Utara, Kabupaten Badung, Bali 80361, Indonesia	\N	50000	700000	700000	WAITING_CONFIRMATION	2019-04-23 06:45:39.044	2019-04-23 06:45:39.044	350000
\.


--
-- Data for Name: Review; Type: TABLE DATA; Schema: default$default; Owner: prisma
--

COPY "default$default"."Review" (id, rating, comment, "createdAt", "userUid", "updatedAt") FROM stdin;
\.


--
-- Data for Name: SavedBikesList; Type: TABLE DATA; Schema: default$default; Owner: prisma
--

COPY "default$default"."SavedBikesList" (id, "userUid", "updatedAt", "createdAt") FROM stdin;
cjtz4kk3y003o0783dq2rv63v	IpOaVfTnZDeoYUIz1IAZ9El8xdA2	2019-04-02 01:49:59.35	2019-04-02 01:49:59.35
cju2pnewi009v0783rwazon11	KrgotLXACIRKnrGvyJWTVg0ROV52	2019-04-04 14:03:23.056	2019-04-04 14:03:23.056
cjvn98wrk02nc0783383637i1	Hq9NJFQ5XWM2zx5VJyqpXTLBluZ2	2019-05-14 03:47:04.525	2019-05-14 03:47:04.525
cjvn9n2qi02qa0783wehzz0i4	SjSNYOIzN3PUGdFb6fXsJUtQafB3	2019-05-14 03:58:05.463	2019-05-14 03:58:05.463
cjwu8pwi7001u0783za56c51s	1wMmJSMEtCNHaJLHzIRjf7kNAVq1	2019-06-13 05:46:23.251	2019-06-13 05:46:23.251
cjxif5cxr008b0783wg24fs7y	ncML7QmkZShFHQLf9JEvvzgaQBm1	2019-06-30 03:52:50.366	2019-06-30 03:52:50.366
cjz0kzecv00jz0783n0eap0hs	a1m3ia8oSFgFFgswcbAvmsq0qzo1	2019-08-07 01:35:43.47	2019-08-07 01:35:43.47
\.


--
-- Data for Name: _BikeToBooking; Type: TABLE DATA; Schema: default$default; Owner: prisma
--

COPY "default$default"."_BikeToBooking" (id, "A", "B") FROM stdin;
\.


--
-- Data for Name: _BikeToReview; Type: TABLE DATA; Schema: default$default; Owner: prisma
--

COPY "default$default"."_BikeToReview" (id, "A", "B") FROM stdin;
\.


--
-- Data for Name: _BikeToSavedBikesList; Type: TABLE DATA; Schema: default$default; Owner: prisma
--

COPY "default$default"."_BikeToSavedBikesList" (id, "A", "B") FROM stdin;
cjvn98wsg02nd0783gcgiaygq	cjv3bpr1p01xz0783f9fao404	cjvn98wrk02nc0783383637i1
cjvn9n2qk02qb07832rxumjm6	cjv3bpqqs01u80783i6uyijk8	cjvn9n2qi02qa0783wehzz0i4
cjwu8pwnk001v0783b2sqs56u	cjv3bpqvm01vr0783clzgrbis	cjwu8pwi7001u0783za56c51s
cjwu8q5hi002407835l9agafs	cjv3bpqrz01ui0783zogtnn9t	cjwu8pwi7001u0783za56c51s
cjx1jioo1004c07839a2od1yf	cjvcbaikn02fn0783vgm9znvv	cjwu8pwi7001u0783za56c51s
cjxif5cxx008c0783p63u5sb7	cjv3bpqvm01vr0783clzgrbis	cjxif5cxr008b0783wg24fs7y
cjz0kzedc00k00783rxm1af8b	cjv3bpr1001xp0783v4gn81iz	cjz0kzecv00jz0783n0eap0hs
\.


--
-- Data for Name: _RelayId; Type: TABLE DATA; Schema: default$default; Owner: prisma
--

COPY "default$default"."_RelayId" (id, "stableModelIdentifier") FROM stdin;
cjtmu6363000t0783sn9upy6x	cjtdq24uc00040783y3tiqa30
cjtqu1g39002907837m9nrio4	cjtdq24v100070783fda1vm9j
cjtz4kk3y003o0783dq2rv63v	cjtdq24v1000507838lm70mum
cju0kyx5m005g0783lb9jwdd9	cjtdq24v100070783fda1vm9j
cju0rkcxo00810783wra9iagf	cjtdq24v100070783fda1vm9j
cju2pnewi009v0783rwazon11	cjtdq24v1000507838lm70mum
cju2pofsi00a907837b1da7vz	cjtdq24v100070783fda1vm9j
cjuatrcyk00e207837d2i66jn	cjtdq24uc00040783y3tiqa30
cjuatuita00e70783hawnpvxt	cjtdq24uc00040783y3tiqa30
cjuausyv000eo0783ad13z9tx	cjtdq24uc00040783y3tiqa30
cjutfdo4p00l10783y5e1r84j	cjtdq24v100070783fda1vm9j
cjv3bppmj01kn0783qg1p3jxe	cjtdq24uc00040783y3tiqa30
cjv3bppnf01ks0783rfjg0mlj	cjtdq24uc00040783y3tiqa30
cjv3bppou01l20783evkuybhu	cjtdq24uc00040783y3tiqa30
cjv3bpppi01l70783wlj7cec5	cjtdq24uc00040783y3tiqa30
cjv3bppr001lh0783efzcme6q	cjtdq24uc00040783y3tiqa30
cjv3bpprw01lm0783iaw8ha9z	cjtdq24uc00040783y3tiqa30
cjv3bpps901lr078390zqvghl	cjtdq24uc00040783y3tiqa30
cjv3bpptj01m60783ps9b26zp	cjtdq24uc00040783y3tiqa30
cjv3bppty01mb0783bd5ktk8k	cjtdq24uc00040783y3tiqa30
cjv3bppuo01mg0783cd7q2qvx	cjtdq24uc00040783y3tiqa30
cjv3bppvz01mq0783q87vx56p	cjtdq24uc00040783y3tiqa30
cjv3bppxf01n00783t2zb3i0d	cjtdq24uc00040783y3tiqa30
cjv3bppyz01na07839xvat90g	cjtdq24uc00040783y3tiqa30
cjv3bpq3701nk0783p14gsknh	cjtdq24uc00040783y3tiqa30
cjv3bpq4301nu0783xvj1o74j	cjtdq24uc00040783y3tiqa30
cjv3bpq4i01nz07837zy45hrk	cjtdq24uc00040783y3tiqa30
cjv3bpq5d01o40783eijgbluf	cjtdq24uc00040783y3tiqa30
cjv3bpq6h01oe0783ijm3jzou	cjtdq24uc00040783y3tiqa30
cjv3bpq7b01oo07838wqtq87n	cjtdq24uc00040783y3tiqa30
cjv3bpq8601oy07836b0y5qb0	cjtdq24uc00040783y3tiqa30
cjv3bpq9901p80783ll8vp7s8	cjtdq24uc00040783y3tiqa30
cjv3bpqa701pi0783zqczh8od	cjtdq24uc00040783y3tiqa30
cjv3bpqb201ps0783pnwsksyl	cjtdq24uc00040783y3tiqa30
cjv3bpqbr01q20783jr8medti	cjtdq24uc00040783y3tiqa30
cjv3bpqcr01qc07834plxjgfg	cjtdq24uc00040783y3tiqa30
cjv3bpqdj01qh0783fhdyx352	cjtdq24uc00040783y3tiqa30
cjv3bpqev01qw0783tqgx5fue	cjtdq24uc00040783y3tiqa30
cjv3bpqfc01r10783zj33txlr	cjtdq24uc00040783y3tiqa30
cjv3bpqfw01r60783l4rhsgo8	cjtdq24uc00040783y3tiqa30
cjv3bpqh301rl078313uposes	cjtdq24uc00040783y3tiqa30
cjv3bpqhi01rq0783xhzto7ti	cjtdq24uc00040783y3tiqa30
cjv3bpqiq01s00783enp9w5xr	cjtdq24uc00040783y3tiqa30
cjv3bpqjj01s50783fbmaj839	cjtdq24uc00040783y3tiqa30
cjv3bpql001sk0783g9ka7dw4	cjtdq24uc00040783y3tiqa30
cjv3bpqln01sp0783lcgthgke	cjtdq24uc00040783y3tiqa30
cjv3bpqn501t407839wafew2s	cjtdq24uc00040783y3tiqa30
cjv3bpqnn01t90783tbqn3ipy	cjtdq24uc00040783y3tiqa30
cjv3bpqo101te07830oubmrkb	cjtdq24uc00040783y3tiqa30
cjv3bpqpb01tt0783qzrxjtdd	cjtdq24uc00040783y3tiqa30
cjv3bpqpo01ty0783ncljs5fc	cjtdq24uc00040783y3tiqa30
cjv3bpqqf01u307832e0f22pd	cjtdq24uc00040783y3tiqa30
cjv3bpqrz01ui0783zogtnn9t	cjtdq24uc00040783y3tiqa30
cjv3bpqsb01un0783eue2u2p9	cjtdq24uc00040783y3tiqa30
cjv3bpqtm01v20783wjf2aw2y	cjtdq24uc00040783y3tiqa30
cjv3bpqty01v707838f7lb4wf	cjtdq24uc00040783y3tiqa30
cjv3bpqub01vc0783jf2v8bwr	cjtdq24uc00040783y3tiqa30
cjv3bpqvm01vr0783clzgrbis	cjtdq24uc00040783y3tiqa30
cjv3bpqwf01w10783z79yu39t	cjtdq24uc00040783y3tiqa30
cjv3bpqxc01wb0783254fbpee	cjtdq24uc00040783y3tiqa30
cjv3bpqxz01wl078349h7rej4	cjtdq24uc00040783y3tiqa30
cjv3bpqyb01wq07834r1vmkc5	cjtdq24uc00040783y3tiqa30
cjv3bpqz701x00783mdpkiyfx	cjtdq24uc00040783y3tiqa30
cjv3bpr0101xa0783kwzaglpp	cjtdq24uc00040783y3tiqa30
cjv3bpr0p01xk07836owa16d9	cjtdq24uc00040783y3tiqa30
cjv3bpr1001xp0783v4gn81iz	cjtdq24uc00040783y3tiqa30
cjv3bpr1p01xz0783f9fao404	cjtdq24uc00040783y3tiqa30
cjv3bpr2n01y90783cycc2s4c	cjtdq24uc00040783y3tiqa30
cjvbzkgrw02f50783oie9wts3	cjtdq24uc00040783y3tiqa30
cjvcblpvz02fs07835dzlj1mo	cjtdq24uc00040783y3tiqa30
cjvn9n2qi02qa0783wehzz0i4	cjtdq24v1000507838lm70mum
cjwu8pwi7001u0783za56c51s	cjtdq24v1000507838lm70mum
cjz0kzecv00jz0783n0eap0hs	cjtdq24v1000507838lm70mum
cjv3bppny01kx07830d3p3y93	cjtdq24uc00040783y3tiqa30
cjv3bppqj01lc0783s8cpyzkg	cjtdq24uc00040783y3tiqa30
cjv3bppso01lw0783qbtrabce	cjtdq24uc00040783y3tiqa30
cjv3bppt701m10783xoufzgfr	cjtdq24uc00040783y3tiqa30
cjv3bppv901ml07835qo44x63	cjtdq24uc00040783y3tiqa30
cjv3bppwp01mv0783aps82zsb	cjtdq24uc00040783y3tiqa30
cjv3bppyj01n5078330pxq0wv	cjtdq24uc00040783y3tiqa30
cjv3bpq2o01nf07837tf5a8rz	cjtdq24uc00040783y3tiqa30
cjv3bpq3k01np0783qqnxw4qv	cjtdq24uc00040783y3tiqa30
cjv3bpq5q01o90783n26ra1re	cjtdq24uc00040783y3tiqa30
cjv3bpq6z01oj0783lwboewvp	cjtdq24uc00040783y3tiqa30
cjv3bpq7o01ot0783suelekmb	cjtdq24uc00040783y3tiqa30
cjv3bpq8r01p30783dvrhkuhi	cjtdq24uc00040783y3tiqa30
cjv3bpq9v01pd0783dhebzu0x	cjtdq24uc00040783y3tiqa30
cjv3bpqap01pn0783h4p67yno	cjtdq24uc00040783y3tiqa30
cjv3bpqbe01px0783086by0wp	cjtdq24uc00040783y3tiqa30
cjv3bpqc301q70783vbtvmga6	cjtdq24uc00040783y3tiqa30
cjv3bpqdw01qm0783ob3t9vn1	cjtdq24uc00040783y3tiqa30
cjv3bpqe701qr0783bxkcwclk	cjtdq24uc00040783y3tiqa30
cjv3bpqgc01rb0783gy6qy1zi	cjtdq24uc00040783y3tiqa30
cjv3bpqgp01rg0783gj1loj3a	cjtdq24uc00040783y3tiqa30
cjv3bpqhw01rv0783a714v4tm	cjtdq24uc00040783y3tiqa30
cjv3bpqjw01sa0783iika0vvb	cjtdq24uc00040783y3tiqa30
cjv3bpqkn01sf0783gz07oh7k	cjtdq24uc00040783y3tiqa30
cjv3bpqme01su0783qpwmd0na	cjtdq24uc00040783y3tiqa30
cjv3bpqms01sz078354rghwe8	cjtdq24uc00040783y3tiqa30
cjv3bpqoe01tj0783pgtug8ov	cjtdq24uc00040783y3tiqa30
cjv3bpqos01to07835k14eixm	cjtdq24uc00040783y3tiqa30
cjv3bpqqs01u80783i6uyijk8	cjtdq24uc00040783y3tiqa30
cjv3bpqrg01ud0783dek8dqgp	cjtdq24uc00040783y3tiqa30
cjv3bpqsq01us07835szghyiw	cjtdq24uc00040783y3tiqa30
cjv3bpqt201ux0783s9n7rtat	cjtdq24uc00040783y3tiqa30
cjv3bpquv01vh0783mbkym2lw	cjtdq24uc00040783y3tiqa30
cjv3bpqv801vm0783qaykyd5h	cjtdq24uc00040783y3tiqa30
cjv3bpqw401vw0783320jmah2	cjtdq24uc00040783y3tiqa30
cjv3bpqx001w60783d0kr9uyo	cjtdq24uc00040783y3tiqa30
cjv3bpqxo01wg0783mzbod5oj	cjtdq24uc00040783y3tiqa30
cjv3bpqyn01wv0783qeeec7yy	cjtdq24uc00040783y3tiqa30
cjv3bpqzi01x50783cssbfsge	cjtdq24uc00040783y3tiqa30
cjv3bpr0d01xf0783ftkdzjg6	cjtdq24uc00040783y3tiqa30
cjv3bpr1c01xu0783c5sq2uc9	cjtdq24uc00040783y3tiqa30
cjv3bpr2c01y40783ps5rllcz	cjtdq24uc00040783y3tiqa30
cjv6qm07l02e10783rqxc5gjz	cjtdq24uc00040783y3tiqa30
cjvcb0ce702fi07839ukbdyt8	cjtdq24uc00040783y3tiqa30
cjvcbaikn02fn0783vgm9znvv	cjtdq24uc00040783y3tiqa30
cjvn98wrk02nc0783383637i1	cjtdq24v1000507838lm70mum
cjxif5cxr008b0783wg24fs7y	cjtdq24v1000507838lm70mum
\.


--
-- Data for Name: CloudSecret; Type: TABLE DATA; Schema: management; Owner: prisma
--

COPY management."CloudSecret" (secret) FROM stdin;
\.


--
-- Data for Name: InternalMigration; Type: TABLE DATA; Schema: management; Owner: prisma
--

COPY management."InternalMigration" (id, "appliedAt") FROM stdin;
\.


--
-- Data for Name: Migration; Type: TABLE DATA; Schema: management; Owner: prisma
--

COPY management."Migration" ("projectId", revision, schema, functions, status, applied, "rolledBack", steps, errors, "startedAt", "finishedAt") FROM stdin;
default$default	1	{"models":[],"relations":[],"enums":[]}	[]	SUCCESS	0	0	[]	[]	\N	\N
default$default	3	{"models":[{"name":"SavedBikesList","stableIdentifier":"cjtdq24v1000507838lm70mum","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bikes","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToSavedBikesList","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Review","stableIdentifier":"cjtdq24v100060783pi8di71f","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"rating","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"comment","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bike","typeIdentifier":"Relation","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToReview","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Booking","stableIdentifier":"cjtdq24v100070783fda1vm9j","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bikeOwnerUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"startDate","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"endDate","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLongitude","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLongitudeDelta","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLatitude","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLatitudeDelta","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationAddress","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationComment","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"dailyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"monthlyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"totalPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"status","typeIdentifier":"Enum","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"enum":{"name":"BookingStatus","values":["WAITING_CONFIRMATION","CONFIRMED","CANCELED"]},"defaultValue":{"gcValueType":"enum","isList":false,"value":"WAITING_CONFIRMATION"}},{"name":"bike","typeIdentifier":"Relation","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToBooking","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Bike","stableIdentifier":"cjtdq24uc00040783y3tiqa30","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"ownerUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"modelId","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"photos","typeIdentifier":"String","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"rating","typeIdentifier":"Float","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"float","isList":false,"value":0}},{"name":"reviewsCount","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"int","isList":false,"value":0}},{"name":"manufactureYear","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"mileage","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"int","isList":false,"value":0}},{"name":"dailyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"monthlyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"status","typeIdentifier":"Enum","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"enum":{"name":"BikeStatus","values":["MODERATION","ACTIVE","ARCHIVED"]},"defaultValue":{"gcValueType":"enum","isList":false,"value":"ACTIVE"}},{"name":"areaIds","typeIdentifier":"Int","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"reviews","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToReview","relationSide":"A"},{"name":"bookings","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToBooking","relationSide":"A"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"_MagicalBackRelation_BikeToSavedBikesList","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":true,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToSavedBikesList","relationSide":"A"}]}],"relations":[{"name":"BikeToBooking","modelAId":"Bike","modelBId":"Booking","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"},{"name":"BikeToReview","modelAId":"Bike","modelBId":"Review","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"},{"name":"BikeToSavedBikesList","modelAId":"Bike","modelBId":"SavedBikesList","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"}],"enums":[{"name":"BikeStatus","values":["MODERATION","ACTIVE","ARCHIVED"]},{"name":"BookingStatus","values":["WAITING_CONFIRMATION","CONFIRMED","CANCELED"]}]}	[]	SUCCESS	2	0	[{"name":"BikeStatus","values":["MODERATION","ACTIVE","ARCHIVED"],"discriminator":"CreateEnum"},{"model":"Bike","name":"status","typeName":"Enum","isRequired":false,"isList":false,"isUnique":false,"defaultValue":"EnumGCValue(ACTIVE)","enum":"BikeStatus","discriminator":"CreateField"}]	[]	2019-03-29 12:53:28.25	2019-03-29 12:53:28.373
default$default	2	{"models":[{"name":"SavedBikesList","stableIdentifier":"cjtdq24v1000507838lm70mum","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bikes","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToSavedBikesList","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Review","stableIdentifier":"cjtdq24v100060783pi8di71f","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"rating","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"comment","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bike","typeIdentifier":"Relation","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToReview","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Booking","stableIdentifier":"cjtdq24v100070783fda1vm9j","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bikeOwnerUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"startDate","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"endDate","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLongitude","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLongitudeDelta","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLatitude","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLatitudeDelta","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationAddress","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationComment","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"dailyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"monthlyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"totalPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"status","typeIdentifier":"Enum","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"enum":{"name":"BookingStatus","values":["WAITING_CONFIRMATION","CONFIRMED","CANCELED"]},"defaultValue":{"gcValueType":"enum","isList":false,"value":"WAITING_CONFIRMATION"}},{"name":"bike","typeIdentifier":"Relation","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToBooking","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Bike","stableIdentifier":"cjtdq24uc00040783y3tiqa30","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"ownerUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"modelId","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"photos","typeIdentifier":"String","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"rating","typeIdentifier":"Float","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"float","isList":false,"value":0}},{"name":"reviewsCount","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"int","isList":false,"value":0}},{"name":"manufactureYear","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"mileage","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"int","isList":false,"value":0}},{"name":"dailyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"monthlyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"areaIds","typeIdentifier":"Int","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"reviews","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToReview","relationSide":"A"},{"name":"bookings","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToBooking","relationSide":"A"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"_MagicalBackRelation_BikeToSavedBikesList","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":true,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToSavedBikesList","relationSide":"A"}]}],"relations":[{"name":"BikeToBooking","modelAId":"Bike","modelBId":"Booking","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"},{"name":"BikeToReview","modelAId":"Bike","modelBId":"Review","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"},{"name":"BikeToSavedBikesList","modelAId":"Bike","modelBId":"SavedBikesList","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"}],"enums":[{"name":"BookingStatus","values":["WAITING_CONFIRMATION","CONFIRMED","CANCELED"]}]}	[]	SUCCESS	53	0	[{"name":"BookingStatus","values":["WAITING_CONFIRMATION","CONFIRMED","CANCELED"],"discriminator":"CreateEnum"},{"name":"SavedBikesList","discriminator":"CreateModel"},{"name":"Review","discriminator":"CreateModel"},{"name":"Booking","discriminator":"CreateModel"},{"name":"Bike","discriminator":"CreateModel"},{"model":"SavedBikesList","name":"id","typeName":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"discriminator":"CreateField"},{"model":"SavedBikesList","name":"userUid","typeName":"String","isRequired":true,"isList":false,"isUnique":true,"discriminator":"CreateField"},{"model":"SavedBikesList","name":"bikes","typeName":"Relation","isRequired":false,"isList":true,"isUnique":false,"relation":"BikeToSavedBikesList","discriminator":"CreateField"},{"model":"SavedBikesList","name":"updatedAt","typeName":"DateTime","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"SavedBikesList","name":"createdAt","typeName":"DateTime","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Review","name":"id","typeName":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"discriminator":"CreateField"},{"model":"Review","name":"rating","typeName":"Int","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Review","name":"comment","typeName":"String","isRequired":false,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Review","name":"createdAt","typeName":"DateTime","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Review","name":"userUid","typeName":"String","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Review","name":"bike","typeName":"Relation","isRequired":true,"isList":false,"isUnique":false,"relation":"BikeToReview","discriminator":"CreateField"},{"model":"Review","name":"updatedAt","typeName":"DateTime","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Booking","name":"id","typeName":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"discriminator":"CreateField"},{"model":"Booking","name":"userUid","typeName":"String","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Booking","name":"bikeOwnerUid","typeName":"String","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Booking","name":"startDate","typeName":"DateTime","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Booking","name":"endDate","typeName":"DateTime","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Booking","name":"deliveryLocationLongitude","typeName":"String","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Booking","name":"deliveryLocationLongitudeDelta","typeName":"String","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Booking","name":"deliveryLocationLatitude","typeName":"String","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Booking","name":"deliveryLocationLatitudeDelta","typeName":"String","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Booking","name":"deliveryLocationAddress","typeName":"String","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Booking","name":"deliveryLocationComment","typeName":"String","isRequired":false,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Booking","name":"dailyPrice","typeName":"Int","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Booking","name":"monthlyPrice","typeName":"Int","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Booking","name":"totalPrice","typeName":"Int","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Booking","name":"status","typeName":"Enum","isRequired":true,"isList":false,"isUnique":false,"defaultValue":"EnumGCValue(WAITING_CONFIRMATION)","enum":"BookingStatus","discriminator":"CreateField"},{"model":"Booking","name":"bike","typeName":"Relation","isRequired":true,"isList":false,"isUnique":false,"relation":"BikeToBooking","discriminator":"CreateField"},{"model":"Booking","name":"updatedAt","typeName":"DateTime","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Booking","name":"createdAt","typeName":"DateTime","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Bike","name":"id","typeName":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"discriminator":"CreateField"},{"model":"Bike","name":"ownerUid","typeName":"String","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Bike","name":"modelId","typeName":"Int","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Bike","name":"photos","typeName":"String","isRequired":false,"isList":true,"isUnique":false,"discriminator":"CreateField"},{"model":"Bike","name":"rating","typeName":"Float","isRequired":false,"isList":false,"isUnique":false,"defaultValue":"FloatGCValue(0.0)","discriminator":"CreateField"},{"model":"Bike","name":"reviewsCount","typeName":"Int","isRequired":false,"isList":false,"isUnique":false,"defaultValue":"IntGCValue(0)","discriminator":"CreateField"},{"model":"Bike","name":"manufactureYear","typeName":"Int","isRequired":false,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Bike","name":"mileage","typeName":"Int","isRequired":false,"isList":false,"isUnique":false,"defaultValue":"IntGCValue(0)","discriminator":"CreateField"},{"model":"Bike","name":"dailyPrice","typeName":"Int","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Bike","name":"monthlyPrice","typeName":"Int","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Bike","name":"areaIds","typeName":"Int","isRequired":false,"isList":true,"isUnique":false,"discriminator":"CreateField"},{"model":"Bike","name":"reviews","typeName":"Relation","isRequired":false,"isList":true,"isUnique":false,"relation":"BikeToReview","discriminator":"CreateField"},{"model":"Bike","name":"bookings","typeName":"Relation","isRequired":false,"isList":true,"isUnique":false,"relation":"BikeToBooking","discriminator":"CreateField"},{"model":"Bike","name":"updatedAt","typeName":"DateTime","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Bike","name":"createdAt","typeName":"DateTime","isRequired":true,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"name":"BikeToBooking","leftModelName":"Bike","rightModelName":"Booking","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL","discriminator":"CreateRelation"},{"name":"BikeToReview","leftModelName":"Bike","rightModelName":"Review","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL","discriminator":"CreateRelation"},{"name":"BikeToSavedBikesList","leftModelName":"Bike","rightModelName":"SavedBikesList","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL","discriminator":"CreateRelation"}]	[]	2019-03-18 02:20:36.508	2019-03-18 02:20:37.305
default$default	4	{"models":[{"name":"SavedBikesList","stableIdentifier":"cjtdq24v1000507838lm70mum","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bikes","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToSavedBikesList","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Review","stableIdentifier":"cjtdq24v100060783pi8di71f","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"rating","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"comment","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bike","typeIdentifier":"Relation","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToReview","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Booking","stableIdentifier":"cjtdq24v100070783fda1vm9j","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bikeOwnerUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"startDate","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"endDate","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLongitude","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLongitudeDelta","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLatitude","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLatitudeDelta","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationAddress","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationComment","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"dailyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"monthlyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"totalPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"status","typeIdentifier":"Enum","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"enum":{"name":"BookingStatus","values":["WAITING_CONFIRMATION","CONFIRMED","CANCELED"]},"defaultValue":{"gcValueType":"enum","isList":false,"value":"WAITING_CONFIRMATION"}},{"name":"bike","typeIdentifier":"Relation","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToBooking","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Bike","stableIdentifier":"cjtdq24uc00040783y3tiqa30","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"ownerUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"modelId","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"photos","typeIdentifier":"String","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"rating","typeIdentifier":"Float","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"float","isList":false,"value":0}},{"name":"reviewsCount","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"int","isList":false,"value":0}},{"name":"manufactureYear","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"mileage","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"int","isList":false,"value":0}},{"name":"dailyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"monthlyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"status","typeIdentifier":"Enum","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"enum":{"name":"BikeStatus","values":["MODERATION","ACTIVE","ARCHIVED"]},"defaultValue":{"gcValueType":"enum","isList":false,"value":"ACTIVE"}},{"name":"areaIds","typeIdentifier":"Int","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"reviews","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToReview","relationSide":"A"},{"name":"bookings","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToBooking","relationSide":"A"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"_MagicalBackRelation_BikeToSavedBikesList","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":true,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToSavedBikesList","relationSide":"A"}]}],"relations":[{"name":"BikeToBooking","modelAId":"Bike","modelBId":"Booking","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"},{"name":"BikeToReview","modelAId":"Bike","modelBId":"Review","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"},{"name":"BikeToSavedBikesList","modelAId":"Bike","modelBId":"SavedBikesList","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"}],"enums":[{"name":"BikeStatus","values":["MODERATION","ACTIVE","ARCHIVED"]},{"name":"BookingStatus","values":["WAITING_CONFIRMATION","CONFIRMED","CANCELED"]}]}	[]	SUCCESS	1	0	[{"model":"Bike","newModel":"Bike","name":"status","newName":null,"typeName":null,"isRequired":true,"isList":null,"unique":null,"discriminator":"UpdateField"}]	[]	2019-03-29 12:59:38.905	2019-03-29 12:59:38.94
default$default	5	{"models":[{"name":"SavedBikesList","stableIdentifier":"cjtdq24v1000507838lm70mum","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bikes","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToSavedBikesList","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Review","stableIdentifier":"cjtdq24v100060783pi8di71f","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"rating","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"comment","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bike","typeIdentifier":"Relation","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToReview","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Booking","stableIdentifier":"cjtdq24v100070783fda1vm9j","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bikeOwnerUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"startDate","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"endDate","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLongitude","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLongitudeDelta","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLatitude","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLatitudeDelta","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationAddress","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationComment","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"dailyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"monthlyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"weeklyPrice","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"totalPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"status","typeIdentifier":"Enum","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"enum":{"name":"BookingStatus","values":["WAITING_CONFIRMATION","CONFIRMED","CANCELED"]},"defaultValue":{"gcValueType":"enum","isList":false,"value":"WAITING_CONFIRMATION"}},{"name":"bike","typeIdentifier":"Relation","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToBooking","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Bike","stableIdentifier":"cjtdq24uc00040783y3tiqa30","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"ownerUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"modelId","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"photos","typeIdentifier":"String","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"rating","typeIdentifier":"Float","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"float","isList":false,"value":0}},{"name":"reviewsCount","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"int","isList":false,"value":0}},{"name":"manufactureYear","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"mileage","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"int","isList":false,"value":0}},{"name":"dailyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"weeklyPrice","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"monthlyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"status","typeIdentifier":"Enum","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"enum":{"name":"BikeStatus","values":["MODERATION","ACTIVE","ARCHIVED"]},"defaultValue":{"gcValueType":"enum","isList":false,"value":"ACTIVE"}},{"name":"areaIds","typeIdentifier":"Int","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"reviews","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToReview","relationSide":"A"},{"name":"bookings","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToBooking","relationSide":"A"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"_MagicalBackRelation_BikeToSavedBikesList","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":true,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToSavedBikesList","relationSide":"A"}]}],"relations":[{"name":"BikeToBooking","modelAId":"Bike","modelBId":"Booking","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"},{"name":"BikeToReview","modelAId":"Bike","modelBId":"Review","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"},{"name":"BikeToSavedBikesList","modelAId":"Bike","modelBId":"SavedBikesList","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"}],"enums":[{"name":"BikeStatus","values":["MODERATION","ACTIVE","ARCHIVED"]},{"name":"BookingStatus","values":["WAITING_CONFIRMATION","CONFIRMED","CANCELED"]}]}	[]	SUCCESS	2	0	[{"model":"Booking","name":"weeklyPrice","typeName":"Int","isRequired":false,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Bike","name":"weeklyPrice","typeName":"Int","isRequired":false,"isList":false,"isUnique":false,"discriminator":"CreateField"}]	[]	2019-04-17 02:55:10.233	2019-04-17 02:55:10.385
default$default	6	{"models":[{"name":"SavedBikesList","stableIdentifier":"cjtdq24v1000507838lm70mum","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bikes","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToSavedBikesList","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Review","stableIdentifier":"cjtdq24v100060783pi8di71f","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"rating","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"comment","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bike","typeIdentifier":"Relation","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToReview","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Booking","stableIdentifier":"cjtdq24v100070783fda1vm9j","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bikeOwnerUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"startDate","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"endDate","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLongitude","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLongitudeDelta","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLatitude","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLatitudeDelta","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationAddress","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationComment","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"dailyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"monthlyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"weeklyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"totalPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"status","typeIdentifier":"Enum","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"enum":{"name":"BookingStatus","values":["WAITING_CONFIRMATION","CONFIRMED","CANCELED"]},"defaultValue":{"gcValueType":"enum","isList":false,"value":"WAITING_CONFIRMATION"}},{"name":"bike","typeIdentifier":"Relation","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToBooking","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Bike","stableIdentifier":"cjtdq24uc00040783y3tiqa30","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"ownerUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"modelId","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"photos","typeIdentifier":"String","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"rating","typeIdentifier":"Float","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"float","isList":false,"value":0}},{"name":"reviewsCount","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"int","isList":false,"value":0}},{"name":"manufactureYear","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"mileage","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"int","isList":false,"value":0}},{"name":"dailyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"weeklyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"monthlyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"status","typeIdentifier":"Enum","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"enum":{"name":"BikeStatus","values":["MODERATION","ACTIVE","ARCHIVED"]},"defaultValue":{"gcValueType":"enum","isList":false,"value":"ACTIVE"}},{"name":"areaIds","typeIdentifier":"Int","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"reviews","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToReview","relationSide":"A"},{"name":"bookings","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToBooking","relationSide":"A"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"_MagicalBackRelation_BikeToSavedBikesList","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":true,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToSavedBikesList","relationSide":"A"}]}],"relations":[{"name":"BikeToBooking","modelAId":"Bike","modelBId":"Booking","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"},{"name":"BikeToReview","modelAId":"Bike","modelBId":"Review","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"},{"name":"BikeToSavedBikesList","modelAId":"Bike","modelBId":"SavedBikesList","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"}],"enums":[{"name":"BikeStatus","values":["MODERATION","ACTIVE","ARCHIVED"]},{"name":"BookingStatus","values":["WAITING_CONFIRMATION","CONFIRMED","CANCELED"]}]}	[]	SUCCESS	2	0	[{"model":"Booking","newModel":"Booking","name":"weeklyPrice","newName":null,"typeName":null,"isRequired":true,"isList":null,"unique":null,"discriminator":"UpdateField"},{"model":"Bike","newModel":"Bike","name":"weeklyPrice","newName":null,"typeName":null,"isRequired":true,"isList":null,"unique":null,"discriminator":"UpdateField"}]	[]	2019-04-17 03:07:41.759	2019-04-17 03:07:41.811
default$default	7	{"models":[{"name":"SavedBikesList","stableIdentifier":"cjtdq24v1000507838lm70mum","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bikes","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToSavedBikesList","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Review","stableIdentifier":"cjtdq24v100060783pi8di71f","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"rating","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"comment","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bike","typeIdentifier":"Relation","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToReview","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Booking","stableIdentifier":"cjtdq24v100070783fda1vm9j","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bikeOwnerUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"startDate","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"endDate","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLongitude","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLongitudeDelta","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLatitude","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLatitudeDelta","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationAddress","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationComment","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"dailyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"monthlyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"weeklyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"totalPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"status","typeIdentifier":"Enum","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"enum":{"name":"BookingStatus","values":["WAITING_CONFIRMATION","CONFIRMED","CANCELED"]},"defaultValue":{"gcValueType":"enum","isList":false,"value":"WAITING_CONFIRMATION"}},{"name":"bike","typeIdentifier":"Relation","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToBooking","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Bike","stableIdentifier":"cjtdq24uc00040783y3tiqa30","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"ownerUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"modelId","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"photos","typeIdentifier":"String","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"rating","typeIdentifier":"Float","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"float","isList":false,"value":0}},{"name":"reviewsCount","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"int","isList":false,"value":0}},{"name":"manufactureYear","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"mileage","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"int","isList":false,"value":0}},{"name":"dailyPrice","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"weeklyPrice","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"monthlyPrice","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"status","typeIdentifier":"Enum","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"enum":{"name":"BikeStatus","values":["MODERATION","ACTIVE","ARCHIVED"]},"defaultValue":{"gcValueType":"enum","isList":false,"value":"ACTIVE"}},{"name":"areaIds","typeIdentifier":"Int","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"whatsapp","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"facebook","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"onlyContacts","typeIdentifier":"Boolean","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"bool","isList":false,"value":false}},{"name":"reviews","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToReview","relationSide":"A"},{"name":"bookings","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToBooking","relationSide":"A"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"_MagicalBackRelation_BikeToSavedBikesList","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":true,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToSavedBikesList","relationSide":"A"}]}],"relations":[{"name":"BikeToBooking","modelAId":"Bike","modelBId":"Booking","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"},{"name":"BikeToReview","modelAId":"Bike","modelBId":"Review","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"},{"name":"BikeToSavedBikesList","modelAId":"Bike","modelBId":"SavedBikesList","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"}],"enums":[{"name":"BikeStatus","values":["MODERATION","ACTIVE","ARCHIVED"]},{"name":"BookingStatus","values":["WAITING_CONFIRMATION","CONFIRMED","CANCELED"]}]}	[]	SUCCESS	6	0	[{"model":"Bike","name":"whatsapp","typeName":"String","isRequired":false,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Bike","name":"facebook","typeName":"String","isRequired":false,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Bike","name":"onlyContacts","typeName":"Boolean","isRequired":false,"isList":false,"isUnique":false,"defaultValue":"BooleanGCValue(false)","discriminator":"CreateField"},{"model":"Bike","newModel":"Bike","name":"dailyPrice","newName":null,"typeName":null,"isRequired":false,"isList":null,"unique":null,"discriminator":"UpdateField"},{"model":"Bike","newModel":"Bike","name":"weeklyPrice","newName":null,"typeName":null,"isRequired":false,"isList":null,"unique":null,"discriminator":"UpdateField"},{"model":"Bike","newModel":"Bike","name":"monthlyPrice","newName":null,"typeName":null,"isRequired":false,"isList":null,"unique":null,"discriminator":"UpdateField"}]	[]	2019-04-27 02:12:56.396	2019-04-27 02:12:56.466
default$default	8	{"models":[{"name":"SavedBikesList","stableIdentifier":"cjtdq24v1000507838lm70mum","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bikes","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToSavedBikesList","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Review","stableIdentifier":"cjtdq24v100060783pi8di71f","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"rating","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"comment","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bike","typeIdentifier":"Relation","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToReview","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Booking","stableIdentifier":"cjtdq24v100070783fda1vm9j","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"userUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"bikeOwnerUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"startDate","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"endDate","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLongitude","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLongitudeDelta","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLatitude","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationLatitudeDelta","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationAddress","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"deliveryLocationComment","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"dailyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"monthlyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"weeklyPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"totalPrice","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"status","typeIdentifier":"Enum","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"enum":{"name":"BookingStatus","values":["WAITING_CONFIRMATION","CONFIRMED","CANCELED"]},"defaultValue":{"gcValueType":"enum","isList":false,"value":"WAITING_CONFIRMATION"}},{"name":"bike","typeIdentifier":"Relation","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToBooking","relationSide":"B"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false}]},{"name":"Bike","stableIdentifier":"cjtdq24uc00040783y3tiqa30","isEmbedded":false,"fields":[{"name":"id","typeIdentifier":"GraphQLID","isRequired":true,"isList":false,"isUnique":true,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"ownerUid","typeIdentifier":"String","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"modelId","typeIdentifier":"Int","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"photos","typeIdentifier":"String","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"rating","typeIdentifier":"Float","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"float","isList":false,"value":0}},{"name":"reviewsCount","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"int","isList":false,"value":0}},{"name":"manufactureYear","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"mileage","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"int","isList":false,"value":0}},{"name":"dailyPrice","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"weeklyPrice","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"monthlyPrice","typeIdentifier":"Int","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"status","typeIdentifier":"Enum","isRequired":true,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"enum":{"name":"BikeStatus","values":["MODERATION","ACTIVE","ARCHIVED"]},"defaultValue":{"gcValueType":"enum","isList":false,"value":"ACTIVE"}},{"name":"areaIds","typeIdentifier":"Int","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"whatsapp","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"facebook","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"onlyContacts","typeIdentifier":"Boolean","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"defaultValue":{"gcValueType":"bool","isList":false,"value":false}},{"name":"addressLat","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"addressLng","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"address","typeIdentifier":"String","isRequired":false,"isList":false,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false},{"name":"reviews","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToReview","relationSide":"A"},{"name":"bookings","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":false,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToBooking","relationSide":"A"},{"name":"updatedAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"createdAt","typeIdentifier":"DateTime","isRequired":true,"isList":false,"isUnique":false,"isHidden":true,"isReadonly":true,"isAutoGenerated":false},{"name":"_MagicalBackRelation_BikeToSavedBikesList","typeIdentifier":"Relation","isRequired":false,"isList":true,"isUnique":false,"isHidden":true,"isReadonly":false,"isAutoGenerated":false,"relationName":"BikeToSavedBikesList","relationSide":"A"}]}],"relations":[{"name":"BikeToBooking","modelAId":"Bike","modelBId":"Booking","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"},{"name":"BikeToReview","modelAId":"Bike","modelBId":"Review","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"},{"name":"BikeToSavedBikesList","modelAId":"Bike","modelBId":"SavedBikesList","modelAOnDelete":"SET_NULL","modelBOnDelete":"SET_NULL"}],"enums":[{"name":"BikeStatus","values":["MODERATION","ACTIVE","ARCHIVED"]},{"name":"BookingStatus","values":["WAITING_CONFIRMATION","CONFIRMED","CANCELED"]}]}	[]	SUCCESS	3	0	[{"model":"Bike","name":"addressLat","typeName":"String","isRequired":false,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Bike","name":"addressLng","typeName":"String","isRequired":false,"isList":false,"isUnique":false,"discriminator":"CreateField"},{"model":"Bike","name":"address","typeName":"String","isRequired":false,"isList":false,"isUnique":false,"discriminator":"CreateField"}]	[]	2019-07-17 05:22:25.921	2019-07-17 05:22:26.104
\.


--
-- Data for Name: Project; Type: TABLE DATA; Schema: management; Owner: prisma
--

COPY management."Project" (id, secrets, "allowQueries", "allowMutations", functions) FROM stdin;
default$default	[]	t	t	[]
\.


--
-- Data for Name: TelemetryInfo; Type: TABLE DATA; Schema: management; Owner: prisma
--

COPY management."TelemetryInfo" (id, "lastPinged") FROM stdin;
\.


--
-- Name: Bike_areaIds Bike_areaIds_pkey; Type: CONSTRAINT; Schema: default$default; Owner: prisma
--

ALTER TABLE ONLY "default$default"."Bike_areaIds"
    ADD CONSTRAINT "Bike_areaIds_pkey" PRIMARY KEY ("nodeId", "position");


--
-- Name: Bike_photos Bike_photos_pkey; Type: CONSTRAINT; Schema: default$default; Owner: prisma
--

ALTER TABLE ONLY "default$default"."Bike_photos"
    ADD CONSTRAINT "Bike_photos_pkey" PRIMARY KEY ("nodeId", "position");


--
-- Name: Bike Bike_pkey; Type: CONSTRAINT; Schema: default$default; Owner: prisma
--

ALTER TABLE ONLY "default$default"."Bike"
    ADD CONSTRAINT "Bike_pkey" PRIMARY KEY (id);


--
-- Name: Booking Booking_pkey; Type: CONSTRAINT; Schema: default$default; Owner: prisma
--

ALTER TABLE ONLY "default$default"."Booking"
    ADD CONSTRAINT "Booking_pkey" PRIMARY KEY (id);


--
-- Name: Review Review_pkey; Type: CONSTRAINT; Schema: default$default; Owner: prisma
--

ALTER TABLE ONLY "default$default"."Review"
    ADD CONSTRAINT "Review_pkey" PRIMARY KEY (id);


--
-- Name: SavedBikesList SavedBikesList_pkey; Type: CONSTRAINT; Schema: default$default; Owner: prisma
--

ALTER TABLE ONLY "default$default"."SavedBikesList"
    ADD CONSTRAINT "SavedBikesList_pkey" PRIMARY KEY (id);


--
-- Name: _BikeToBooking _BikeToBooking_pkey; Type: CONSTRAINT; Schema: default$default; Owner: prisma
--

ALTER TABLE ONLY "default$default"."_BikeToBooking"
    ADD CONSTRAINT "_BikeToBooking_pkey" PRIMARY KEY (id);


--
-- Name: _BikeToReview _BikeToReview_pkey; Type: CONSTRAINT; Schema: default$default; Owner: prisma
--

ALTER TABLE ONLY "default$default"."_BikeToReview"
    ADD CONSTRAINT "_BikeToReview_pkey" PRIMARY KEY (id);


--
-- Name: _BikeToSavedBikesList _BikeToSavedBikesList_pkey; Type: CONSTRAINT; Schema: default$default; Owner: prisma
--

ALTER TABLE ONLY "default$default"."_BikeToSavedBikesList"
    ADD CONSTRAINT "_BikeToSavedBikesList_pkey" PRIMARY KEY (id);


--
-- Name: _RelayId pk_RelayId; Type: CONSTRAINT; Schema: default$default; Owner: prisma
--

ALTER TABLE ONLY "default$default"."_RelayId"
    ADD CONSTRAINT "pk_RelayId" PRIMARY KEY (id);


--
-- Name: CloudSecret CloudSecret_pkey; Type: CONSTRAINT; Schema: management; Owner: prisma
--

ALTER TABLE ONLY management."CloudSecret"
    ADD CONSTRAINT "CloudSecret_pkey" PRIMARY KEY (secret);


--
-- Name: InternalMigration InternalMigration_pkey; Type: CONSTRAINT; Schema: management; Owner: prisma
--

ALTER TABLE ONLY management."InternalMigration"
    ADD CONSTRAINT "InternalMigration_pkey" PRIMARY KEY (id);


--
-- Name: Migration Migration_pkey; Type: CONSTRAINT; Schema: management; Owner: prisma
--

ALTER TABLE ONLY management."Migration"
    ADD CONSTRAINT "Migration_pkey" PRIMARY KEY ("projectId", revision);


--
-- Name: Project Project_pkey; Type: CONSTRAINT; Schema: management; Owner: prisma
--

ALTER TABLE ONLY management."Project"
    ADD CONSTRAINT "Project_pkey" PRIMARY KEY (id);


--
-- Name: TelemetryInfo TelemetryInfo_pkey; Type: CONSTRAINT; Schema: management; Owner: prisma
--

ALTER TABLE ONLY management."TelemetryInfo"
    ADD CONSTRAINT "TelemetryInfo_pkey" PRIMARY KEY (id);


--
-- Name: _BikeToBooking_A; Type: INDEX; Schema: default$default; Owner: prisma
--

CREATE INDEX "_BikeToBooking_A" ON "default$default"."_BikeToBooking" USING btree ("A");


--
-- Name: _BikeToBooking_AB_unique; Type: INDEX; Schema: default$default; Owner: prisma
--

CREATE UNIQUE INDEX "_BikeToBooking_AB_unique" ON "default$default"."_BikeToBooking" USING btree ("A", "B");


--
-- Name: _BikeToBooking_B; Type: INDEX; Schema: default$default; Owner: prisma
--

CREATE INDEX "_BikeToBooking_B" ON "default$default"."_BikeToBooking" USING btree ("B");


--
-- Name: _BikeToReview_A; Type: INDEX; Schema: default$default; Owner: prisma
--

CREATE INDEX "_BikeToReview_A" ON "default$default"."_BikeToReview" USING btree ("A");


--
-- Name: _BikeToReview_AB_unique; Type: INDEX; Schema: default$default; Owner: prisma
--

CREATE UNIQUE INDEX "_BikeToReview_AB_unique" ON "default$default"."_BikeToReview" USING btree ("A", "B");


--
-- Name: _BikeToReview_B; Type: INDEX; Schema: default$default; Owner: prisma
--

CREATE INDEX "_BikeToReview_B" ON "default$default"."_BikeToReview" USING btree ("B");


--
-- Name: _BikeToSavedBikesList_A; Type: INDEX; Schema: default$default; Owner: prisma
--

CREATE INDEX "_BikeToSavedBikesList_A" ON "default$default"."_BikeToSavedBikesList" USING btree ("A");


--
-- Name: _BikeToSavedBikesList_AB_unique; Type: INDEX; Schema: default$default; Owner: prisma
--

CREATE UNIQUE INDEX "_BikeToSavedBikesList_AB_unique" ON "default$default"."_BikeToSavedBikesList" USING btree ("A", "B");


--
-- Name: _BikeToSavedBikesList_B; Type: INDEX; Schema: default$default; Owner: prisma
--

CREATE INDEX "_BikeToSavedBikesList_B" ON "default$default"."_BikeToSavedBikesList" USING btree ("B");


--
-- Name: default$default.SavedBikesList.userUid._UNIQUE; Type: INDEX; Schema: default$default; Owner: prisma
--

CREATE UNIQUE INDEX "default$default.SavedBikesList.userUid._UNIQUE" ON "default$default"."SavedBikesList" USING btree ("userUid");


--
-- Name: Bike_areaIds Bike_areaIds_nodeId_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: prisma
--

ALTER TABLE ONLY "default$default"."Bike_areaIds"
    ADD CONSTRAINT "Bike_areaIds_nodeId_fkey" FOREIGN KEY ("nodeId") REFERENCES "default$default"."Bike"(id);


--
-- Name: Bike_photos Bike_photos_nodeId_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: prisma
--

ALTER TABLE ONLY "default$default"."Bike_photos"
    ADD CONSTRAINT "Bike_photos_nodeId_fkey" FOREIGN KEY ("nodeId") REFERENCES "default$default"."Bike"(id);


--
-- Name: _BikeToBooking _BikeToBooking_A_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: prisma
--

ALTER TABLE ONLY "default$default"."_BikeToBooking"
    ADD CONSTRAINT "_BikeToBooking_A_fkey" FOREIGN KEY ("A") REFERENCES "default$default"."Bike"(id) ON DELETE CASCADE;


--
-- Name: _BikeToBooking _BikeToBooking_B_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: prisma
--

ALTER TABLE ONLY "default$default"."_BikeToBooking"
    ADD CONSTRAINT "_BikeToBooking_B_fkey" FOREIGN KEY ("B") REFERENCES "default$default"."Booking"(id) ON DELETE CASCADE;


--
-- Name: _BikeToReview _BikeToReview_A_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: prisma
--

ALTER TABLE ONLY "default$default"."_BikeToReview"
    ADD CONSTRAINT "_BikeToReview_A_fkey" FOREIGN KEY ("A") REFERENCES "default$default"."Bike"(id) ON DELETE CASCADE;


--
-- Name: _BikeToReview _BikeToReview_B_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: prisma
--

ALTER TABLE ONLY "default$default"."_BikeToReview"
    ADD CONSTRAINT "_BikeToReview_B_fkey" FOREIGN KEY ("B") REFERENCES "default$default"."Review"(id) ON DELETE CASCADE;


--
-- Name: _BikeToSavedBikesList _BikeToSavedBikesList_A_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: prisma
--

ALTER TABLE ONLY "default$default"."_BikeToSavedBikesList"
    ADD CONSTRAINT "_BikeToSavedBikesList_A_fkey" FOREIGN KEY ("A") REFERENCES "default$default"."Bike"(id) ON DELETE CASCADE;


--
-- Name: _BikeToSavedBikesList _BikeToSavedBikesList_B_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: prisma
--

ALTER TABLE ONLY "default$default"."_BikeToSavedBikesList"
    ADD CONSTRAINT "_BikeToSavedBikesList_B_fkey" FOREIGN KEY ("B") REFERENCES "default$default"."SavedBikesList"(id) ON DELETE CASCADE;


--
-- Name: Migration migrations_projectid_foreign; Type: FK CONSTRAINT; Schema: management; Owner: prisma
--

ALTER TABLE ONLY management."Migration"
    ADD CONSTRAINT migrations_projectid_foreign FOREIGN KEY ("projectId") REFERENCES management."Project"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Debian 10.5-2.pgdg90+1)
-- Dumped by pg_dump version 10.5 (Debian 10.5-2.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: prisma
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

