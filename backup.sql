--
-- PostgreSQL database cluster dump
--

\restrict rWYexhfBKtKv9bSoRW4dCLfVUoBdbOfq3BMEpSEtLA4loarzsraYBNTyk7ruSqq

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:LI1xmuV+gCjHMiyZ6WIbhw==$rtjteG6jar4/1ojvZqoUFHSCmO9eGI6qeb54sVx0x6Y=:lM7VRPXAlihb2tBRVf2RZTuYyiSFszLaMF/bcrKiuqY=';

--
-- User Configurations
--








\unrestrict rWYexhfBKtKv9bSoRW4dCLfVUoBdbOfq3BMEpSEtLA4loarzsraYBNTyk7ruSqq

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict wvmYrepzbWV7ySw2czQ1J1dRYRbJadvThKE7UL7jlWDNPp43U9IgCMwt0Q5eghd

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict wvmYrepzbWV7ySw2czQ1J1dRYRbJadvThKE7UL7jlWDNPp43U9IgCMwt0Q5eghd

--
-- Database "company" dump
--

--
-- PostgreSQL database dump
--

\restrict QYH8ysPKQq4kOdGWpFldempNeBdBCdvz1RXWFB6gxAS395aQqPLnreQiN3BFm2X

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: company; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE company WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE company OWNER TO postgres;

\unrestrict QYH8ysPKQq4kOdGWpFldempNeBdBCdvz1RXWFB6gxAS395aQqPLnreQiN3BFm2X
\connect company
\restrict QYH8ysPKQq4kOdGWpFldempNeBdBCdvz1RXWFB6gxAS395aQqPLnreQiN3BFm2X

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(100) NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    hire_date date NOT NULL,
    department_id integer
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    project_id integer NOT NULL,
    project_name character varying(100) NOT NULL,
    employee_id integer
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (department_id, department_name) FROM stdin;
1	Human Resources
2	IT
3	Sales
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (employee_id, first_name, last_name, hire_date, department_id) FROM stdin;
1	John	Johnson	2025-09-13	2
2	Johnny	John	2025-09-01	3
3	Johnson	Johns	2025-04-01	1
4	Jane	Doe	2020-12-16	2
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (project_id, project_name, employee_id) FROM stdin;
501	Website Redesign	4
502	New HR System	3
503	Q3 Sales Campaign	2
\.


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (project_id);


--
-- Name: employees fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- Name: projects fkpro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT fkpro FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);


--
-- PostgreSQL database dump complete
--

\unrestrict QYH8ysPKQq4kOdGWpFldempNeBdBCdvz1RXWFB6gxAS395aQqPLnreQiN3BFm2X

--
-- Database "lib" dump
--

--
-- PostgreSQL database dump
--

\restrict RTNCzy0nPKRBeae56a0EwccIl2rIf5GRW2I1VszmKZ6nFU9NwUWKqoneeqFJRT0

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: lib; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE lib WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE lib OWNER TO postgres;

\unrestrict RTNCzy0nPKRBeae56a0EwccIl2rIf5GRW2I1VszmKZ6nFU9NwUWKqoneeqFJRT0
\connect lib
\restrict RTNCzy0nPKRBeae56a0EwccIl2rIf5GRW2I1VszmKZ6nFU9NwUWKqoneeqFJRT0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    id bigint NOT NULL,
    fullname character varying(50)
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.authors_id_seq OWNER TO postgres;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    id bigint NOT NULL,
    name character varying(100),
    author_id integer
);


ALTER TABLE public.books OWNER TO postgres;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_id_seq OWNER TO postgres;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: loans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loans (
    book_id integer,
    member_id integer,
    borrowed boolean,
    returned boolean,
    borrowdate date,
    returndate date
);


ALTER TABLE public.loans OWNER TO postgres;

--
-- Name: members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.members (
    id bigint NOT NULL,
    firstname character varying(50),
    lastname character varying(50),
    birth date
);


ALTER TABLE public.members OWNER TO postgres;

--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_id_seq OWNER TO postgres;

