CREATE TABLE public.account
(
    user_id integer NOT NULL DEFAULT nextval('account_user_id_seq'::regclass),
    username character varying(50) COLLATE pg_catalog."default" NOT NULL,
    password character varying(50) COLLATE pg_catalog."default" NOT NULL,
    email character varying(355) COLLATE pg_catalog."default" NOT NULL,
    created_on timestamp without time zone NOT NULL,
    last_login timestamp without time zone,
    CONSTRAINT account_pkey PRIMARY KEY (user_id),
    CONSTRAINT account_email_key UNIQUE (email),
    CONSTRAINT account_username_key UNIQUE (username)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.account
    OWNER to achitnis;

CREATE TABLE public.account_role
(
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    grant_date timestamp without time zone,
    CONSTRAINT account_role_pkey PRIMARY KEY (user_id, role_id),
    CONSTRAINT account_role_role_id_fkey FOREIGN KEY (role_id)
        REFERENCES public.role (role_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT account_role_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.account (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.account_role
    OWNER to achitnis;

CREATE TABLE public.role
(
    role_id integer NOT NULL DEFAULT nextval('role_role_id_seq'::regclass),
    role_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    role_description character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT role_pkey PRIMARY KEY (role_id),
    CONSTRAINT role_role_name_key UNIQUE (role_name)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.role
    OWNER to achitnis;
