--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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
-- Name: OdemeSekli; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OdemeSekli" (
    "odemeSekliId" integer NOT NULL,
    "odemeAd" character varying(20) NOT NULL
);


ALTER TABLE public."OdemeSekli" OWNER TO postgres;

--
-- Name: OdemeSekli_odemeSekliId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."OdemeSekli" ALTER COLUMN "odemeSekliId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."OdemeSekli_odemeSekliId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bolge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bolge (
    "bolgeId" integer NOT NULL,
    "bolgeAdi" character varying(40)
);


ALTER TABLE public.bolge OWNER TO postgres;

--
-- Name: bolge_bolgeId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.bolge ALTER COLUMN "bolgeId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."bolge_bolgeId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: eskiMusteri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."eskiMusteri" (
    "emusteriId" integer NOT NULL,
    ad character varying(20) NOT NULL,
    soyad character varying(20) NOT NULL,
    adres character varying(40) NOT NULL,
    il character varying(20) NOT NULL,
    ilce character varying(20) NOT NULL
);


ALTER TABLE public."eskiMusteri" OWNER TO postgres;

--
-- Name: eskiMusteri_emusteriId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."eskiMusteri" ALTER COLUMN "emusteriId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."eskiMusteri_emusteriId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: fatura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fatura (
    "faturaId" integer NOT NULL,
    "faturaTarihi" date NOT NULL,
    "toplamTutar" integer NOT NULL
);


ALTER TABLE public.fatura OWNER TO postgres;

--
-- Name: fatura_faturaId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.fatura ALTER COLUMN "faturaId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."fatura_faturaId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: il; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.il (
    "ilId" integer NOT NULL,
    "ilAdi" character varying(20)
);


ALTER TABLE public.il OWNER TO postgres;

--
-- Name: il_ilId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.il ALTER COLUMN "ilId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."il_ilId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ilce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ilce (
    "ilceId" integer NOT NULL,
    "ilceAdi" character varying NOT NULL,
    il integer NOT NULL
);


ALTER TABLE public.ilce OWNER TO postgres;

--
-- Name: ilce_ilceId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ilce ALTER COLUMN "ilceId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ilce_ilceId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: kasiyer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kasiyer (
    "kasiyerId" integer NOT NULL,
    ad character varying(20),
    soyad character varying(20),
    il integer NOT NULL,
    ilce integer NOT NULL,
    bolge integer NOT NULL
);


ALTER TABLE public.kasiyer OWNER TO postgres;

--
-- Name: kasiyer_kasiyerId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.kasiyer ALTER COLUMN "kasiyerId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."kasiyer_kasiyerId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategori (
    "kategoriId" integer NOT NULL,
    kategori character varying(20) NOT NULL
);


ALTER TABLE public.kategori OWNER TO postgres;

--
-- Name: kategori_kategoriId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.kategori ALTER COLUMN "kategoriId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."kategori_kategoriId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: musteriler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.musteriler (
    "musteriId" integer NOT NULL,
    ad character varying(20),
    soyad character varying(20),
    il integer NOT NULL,
    ilce integer NOT NULL,
    bolge integer NOT NULL,
    adres character varying(40) NOT NULL,
    mail character varying(40) NOT NULL
);


ALTER TABLE public.musteriler OWNER TO postgres;

--
-- Name: musteriler_musteriId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.musteriler ALTER COLUMN "musteriId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."musteriler_musteriId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: satis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.satis (
    "satisId" integer NOT NULL,
    "toplamTutar" integer NOT NULL,
    musteri integer NOT NULL,
    "faturaNo" integer NOT NULL,
    kasiyer integer NOT NULL,
    "satisTarihi" date NOT NULL,
    "odemeSekli" integer NOT NULL
);


ALTER TABLE public.satis OWNER TO postgres;

--
-- Name: satis_satisId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.satis ALTER COLUMN "satisId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."satis_satisId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: sepet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sepet (
    "sepetId" integer NOT NULL,
    "urunAdi" integer NOT NULL,
    kasiyer integer NOT NULL,
    musteri integer NOT NULL,
    "toplamTutar" integer NOT NULL
);


ALTER TABLE public.sepet OWNER TO postgres;

