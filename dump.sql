--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-03-02 23:57:16

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16989)
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- TOC entry 214 (class 1259 OID 16988)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 214
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- TOC entry 217 (class 1259 OID 17001)
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- TOC entry 216 (class 1259 OID 17000)
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 216
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- TOC entry 219 (class 1259 OID 17011)
-- Name: url; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.url (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "visitCount" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- TOC entry 218 (class 1259 OID 17010)
-- Name: url_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.url_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 218
-- Name: url_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.url_id_seq OWNED BY public.url.id;


--
-- TOC entry 3183 (class 2604 OID 16992)
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- TOC entry 3185 (class 2604 OID 17004)
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- TOC entry 3187 (class 2604 OID 17014)
-- Name: url id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url ALTER COLUMN id SET DEFAULT nextval('public.url_id_seq'::regclass);


--
-- TOC entry 3340 (class 0 OID 16989)
-- Dependencies: 215
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.customers VALUES (1, 'João', 'joao@driven.com.br', '$2b$10$5bdeIQNjiO4hqv4s8Pc7CersM31NgSby7MEysQBv8cA.H/l8vS3nO', '2023-03-02 18:26:19.820007');


--
-- TOC entry 3342 (class 0 OID 17001)
-- Dependencies: 217
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, 'e51515a1-16a0-463b-9d29-9636a15a5730', '2023-03-02 18:26:39.326709');
INSERT INTO public.sessions VALUES (2, 1, '0c9fcedb-4089-4c43-9133-c6992ca8ca1a', '2023-03-02 20:22:49.934143');


--
-- TOC entry 3344 (class 0 OID 17011)
-- Dependencies: 219
-- Data for Name: url; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.url VALUES (1, 1, 'https://www.twitch.tv/xofaxd', 'DJPAZKrSHeif9Dqxr1zU3', 0, '2023-03-02 18:27:48.091215');
INSERT INTO public.url VALUES (2, 1, 'https://www.twitch.tv/xofaxd', 'gNi_62RGQAvXtYFAItjli', 0, '2023-03-02 18:34:53.930149');
INSERT INTO public.url VALUES (4, 1, 'https://www.twitch.tv/xofaxd', 'KV2fqHGUoadbd9tq2lJWk', 0, '2023-03-02 18:59:57.416972');
INSERT INTO public.url VALUES (6, 1, 'https://www.twitch.tv/xofaxd', 'juFPFdA1rz8DKIRqo8-5Z', 0, '2023-03-02 19:06:03.189751');
INSERT INTO public.url VALUES (7, 1, 'https://www.twitch.tv/xofaxd', '9NevQcUHn9GqCM8tfuKyn', 0, '2023-03-02 19:07:24.273103');
INSERT INTO public.url VALUES (8, 1, 'https://www.twitch.tv/xofaxd', 'IzZEGtHrWlbfX_tTT04Wu', 0, '2023-03-02 19:14:44.394014');
INSERT INTO public.url VALUES (9, 1, 'https://www.twitch.tv/xofaxd', 'XCj3lMgKSay4ODNNRBSnc', 0, '2023-03-02 19:20:13.678997');
INSERT INTO public.url VALUES (11, 1, 'https://www.twitch.tv/xofaxd', '9Y2_St9HSt97JHhesRuiz', 0, '2023-03-02 19:35:11.821354');
INSERT INTO public.url VALUES (12, 1, 'https://www.twitch.tv/xofaxd', 'QS-ZwFK7xelJv3VFDp3Gh', 0, '2023-03-02 19:35:26.298653');
INSERT INTO public.url VALUES (10, 1, 'https://www.twitch.tv/xofaxd', 'UT_ZxKrDbnMkRJ5TkYr9h', 6, '2023-03-02 19:35:04.96802');
INSERT INTO public.url VALUES (3, 1, 'https://www.twitch.tv/xofaxd', 'eoj5Duq5VW657Jnp4BJl-', 9, '2023-03-02 18:59:52.861963');
INSERT INTO public.url VALUES (5, 1, 'https://www.twitch.tv/xofaxd', '8QtxGa60zlBHYrZubT5ca', 39, '2023-03-02 19:05:44.946887');


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 214
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_id_seq', 1, true);


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 216
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 2, true);


--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 218
-- Name: url_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.url_id_seq', 12, true);


--
-- TOC entry 3190 (class 2606 OID 16999)
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- TOC entry 3192 (class 2606 OID 16997)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 3194 (class 2606 OID 17009)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3196 (class 2606 OID 17019)
-- Name: url url_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_pkey PRIMARY KEY (id);


-- Completed on 2023-03-02 23:57:17

--
-- PostgreSQL database dump complete
--

