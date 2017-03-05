--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

-- Started on 2017-03-05 17:47:58

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 16396)
-- Name: security1; Type: SCHEMA; Schema: -; Owner: sec1
--

CREATE SCHEMA security1;


ALTER SCHEMA security1 OWNER TO sec1;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = security1, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 195 (class 1259 OID 16466)
-- Name: org_role_names; Type: TABLE; Schema: security1; Owner: sec1
--

CREATE TABLE org_role_names (
    id integer NOT NULL,
    role_name character varying NOT NULL
);


ALTER TABLE org_role_names OWNER TO sec1;

--
-- TOC entry 194 (class 1259 OID 16464)
-- Name: org_role_names_id_seq; Type: SEQUENCE; Schema: security1; Owner: sec1
--

CREATE SEQUENCE org_role_names_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE org_role_names_id_seq OWNER TO sec1;

--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 194
-- Name: org_role_names_id_seq; Type: SEQUENCE OWNED BY; Schema: security1; Owner: sec1
--

ALTER SEQUENCE org_role_names_id_seq OWNED BY org_role_names.id;


--
-- TOC entry 193 (class 1259 OID 16458)
-- Name: org_team; Type: TABLE; Schema: security1; Owner: sec1
--

CREATE TABLE org_team (
    id integer NOT NULL,
    role_id bigint,
    user_id bigint,
    org_id bigint,
    role_name character varying
);


ALTER TABLE org_team OWNER TO sec1;

--
-- TOC entry 192 (class 1259 OID 16456)
-- Name: org_team_id_seq; Type: SEQUENCE; Schema: security1; Owner: sec1
--

CREATE SEQUENCE org_team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE org_team_id_seq OWNER TO sec1;

--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 192
-- Name: org_team_id_seq; Type: SEQUENCE OWNED BY; Schema: security1; Owner: sec1
--

ALTER SEQUENCE org_team_id_seq OWNED BY org_team.id;


--
-- TOC entry 197 (class 1259 OID 16554)
-- Name: organization; Type: TABLE; Schema: security1; Owner: sec1
--

CREATE TABLE organization (
    id integer NOT NULL,
    name character varying NOT NULL,
    parent_id bigint
);


ALTER TABLE organization OWNER TO sec1;

--
-- TOC entry 196 (class 1259 OID 16552)
-- Name: organization_id_seq; Type: SEQUENCE; Schema: security1; Owner: sec1
--

CREATE SEQUENCE organization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE organization_id_seq OWNER TO sec1;

--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 196
-- Name: organization_id_seq; Type: SEQUENCE OWNED BY; Schema: security1; Owner: sec1
--

ALTER SEQUENCE organization_id_seq OWNED BY organization.id;


--
-- TOC entry 188 (class 1259 OID 16411)
-- Name: roles; Type: TABLE; Schema: security1; Owner: sec1
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE roles OWNER TO sec1;

--
-- TOC entry 187 (class 1259 OID 16409)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: security1; Owner: sec1
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO sec1;

--
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 187
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: security1; Owner: sec1
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- TOC entry 191 (class 1259 OID 16424)
-- Name: user_roles; Type: TABLE; Schema: security1; Owner: sec1
--

