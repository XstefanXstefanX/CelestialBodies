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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    actively_accreting boolean
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(20),
    stars_number_billions integer,
    distance_from_earth integer
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
    planet_id integer,
    name character varying(30) NOT NULL,
    type text,
    orbital_period_earth_years numeric(4,1),
    diameter integer
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
    type text,
    has_life boolean,
    orbital_period_earth_years numeric(5,2),
    moons integer,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(30) NOT NULL,
    type text,
    constellation character varying(30),
    distance_light_years_from_earth numeric(5,1),
    apparent_magnitude numeric(4,3)
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'SAGITTARIUS A', true);
INSERT INTO public.black_hole VALUES (2, 'M87', true);
INSERT INTO public.black_hole VALUES (3, 'V616 MONOCEROTIS', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'MILKY WAY', 'SPIRAL', 200, 100000);
INSERT INTO public.galaxy VALUES (2, 'ANDROMEDA', 'SPIRAL', 1000000000, 2500000);
INSERT INTO public.galaxy VALUES (3, 'TRIANGULUM', 'SPIRAL', 40, 3000000);
INSERT INTO public.galaxy VALUES (4, 'WHIRLPOOL', 'SPIRAL', 40, 23000000);
INSERT INTO public.galaxy VALUES (5, 'SOMBRERO', 'SPIRAL', 800000000, 29000000);
INSERT INTO public.galaxy VALUES (6, 'CENTAURUS A', 'ELLIPTICAL', 100, 13000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'LUNA', 'Terrestrial', 27.3, 3474);
INSERT INTO public.moon VALUES (2, 4, 'PHOBOS', 'Captured Asteroid', 0.3, 22);
INSERT INTO public.moon VALUES (3, 4, 'DEIMOS', 'Captured Asteroid', 1.3, 12);
INSERT INTO public.moon VALUES (4, 5, 'GANYMEDE', 'Galilean Satellite', 7.2, 5268);
INSERT INTO public.moon VALUES (5, 5, 'CALLISTO', 'Galilean Satellite', 16.7, 4820);
INSERT INTO public.moon VALUES (6, 5, 'EUROPA', 'Galilean Satellite', 3.5, 3121);
INSERT INTO public.moon VALUES (7, 5, 'LO', 'Galilean Satellite', 1.8, 3642);
INSERT INTO public.moon VALUES (8, 6, 'TITAN', 'Regular Satellite', 15.9, 5150);
INSERT INTO public.moon VALUES (9, 6, 'ENCELADUS', 'Regular Satellite', 1.4, 504);
INSERT INTO public.moon VALUES (10, 6, 'MIMAS', 'Regular Satellite', 0.9, 396);
INSERT INTO public.moon VALUES (11, 8, 'TRITON', 'Captured Kuiper Belt', -5.9, 2707);
INSERT INTO public.moon VALUES (12, 8, 'PROTEUS', 'Irregular Satellite', 1.1, 420);
INSERT INTO public.moon VALUES (13, 7, 'MIRANDA', 'Regular Satellite', 1.4, 472);
INSERT INTO public.moon VALUES (14, 7, 'TITANIA', 'Regular Satellite', 8.7, 1578);
INSERT INTO public.moon VALUES (15, 7, 'OBERON', 'Regular Satellite', 13.5, 1523);
INSERT INTO public.moon VALUES (16, 7, 'ARIEL', 'Regular Satellite', 2.5, 1157);
INSERT INTO public.moon VALUES (17, 9, 'CHARON', 'Regular Satellite', 6.4, 1207);
INSERT INTO public.moon VALUES (18, 8, 'NEREID', 'Irregular Satellite', 360.1, 170);
INSERT INTO public.moon VALUES (19, 6, 'PHOEBE', 'Irregular Satellite', 550.5, 213);
INSERT INTO public.moon VALUES (20, 6, 'HYPERION', 'Irregular Satellite', 21.3, 270);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'MERCURY', 'Terrestrial', false, 0.24, 0, 13);
INSERT INTO public.planet VALUES (3, 'EARTH', 'Terestrial', true, 1.00, 1, 13);
INSERT INTO public.planet VALUES (2, 'VENUS', 'Terrestrial', false, 0.62, 0, 13);
INSERT INTO public.planet VALUES (4, 'MARS', 'Terrestrial', false, 1.88, 2, 13);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas GIANT', false, 11.86, 79, 13);
INSERT INTO public.planet VALUES (6, 'SATURN', 'Gas GIANT', false, 29.46, 82, 13);
INSERT INTO public.planet VALUES (7, 'URANUS', 'Ice GIANT', false, 85.01, 27, 13);
INSERT INTO public.planet VALUES (8, 'NEPTUNE', 'Ice GIANT', false, 164.80, 14, 13);
INSERT INTO public.planet VALUES (9, 'PLUTO', 'Dwarf Planet', false, 248.00, 5, 13);
INSERT INTO public.planet VALUES (10, 'PROXIMA CENTAURI B', 'Terrestrial', false, 11.20, 0, 6);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1D', 'Terrestrial', false, 4.05, 0, 8);
INSERT INTO public.planet VALUES (12, 'KEPLER-452B', 'Terrestrial', false, 385.00, 0, 8);
INSERT INTO public.planet VALUES (13, 'HD189733B', 'Gas GIANT', false, 2.22, 0, 8);
INSERT INTO public.planet VALUES (14, 'WASP-76B', 'Gas GIANT', false, 1.81, 0, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'SIRIUS', 'A-TYPE Main Sequence', 'Canis Major', 8.6, -1.460);
INSERT INTO public.star VALUES (2, 1, 'BETELGEUSE', 'Red Supergiant', 'Orion', 642.0, 0.500);
INSERT INTO public.star VALUES (3, 1, 'Vega', 'A-TYPE MAIN Sequence', 'Lyra', 25.0, 0.030);
INSERT INTO public.star VALUES (5, 1, 'ALPHA CENTAURI A', 'G-TYPE MAIN Sequence', 'Centaurus', 4.3, 0.010);
INSERT INTO public.star VALUES (6, 1, 'PROXIMA CENTAURI', 'M-TYPE Red Dward', 'Centauri', 4.2, 1.130);
INSERT INTO public.star VALUES (7, 1, 'POLARIS', 'F-TYPE Yellow SUPERGIANT', 'Ursa Minor', 3.8, 1.970);
INSERT INTO public.star VALUES (8, 1, 'Rigel', 'Blue SUPERGIANT', 'Orion', 1.2, 0.050);
INSERT INTO public.star VALUES (9, 1, 'CANOPUS', 'A-TYPE Fading GIANT', 'Carina', 310.0, 0.720);
INSERT INTO public.star VALUES (10, 1, 'ALPHA CRUCIS', 'B-TYPE Blue GIANT', 'Crux(Southern Cross)', 321.0, 0.760);
INSERT INTO public.star VALUES (11, 1, 'ALTAIR', 'A-TYPE MAIN Sequence', 'Aquila', 16.7, 0.760);
INSERT INTO public.star VALUES (12, 1, 'Arcturus', 'K-TYPE GIANT', 'Bootes', 37.0, 0.040);
INSERT INTO public.star VALUES (4, 1, 'Antares', 'M-TYPE Red SUPERGIANT', 'Scorpius', 550.0, 0.960);
INSERT INTO public.star VALUES (13, 1, 'SUN', 'G-TYPE MAIN Sequence', 'N/A', 8.4, 6.740);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 14, true);


--
-- Name: black_hole black_hole_black_hole_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_black_hole_id_key UNIQUE (black_hole_id);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

