--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.20
-- Dumped by pg_dump version 9.5.20

-- Started on 2020-06-05 23:34:59

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 190 (class 1259 OID 65584)
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    id integer NOT NULL,
    cooperatives_id integer NOT NULL,
    compteutilisateur integer NOT NULL
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 65582)
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_id_seq OWNER TO postgres;

--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 189
-- Name: admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;


--
-- TOC entry 192 (class 1259 OID 65597)
-- Name: admingeneral; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admingeneral (
    id integer NOT NULL
);


ALTER TABLE public.admingeneral OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 65595)
-- Name: admingeneral_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admingeneral_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admingeneral_id_seq OWNER TO postgres;

--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 191
-- Name: admingeneral_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admingeneral_id_seq OWNED BY public.admingeneral.id;


--
-- TOC entry 183 (class 1259 OID 65547)
-- Name: clients_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_seq OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 65549)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer DEFAULT nextval('public.clients_seq'::regclass) NOT NULL,
    adresse_livraison text,
    numero integer,
    civilite character varying(45),
    sexe character varying(45),
    nom character varying(45),
    prenom character varying(45),
    data_naissance character varying(45),
    telephone character varying(45),
    email character varying(45),
    infos_contacts text
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 65686)
-- Name: collecteoeufs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collecteoeufs (
    id integer NOT NULL,
    date_collecte date,
    nombreoeufs integer,
    date_limme_consommation date,
    unite_production_id integer NOT NULL
);


ALTER TABLE public.collecteoeufs OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 65684)
-- Name: collecteoeufs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collecteoeufs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collecteoeufs_id_seq OWNER TO postgres;

--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 201
-- Name: collecteoeufs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collecteoeufs_id_seq OWNED BY public.collecteoeufs.id;


--
-- TOC entry 206 (class 1259 OID 65707)
-- Name: commandes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commandes (
    id integer NOT NULL,
    date_commande date,
    numero character varying(50),
    clients_id integer NOT NULL,
    unite_production_id integer NOT NULL,
    ligne_commandes_id integer NOT NULL
);


ALTER TABLE public.commandes OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 65705)
-- Name: commandes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commandes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commandes_id_seq OWNER TO postgres;

--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 205
-- Name: commandes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commandes_id_seq OWNED BY public.commandes.id;


--
-- TOC entry 194 (class 1259 OID 65605)
-- Name: compteutilisateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compteutilisateur (
    id integer NOT NULL,
    login text,
    password text
);


ALTER TABLE public.compteutilisateur OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 65749)
-- Name: compteutilisateur_has_profilutilisateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compteutilisateur_has_profilutilisateur (
    compteutilisateur_id integer NOT NULL,
    profilutilisateur_id integer NOT NULL
);


ALTER TABLE public.compteutilisateur_has_profilutilisateur OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 65603)
-- Name: compteutilisateur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compteutilisateur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compteutilisateur_id_seq OWNER TO postgres;

--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 193
-- Name: compteutilisateur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compteutilisateur_id_seq OWNED BY public.compteutilisateur.id;


--
-- TOC entry 185 (class 1259 OID 65558)
-- Name: cooperatives_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cooperatives_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cooperatives_seq OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 65560)
-- Name: cooperatives; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cooperatives (
    id integer DEFAULT nextval('public.cooperatives_seq'::regclass) NOT NULL,
    nom character varying(45),
    adresse text,
    telephone character varying(45),
    email character varying(45),
    infos_contacts text
);


ALTER TABLE public.cooperatives OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 65638)
-- Name: especes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.especes (
    id integer NOT NULL,
    code character varying(45),
    nom character varying(45),
    calibre character varying(45),
    couleurs character varying(45),
    productionqot integer
);


ALTER TABLE public.especes OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 65636)
-- Name: especes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.especes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.especes_id_seq OWNER TO postgres;

--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 195
-- Name: especes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.especes_id_seq OWNED BY public.especes.id;


--
-- TOC entry 187 (class 1259 OID 65569)
-- Name: gestionnaire_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gestionnaire_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gestionnaire_seq OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 65571)
-- Name: gestionnaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gestionnaire (
    id integer DEFAULT nextval('public.gestionnaire_seq'::regclass) NOT NULL,
    cooperatives_id integer NOT NULL
);


ALTER TABLE public.gestionnaire OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 65699)
-- Name: ligne_commandes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ligne_commandes (
    id integer NOT NULL,
    numero integer,
    calibre integer,
    quantite integer,
    unite character varying(45)
);


