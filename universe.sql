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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying NOT NULL,
    diameter_km numeric,
    period_years integer,
    is_active boolean,
    distance_from_sun_km numeric,
    discovery_year integer,
    description text,
    star_id integer NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age integer NOT NULL,
    type text NOT NULL,
    has_black_hole boolean NOT NULL,
    size numeric(10,2) NOT NULL
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
    name character varying(50) NOT NULL,
    age integer,
    mass numeric(10,2),
    is_habitable boolean,
    distance_from_planet integer,
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
    name character varying NOT NULL,
    age integer NOT NULL,
    has_atmosphere boolean NOT NULL,
    distance_from_earth integer NOT NULL,
    star_id integer,
    mass numeric(11,2) NOT NULL
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
    name character varying(40) NOT NULL,
    age integer NOT NULL,
    mass numeric(10,2) NOT NULL,
    temperature integer,
    is_main_sequence boolean NOT NULL,
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 11.0, 76, true, 35.1, 1705, 'Famous periodic comet that can be seen from Earth', 1);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 60.0, 2537, false, 317.0, 1995, 'One of the brightest comets of the 20th century', 2);
INSERT INTO public.comet VALUES (3, 'Comet West', 30.0, 254, false, 50.7, 1975, 'One of the brightest comets of the 20th century', 3);
INSERT INTO public.comet VALUES (4, 'Comet ISON', 5.0, 428, true, 7.2, 2012, 'Discovered by Russian astronomers in 2012', 4);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13500, 'Barred Spiral', true, 10000000.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 22000, 'Spiral', false, 20000000.00);
INSERT INTO public.galaxy VALUES (3, 'Pinwheel', 25000, 'Spiral', false, 50000000.00);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 25000, 'Spiral', false, 80000000.00);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 23000, 'Spiral', false, 15000000.00);
INSERT INTO public.galaxy VALUES (6, 'Cigar', 11000, 'Irregular', false, 40000000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (73, 'Luna', 45000, 0.07, NULL, 384400, 3);
INSERT INTO public.moon VALUES (74, 'Phobos', 45000, 0.00, false, 9377, 4);
INSERT INTO public.moon VALUES (75, 'Deimos', 45000, 0.00, false, 23460, 4);
INSERT INTO public.moon VALUES (79, 'Mimas', 45000, 0.00, false, 185520, 10);
INSERT INTO public.moon VALUES (80, 'Enceladus', 45000, 0.00, NULL, 238040, 10);
INSERT INTO public.moon VALUES (81, 'Titan', 45000, 0.00, NULL, 1221870, 10);
INSERT INTO public.moon VALUES (82, 'Ariel', 45000, 0.00, false, 190900, 11);
INSERT INTO public.moon VALUES (83, 'Umbriel', 45000, 0.00, false, 266000, 11);
INSERT INTO public.moon VALUES (84, 'Titania', 45000, 0.00, NULL, 435910, 11);
INSERT INTO public.moon VALUES (85, 'Triton', 45000, 0.03, NULL, 354759, 8);
INSERT INTO public.moon VALUES (86, 'Nereid', 45000, 0.00, false, 5513800, 8);
INSERT INTO public.moon VALUES (87, 'Charon', 45000, 0.00, false, 5513800, 8);
INSERT INTO public.moon VALUES (88, 'Styx', NULL, NULL, false, 42560, 9);
INSERT INTO public.moon VALUES (89, 'Nix', NULL, NULL, NULL, 48670, 9);
INSERT INTO public.moon VALUES (90, 'Kerberos', NULL, NULL, NULL, 59160, 9);
INSERT INTO public.moon VALUES (91, 'Hydra', NULL, NULL, NULL, 64740, 9);
INSERT INTO public.moon VALUES (92, 'Ananke', NULL, NULL, false, 21200, 12);
INSERT INTO public.moon VALUES (93, 'Carme', NULL, NULL, false, 23400, 1);
INSERT INTO public.moon VALUES (94, 'Pasiphae', NULL, NULL, false, 23500, 3);
INSERT INTO public.moon VALUES (95, 'Sinope', NULL, NULL, false, 23700, 5);
INSERT INTO public.moon VALUES (96, 'Himalia', NULL, NULL, NULL, 1980000, 7);
INSERT INTO public.moon VALUES (97, 'Lysithea', NULL, NULL, false, 11720000, 12);
INSERT INTO public.moon VALUES (98, 'Elara', NULL, NULL, NULL, 11740000, 12);
INSERT INTO public.moon VALUES (99, 'Dia', NULL, NULL, false, 12571000, 12);
INSERT INTO public.moon VALUES (100, 'Europa', NULL, NULL, NULL, 671100, 8);
INSERT INTO public.moon VALUES (101, 'Ganymede', NULL, NULL, NULL, 1070412, 4);
INSERT INTO public.moon VALUES (102, 'Callisto', NULL, NULL, NULL, 1882709, 5);
INSERT INTO public.moon VALUES (103, 'Themisto', NULL, NULL, false, 7428300, 4);
INSERT INTO public.moon VALUES (104, 'Carpo', NULL, NULL, false, 17182000, 6);
INSERT INTO public.moon VALUES (105, 'Ersa', NULL, NULL, NULL, 9712000, 12);
INSERT INTO public.moon VALUES (106, 'S/2003 J 23', NULL, NULL, NULL, 19820000, 2);
INSERT INTO public.moon VALUES (107, 'S/2010 J 1', NULL, NULL, NULL, 20470000, 3);
INSERT INTO public.moon VALUES (108, 'S/2017 J 1', NULL, NULL, NULL, 23410000, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 450000, false, 58, 1, 0.33);
INSERT INTO public.planet VALUES (2, 'Venus', 4500000, true, 108, 1, 4.87);
INSERT INTO public.planet VALUES (3, 'Earth', 450000, true, 150, 1, 5.97);
INSERT INTO public.planet VALUES (4, 'Mars', 450000, false, 228, 1, 0.64);
INSERT INTO public.planet VALUES (5, 'Jupiter', 450000, true, 778, 1, 1898.00);
INSERT INTO public.planet VALUES (6, 'Saturn', 450000, true, 1433, 1, 568.00);
INSERT INTO public.planet VALUES (7, 'Uranus', 4500000, true, 2872, 1, 86.80);
INSERT INTO public.planet VALUES (8, 'Neptune', 4500000, true, 4495, 1, 102.00);
INSERT INTO public.planet VALUES (9, 'Kepler-438b', 1500000, true, 64000000, 2, 0.12);
INSERT INTO public.planet VALUES (10, 'Kepler-442b', 2200000, true, 113000000, 2, 2.34);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 500000, false, 6400000, 5, 1.30);
INSERT INTO public.planet VALUES (12, 'Trappist-1d', 200000, true, 40, 6, 0.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 460000000, 1.99, 5778, true, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 60000000, 1.10, 5790, true, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 60000000, 0.91, 5260, true, 1);
INSERT INTO public.star VALUES (4, 'Barnard''s Star', 10000000, 0.14, 3134, false, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 50000000, 0.12, 3042, false, 1);
INSERT INTO public.star VALUES (6, 'Wolf 359', 700000000, 0.09, 2800, false, 1);
INSERT INTO public.star VALUES (7, 'Betelgeuse', 8500000, 17.80, 3600, false, 1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 108, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: comet comet_star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