--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (id, fullname) FROM stdin;
1	Cormac McCarthy
2	George RR Martin
3	Fyodor Dostoevsky
4	Leo Tolstoy
5	Brandon Sanderson
6	JRR Tolkien
7	William Shakespeare
8	Agatha Christie
9	Dr. Seuss
10	Stephen King
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (id, name, author_id) FROM stdin;
1	Blood Meridian	1
2	Child of God	1
3	A Storm of Swords	2
4	No Country For Old Men	1
5	Brothers Karamazov	3
6	It	10
7	The Hobbit	6
8	War And Peace	4
9	Murder On The Orient Express	8
10	Hamlet	7
11	Lorax	9
12	Mistborn: The Final Empire	5
13	Carrie	10
14	The Shining	10
15	Anna Karenina	4
16	The Fellowship of The Ring	6
17	Romeo And Juliet	7
18	A Clash of Kings	2
\.


--
-- Data for Name: loans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loans (book_id, member_id, borrowed, returned, borrowdate, returndate) FROM stdin;
1	1	t	f	2025-10-12	\N
2	1	t	t	2025-10-12	2025-11-12
5	10	t	f	2024-07-09	\N
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.members (id, firstname, lastname, birth) FROM stdin;
1	Joe	Schmo	2005-05-24
2	Joey	Blowy	2006-06-06
3	Louie	Screwy	1998-12-01
4	Jacky	Smacky	1987-09-30
5	Jon	Don	1976-04-20
6	Louis	C.K	1967-09-12
7	Ehsan	Behnia	2005-05-24
8	Johnny	Money	1954-04-20
9	Eric	Derrick	2000-01-01
10	Eddard	Stark	1387-04-08
11	Tony	Stark	1970-05-29
\.


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authors_id_seq', 10, true);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_id_seq', 18, true);


--
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.members_id_seq', 11, true);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: books books_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.authors(id);


--
-- Name: loans loans_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- Name: loans loans_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id);


--
-- PostgreSQL database dump complete
--

\unrestrict RTNCzy0nPKRBeae56a0EwccIl2rIf5GRW2I1VszmKZ6nFU9NwUWKqoneeqFJRT0

--
-- Database "mylink" dump
--

--
-- PostgreSQL database dump
--

\restrict O0JFU1fwDXsB2gCzy8QOZv6LOZ5iQQgZMilSMrlgABHCc1tpbqdEWRlhgtkfUdU

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: mylink; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE mylink WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE mylink OWNER TO postgres;

\unrestrict O0JFU1fwDXsB2gCzy8QOZv6LOZ5iQQgZMilSMrlgABHCc1tpbqdEWRlhgtkfUdU
\connect mylink
\restrict O0JFU1fwDXsB2gCzy8QOZv6LOZ5iQQgZMilSMrlgABHCc1tpbqdEWRlhgtkfUdU

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict O0JFU1fwDXsB2gCzy8QOZv6LOZ5iQQgZMilSMrlgABHCc1tpbqdEWRlhgtkfUdU

--
-- Database "p5" dump
--

--
-- PostgreSQL database dump
--

\restrict tDqVGVWvW7DpkydfEEXqG3kwdaqTvdCXGu901B2lJLuWE90Mrk6rutXJiUA9WZT

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: p5; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE p5 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE p5 OWNER TO postgres;

\unrestrict tDqVGVWvW7DpkydfEEXqG3kwdaqTvdCXGu901B2lJLuWE90Mrk6rutXJiUA9WZT
\connect p5
\restrict tDqVGVWvW7DpkydfEEXqG3kwdaqTvdCXGu901B2lJLuWE90Mrk6rutXJiUA9WZT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name text NOT NULL,
    city text NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    customer_id integer,
    product_id integer,
    quantity integer,
    order_date date
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name text NOT NULL,
    category text NOT NULL,
    price numeric(8,2)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers (
    id integer NOT NULL,
    name text NOT NULL,
    city text NOT NULL
);


ALTER TABLE public.suppliers OWNER TO postgres;

--
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suppliers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.suppliers_id_seq OWNER TO postgres;

--
-- Name: suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suppliers_id_seq OWNED BY public.suppliers.id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: suppliers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers ALTER COLUMN id SET DEFAULT nextval('public.suppliers_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, name, city) FROM stdin;
1	Aidar	Almaty
2	Dana	Astana
3	Mira	Almaty
4	Zhan	Shymkent
5	Ruslan	Aktobe
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, customer_id, product_id, quantity, order_date) FROM stdin;
1	1	1	2	2025-10-01
2	1	2	1	2025-10-02
3	3	3	1	2025-10-03
4	3	1	3	2025-10-04
5	2	5	1	2025-10-05
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, category, price) FROM stdin;
1	Mouse	Electronics	25.50
2	Keyboard	Electronics	45.00
3	Monitor	Electronics	120.00
4	Chair	Furniture	80.00
5	Desk	Furniture	150.00
\.


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliers (id, name, city) FROM stdin;
1	TechWorld	Almaty
2	FurniCo	Astana
3	MegaSupply	Atyrau
4	ElectroPlus	Almaty
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 5, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 5, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 5, true);


