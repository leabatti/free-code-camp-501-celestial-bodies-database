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
-- Name: exoplanet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.exoplanet (
    exoplanet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    diameter_in_km numeric(6,0),
    distance_in_ly integer,
    orbital_period_in_days integer,
    info text,
    is_habitable boolean,
    star_id integer
);


ALTER TABLE public.exoplanet OWNER TO freecodecamp;

--
-- Name: exoplanet_exoplanet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.exoplanet_exoplanet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exoplanet_exoplanet_id_seq OWNER TO freecodecamp;

--
-- Name: exoplanet_exoplanet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.exoplanet_exoplanet_id_seq OWNED BY public.exoplanet.exoplanet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    diameter_in_ly numeric(6,0),
    number_of_stars_in_bn integer,
    number_of_planetary_systems integer,
    info text,
    has_black_hole boolean
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
    name character varying(60) NOT NULL,
    diameter_in_km numeric(6,0),
    surface_gravity_in_cm_s2 integer,
    escape_velocity_in_m_s integer,
    info text,
    has_atmosphere boolean,
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
    name character varying(60) NOT NULL,
    diameter_in_km numeric(6,0),
    number_of_moons integer,
    orbital_period_in_days integer,
    info text,
    is_habitable boolean,
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
    name character varying(60) NOT NULL,
    diameter_in_km numeric(10,0),
    luminosity_class integer,
    age_in_myr integer,
    info text,
    has_planets boolean,
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
-- Name: exoplanet exoplanet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet ALTER COLUMN exoplanet_id SET DEFAULT nextval('public.exoplanet_exoplanet_id_seq'::regclass);


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
-- Data for Name: exoplanet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.exoplanet VALUES (1, 'Kepler-22b', 60000, 620, 289, 'Earth-like, may have liquid water', true, 6);
INSERT INTO public.exoplanet VALUES (2, 'TRAPPIST-1d', 13280, 40, 4, 'One of seven Earth-size planets', true, 6);
INSERT INTO public.exoplanet VALUES (3, 'HD 209458 b', 150000, 153, 4, 'First exoplanet detected by transit', false, 2);
INSERT INTO public.exoplanet VALUES (4, 'WASP-12b', 228000, 870, 1, 'Extremely hot gas giant', false, 3);
INSERT INTO public.exoplanet VALUES (5, 'Gliese 581 c', 18000, 20, 13, 'Possible conditions for life', true, 4);
INSERT INTO public.exoplanet VALUES (6, '51 Pegasi b', 158000, 50, 4, 'First confirmed exoplanet around sunlike star', false, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 105700, 200, 3200, 'The galaxy that contains our Solar System', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 1000, 5000, 'The nearest large spiral galaxy to Milky Way', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 40, 500, 'Third-largest galaxy in Local Group', false);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 120000, 1000, 2500, 'Home to a supermassive black hole', true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 76000, 100, 3000, 'Famous for its spiral shape', true);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 50000, 800, 4500, 'Distinct due to its bright central bulge', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474, 162, 2380, 'Earth''s only natural satellite', false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 71, 11, 'One of Mars'' small moons', false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 39, 6, 'Small, smooth-surfaced moon', false, 2);
INSERT INTO public.moon VALUES (4, 'Titan', 5150, 135, 2700, 'Largest moon of Saturn', true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 3122, 134, 2025, 'May have a subsurface ocean', false, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268, 144, 2720, 'Largest moon in the Solar System', true, 4);
INSERT INTO public.moon VALUES (7, 'Callisto', 4820, 126, 2410, 'Heavily cratered surface', false, 4);
INSERT INTO public.moon VALUES (8, 'Io', 3642, 183, 2590, 'Active volcanoes', false, 4);
INSERT INTO public.moon VALUES (9, 'Triton', 2706, 94, 1450, 'Neptune''s largest moon', true, 7);
INSERT INTO public.moon VALUES (10, 'Miranda', 471, 46, 560, 'Unique surface features', false, 8);
INSERT INTO public.moon VALUES (11, 'Enceladus', 504, 117, 2200, 'Subsurface ocean, icy plumes', true, 5);
INSERT INTO public.moon VALUES (12, 'Oberon', 1523, 77, 1030, 'Uranus'' second-largest moon', false, 8);
INSERT INTO public.moon VALUES (13, 'Rhea', 1527, 93, 1160, 'Saturn’s second-largest moon', false, 5);
INSERT INTO public.moon VALUES (14, 'Iapetus', 1468, 82, 1120, 'Two-toned surface', false, 5);
INSERT INTO public.moon VALUES (15, 'Dione', 1123, 70, 990, 'Evidence of subsurface ocean', false, 5);
INSERT INTO public.moon VALUES (16, 'Charon', 1212, 30, 609, 'Pluto''s largest moon', false, 12);
INSERT INTO public.moon VALUES (17, 'Nereid', 340, 39, 500, 'Irregular orbit around Neptune', false, 7);
INSERT INTO public.moon VALUES (18, 'Hydra', 51, 14, 140, 'One of Pluto''s outer moons', false, 12);
INSERT INTO public.moon VALUES (19, 'Styx', 16, 9, 80, 'Tiny moon of Pluto', false, 12);
INSERT INTO public.moon VALUES (20, 'Kepler-1625b I', 4385, 109, 2200, 'First potential exomoon discovery', true, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 12742, 1, 365, 'Our home planet, rich in life', true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 6779, 2, 687, 'Known as the Red Planet', false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 12104, 0, 225, 'Similar size to Earth, extreme climate', false, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 139820, 95, 4333, 'Largest planet in the Solar System', false, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 116460, 146, 10759, 'Known for its stunning ring system', false, 1);
INSERT INTO public.planet VALUES (6, 'Mercury', 4879, 0, 88, 'Smallest planet, closest to the Sun', false, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 49244, 16, 60190, 'Farthest planet from the Sun', false, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 50724, 28, 30685, 'Has a unique sideways rotation', false, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-442b', 13700, 0, 112, 'Potentially habitable exoplanet', true, 6);
INSERT INTO public.planet VALUES (10, 'Proxima b', 12100, 0, 11, 'Rocky exoplanet orbiting Proxima Centauri', true, 6);
INSERT INTO public.planet VALUES (11, 'Gliese 581d', 15000, 0, 67, 'Possible conditions for life', true, 5);
INSERT INTO public.planet VALUES (12, 'HD 189733b', 78000, 0, 2, 'Extreme weather with glass rain', false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1392700, 5, 4600, 'Our home star, a yellow dwarf', true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 887560000, 1, 8000, 'A red supergiant, nearing supernova', false, 1);
INSERT INTO public.star VALUES (4, 'Vega', 2663200, 3, 455, 'One of the most luminous stars near Earth', true, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 128300000, 1, 800, 'A blue supergiant, much larger than the Sun', false, 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 214240, 4, 4800, 'The closest known exoplanetary system', true, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 2372400, 2, 300, 'The brightest star in Earth''s night sky', true, 1);


--
-- Name: exoplanet_exoplanet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.exoplanet_exoplanet_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: exoplanet exoplanet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_name_key UNIQUE (name);


--
-- Name: exoplanet exoplanet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_pkey PRIMARY KEY (exoplanet_id);


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
-- Name: exoplanet exoplanet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