--
-- Name: sepet_sepetId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.sepet ALTER COLUMN "sepetId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."sepet_sepetId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: stok; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stok (
    "stokId" integer NOT NULL,
    urun integer NOT NULL,
    adet integer NOT NULL
);


ALTER TABLE public.stok OWNER TO postgres;

--
-- Name: stok_stokId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.stok ALTER COLUMN "stokId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."stok_stokId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tedarikci; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tedarikci (
    "tedarikciId" integer NOT NULL,
    "firmaAdi" character varying(50) NOT NULL,
    telefon character varying(11) NOT NULL
);


ALTER TABLE public.tedarikci OWNER TO postgres;

--
-- Name: tedarikci_tedarikciId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tedarikci ALTER COLUMN "tedarikciId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."tedarikci_tedarikciId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: urun; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.urun (
    "urunId" integer NOT NULL,
    "urunAdi" character varying(50) NOT NULL,
    kategori integer NOT NULL,
    yayinevi integer NOT NULL,
    tedarikci integer NOT NULL,
    "birimFiyat" integer NOT NULL
);


ALTER TABLE public.urun OWNER TO postgres;

--
-- Name: urun_urunId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.urun ALTER COLUMN "urunId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."urun_urunId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: yayinevi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yayinevi (
    "yayineviId" integer NOT NULL,
    kategori integer NOT NULL,
    "yayineviAdi" character varying(50) NOT NULL
);


ALTER TABLE public.yayinevi OWNER TO postgres;

--
-- Name: yayinevi_yayineviId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.yayinevi ALTER COLUMN "yayineviId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."yayinevi_yayineviId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: OdemeSekli; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: bolge; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bolge OVERRIDING SYSTEM VALUE VALUES
	(1, 'Marmara'),
	(2, 'Karadeniz'),
	(4, 'Ege'),
	(5, 'İç Anadolu'),
	(6, 'Akdeniz'),
	(7, 'Doğu Anadolu'),
	(8, 'Güneydoğu Anadolu');


--
-- Data for Name: eskiMusteri; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: fatura; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: il; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.il OVERRIDING SYSTEM VALUE VALUES
	(1, 'Edirne'),
	(2, 'Kırklareli'),
	(3, 'Tekirdağ'),
	(4, 'İstanbul'),
	(5, 'Kocaeli'),
	(6, 'Sakarya'),
	(7, 'Yalova'),
	(8, 'Bursa'),
	(9, 'Bilecik'),
	(10, 'Balıkesir'),
	(11, 'Çanakkale');


--
-- Data for Name: ilce; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ilce OVERRIDING SYSTEM VALUE VALUES
	(1, 'Keşan', 1),
	(2, 'Demirköy', 2),
	(3, 'Çorlu', 3),
	(4, 'Maltepe', 4),
	(5, 'İzmit', 5),
	(6, 'Serdivan', 6),
	(7, 'Altınova', 7),
	(8, 'Nilüfer', 8),
	(9, 'Bozüyük', 9),
	(10, 'Bandırma', 10),
	(11, 'Biga', 11);


--
-- Data for Name: kasiyer; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kategori OVERRIDING SYSTEM VALUE VALUES
	(1, 'Bilim Kurgu');


--
-- Data for Name: musteriler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.musteriler OVERRIDING SYSTEM VALUE VALUES
	(1, 'Ali', 'Selim', 1, 1, 1, 'Karşıyaka Mh.', 'aliselim@gmail.com'),
	(6, 'Zekeriya', 'Öz', 3, 3, 1, 'Mithatpaşa Mh.', 'Zoz123@outlook.com'),
	(2, 'Tankurt', 'Manas', 2, 2, 1, 'Paşa Mh.', 'tmanas@hotmail.com'),
	(7, 'Akif', 'Çavuş', 4, 4, 1, 'Menekşe Mh.', 'akifcvs@gmail.com'),
	(8, 'Aytuncan', 'ÇETIN', 8, 8, 1, 'AVP Mh.', 'aytuncan.cetin@ogr.sakarya.edu.tr'),
	(9, 'Mustafa', 'Baydemir', 5, 5, 1, 'NizamettinPaşa Mh.', 'mustafabydmr@gmail.com'),
	(10, 'Mustafa', 'Köslü', 3, 3, 1, 'Nergis Mh.', 'koslu34@gmail.com'),
	(11, 'a', 'a', 1, 1, 1, 'bilinmeyen', 'aaaa@gmail.com');