--
-- Name: suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliers_id_seq', 4, true);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: orders orders_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

\unrestrict tDqVGVWvW7DpkydfEEXqG3kwdaqTvdCXGu901B2lJLuWE90Mrk6rutXJiUA9WZT

--
-- Database "post" dump
--

--
-- PostgreSQL database dump
--

\restrict y27eILB6EsWNFFhYiJUaESsT1fsoNTM6KEJNbrPAl8yH7OThlBJjQFEr4TMTiPy

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: post; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE post WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE post OWNER TO postgres;

\unrestrict y27eILB6EsWNFFhYiJUaESsT1fsoNTM6KEJNbrPAl8yH7OThlBJjQFEr4TMTiPy
\connect post
\restrict y27eILB6EsWNFFhYiJUaESsT1fsoNTM6KEJNbrPAl8yH7OThlBJjQFEr4TMTiPy

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict y27eILB6EsWNFFhYiJUaESsT1fsoNTM6KEJNbrPAl8yH7OThlBJjQFEr4TMTiPy

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict XvPfbMXE1lskhqhZXdOqenQTzdbYRYnunnN6uphr8cd6es6epsRnOwvzuhRaV5i

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict XvPfbMXE1lskhqhZXdOqenQTzdbYRYnunnN6uphr8cd6es6epsRnOwvzuhRaV5i

--
-- Database "shop_db" dump
--

--
-- PostgreSQL database dump
--

\restrict 4zulhfSbv5tytlO3yp0YUm1tU5HECp1pXrxMxC4UeylK7VSwpAPiLFEI485ZhvX

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: shop_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE shop_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE shop_db OWNER TO postgres;

\unrestrict 4zulhfSbv5tytlO3yp0YUm1tU5HECp1pXrxMxC4UeylK7VSwpAPiLFEI485ZhvX
\connect shop_db
\restrict 4zulhfSbv5tytlO3yp0YUm1tU5HECp1pXrxMxC4UeylK7VSwpAPiLFEI485ZhvX

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    caterogy_name character varying(50)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id bigint NOT NULL,
    full_name character varying(100) NOT NULL,
    email character varying(100)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_customer_id_seq OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id bigint NOT NULL,
    name character varying(50) NOT NULL,
    category character varying(50),
    price bigint,
    in_stock integer DEFAULT 0
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, caterogy_name) FROM stdin;
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, full_name, email) FROM stdin;
1	Joe Derrick	joeydoughy@gmail.com
2	Hugh Jazz	hugheyscrewy@mail.com
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, name, category, price, in_stock) FROM stdin;
2	Telephone	Electronics	1500	0
3	Fax Machine	Electronics	500	1
4	Ethernet cable	Electronics	100	1
5	Sketchbook	Art Supplies	20	1
1	Laptop	Electronics	1650	1
\.


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 1, false);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 1, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- PostgreSQL database dump complete
--

\unrestrict 4zulhfSbv5tytlO3yp0YUm1tU5HECp1pXrxMxC4UeylK7VSwpAPiLFEI485ZhvX

--
-- Database "shopdb" dump
--

--
-- PostgreSQL database dump
--

\restrict uups3GqLievrJXHfdkct9ZQeINecTg0EAP0TXmS8UXui7FlsNHinaGn77MVyC6v

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: shopdb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE shopdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE shopdb OWNER TO postgres;

\unrestrict uups3GqLievrJXHfdkct9ZQeINecTg0EAP0TXmS8UXui7FlsNHinaGn77MVyC6v
\connect shopdb
\restrict uups3GqLievrJXHfdkct9ZQeINecTg0EAP0TXmS8UXui7FlsNHinaGn77MVyC6v

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customerid integer NOT NULL,
    firstname character varying(50),
    lastname character varying(50),
    country character varying(50),
    age integer,
    phone character varying(15)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_customerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_customerid_seq OWNER TO postgres;

