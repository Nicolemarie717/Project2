-- Database: crowdfunding_db

-- DROP DATABASE IF EXISTS crowdfunding_db;

CREATE DATABASE crowdfunding_db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


-- Table: public.campaign

-- DROP TABLE IF EXISTS public.campaign;

CREATE TABLE IF NOT EXISTS public.campaign
(
    cf_id integer NOT NULL,
    contact_id integer NOT NULL,
    company_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    description character varying(255) COLLATE pg_catalog."default" NOT NULL,
    goal double precision NOT NULL,
    pledged double precision NOT NULL,
    outcome character varying(12) COLLATE pg_catalog."default" NOT NULL,
    backers_count integer NOT NULL,
    country character varying(2) COLLATE pg_catalog."default" NOT NULL,
    currency character varying(3) COLLATE pg_catalog."default" NOT NULL,
    launched_date date NOT NULL,
    end_date date NOT NULL,
    category_id character varying(4) COLLATE pg_catalog."default" NOT NULL,
    subcategory_ids character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT campaign_pkey PRIMARY KEY (cf_id),
    CONSTRAINT campaign_category_id_fkey FOREIGN KEY (category_id)
        REFERENCES public.category (category_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT campaign_contact_id_fkey FOREIGN KEY (contact_id)
        REFERENCES public.contacts (contact_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT campaign_subcategory_ids_fkey FOREIGN KEY (subcategory_ids)
        REFERENCES public.subcategory (subcategory_ids) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.campaign
    OWNER to postgres;

-- Table: public.category

-- DROP TABLE IF EXISTS public.category;

CREATE TABLE IF NOT EXISTS public.category
(
    category_id character varying(4) COLLATE pg_catalog."default" NOT NULL,
    category character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT category_pkey PRIMARY KEY (category_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.category
    OWNER to postgres;
	

-- Table: public.contacts

-- DROP TABLE IF EXISTS public.contacts;

CREATE TABLE IF NOT EXISTS public.contacts
(
    contact_id integer NOT NULL,
    first_name character varying(15) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(15) COLLATE pg_catalog."default" NOT NULL,
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT contacts_pkey PRIMARY KEY (contact_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.contacts
    OWNER to postgres;
	

-- Table: public.subcategory

-- DROP TABLE IF EXISTS public.subcategory;

CREATE TABLE IF NOT EXISTS public.subcategory
(
    subcategory_ids character varying(10) COLLATE pg_catalog."default" NOT NULL,
    "sub-category" character varying(40) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT subcategory_pkey PRIMARY KEY (subcategory_ids)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.subcategory
    OWNER to postgres;
	
	
	
ALTER TABLE campaign ALTER COLUMN goal type float ;

ALTER TABLE campaign ALTER COLUMN pledged type float ;

ALTER TABLE campaign ALTER COLUMN country type varchar (2) ;

ALTER TABLE campaign ALTER COLUMN currency type varchar (3) ;

ALTER TABLE campaign ALTER COLUMN category_id type varchar (4) ;

ALTER TABLE campaign ALTER COLUMN subcategory_ids type varchar (10) ;

ALTER TABLE category ALTER COLUMN category_id type varchar (4) ;

ALTER TABLE subcategory ALTER COLUMN subcategory_ids type varchar (10) ;

select * from campaign;

select * from category;

select * from contacts;

select * from subcategory;