CREATE TABLE user_roles (
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE user_roles OWNER TO sec1;

--
-- TOC entry 190 (class 1259 OID 16422)
-- Name: user_roles_role_id_seq; Type: SEQUENCE; Schema: security1; Owner: sec1
--

CREATE SEQUENCE user_roles_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_roles_role_id_seq OWNER TO sec1;

--
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 190
-- Name: user_roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: security1; Owner: sec1
--

ALTER SEQUENCE user_roles_role_id_seq OWNED BY user_roles.role_id;


--
-- TOC entry 189 (class 1259 OID 16420)
-- Name: user_roles_user_id_seq; Type: SEQUENCE; Schema: security1; Owner: sec1
--

CREATE SEQUENCE user_roles_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_roles_user_id_seq OWNER TO sec1;

--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 189
-- Name: user_roles_user_id_seq; Type: SEQUENCE OWNED BY; Schema: security1; Owner: sec1
--

ALTER SEQUENCE user_roles_user_id_seq OWNED BY user_roles.user_id;


--
-- TOC entry 186 (class 1259 OID 16399)
-- Name: users; Type: TABLE; Schema: security1; Owner: sec1
--

CREATE TABLE users (
    id integer NOT NULL,
    subject character varying NOT NULL,
    user_name character varying NOT NULL,
    password character varying,
    is_enabled boolean DEFAULT true,
    is_account_non_locked boolean DEFAULT true,
    is_account_non_expired boolean DEFAULT true,
    is_credential_non_expired boolean DEFAULT true,
    sid character varying
);


ALTER TABLE users OWNER TO sec1;

--
-- TOC entry 185 (class 1259 OID 16397)
-- Name: users_id_seq; Type: SEQUENCE; Schema: security1; Owner: sec1
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO sec1;

--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 185
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: security1; Owner: sec1
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2047 (class 2604 OID 16469)
-- Name: org_role_names id; Type: DEFAULT; Schema: security1; Owner: sec1
--

ALTER TABLE ONLY org_role_names ALTER COLUMN id SET DEFAULT nextval('org_role_names_id_seq'::regclass);


--
-- TOC entry 2046 (class 2604 OID 16461)
-- Name: org_team id; Type: DEFAULT; Schema: security1; Owner: sec1
--

ALTER TABLE ONLY org_team ALTER COLUMN id SET DEFAULT nextval('org_team_id_seq'::regclass);


--
-- TOC entry 2048 (class 2604 OID 16557)
-- Name: organization id; Type: DEFAULT; Schema: security1; Owner: sec1
--

ALTER TABLE ONLY organization ALTER COLUMN id SET DEFAULT nextval('organization_id_seq'::regclass);


--
-- TOC entry 2043 (class 2604 OID 16414)
-- Name: roles id; Type: DEFAULT; Schema: security1; Owner: sec1
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- TOC entry 2044 (class 2604 OID 16427)
-- Name: user_roles user_id; Type: DEFAULT; Schema: security1; Owner: sec1
--

ALTER TABLE ONLY user_roles ALTER COLUMN user_id SET DEFAULT nextval('user_roles_user_id_seq'::regclass);


--
-- TOC entry 2045 (class 2604 OID 16428)
-- Name: user_roles role_id; Type: DEFAULT; Schema: security1; Owner: sec1
--

ALTER TABLE ONLY user_roles ALTER COLUMN role_id SET DEFAULT nextval('user_roles_role_id_seq'::regclass);


--
-- TOC entry 2038 (class 2604 OID 16402)
-- Name: users id; Type: DEFAULT; Schema: security1; Owner: sec1
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2190 (class 0 OID 16466)
-- Dependencies: 195
-- Data for Name: org_role_names; Type: TABLE DATA; Schema: security1; Owner: sec1
--

COPY org_role_names (id, role_name) FROM stdin;
\.


--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 194
-- Name: org_role_names_id_seq; Type: SEQUENCE SET; Schema: security1; Owner: sec1
--

SELECT pg_catalog.setval('org_role_names_id_seq', 1, false);


--
-- TOC entry 2188 (class 0 OID 16458)
-- Dependencies: 193
-- Data for Name: org_team; Type: TABLE DATA; Schema: security1; Owner: sec1
--

COPY org_team (id, role_id, user_id, org_id, role_name) FROM stdin;
\.


--
-- TOC entry 2207 (class 0 OID 0)
-- Dependencies: 192
-- Name: org_team_id_seq; Type: SEQUENCE SET; Schema: security1; Owner: sec1
--

SELECT pg_catalog.setval('org_team_id_seq', 1, false);


--
-- TOC entry 2192 (class 0 OID 16554)
-- Dependencies: 197
-- Data for Name: organization; Type: TABLE DATA; Schema: security1; Owner: sec1
--

COPY organization (id, name, parent_id) FROM stdin;
\.


--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 196
-- Name: organization_id_seq; Type: SEQUENCE SET; Schema: security1; Owner: sec1
--

SELECT pg_catalog.setval('organization_id_seq', 1, false);


--
-- TOC entry 2183 (class 0 OID 16411)
-- Dependencies: 188
-- Data for Name: roles; Type: TABLE DATA; Schema: security1; Owner: sec1
--

COPY roles (id, name) FROM stdin;
6	Level5
1	Level0
3	Level2
4	Level3
2	Level1
5	Level4
\.


--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 187
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: security1; Owner: sec1
--

SELECT pg_catalog.setval('roles_id_seq', 6, true);


--
-- TOC entry 2186 (class 0 OID 16424)
-- Dependencies: 191
-- Data for Name: user_roles; Type: TABLE DATA; Schema: security1; Owner: sec1
--

COPY user_roles (user_id, role_id) FROM stdin;
1	1
1	2
1	3
\.


--
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 190
-- Name: user_roles_role_id_seq; Type: SEQUENCE SET; Schema: security1; Owner: sec1
--

SELECT pg_catalog.setval('user_roles_role_id_seq', 3, true);


--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 189
-- Name: user_roles_user_id_seq; Type: SEQUENCE SET; Schema: security1; Owner: sec1
--

SELECT pg_catalog.setval('user_roles_user_id_seq', 1, false);


--
-- TOC entry 2181 (class 0 OID 16399)
-- Dependencies: 186
-- Data for Name: users; Type: TABLE DATA; Schema: security1; Owner: sec1
--

COPY users (id, subject, user_name, password, is_enabled, is_account_non_locked, is_account_non_expired, is_credential_non_expired, sid) FROM stdin;
1	CN=Paul Robert,OU=Software Engineer,O=Programmer Inc.,L=Damascus,ST=MD,C=US,E=bogus.com	"CN=Paul Robert,OU=Software Engineer,O=Programmer Inc.,L=Damascus,ST=MD,C=US,E=bogus.com", OU=Software Engineer, O=Programmer Inc., L=Damascus, ST=MD, C=US, EMAILADDRESS=bogus.com	\N	t	f	f	f	rpaul
\.


--
-- TOC entry 2212 (class 0 OID 0)
-- Dependencies: 185
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: security1; Owner: sec1
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- TOC entry 2058 (class 2606 OID 16474)
-- Name: org_role_names org_role_names_pkey; Type: CONSTRAINT; Schema: security1; Owner: sec1
--

ALTER TABLE ONLY org_role_names
    ADD CONSTRAINT org_role_names_pkey PRIMARY KEY (id);


--
-- TOC entry 2056 (class 2606 OID 16463)
-- Name: org_team org_team_pkey; Type: CONSTRAINT; Schema: security1; Owner: sec1
--

ALTER TABLE ONLY org_team
    ADD CONSTRAINT org_team_pkey PRIMARY KEY (id);


--
-- TOC entry 2060 (class 2606 OID 16562)
-- Name: organization organization_pk; Type: CONSTRAINT; Schema: security1; Owner: sec1
--

ALTER TABLE ONLY organization
    ADD CONSTRAINT organization_pk PRIMARY KEY (id);


--
-- TOC entry 2052 (class 2606 OID 16419)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: security1; Owner: sec1
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2054 (class 2606 OID 16430)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: security1; Owner: sec1
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2050 (class 2606 OID 16490)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: security1; Owner: sec1
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2062 (class 2606 OID 16496)
-- Name: user_roles usr_roles_fk; Type: FK CONSTRAINT; Schema: security1; Owner: sec1
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT usr_roles_fk FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- TOC entry 2061 (class 2606 OID 16491)
-- Name: user_roles usr_usrs_fk; Type: FK CONSTRAINT; Schema: security1; Owner: sec1
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT usr_usrs_fk FOREIGN KEY (user_id) REFERENCES users(id);


-- Completed on 2017-03-05 17:47:59

--
-- PostgreSQL database dump complete
--