--
-- Name: customers_customerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customerid_seq OWNED BY public.customers.customerid;


--
-- Name: orderdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderdetails (
    orderdetailid integer NOT NULL,
    orderid integer,
    productid integer,
    quantity integer
);


ALTER TABLE public.orderdetails OWNER TO postgres;

--
-- Name: orderdetails_orderdetailid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderdetails_orderdetailid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderdetails_orderdetailid_seq OWNER TO postgres;

--
-- Name: orderdetails_orderdetailid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderdetails_orderdetailid_seq OWNED BY public.orderdetails.orderdetailid;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    orderid integer NOT NULL,
    customerid integer,
    orderdate date,
    totalamount numeric(10,2)
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_orderid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_orderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_orderid_seq OWNER TO postgres;

--
-- Name: orders_orderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_orderid_seq OWNED BY public.orders.orderid;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    productid integer NOT NULL,
    productname character varying(50),
    category character varying(50),
    price numeric(8,2)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_productid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_productid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_productid_seq OWNER TO postgres;

--
-- Name: products_productid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_productid_seq OWNED BY public.products.productid;


--
-- Name: customers customerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customerid SET DEFAULT nextval('public.customers_customerid_seq'::regclass);


--
-- Name: orderdetails orderdetailid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdetails ALTER COLUMN orderdetailid SET DEFAULT nextval('public.orderdetails_orderdetailid_seq'::regclass);


--
-- Name: orders orderid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN orderid SET DEFAULT nextval('public.orders_orderid_seq'::regclass);


--
-- Name: products productid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN productid SET DEFAULT nextval('public.products_productid_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customerid, firstname, lastname, country, age, phone) FROM stdin;
1	Liam	Smith	USA	23	1111111111
2	Sophia	Miller	USA	21	2222222222
3	Akira	Tanaka	Japan	24	3333333333
4	Carlos	Hernandez	USA	21	4444444444
5	Isabella	Rossi	Italy	22	5555555555
6	Aiko	Suzuki	Japan	25	6666666666
7	\N	\N	\N	\N	\N
\.


--
-- Data for Name: orderdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderdetails (orderdetailid, orderid, productid, quantity) FROM stdin;
1	1	1	1
2	1	2	2
3	2	3	1
4	3	1	1
5	3	6	2
6	4	2	1
7	5	4	1
8	5	5	1
9	6	3	3
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (orderid, customerid, orderdate, totalamount) FROM stdin;
1	1	2025-09-01	250.00
2	2	2025-09-03	180.00
3	3	2025-09-05	350.00
4	1	2025-09-10	120.00
5	4	2025-09-11	80.00
6	5	2025-09-12	400.00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (productid, productname, category, price) FROM stdin;
1	Laptop	Electronics	900.00
2	Mouse	Electronics	25.00
3	Keyboard	Electronics	45.00
4	Chair	Furniture	150.00
5	Desk	Furniture	200.00
6	Headphones	Electronics	80.00
\.


--
-- Name: customers_customerid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customerid_seq', 6, true);


--
-- Name: orderdetails_orderdetailid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderdetails_orderdetailid_seq', 9, true);


--
-- Name: orders_orderid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_orderid_seq', 6, true);


--
-- Name: products_productid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_productid_seq', 6, true);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customerid);


--
-- Name: orderdetails orderdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_pkey PRIMARY KEY (orderdetailid);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);


--
-- Name: orderdetails orderdetails_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid);


--
-- Name: orderdetails orderdetails_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);


--
-- Name: orders orders_customerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customers(customerid);


--
-- PostgreSQL database dump complete
--

\unrestrict uups3GqLievrJXHfdkct9ZQeINecTg0EAP0TXmS8UXui7FlsNHinaGn77MVyC6v

--
-- Database "university" dump
--

--
-- PostgreSQL database dump
--

\restrict NZdVnEii8gmAV1h2a2KDePRsh87RenD3jRCjcqsXuFcl0peifnPIrU4NDQFy7Xa

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: university; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE university WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE university OWNER TO postgres;

\unrestrict NZdVnEii8gmAV1h2a2KDePRsh87RenD3jRCjcqsXuFcl0peifnPIrU4NDQFy7Xa
\connect university
\restrict NZdVnEii8gmAV1h2a2KDePRsh87RenD3jRCjcqsXuFcl0peifnPIrU4NDQFy7Xa

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course_name character varying(100),
    credits integer,
    department character varying(100)
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courses_course_id_seq OWNER TO postgres;

