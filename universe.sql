--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30) NOT NULL,
    galaxy_types text,
    constellation character varying(30),
    right_ascension character varying(30)
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
    name character varying(30) NOT NULL,
    orbital_period_days integer,
    planet_id integer,
    discovery_year integer
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
    name character varying(30) NOT NULL,
    has_moon boolean,
    orbit_earth_days numeric,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
-- Name: planets_have_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planets_have_moon (
    planets_have_moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    moon_count integer,
    planet_id integer
);


ALTER TABLE public.planets_have_moon OWNER TO freecodecamp;

--
-- Name: planets_have_moon_planets_have_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_have_moon_planets_have_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_have_moon_planets_have_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planets_have_moon_planets_have_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_have_moon_planets_have_moon_id_seq OWNED BY public.planets_have_moon.planets_have_moon_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_times_of_sun integer,
    light_years_from_earth numeric,
    alive boolean,
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
-- Name: planets_have_moon planets_have_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_have_moon ALTER COLUMN planets_have_moon_id SET DEFAULT nextval('public.planets_have_moon_planets_have_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral', 'Sagittarius(centre)', '17h45m40.03599s');
INSERT INTO public.galaxy VALUES (3, 'Cygnus A', 'elliptical', 'Cygnus', '19h59m28.3566s');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Clouds', 'irregular', 'Dorado/Mensa', '05h23m34s');
INSERT INTO public.galaxy VALUES (5, 'Butterfly', 'unbarred spiral', 'Virgo', '12h36m34.3s');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'lecticular', 'Sculptor', '00h37m41.1s');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'barred spiral', 'Andromeda', '00h42m44.3s');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Metis', 0, 5, NULL);
INSERT INTO public.moon VALUES (2, 'Adrastea', 0, 5, NULL);
INSERT INTO public.moon VALUES (3, 'Amalthea', 0, 5, NULL);
INSERT INTO public.moon VALUES (4, 'Thebe', 1, 5, NULL);
INSERT INTO public.moon VALUES (5, 'Io', 2, 5, NULL);
INSERT INTO public.moon VALUES (6, 'Europa', 4, 5, NULL);
INSERT INTO public.moon VALUES (7, 'Ganymede', 7, 5, NULL);
INSERT INTO public.moon VALUES (8, 'Callisto', 17, 5, NULL);
INSERT INTO public.moon VALUES (9, 'Themisto', 130, 5, NULL);
INSERT INTO public.moon VALUES (10, 'Leda', 241, 5, NULL);
INSERT INTO public.moon VALUES (11, 'Ersa', 249, 5, NULL);
INSERT INTO public.moon VALUES (12, 'Himalia', 251, 5, NULL);
INSERT INTO public.moon VALUES (13, 'Pandia', 252, 5, NULL);
INSERT INTO public.moon VALUES (14, 'Lysithea', 259, 5, NULL);
INSERT INTO public.moon VALUES (15, 'Elara', 260, 5, NULL);
INSERT INTO public.moon VALUES (16, 'Dia', 278, 5, NULL);
INSERT INTO public.moon VALUES (17, 'Carpo', 456, 5, NULL);
INSERT INTO public.moon VALUES (18, 'Valetudo', 528, 5, NULL);
INSERT INTO public.moon VALUES (19, 'Euporie', 551, 5, NULL);
INSERT INTO public.moon VALUES (20, 'Eupheme', 618, 5, NULL);
INSERT INTO public.moon VALUES (21, 'Mneme', 620, 5, NULL);
INSERT INTO public.moon VALUES (22, 'Euanthe', 620, 5, NULL);
INSERT INTO public.moon VALUES (23, 'Harpalyke', 623, 5, NULL);
INSERT INTO public.moon VALUES (24, 'Orthosie', 623, 5, NULL);
INSERT INTO public.moon VALUES (25, 'Helike', 626, 5, NULL);
INSERT INTO public.moon VALUES (26, 'Praxidike', 625, 5, NULL);
INSERT INTO public.moon VALUES (27, 'Thelxinoe', 628, 5, NULL);
INSERT INTO public.moon VALUES (28, 'Thyone', 627, 5, NULL);
INSERT INTO public.moon VALUES (29, 'Ananke', 630, 5, NULL);
INSERT INTO public.moon VALUES (30, 'Iocaste', 632, 5, NULL);
INSERT INTO public.moon VALUES (31, 'Hermippe', 634, 5, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 88, 3);
INSERT INTO public.planet VALUES (2, 'Venus', false, 225, 3);
INSERT INTO public.planet VALUES (3, 'Earth', true, 365, 3);
INSERT INTO public.planet VALUES (4, 'Mars', true, 367, 3);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, 4343.5, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', true, 10767.5, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', true, 30660, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', true, 60225, 3);
INSERT INTO public.planet VALUES (9, 'Pluto', true, 90520, 3);
INSERT INTO public.planet VALUES (10, 'Makemake', false, 111325, 3);
INSERT INTO public.planet VALUES (11, 'Ceres', false, 1682, 3);
INSERT INTO public.planet VALUES (12, 'Haumea', true, 104025, 3);
INSERT INTO public.planet VALUES (13, 'Eris', true, 203305, 3);


--
-- Data for Name: planets_have_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planets_have_moon VALUES (9, 'Earth', 1, 3);
INSERT INTO public.planets_have_moon VALUES (10, 'Mars', 2, 4);
INSERT INTO public.planets_have_moon VALUES (11, 'Jupiter', 95, 5);
INSERT INTO public.planets_have_moon VALUES (12, 'Saturn', 83, 6);
INSERT INTO public.planets_have_moon VALUES (13, 'Uranus', 27, 7);
INSERT INTO public.planets_have_moon VALUES (14, 'Naptune', 14, 8);
INSERT INTO public.planets_have_moon VALUES (15, 'Pluto', 5, 9);
INSERT INTO public.planets_have_moon VALUES (16, 'Haumea', 2, 12);
INSERT INTO public.planets_have_moon VALUES (17, 'Eris', 1, 13);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'UY Scuti', 1700, 5219, false, 1);
INSERT INTO public.star VALUES (2, 'Antares', 883, 550, true, 1);
INSERT INTO public.star VALUES (3, 'Sun', 1, 0.00001581, true, 1);
INSERT INTO public.star VALUES (4, 'Mu Cephei', 1260, 5258, true, 1);
INSERT INTO public.star VALUES (5, 'RW Cephei', 1535, 3500, true, 1);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 887, 643, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 31, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planets_have_moon_planets_have_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_have_moon_planets_have_moon_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: moon discovery_year_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT discovery_year_unique UNIQUE (discovery_year);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_right_ascention_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_right_ascention_key UNIQUE (right_ascension);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: star name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet orbit_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT orbit_unique UNIQUE (orbit_earth_days);


--
-- Name: planets_have_moon planet_name_have_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_have_moon
    ADD CONSTRAINT planet_name_have_moon UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planets_have_moon planets_have_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_have_moon
    ADD CONSTRAINT planets_have_moon_pkey PRIMARY KEY (planets_have_moon_id);


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
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planets_have_moon planets_have_moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_have_moon
    ADD CONSTRAINT planets_have_moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