ALTER TABLE public.ligne_commandes OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 65697)
-- Name: ligne_commandes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ligne_commandes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ligne_commandes_id_seq OWNER TO postgres;

--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 203
-- Name: ligne_commandes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ligne_commandes_id_seq OWNED BY public.ligne_commandes.id;


--
-- TOC entry 200 (class 1259 OID 65668)
-- Name: poules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.poules (
    id integer NOT NULL,
    date_naissance date NOT NULL,
    date_debut_production date,
    etat integer,
    unite_production_id integer NOT NULL,
    especes_id integer NOT NULL
);


ALTER TABLE public.poules OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 65666)
-- Name: poules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.poules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.poules_id_seq OWNER TO postgres;

--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 199
-- Name: poules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.poules_id_seq OWNED BY public.poules.id;


--
-- TOC entry 208 (class 1259 OID 65730)
-- Name: previsions_commandes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.previsions_commandes (
    id integer NOT NULL,
    periodicite character varying(45),
    date_reference date,
    oeufs integer,
    unite_production_id integer NOT NULL
);


ALTER TABLE public.previsions_commandes OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 65728)
-- Name: previsions_commandes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.previsions_commandes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.previsions_commandes_id_seq OWNER TO postgres;

--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 207
-- Name: previsions_commandes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.previsions_commandes_id_seq OWNED BY public.previsions_commandes.id;


--
-- TOC entry 181 (class 1259 OID 65536)
-- Name: producteurs_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producteurs_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producteurs_seq OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 65538)
-- Name: producteurs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producteurs (
    id integer DEFAULT nextval('public.producteurs_seq'::regclass) NOT NULL,
    civilite character varying(45),
    sexe character varying(45),
    nom character varying(45),
    prenom character varying(45),
    data_naissance character varying(45),
    telephone character varying(45),
    email character varying(45),
    infos_contacts text
);


ALTER TABLE public.producteurs OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 65743)
-- Name: profilutilisateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profilutilisateur (
    id integer NOT NULL,
    profil character varying(45)
);


ALTER TABLE public.profilutilisateur OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 65741)
-- Name: profilutilisateur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profilutilisateur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profilutilisateur_id_seq OWNER TO postgres;

--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 209
-- Name: profilutilisateur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profilutilisateur_id_seq OWNED BY public.profilutilisateur.id;


--
-- TOC entry 198 (class 1259 OID 65646)
-- Name: unite_production; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unite_production (
    id integer NOT NULL,
    nom character varying NOT NULL,
    adresse character varying,
    telephone character varying,
    email character varying,
    infos_contacts text,
    producteurs_id integer NOT NULL,
    cooperatives_id integer NOT NULL
);


ALTER TABLE public.unite_production OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 65644)
-- Name: unite_production_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unite_production_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unite_production_id_seq OWNER TO postgres;

--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 197
-- Name: unite_production_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unite_production_id_seq OWNED BY public.unite_production.id;


--
-- TOC entry 2078 (class 2604 OID 65587)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);


--
-- TOC entry 2079 (class 2604 OID 65600)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admingeneral ALTER COLUMN id SET DEFAULT nextval('public.admingeneral_id_seq'::regclass);


--
-- TOC entry 2084 (class 2604 OID 65689)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collecteoeufs ALTER COLUMN id SET DEFAULT nextval('public.collecteoeufs_id_seq'::regclass);


--
-- TOC entry 2086 (class 2604 OID 65710)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commandes ALTER COLUMN id SET DEFAULT nextval('public.commandes_id_seq'::regclass);


--
-- TOC entry 2080 (class 2604 OID 65608)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compteutilisateur ALTER COLUMN id SET DEFAULT nextval('public.compteutilisateur_id_seq'::regclass);


--
-- TOC entry 2081 (class 2604 OID 65641)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especes ALTER COLUMN id SET DEFAULT nextval('public.especes_id_seq'::regclass);


--
-- TOC entry 2085 (class 2604 OID 65702)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ligne_commandes ALTER COLUMN id SET DEFAULT nextval('public.ligne_commandes_id_seq'::regclass);


--
-- TOC entry 2083 (class 2604 OID 65671)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poules ALTER COLUMN id SET DEFAULT nextval('public.poules_id_seq'::regclass);


--
-- TOC entry 2087 (class 2604 OID 65733)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.previsions_commandes ALTER COLUMN id SET DEFAULT nextval('public.previsions_commandes_id_seq'::regclass);


--
-- TOC entry 2088 (class 2604 OID 65746)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profilutilisateur ALTER COLUMN id SET DEFAULT nextval('public.profilutilisateur_id_seq'::regclass);


