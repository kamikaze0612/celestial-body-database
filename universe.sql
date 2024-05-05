--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    constellation character varying(20) NOT NULL,
    size_in_kpc real NOT NULL,
    random integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    discovered integer NOT NULL,
    notes text NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    distance real NOT NULL,
    notes text NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_fact; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_fact (
    planet_fact_id integer NOT NULL,
    planet_id integer,
    is_habitable boolean NOT NULL,
    fact text NOT NULL,
    name character varying(20),
    is_visible boolean
);


ALTER TABLE public.planet_fact OWNER TO freecodecamp;

--
-- Name: planet_fact_fact_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_fact_fact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_fact_fact_id_seq OWNER TO freecodecamp;

--
-- Name: planet_fact_fact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_fact_fact_id_seq OWNED BY public.planet_fact.planet_fact_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    distance integer NOT NULL,
    magnitude numeric(2,1) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_fact planet_fact_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_fact ALTER COLUMN planet_fact_id SET DEFAULT nextval('public.planet_fact_fact_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Andromeda', 46.6, 15);
INSERT INTO public.galaxy VALUES (2, 'Black Eye', 'Coma Berenices', 16.5, 23);
INSERT INTO public.galaxy VALUES (3, 'Comet', 'Sculptor', 0.2, 42);
INSERT INTO public.galaxy VALUES (4, 'Cigar', 'Ursa Major', 12.5, 13);
INSERT INTO public.galaxy VALUES (5, 'Backward', 'Centaurus', 200, 29);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Sculptor', 44.2, 48);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ashleya', 1799, 'Old develop above measure', 1);
INSERT INTO public.moon VALUES (2, 'Jorgea', 1995, 'Their garden discussion response store', 1);
INSERT INTO public.moon VALUES (3, 'Claytona', 1778, 'Local visit office consumer product', 2);
INSERT INTO public.moon VALUES (4, 'Jessicaa', 1949, 'Name win name time spring', 3);
INSERT INTO public.moon VALUES (5, 'Shawna', 1729, 'Discover executive beyond', 3);
INSERT INTO public.moon VALUES (6, 'Christophera', 2019, 'Daughter need call nor example', 4);
INSERT INTO public.moon VALUES (7, 'Georgea', 2018, 'Wife decided suddenly', 4);
INSERT INTO public.moon VALUES (8, 'Carlosa', 2010, 'These team base already', 5);
INSERT INTO public.moon VALUES (9, 'Brandona', 1718, 'Likely sense simple cultural', 5);
INSERT INTO public.moon VALUES (10, 'Jonathana', 1921, 'With blood anyone technology', 6);
INSERT INTO public.moon VALUES (11, 'Keliya', 1815, 'Face knowledge character sure music', 7);
INSERT INTO public.moon VALUES (12, 'Johna', 1660, 'Nice baby job character that', 7);
INSERT INTO public.moon VALUES (13, 'Joshuaa', 1997, 'Cause certain fund realize western', 8);
INSERT INTO public.moon VALUES (14, 'Michellea', 1921, 'Seek up interview those', 8);
INSERT INTO public.moon VALUES (15, 'Jessea', 1680, 'Move campaign on week continue', 9);
INSERT INTO public.moon VALUES (16, 'Wesleya', 1761, 'Energy less Americal allow glass', 9);
INSERT INTO public.moon VALUES (17, 'Jennifera', 1741, 'Two power administration might model', 10);
INSERT INTO public.moon VALUES (18, 'William', 1889, 'Outside loss return but', 11);
INSERT INTO public.moon VALUES (19, 'Jamiea', 1983, 'No one always half', 11);
INSERT INTO public.moon VALUES (20, 'Devina', 1681, 'Serve apply save my church', 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 10, 'Earth is our home', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 227.9, 'Mars is the fourth planet', 1);
INSERT INTO public.planet VALUES (3, 'Saturn', 1434.1, 'Saturn is the sixth planet', 2);
INSERT INTO public.planet VALUES (4, 'Jupiter', 778.5, 'Jupiter is the fifth planet', 2);
INSERT INTO public.planet VALUES (5, 'Venus', 108.2, 'Venus is the seventh planet', 3);
INSERT INTO public.planet VALUES (6, 'Uranus', 2871, 'Uranus is the second plnaet', 3);
INSERT INTO public.planet VALUES (7, 'Mercury', 58.2, 'Mercury is the first planet', 4);
INSERT INTO public.planet VALUES (8, 'Neptune', 4495.1, 'Neptune is the eighth planet', 4);
INSERT INTO public.planet VALUES (9, 'Gliesse-667CC', 22.18, 'Gliesse-667CC is the exoplanet', 5);
INSERT INTO public.planet VALUES (10, 'Kepler-22B', 587.1, 'Kepler-22B is the exoplanet', 5);
INSERT INTO public.planet VALUES (11, 'Kepler-69C', 2707, 'Kepler-69C is confirmed super-Earth planet', 6);
INSERT INTO public.planet VALUES (12, 'Kepler-62F', 1207, 'Kepler-62F is super-Earth exoplanet', 6);


--
-- Data for Name: planet_fact; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_fact VALUES (1, 1, true, 'Earth is home to humankind', 'Hello', true);
INSERT INTO public.planet_fact VALUES (2, 2, false, 'Mars is believed to habitated by aliens', 'Test', true);
INSERT INTO public.planet_fact VALUES (3, 3, false, 'Saturn is enormous planet', 'Yahoo', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 97, 2.1, 1);
INSERT INTO public.star VALUES (2, 'Ceres', 413, 6.7, 2);
INSERT INTO public.star VALUES (3, 'Red Star', 100, 5.4, 3);
INSERT INTO public.star VALUES (4, 'Messier 82', 12, 8.4, 4);
INSERT INTO public.star VALUES (5, 'NGC 4622', 111, 3.5, 5);
INSERT INTO public.star VALUES (6, 'Mass', 120, 4.3, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_fact_fact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_fact_fact_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_fact planet_fact_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_fact
    ADD CONSTRAINT planet_fact_name_key UNIQUE (name);


--
-- Name: planet_fact planet_fact_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_fact
    ADD CONSTRAINT planet_fact_pkey PRIMARY KEY (planet_fact_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_fact planet_fact_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_fact
    ADD CONSTRAINT planet_fact_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

