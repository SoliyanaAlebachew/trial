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
    name character varying(100) NOT NULL,
    galaxy_type text NOT NULL,
    age_in_billions numeric(4,1) NOT NULL,
    num_stars integer NOT NULL,
    distance_light_years integer NOT NULL,
    is_spiral boolean NOT NULL,
    has_black_hole boolean NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    composition text NOT NULL,
    radius_km integer NOT NULL,
    orbital_period_days integer NOT NULL,
    mass numeric(6,2) NOT NULL,
    is_spherical boolean NOT NULL,
    has_atmosphere boolean NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type text NOT NULL,
    diameter_km integer NOT NULL,
    num_moons integer NOT NULL,
    orbit_radius_km numeric(12,0) NOT NULL,
    has_life boolean NOT NULL,
    is_gas_giant boolean NOT NULL
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
-- Name: space_agency; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_agency (
    space_agency_id integer NOT NULL,
    name character varying(100) NOT NULL,
    country text NOT NULL,
    established_year integer NOT NULL,
    missions_launched integer NOT NULL,
    budget_billion numeric(5,2) NOT NULL,
    is_public boolean NOT NULL,
    has_military_use boolean NOT NULL
);


ALTER TABLE public.space_agency OWNER TO freecodecamp;

--
-- Name: space_agency_agency_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_agency_agency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_agency_agency_id_seq OWNER TO freecodecamp;

--
-- Name: space_agency_agency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_agency_agency_id_seq OWNED BY public.space_agency.space_agency_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type text NOT NULL,
    mass_in_solar numeric(5,2) NOT NULL,
    temperature_kelvin integer NOT NULL,
    brightness_rank integer NOT NULL,
    is_visible boolean NOT NULL,
    has_planets boolean NOT NULL
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
-- Name: space_agency space_agency_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_agency ALTER COLUMN space_agency_id SET DEFAULT nextval('public.space_agency_agency_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 14.0, 100000000, 0, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10.0, 200000000, 2500000, true, true);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Elliptical', 13.0, 150000000, 53000000, false, true);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'Spiral', 12.0, 50000000, 3000000, true, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 9.0, 80000000, 23000000, true, true);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 11.0, 60000000, 29000000, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 'Rocky', 1737, 27, 7.00, true, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 'Rocky', 11, 1, 1.00, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'Rocky', 6, 1, 1.00, false, false);
INSERT INTO public.moon VALUES (4, 'Io', 3, 'Volcanic Rock', 1821, 2, 9.00, true, true);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 'Ice', 1560, 4, 5.00, true, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 'Ice/Rock', 2634, 7, 15.00, true, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 'Ice/Rock', 2410, 17, 11.00, true, true);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 'Ice', 2575, 16, 13.00, true, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, 'Ice', 252, 1, 1.00, true, true);
INSERT INTO public.moon VALUES (10, 'Mimas', 4, 'Ice', 198, 1, 1.00, true, false);
INSERT INTO public.moon VALUES (11, 'Tethys', 4, 'Ice', 531, 2, 1.00, true, false);
INSERT INTO public.moon VALUES (12, 'Dione', 4, 'Ice', 561, 3, 1.00, true, true);
INSERT INTO public.moon VALUES (13, 'Rhea', 4, 'Ice', 764, 5, 2.00, true, false);
INSERT INTO public.moon VALUES (14, 'Iapetus', 4, 'Ice', 734, 79, 2.00, true, false);
INSERT INTO public.moon VALUES (15, 'Vega-1-A', 10, 'Rocky', 400, 3, 1.00, true, false);
INSERT INTO public.moon VALUES (16, 'Vega-1-B', 10, 'Rocky', 350, 3, 1.00, true, false);
INSERT INTO public.moon VALUES (17, 'Rigel-1-A', 8, 'Rocky', 500, 2, 1.00, true, false);
INSERT INTO public.moon VALUES (18, 'Rigel-1-B', 8, 'Rocky', 550, 3, 1.00, true, false);
INSERT INTO public.moon VALUES (19, 'Kepler-Moon', 6, 'Ice', 600, 2, 1.00, true, false);
INSERT INTO public.moon VALUES (20, 'Proxima-Moon', 7, 'Rocky', 300, 1, 1.00, true, false);
INSERT INTO public.moon VALUES (21, 'Betel-Moon', 12, 'Gas', 800, 3, 2.00, true, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 12742, 1, 150000000, true, false);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 6779, 2, 230000000, false, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas Giant', 139820, 79, 780000000, false, true);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Gas Giant', 116460, 82, 1400000000, false, true);
INSERT INTO public.planet VALUES (5, 'Venus', 1, 'Terrestrial', 12104, 0, 108000000, false, false);
INSERT INTO public.planet VALUES (6, 'Proxima b', 6, 'Terrestrial', 11400, 0, 8000000, false, false);
INSERT INTO public.planet VALUES (7, 'Kepler-186f', 6, 'Terrestrial', 13000, 0, 56000000, false, false);
INSERT INTO public.planet VALUES (8, 'Rigel-1', 5, 'Terrestrial', 15000, 3, 250000000, false, false);
INSERT INTO public.planet VALUES (9, 'Rigel-2', 5, 'Gas Giant', 18000, 1, 450000000, false, true);
INSERT INTO public.planet VALUES (10, 'Vega-1', 4, 'Terrestrial', 9000, 2, 300000000, false, false);
INSERT INTO public.planet VALUES (11, 'Vega-2', 4, 'Terrestrial', 11000, 0, 400000000, false, false);
INSERT INTO public.planet VALUES (12, 'Betelgeuse-1', 3, 'Gas Giant', 130000, 4, 600000000, false, true);


--
-- Data for Name: space_agency; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_agency VALUES (1, 'NASA', 'USA', 1958, 200, 25.00, true, true);
INSERT INTO public.space_agency VALUES (2, 'ESA', 'Europe', 1975, 130, 7.00, true, false);
INSERT INTO public.space_agency VALUES (3, 'SpaceX', 'USA', 2002, 95, 5.00, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 1.00, 5778, 1, true, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type', 2.00, 9940, 2, true, false);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red Supergiant', 12.00, 3500, 7, true, true);
INSERT INTO public.star VALUES (4, 'Vega', 2, 'A-type', 2.00, 9600, 5, true, false);
INSERT INTO public.star VALUES (5, 'Rigel', 3, 'Blue Supergiant', 21.00, 11000, 3, true, true);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 'M-type', 0.00, 3042, 10, false, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_agency_agency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_agency_agency_id_seq', 3, true);


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
-- Name: space_agency space_agency_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_agency
    ADD CONSTRAINT space_agency_name_key UNIQUE (name);


--
-- Name: space_agency space_agency_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_agency
    ADD CONSTRAINT space_agency_pkey PRIMARY KEY (space_agency_id);


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