--
-- TOC entry 2082 (class 2604 OID 65649)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unite_production ALTER COLUMN id SET DEFAULT nextval('public.unite_production_id_seq'::regclass);


--
-- TOC entry 2262 (class 0 OID 65584)
-- Dependencies: 190
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (id, cooperatives_id, compteutilisateur) FROM stdin;
2	1	8
3	10	9
4	17	10
5	16	12
\.


--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 189
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_id_seq', 5, true);


--
-- TOC entry 2264 (class 0 OID 65597)
-- Dependencies: 192
-- Data for Name: admingeneral; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admingeneral (id) FROM stdin;
1
\.


--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 191
-- Name: admingeneral_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admingeneral_id_seq', 1, false);


--
-- TOC entry 2256 (class 0 OID 65549)
-- Dependencies: 184
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, adresse_livraison, numero, civilite, sexe, nom, prenom, data_naissance, telephone, email, infos_contacts) FROM stdin;
\.


--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 183
-- Name: clients_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_seq', 1, false);


--
-- TOC entry 2274 (class 0 OID 65686)
-- Dependencies: 202
-- Data for Name: collecteoeufs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collecteoeufs (id, date_collecte, nombreoeufs, date_limme_consommation, unite_production_id) FROM stdin;
\.


--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 201
-- Name: collecteoeufs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collecteoeufs_id_seq', 1, false);


--
-- TOC entry 2278 (class 0 OID 65707)
-- Dependencies: 206
-- Data for Name: commandes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commandes (id, date_commande, numero, clients_id, unite_production_id, ligne_commandes_id) FROM stdin;
\.


--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 205
-- Name: commandes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commandes_id_seq', 1, false);


--
-- TOC entry 2266 (class 0 OID 65605)
-- Dependencies: 194
-- Data for Name: compteutilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compteutilisateur (id, login, password) FROM stdin;
1	ROOT	TOOR
8	Taty	a264e5bc128a9701b0dea99888254458
9	Stephane	c320dc92c374906fbc071bb485150871
10	Zozo	6f6592c196b9bdcee277e49f3ac9c44b
12	Philippe	f7f861681aecb18f4c96fa62eabb43ee
\.


--
-- TOC entry 2283 (class 0 OID 65749)
-- Dependencies: 211
-- Data for Name: compteutilisateur_has_profilutilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compteutilisateur_has_profilutilisateur (compteutilisateur_id, profilutilisateur_id) FROM stdin;
1	1
8	2
9	2
10	2
12	2
\.


--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 193
-- Name: compteutilisateur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compteutilisateur_id_seq', 12, true);


--
-- TOC entry 2258 (class 0 OID 65560)
-- Dependencies: 186
-- Data for Name: cooperatives; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cooperatives (id, nom, adresse, telephone, email, infos_contacts) FROM stdin;
1	La casa	33 bis rue bergere Bacongo	00242 438 24 26	stephanebazebibouta@gmail.com	Indisponible pour le moment
10	Poulage	33 rue mouyondzi	00242 961 44 98	dada@gmail.com	Plus tard
15	Zelande	N7 rue Barthelemy Bantantu Chateau d'eau Brazzaville	+242 05 512 78 75	stphnbamby@gmail.com	Inbox
16	Shebna	N7 rue Barthelemy Bantantu Chateau d'eau Brazzaville	+242 05 512 78 75	stphnbamby@gmail.com	Inbox
17	Ricodiba	N9 rue Barthelemy Diaz Moungali Brazzaville	+242 05 512 78 75	stphnbamby@gmail.com	Inbox
\.


--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 185
-- Name: cooperatives_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cooperatives_seq', 21, true);


--
-- TOC entry 2268 (class 0 OID 65638)
-- Dependencies: 196
-- Data for Name: especes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.especes (id, code, nom, calibre, couleurs, productionqot) FROM stdin;
\.


--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 195
-- Name: especes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.especes_id_seq', 1, false);


--
-- TOC entry 2260 (class 0 OID 65571)
-- Dependencies: 188
-- Data for Name: gestionnaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gestionnaire (id, cooperatives_id) FROM stdin;
\.


--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 187
-- Name: gestionnaire_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gestionnaire_seq', 1, false);


--
-- TOC entry 2276 (class 0 OID 65699)
-- Dependencies: 204
-- Data for Name: ligne_commandes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ligne_commandes (id, numero, calibre, quantite, unite) FROM stdin;
\.


