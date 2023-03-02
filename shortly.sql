PGDMP                         {            shortly    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16825    shortly    DATABASE     ~   CREATE DATABASE shortly WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE shortly;
                postgres    false            �            1259    16827 	   customers    TABLE     �   CREATE TABLE public.customers (
    id integer NOT NULL,
    name character(50) NOT NULL,
    email character(100) NOT NULL,
    password character(24) NOT NULL
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    16826    customers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public          postgres    false    215                       0    0    customers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
          public          postgres    false    214            �            1259    16836    sessions    TABLE     r   CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL
);
    DROP TABLE public.sessions;
       public         heap    postgres    false            �            1259    16835    sessions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sessions_id_seq;
       public          postgres    false    217                       0    0    sessions_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;
          public          postgres    false    216            �            1259    16850    url    TABLE     �   CREATE TABLE public.url (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    visitcount integer NOT NULL
);
    DROP TABLE public.url;
       public         heap    postgres    false            �            1259    16849 
   url_id_seq    SEQUENCE     �   CREATE SEQUENCE public.url_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.url_id_seq;
       public          postgres    false    219                       0    0 
   url_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.url_id_seq OWNED BY public.url.id;
          public          postgres    false    218            o           2604    16830    customers id    DEFAULT     l   ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 ;   ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            p           2604    16839    sessions id    DEFAULT     j   ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);
 :   ALTER TABLE public.sessions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            q           2604    16853    url id    DEFAULT     `   ALTER TABLE ONLY public.url ALTER COLUMN id SET DEFAULT nextval('public.url_id_seq'::regclass);
 5   ALTER TABLE public.url ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219                      0    16827 	   customers 
   TABLE DATA           >   COPY public.customers (id, name, email, password) FROM stdin;
    public          postgres    false    215   7                 0    16836    sessions 
   TABLE DATA           7   COPY public.sessions (id, "userId", token) FROM stdin;
    public          postgres    false    217   T                 0    16850    url 
   TABLE DATA           H   COPY public.url (id, "userId", url, "shortUrl", visitcount) FROM stdin;
    public          postgres    false    219   q                  0    0    customers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.customers_id_seq', 1, false);
          public          postgres    false    214                       0    0    sessions_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.sessions_id_seq', 1, false);
          public          postgres    false    216                       0    0 
   url_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.url_id_seq', 1, false);
          public          postgres    false    218            s           2606    16834    customers customers_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_email_key;
       public            postgres    false    215            u           2606    16832    customers customers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    215            w           2606    16843    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            postgres    false    217            y           2606    16857    url url_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.url DROP CONSTRAINT url_pkey;
       public            postgres    false    219            z           2606    16844    sessions sessions_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.customers(id);
 I   ALTER TABLE ONLY public.sessions DROP CONSTRAINT "sessions_userId_fkey";
       public          postgres    false    215    217    3189            {           2606    16858    url url_userId_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.url
    ADD CONSTRAINT "url_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.customers(id);
 ?   ALTER TABLE ONLY public.url DROP CONSTRAINT "url_userId_fkey";
       public          postgres    false    3189    215    219                  x������ � �            x������ � �            x������ � �     