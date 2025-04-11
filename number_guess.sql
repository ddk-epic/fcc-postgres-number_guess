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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    secret_number integer NOT NULL,
    number_guess integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_user_id_seq OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_user_id_seq OWNED BY public.players.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN user_id SET DEFAULT nextval('public.players_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 12, 708, 709);
INSERT INTO public.games VALUES (2, 12, 578, 579);
INSERT INTO public.games VALUES (3, 13, 372, 373);
INSERT INTO public.games VALUES (4, 13, 493, 494);
INSERT INTO public.games VALUES (5, 12, 55, 58);
INSERT INTO public.games VALUES (6, 12, 51, 53);
INSERT INTO public.games VALUES (7, 12, 652, 653);
INSERT INTO public.games VALUES (8, 14, 267, 268);
INSERT INTO public.games VALUES (9, 14, 745, 746);
INSERT INTO public.games VALUES (10, 15, 774, 775);
INSERT INTO public.games VALUES (11, 15, 967, 968);
INSERT INTO public.games VALUES (12, 14, 563, 566);
INSERT INTO public.games VALUES (13, 14, 186, 188);
INSERT INTO public.games VALUES (14, 14, 794, 795);
INSERT INTO public.games VALUES (15, 9, 773, 3);
INSERT INTO public.games VALUES (16, 16, 866, 867);
INSERT INTO public.games VALUES (17, 16, 146, 147);
INSERT INTO public.games VALUES (18, 17, 240, 241);
INSERT INTO public.games VALUES (19, 17, 113, 114);
INSERT INTO public.games VALUES (20, 16, 506, 509);
INSERT INTO public.games VALUES (21, 16, 530, 532);
INSERT INTO public.games VALUES (22, 16, 892, 893);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'user_1744390197806');
INSERT INTO public.players VALUES (2, 'user_1744390197805');
INSERT INTO public.players VALUES (3, 'user_1744390212225');
INSERT INTO public.players VALUES (4, 'user_1744390212224');
INSERT INTO public.players VALUES (5, 'user_1744390228337');
INSERT INTO public.players VALUES (6, 'user_1744390228336');
INSERT INTO public.players VALUES (7, 'user_1744390337599');
INSERT INTO public.players VALUES (8, 'user_1744390337598');
INSERT INTO public.players VALUES (9, 'ttt');
INSERT INTO public.players VALUES (10, 'user_1744390830452');
INSERT INTO public.players VALUES (11, 'user_1744390830451');
INSERT INTO public.players VALUES (12, 'user_1744390855194');
INSERT INTO public.players VALUES (13, 'user_1744390855193');
INSERT INTO public.players VALUES (14, 'user_1744390889975');
INSERT INTO public.players VALUES (15, 'user_1744390889974');
INSERT INTO public.players VALUES (16, 'user_1744391031988');
INSERT INTO public.players VALUES (17, 'user_1744391031987');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 22, true);


--
-- Name: players_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_user_id_seq', 17, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (user_id);


--
-- Name: players unique_username; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT unique_username UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.players(user_id);


--
-- PostgreSQL database dump complete
--