--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 203
-- Name: ligne_commandes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ligne_commandes_id_seq', 1, false);


--
-- TOC entry 2272 (class 0 OID 65668)
-- Dependencies: 200
-- Data for Name: poules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.poules (id, date_naissance, date_debut_production, etat, unite_production_id, especes_id) FROM stdin;
\.


--
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 199
-- Name: poules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.poules_id_seq', 1, false);


--
-- TOC entry 2280 (class 0 OID 65730)
-- Dependencies: 208
-- Data for Name: previsions_commandes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.previsions_commandes (id, periodicite, date_reference, oeufs, unite_production_id) FROM stdin;
\.


--
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 207
-- Name: previsions_commandes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.previsions_commandes_id_seq', 1, false);


--
-- TOC entry 2254 (class 0 OID 65538)
-- Dependencies: 182
-- Data for Name: producteurs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producteurs (id, civilite, sexe, nom, prenom, data_naissance, telephone, email, infos_contacts) FROM stdin;
\.


--
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 181
-- Name: producteurs_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producteurs_seq', 1, false);


--
-- TOC entry 2282 (class 0 OID 65743)
-- Dependencies: 210
-- Data for Name: profilutilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profilutilisateur (id, profil) FROM stdin;
1	Administrateur général
2	Administrateur
3	Gestionnaire
4	Producteur
5	Client
\.


--
-- TOC entry 2317 (class 0 OID 0)
-- Dependencies: 209
-- Name: profilutilisateur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profilutilisateur_id_seq', 1, true);


--
-- TOC entry 2270 (class 0 OID 65646)
-- Dependencies: 198
-- Data for Name: unite_production; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unite_production (id, nom, adresse, telephone, email, infos_contacts, producteurs_id, cooperatives_id) FROM stdin;
\.


--
-- TOC entry 2318 (class 0 OID 0)
-- Dependencies: 197
-- Name: unite_production_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unite_production_id_seq', 1, false);


--
-- TOC entry 2100 (class 2606 OID 65589)
-- Name: admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- TOC entry 2102 (class 2606 OID 65602)
-- Name: admingeneral_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admingeneral
    ADD CONSTRAINT admingeneral_pkey PRIMARY KEY (id);


--
-- TOC entry 2092 (class 2606 OID 65557)
-- Name: clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 2114 (class 2606 OID 65691)
-- Name: collecteoeufs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collecteoeufs
    ADD CONSTRAINT collecteoeufs_pkey PRIMARY KEY (id);


--
-- TOC entry 2118 (class 2606 OID 65712)
-- Name: commandes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT commandes_pkey PRIMARY KEY (id);


--
-- TOC entry 2124 (class 2606 OID 65753)
-- Name: compteutilisateur_has_profilutilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compteutilisateur_has_profilutilisateur
    ADD CONSTRAINT compteutilisateur_has_profilutilisateur_pkey PRIMARY KEY (compteutilisateur_id, profilutilisateur_id);


--
-- TOC entry 2104 (class 2606 OID 65615)
-- Name: compteutilisateur_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compteutilisateur
    ADD CONSTRAINT compteutilisateur_login_key UNIQUE (login);


--
-- TOC entry 2106 (class 2606 OID 65613)
-- Name: compteutilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compteutilisateur
    ADD CONSTRAINT compteutilisateur_pkey PRIMARY KEY (id);


--
-- TOC entry 2094 (class 2606 OID 65568)
-- Name: cooperatives_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cooperatives
    ADD CONSTRAINT cooperatives_pkey PRIMARY KEY (id);


--
-- TOC entry 2108 (class 2606 OID 65643)
-- Name: especes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especes
    ADD CONSTRAINT especes_pkey PRIMARY KEY (id);


--
-- TOC entry 2098 (class 2606 OID 65576)
-- Name: gestionnaire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gestionnaire
    ADD CONSTRAINT gestionnaire_pkey PRIMARY KEY (id);


--
-- TOC entry 2116 (class 2606 OID 65704)
-- Name: ligne_commandes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ligne_commandes
    ADD CONSTRAINT ligne_commandes_pkey PRIMARY KEY (id);


--
-- TOC entry 2112 (class 2606 OID 65673)
-- Name: poules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poules
    ADD CONSTRAINT poules_pkey PRIMARY KEY (id);


--
-- TOC entry 2120 (class 2606 OID 65735)
-- Name: previsions_commandes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.previsions_commandes
    ADD CONSTRAINT previsions_commandes_pkey PRIMARY KEY (id);