--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- Name: enrollments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollments (
    enrollment_id integer NOT NULL,
    student_id integer,
    course_id integer,
    grade numeric(3,1)
);


ALTER TABLE public.enrollments OWNER TO postgres;

--
-- Name: enrollments_enrollment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enrollments_enrollment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.enrollments_enrollment_id_seq OWNER TO postgres;

--
-- Name: enrollments_enrollment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enrollments_enrollment_id_seq OWNED BY public.enrollments.enrollment_id;


--
-- Name: professors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professors (
    professor_id integer NOT NULL,
    name character varying(100),
    department character varying(100)
);


ALTER TABLE public.professors OWNER TO postgres;

--
-- Name: professors_professor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.professors_professor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.professors_professor_id_seq OWNER TO postgres;

--
-- Name: professors_professor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.professors_professor_id_seq OWNED BY public.professors.professor_id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    name character varying(100),
    major character varying(100),
    enrollment_year integer
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_student_id_seq OWNER TO postgres;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- Name: teaches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teaches (
    teach_id integer NOT NULL,
    professor_id integer,
    course_id integer
);


ALTER TABLE public.teaches OWNER TO postgres;

--
-- Name: teaches_teach_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teaches_teach_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teaches_teach_id_seq OWNER TO postgres;

--
-- Name: teaches_teach_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teaches_teach_id_seq OWNED BY public.teaches.teach_id;


--
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: enrollments enrollment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments ALTER COLUMN enrollment_id SET DEFAULT nextval('public.enrollments_enrollment_id_seq'::regclass);


--
-- Name: professors professor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors ALTER COLUMN professor_id SET DEFAULT nextval('public.professors_professor_id_seq'::regclass);


--
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- Name: teaches teach_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teaches ALTER COLUMN teach_id SET DEFAULT nextval('public.teaches_teach_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (course_id, course_name, credits, department) FROM stdin;
1	Database Systems	3	Computer Science
2	Linear Algebra	4	Mathematics
3	Quantum Mechanics	4	Physics
4	Algorithms	3	Computer Science
5	Statistics	3	Mathematics
\.


--
-- Data for Name: enrollments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enrollments (enrollment_id, student_id, course_id, grade) FROM stdin;
1	1	1	9.0
2	1	4	8.5
3	2	2	7.0
4	2	5	8.0
5	3	3	9.5
6	4	1	6.5
7	4	4	7.5
8	5	2	9.0
\.


--
-- Data for Name: professors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.professors (professor_id, name, department) FROM stdin;
1	Dr. Smith	Computer Science
2	Dr. Johnson	Mathematics
3	Dr. Brown	Physics
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (student_id, name, major, enrollment_year) FROM stdin;
1	Alice	Computer Science	2022
2	Bob	Mathematics	2021
3	Carol	Physics	2023
4	David	Computer Science	2021
5	Eve	Mathematics	2022
\.


--
-- Data for Name: teaches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teaches (teach_id, professor_id, course_id) FROM stdin;
1	1	1
2	1	4
3	2	2
4	2	5
5	3	3
\.


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 5, true);


--
-- Name: enrollments_enrollment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enrollments_enrollment_id_seq', 8, true);


--
-- Name: professors_professor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.professors_professor_id_seq', 3, true);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_student_id_seq', 5, true);


--
-- Name: teaches_teach_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teaches_teach_id_seq', 5, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- Name: enrollments enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (enrollment_id);


--
-- Name: professors professors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors
    ADD CONSTRAINT professors_pkey PRIMARY KEY (professor_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: teaches teaches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teaches
    ADD CONSTRAINT teaches_pkey PRIMARY KEY (teach_id);


--
-- Name: enrollments enrollments_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- Name: enrollments enrollments_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(student_id);


--
-- Name: teaches teaches_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teaches
    ADD CONSTRAINT teaches_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- Name: teaches teaches_professor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teaches
    ADD CONSTRAINT teaches_professor_id_fkey FOREIGN KEY (professor_id) REFERENCES public.professors(professor_id);


--
-- PostgreSQL database dump complete
--

\unrestrict NZdVnEii8gmAV1h2a2KDePRsh87RenD3jRCjcqsXuFcl0peifnPIrU4NDQFy7Xa

--
-- PostgreSQL database cluster dump complete
--