--
-- Data for Name: satis; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: sepet; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: stok; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tedarikci; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: urun; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: yayinevi; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: OdemeSekli_odemeSekliId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OdemeSekli_odemeSekliId_seq"', 1, false);


--
-- Name: bolge_bolgeId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."bolge_bolgeId_seq"', 8, true);


--
-- Name: eskiMusteri_emusteriId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."eskiMusteri_emusteriId_seq"', 1, false);


--
-- Name: fatura_faturaId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."fatura_faturaId_seq"', 1, false);


--
-- Name: il_ilId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."il_ilId_seq"', 11, true);


--
-- Name: ilce_ilceId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ilce_ilceId_seq"', 11, true);


--
-- Name: kasiyer_kasiyerId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."kasiyer_kasiyerId_seq"', 1, false);


--
-- Name: kategori_kategoriId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."kategori_kategoriId_seq"', 1, true);


--
-- Name: musteriler_musteriId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."musteriler_musteriId_seq"', 11, true);


--
-- Name: satis_satisId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."satis_satisId_seq"', 1, false);


--
-- Name: sepet_sepetId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."sepet_sepetId_seq"', 1, false);


--
-- Name: stok_stokId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."stok_stokId_seq"', 1, false);


--
-- Name: tedarikci_tedarikciId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tedarikci_tedarikciId_seq"', 1, false);


--
-- Name: urun_urunId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."urun_urunId_seq"', 1, false);


--
-- Name: yayinevi_yayineviId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."yayinevi_yayineviId_seq"', 1, false);


--
-- Name: il il_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.il
    ADD CONSTRAINT il_pkey PRIMARY KEY ("ilId");


--
-- Name: kasiyer kasiyer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kasiyer
    ADD CONSTRAINT kasiyer_pkey PRIMARY KEY ("kasiyerId");


--
-- Name: kategori kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT kategori_pkey PRIMARY KEY ("kategoriId");


--
-- Name: musteriler musteriler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteriler
    ADD CONSTRAINT musteriler_pkey PRIMARY KEY ("musteriId");


--
-- Name: tedarikci tedarikci_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tedarikci
    ADD CONSTRAINT tedarikci_pkey PRIMARY KEY ("tedarikciId");


--
-- Name: OdemeSekli unique_OdemeTuru_odemeTuruId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OdemeSekli"
    ADD CONSTRAINT "unique_OdemeTuru_odemeTuruId" PRIMARY KEY ("odemeSekliId");


--
-- Name: bolge unique_bolge_bolgeId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bolge
    ADD CONSTRAINT "unique_bolge_bolgeId" PRIMARY KEY ("bolgeId");


--
-- Name: eskiMusteri unique_eskiMusteri_emusteriId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."eskiMusteri"
    ADD CONSTRAINT "unique_eskiMusteri_emusteriId" PRIMARY KEY ("emusteriId");


--
-- Name: fatura unique_fatura_faturaId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fatura
    ADD CONSTRAINT "unique_fatura_faturaId" PRIMARY KEY ("faturaId");


--
-- Name: il unique_il_ilId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.il
    ADD CONSTRAINT "unique_il_ilId" UNIQUE ("ilId");


--
-- Name: ilce unique_ilce_ilceId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilce
    ADD CONSTRAINT "unique_ilce_ilceId" PRIMARY KEY ("ilceId");


--
-- Name: satis unique_satis_satisId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satis
    ADD CONSTRAINT "unique_satis_satisId" PRIMARY KEY ("satisId");


--
-- Name: sepet unique_sepet_sepetId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sepet
    ADD CONSTRAINT "unique_sepet_sepetId" PRIMARY KEY ("sepetId");


--
-- Name: stok unique_stok_stokId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stok
    ADD CONSTRAINT "unique_stok_stokId" PRIMARY KEY ("stokId");