--
-- TOC entry 2090 (class 2606 OID 65546)
-- Name: producteurs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producteurs
    ADD CONSTRAINT producteurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2122 (class 2606 OID 65748)
-- Name: profilutilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profilutilisateur
    ADD CONSTRAINT profilutilisateur_pkey PRIMARY KEY (id);


--
-- TOC entry 2096 (class 2606 OID 65765)
-- Name: unicite; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cooperatives
    ADD CONSTRAINT unicite UNIQUE (nom);


--
-- TOC entry 2110 (class 2606 OID 65654)
-- Name: unite_production_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unite_production
    ADD CONSTRAINT unite_production_pkey PRIMARY KEY (id);


--
-- TOC entry 2127 (class 2606 OID 65766)
-- Name: admin_compte_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_compte_fk FOREIGN KEY (compteutilisateur) REFERENCES public.compteutilisateur(id);


--
-- TOC entry 2126 (class 2606 OID 65590)
-- Name: admin_cooperatives_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_cooperatives_id_fkey FOREIGN KEY (cooperatives_id) REFERENCES public.cooperatives(id);


--
-- TOC entry 2132 (class 2606 OID 65692)
-- Name: collecteoeufs_unite_production_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collecteoeufs
    ADD CONSTRAINT collecteoeufs_unite_production_id_fkey FOREIGN KEY (unite_production_id) REFERENCES public.unite_production(id);


--
-- TOC entry 2133 (class 2606 OID 65713)
-- Name: commandes_clients_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT commandes_clients_id_fkey FOREIGN KEY (clients_id) REFERENCES public.clients(id);


--
-- TOC entry 2135 (class 2606 OID 65723)
-- Name: commandes_ligne_commandes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT commandes_ligne_commandes_id_fkey FOREIGN KEY (ligne_commandes_id) REFERENCES public.ligne_commandes(id);


--
-- TOC entry 2134 (class 2606 OID 65718)
-- Name: commandes_unite_production_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT commandes_unite_production_id_fkey FOREIGN KEY (unite_production_id) REFERENCES public.unite_production(id);


--
-- TOC entry 2137 (class 2606 OID 65754)
-- Name: compteutilisateur_has_profilutilisate_compteutilisateur_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compteutilisateur_has_profilutilisateur
    ADD CONSTRAINT compteutilisateur_has_profilutilisate_compteutilisateur_id_fkey FOREIGN KEY (compteutilisateur_id) REFERENCES public.compteutilisateur(id);


--
-- TOC entry 2138 (class 2606 OID 65759)
-- Name: compteutilisateur_has_profilutilisate_profilutilisateur_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compteutilisateur_has_profilutilisateur
    ADD CONSTRAINT compteutilisateur_has_profilutilisate_profilutilisateur_id_fkey FOREIGN KEY (profilutilisateur_id) REFERENCES public.profilutilisateur(id);


--
-- TOC entry 2125 (class 2606 OID 65577)
-- Name: gestionnaire_cooperatives_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gestionnaire
    ADD CONSTRAINT gestionnaire_cooperatives_id_fkey FOREIGN KEY (cooperatives_id) REFERENCES public.cooperatives(id);


--
-- TOC entry 2131 (class 2606 OID 65679)
-- Name: poules_especes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poules
    ADD CONSTRAINT poules_especes_id_fkey FOREIGN KEY (especes_id) REFERENCES public.especes(id);


--
-- TOC entry 2130 (class 2606 OID 65674)
-- Name: poules_unite_production_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poules
    ADD CONSTRAINT poules_unite_production_id_fkey FOREIGN KEY (unite_production_id) REFERENCES public.unite_production(id);


--
-- TOC entry 2136 (class 2606 OID 65736)
-- Name: previsions_commandes_unite_production_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.previsions_commandes
    ADD CONSTRAINT previsions_commandes_unite_production_id_fkey FOREIGN KEY (unite_production_id) REFERENCES public.unite_production(id);


--
-- TOC entry 2129 (class 2606 OID 65660)
-- Name: unite_production_cooperatives_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unite_production
    ADD CONSTRAINT unite_production_cooperatives_id_fkey FOREIGN KEY (cooperatives_id) REFERENCES public.cooperatives(id);


--
-- TOC entry 2128 (class 2606 OID 65655)
-- Name: unite_production_producteurs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unite_production
    ADD CONSTRAINT unite_production_producteurs_id_fkey FOREIGN KEY (producteurs_id) REFERENCES public.producteurs(id);


--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2020-06-05 23:35:00

--
-- PostgreSQL database dump complete
--