--
-- Name: musteriler unique_table1_musteriId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteriler
    ADD CONSTRAINT "unique_table1_musteriId" UNIQUE ("musteriId");


--
-- Name: urun unique_urun_urunId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urun
    ADD CONSTRAINT "unique_urun_urunId" UNIQUE ("urunId");


--
-- Name: urun urun_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urun
    ADD CONSTRAINT urun_pkey PRIMARY KEY ("urunId");


--
-- Name: yayinevi yayinevi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yayinevi
    ADD CONSTRAINT yayinevi_pkey PRIMARY KEY ("yayineviId");


--
-- Name: ilce ilce_il_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilce
    ADD CONSTRAINT ilce_il_fkey FOREIGN KEY (il) REFERENCES public.il("ilId");


--
-- Name: kasiyer ilfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kasiyer
    ADD CONSTRAINT ilfk FOREIGN KEY (il) REFERENCES public.il("ilId");


--
-- Name: kasiyer kasiyer_bolge_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kasiyer
    ADD CONSTRAINT kasiyer_bolge_fkey FOREIGN KEY (bolge) REFERENCES public.bolge("bolgeId");


--
-- Name: kasiyer kasiyer_ilce_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kasiyer
    ADD CONSTRAINT kasiyer_ilce_fkey FOREIGN KEY (ilce) REFERENCES public.ilce("ilceId");


--
-- Name: musteriler musteriler_bolge_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteriler
    ADD CONSTRAINT musteriler_bolge_fkey FOREIGN KEY (bolge) REFERENCES public.bolge("bolgeId");


--
-- Name: musteriler musteriler_il_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteriler
    ADD CONSTRAINT musteriler_il_fkey FOREIGN KEY (il) REFERENCES public.il("ilId");


--
-- Name: musteriler musteriler_ilce_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteriler
    ADD CONSTRAINT musteriler_ilce_fkey FOREIGN KEY (ilce) REFERENCES public.ilce("ilceId");


--
-- Name: satis satis_faturaNo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satis
    ADD CONSTRAINT "satis_faturaNo_fkey" FOREIGN KEY ("faturaNo") REFERENCES public.fatura("faturaId");


--
-- Name: satis satis_kasiyer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satis
    ADD CONSTRAINT satis_kasiyer_fkey FOREIGN KEY (kasiyer) REFERENCES public.kasiyer("kasiyerId");


--
-- Name: satis satis_musteri_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satis
    ADD CONSTRAINT satis_musteri_fkey FOREIGN KEY (musteri) REFERENCES public.musteriler("musteriId");


--
-- Name: sepet sepet_kasiyer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sepet
    ADD CONSTRAINT sepet_kasiyer_fkey FOREIGN KEY (kasiyer) REFERENCES public.kasiyer("kasiyerId");


--
-- Name: sepet sepet_musteri_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sepet
    ADD CONSTRAINT sepet_musteri_fkey FOREIGN KEY (musteri) REFERENCES public.musteriler("musteriId");


--
-- Name: sepet sepet_urunAdi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sepet
    ADD CONSTRAINT "sepet_urunAdi_fkey" FOREIGN KEY ("urunAdi") REFERENCES public.urun("urunId");


--
-- Name: stok stok_urun_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stok
    ADD CONSTRAINT stok_urun_fkey FOREIGN KEY (urun) REFERENCES public.urun("urunId");


--
-- Name: urun urun_kategori_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urun
    ADD CONSTRAINT urun_kategori_fkey FOREIGN KEY (kategori) REFERENCES public.kategori("kategoriId");


--
-- Name: urun urun_tedarikci_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urun
    ADD CONSTRAINT urun_tedarikci_fkey FOREIGN KEY (tedarikci) REFERENCES public.tedarikci("tedarikciId");


--
-- Name: urun urun_yayinevi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urun
    ADD CONSTRAINT urun_yayinevi_fkey FOREIGN KEY (yayinevi) REFERENCES public.yayinevi("yayineviId");


--
-- Name: yayinevi yayinevi_kategori_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yayinevi
    ADD CONSTRAINT yayinevi_kategori_fkey FOREIGN KEY (kategori) REFERENCES public.kategori("kategoriId");


--
-- PostgreSQL database dump complete
--

