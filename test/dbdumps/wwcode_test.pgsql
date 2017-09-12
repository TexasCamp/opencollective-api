toc.dat                                                                                             0000600 0004000 0002000 00000200750 13156021737 0014450 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       2                    u           wwcode_test    9.6.5    9.6.5 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         �           1262    18582876    wwcode_test    DATABASE     }   CREATE DATABASE wwcode_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE wwcode_test;
             opencollective    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false         �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    4                     3079    12655    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false         �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1                     3079    18582877    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                  false    4         �           0    0    EXTENSION postgis    COMMENT     g   COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';
                       false    2         )           1247    18584850    enum_Groups_membership_type    TYPE     i   CREATE TYPE "enum_Groups_membership_type" AS ENUM (
    'donation',
    'monthlyfee',
    'yearlyfee'
);
 0   DROP TYPE public."enum_Groups_membership_type";
       public       xdamman    false    4         ,           1247    18584858    enum_UserGroups_role    TYPE     X   CREATE TYPE "enum_UserGroups_role" AS ENUM (
    'admin',
    'writer',
    'viewer'
);
 )   DROP TYPE public."enum_UserGroups_role";
       public       xdamman    false    4         �            1259    18584865 
   Activities    TABLE     �   CREATE TABLE "Activities" (
    id integer NOT NULL,
    type character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "CollectiveId" integer,
    "UserId" integer,
    "TransactionId" integer
);
     DROP TABLE public."Activities";
       public         opencollective    false    4         �            1259    18584871    Activities_id_seq    SEQUENCE     u   CREATE SEQUENCE "Activities_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Activities_id_seq";
       public       opencollective    false    201    4         �           0    0    Activities_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE "Activities_id_seq" OWNED BY "Activities".id;
            public       opencollective    false    202         �            1259    18584886    PaymentMethods    TABLE     �  CREATE TABLE "PaymentMethods" (
    id integer NOT NULL,
    name character varying(255),
    token character varying(255),
    "customerId" character varying(255),
    service character varying(255) DEFAULT 'stripe'::character varying,
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "confirmedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer,
    "expiryDate" timestamp with time zone,
    uuid uuid,
    "CollectiveId" integer,
    "archivedAt" timestamp with time zone,
    "monthlyLimitPerMember" integer,
    "primary" boolean DEFAULT false,
    currency character varying(3)
);
 $   DROP TABLE public."PaymentMethods";
       public         opencollective    false    4         �            1259    18584893    Cards_id_seq    SEQUENCE     p   CREATE SEQUENCE "Cards_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Cards_id_seq";
       public       opencollective    false    203    4         �           0    0    Cards_id_seq    SEQUENCE OWNED BY     <   ALTER SEQUENCE "Cards_id_seq" OWNED BY "PaymentMethods".id;
            public       opencollective    false    204         �            1259    18584947    CollectiveHistories    TABLE       CREATE TABLE "CollectiveHistories" (
    id integer,
    name character varying(255),
    description character varying(255),
    currency character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean,
    "longDescription" text,
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    mission character varying(255),
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean,
    "LastEditedByUserId" integer,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL,
    "CreatedByUserId" integer,
    "HostCollectiveId" integer,
    "ParentCollectiveId" integer,
    type character varying(255) DEFAULT 'COLLECTIVE'::character varying,
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "locationName" character varying(255),
    address character varying(255),
    timezone character varying(255),
    "maxAmount" integer,
    "maxQuantity" integer,
    "geoLocationLatLong" geometry(Point)
);
 )   DROP TABLE public."CollectiveHistories";
       public         opencollective    false    2    2    4    2    4    2    4    2    4    4    2    4    2    4    2    4    4         �            1259    18584955    Collectives    TABLE     �  CREATE TABLE "Collectives" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean DEFAULT false,
    "longDescription" text,
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    mission character varying(128),
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean DEFAULT false,
    "LastEditedByUserId" integer,
    "CreatedByUserId" integer,
    "HostCollectiveId" integer,
    "ParentCollectiveId" integer,
    type character varying(255) DEFAULT 'COLLECTIVE'::character varying,
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "locationName" character varying(255),
    address character varying(255),
    timezone character varying(255),
    "maxAmount" integer,
    "maxQuantity" integer,
    "geoLocationLatLong" geometry(Point)
);
 !   DROP TABLE public."Collectives";
       public         opencollective    false    2    2    4    2    4    2    4    2    4    4    2    4    2    4    2    4    4         �            1259    18584903    ConnectedAccounts    TABLE     �  CREATE TABLE "ConnectedAccounts" (
    id integer NOT NULL,
    service character varying(255),
    username character varying(255),
    "clientId" character varying(255),
    token character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer,
    "CollectiveId" integer,
    "refreshToken" character varying(255)
);
 '   DROP TABLE public."ConnectedAccounts";
       public         opencollective    false    4         �            1259    18584909    ConnectedAccounts_id_seq    SEQUENCE     |   CREATE SEQUENCE "ConnectedAccounts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."ConnectedAccounts_id_seq";
       public       opencollective    false    205    4         �           0    0    ConnectedAccounts_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE "ConnectedAccounts_id_seq" OWNED BY "ConnectedAccounts".id;
            public       opencollective    false    206         �            1259    18584911    Orders    TABLE     q  CREATE TABLE "Orders" (
    id integer NOT NULL,
    "CreatedByUserId" integer,
    "CollectiveId" integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "totalAmount" integer,
    description character varying(255),
    "SubscriptionId" integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "PaymentMethodId" integer,
    "processedAt" timestamp with time zone,
    "privateMessage" text,
    "TierId" integer,
    "FromCollectiveId" integer,
    "publicMessage" character varying(255),
    quantity integer
);
    DROP TABLE public."Orders";
       public         opencollective    false    4         �            1259    18584919    Donations_id_seq    SEQUENCE     t   CREATE SEQUENCE "Donations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Donations_id_seq";
       public       opencollective    false    4    207         �           0    0    Donations_id_seq    SEQUENCE OWNED BY     8   ALTER SEQUENCE "Donations_id_seq" OWNED BY "Orders".id;
            public       opencollective    false    208         �            1259    18584930    ExpenseHistories    TABLE     �  CREATE TABLE "ExpenseHistories" (
    id integer,
    "UserId" integer,
    "CollectiveId" integer,
    currency character varying(255),
    amount integer,
    description character varying(255),
    "payoutMethod" character varying(255),
    "privateMessage" text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer,
    status character varying(255),
    "incurredAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL
);
 &   DROP TABLE public."ExpenseHistories";
       public         opencollective    false    4         �            1259    18584936    ExpenseHistories_hid_seq    SEQUENCE     |   CREATE SEQUENCE "ExpenseHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."ExpenseHistories_hid_seq";
       public       opencollective    false    4    209         �           0    0    ExpenseHistories_hid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE "ExpenseHistories_hid_seq" OWNED BY "ExpenseHistories".hid;
            public       opencollective    false    210         �            1259    18584938    Expenses    TABLE     �  CREATE TABLE "Expenses" (
    id integer NOT NULL,
    "UserId" integer NOT NULL,
    "CollectiveId" integer NOT NULL,
    currency character varying(255) NOT NULL,
    amount integer NOT NULL,
    description character varying(255) NOT NULL,
    "privateMessage" text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer NOT NULL,
    status character varying(255) DEFAULT 'PENDING'::character varying NOT NULL,
    "incurredAt" timestamp with time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone,
    "payoutMethod" character varying(255) NOT NULL
);
    DROP TABLE public."Expenses";
       public         opencollective    false    4         �            1259    18584945    Expenses_id_seq    SEQUENCE     s   CREATE SEQUENCE "Expenses_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Expenses_id_seq";
       public       opencollective    false    4    211         �           0    0    Expenses_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE "Expenses_id_seq" OWNED BY "Expenses".id;
            public       opencollective    false    212         �            1259    18584953    GroupHistories_hid_seq    SEQUENCE     z   CREATE SEQUENCE "GroupHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."GroupHistories_hid_seq";
       public       opencollective    false    4    213         �           0    0    GroupHistories_hid_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE "GroupHistories_hid_seq" OWNED BY "CollectiveHistories".hid;
            public       opencollective    false    214         �            1259    18584964    Groups_id_seq    SEQUENCE     q   CREATE SEQUENCE "Groups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Groups_id_seq";
       public       opencollective    false    4    215         �           0    0    Groups_id_seq    SEQUENCE OWNED BY     :   ALTER SEQUENCE "Groups_id_seq" OWNED BY "Collectives".id;
            public       opencollective    false    216         �            1259    18585038    Members    TABLE     �  CREATE TABLE "Members" (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer NOT NULL,
    "CollectiveId" integer NOT NULL,
    role character varying(255) DEFAULT 'MEMBER'::character varying NOT NULL,
    id integer NOT NULL,
    description character varying(255),
    "MemberCollectiveId" integer,
    "TierId" integer
);
    DROP TABLE public."Members";
       public         opencollective    false    4         �            1259    18584966    Notifications    TABLE     r  CREATE TABLE "Notifications" (
    id integer NOT NULL,
    channel character varying(255) DEFAULT 'email'::character varying,
    type character varying(255),
    active boolean DEFAULT true,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "UserId" integer,
    "CollectiveId" integer,
    "webhookUrl" character varying(255)
);
 #   DROP TABLE public."Notifications";
       public         opencollective    false    4         �            1259    18584974    Paykeys    TABLE     o  CREATE TABLE "Paykeys" (
    id integer NOT NULL,
    "trackingId" character varying(255),
    paykey character varying(255),
    status character varying(255),
    payload json,
    data json,
    error json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "TransactionId" integer
);
    DROP TABLE public."Paykeys";
       public         opencollective    false    4         �            1259    18584980    Paykeys_id_seq    SEQUENCE     r   CREATE SEQUENCE "Paykeys_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Paykeys_id_seq";
       public       opencollective    false    218    4         �           0    0    Paykeys_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE "Paykeys_id_seq" OWNED BY "Paykeys".id;
            public       opencollective    false    219         �            1259    18584991    SequelizeMeta    TABLE     K   CREATE TABLE "SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public         opencollective    false    4         �            1259    18584994    Sessions    TABLE     �   CREATE TABLE "Sessions" (
    sid character varying(32) NOT NULL,
    expires timestamp with time zone,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Sessions";
       public         opencollective    false    4         �            1259    18585008    Subscriptions    TABLE       CREATE TABLE "Subscriptions" (
    id integer NOT NULL,
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "interval" character varying(8) DEFAULT NULL::character varying,
    "isActive" boolean DEFAULT false,
    data json,
    "stripeSubscriptionId" character varying(255),
    "activatedAt" timestamp with time zone,
    "deactivatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone
);
 #   DROP TABLE public."Subscriptions";
       public         opencollective    false    4         �            1259    18585016    Subscriptions_id_seq    SEQUENCE     x   CREATE SEQUENCE "Subscriptions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Subscriptions_id_seq";
       public       opencollective    false    217    4         �           0    0    Subscriptions_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE "Subscriptions_id_seq" OWNED BY "Notifications".id;
            public       opencollective    false    223         �            1259    18585018    Subscriptions_id_seq1    SEQUENCE     y   CREATE SEQUENCE "Subscriptions_id_seq1"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Subscriptions_id_seq1";
       public       opencollective    false    222    4         �           0    0    Subscriptions_id_seq1    SEQUENCE OWNED BY     D   ALTER SEQUENCE "Subscriptions_id_seq1" OWNED BY "Subscriptions".id;
            public       opencollective    false    224         �            1259    18585020    Tiers    TABLE       CREATE TABLE "Tiers" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "maxQuantity" integer,
    password character varying(255),
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    slug character varying(255),
    "maxQuantityPerUser" integer,
    goal integer,
    type character varying(255) DEFAULT 'TICKET'::character varying,
    "CollectiveId" integer,
    "interval" character varying(8) DEFAULT NULL::character varying,
    button character varying(255),
    presets json
);
    DROP TABLE public."Tiers";
       public         opencollective    false    4         �            1259    18585027    Tiers_id_seq    SEQUENCE     p   CREATE SEQUENCE "Tiers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Tiers_id_seq";
       public       opencollective    false    225    4         �           0    0    Tiers_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE "Tiers_id_seq" OWNED BY "Tiers".id;
            public       opencollective    false    226         �            1259    18585029    Transactions    TABLE     q  CREATE TABLE "Transactions" (
    id integer NOT NULL,
    type character varying(255),
    description character varying(255),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone NOT NULL,
    "CollectiveId" integer,
    "CreatedByUserId" integer,
    "PaymentMethodId" integer,
    "deletedAt" timestamp with time zone,
    data json,
    "OrderId" integer,
    "platformFeeInHostCurrency" integer,
    "hostFeeInHostCurrency" integer,
    "paymentProcessorFeeInHostCurrency" integer,
    "hostCurrency" character varying(255),
    "hostCurrencyFxRate" double precision,
    "amountInHostCurrency" integer,
    "netAmountInCollectiveCurrency" integer,
    "ExpenseId" integer,
    uuid uuid,
    "FromCollectiveId" integer,
    "HostCollectiveId" integer
);
 "   DROP TABLE public."Transactions";
       public         opencollective    false    4         �            1259    18585036    Transactions_id_seq    SEQUENCE     w   CREATE SEQUENCE "Transactions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Transactions_id_seq";
       public       opencollective    false    227    4         �           0    0    Transactions_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE "Transactions_id_seq" OWNED BY "Transactions".id;
            public       opencollective    false    228         �            1259    18585042    UserGroups_id_seq    SEQUENCE     u   CREATE SEQUENCE "UserGroups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."UserGroups_id_seq";
       public       opencollective    false    4    229         �           0    0    UserGroups_id_seq    SEQUENCE OWNED BY     :   ALTER SEQUENCE "UserGroups_id_seq" OWNED BY "Members".id;
            public       opencollective    false    230         �            1259    18585044    Users    TABLE     4  CREATE TABLE "Users" (
    id integer NOT NULL,
    email character varying(255),
    _salt character varying(255) DEFAULT '$2a$10$JqAcT6sBbBs5pO9FkwqLEu'::character varying,
    refresh_token character varying(255) DEFAULT '$2a$10$IHs8e8FdK1.bqjvZxr4Zvu'::character varying,
    password_hash character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "seenAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "paypalEmail" character varying(255),
    "resetPasswordTokenHash" character varying(255),
    "resetPasswordSentAt" timestamp with time zone,
    "firstName" character varying(128),
    "lastName" character varying(128),
    "billingAddress" character varying(255),
    "isHost" boolean DEFAULT false,
    "CollectiveId" integer
);
    DROP TABLE public."Users";
       public         opencollective    false    4         �            1259    18585055    Users_id_seq    SEQUENCE     p   CREATE SEQUENCE "Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Users_id_seq";
       public       opencollective    false    4    231         �           0    0    Users_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE "Users_id_seq" OWNED BY "Users".id;
            public       opencollective    false    232         �           0    0    geography_columns    ACL     8   GRANT ALL ON TABLE geography_columns TO opencollective;
            public       xdamman    false    189         �           0    0    geometry_columns    ACL     7   GRANT ALL ON TABLE geometry_columns TO opencollective;
            public       xdamman    false    190         �           0    0    raster_columns    ACL     5   GRANT ALL ON TABLE raster_columns TO opencollective;
            public       xdamman    false    199         �           0    0    raster_overviews    ACL     7   GRANT ALL ON TABLE raster_overviews TO opencollective;
            public       xdamman    false    200         �           0    0    spatial_ref_sys    ACL     �   REVOKE SELECT ON TABLE spatial_ref_sys FROM PUBLIC;
REVOKE ALL ON TABLE spatial_ref_sys FROM xdamman;
GRANT SELECT ON TABLE spatial_ref_sys TO PUBLIC;
GRANT ALL ON TABLE spatial_ref_sys TO opencollective;
            public       opencollective    false    187         �           2604    18585057    Activities id    DEFAULT     d   ALTER TABLE ONLY "Activities" ALTER COLUMN id SET DEFAULT nextval('"Activities_id_seq"'::regclass);
 >   ALTER TABLE public."Activities" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    202    201         �           2604    18585065    CollectiveHistories hid    DEFAULT     s   ALTER TABLE ONLY "CollectiveHistories" ALTER COLUMN hid SET DEFAULT nextval('"GroupHistories_hid_seq"'::regclass);
 H   ALTER TABLE public."CollectiveHistories" ALTER COLUMN hid DROP DEFAULT;
       public       opencollective    false    214    213         �           2604    18585066    Collectives id    DEFAULT     a   ALTER TABLE ONLY "Collectives" ALTER COLUMN id SET DEFAULT nextval('"Groups_id_seq"'::regclass);
 ?   ALTER TABLE public."Collectives" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    216    215         �           2604    18585060    ConnectedAccounts id    DEFAULT     r   ALTER TABLE ONLY "ConnectedAccounts" ALTER COLUMN id SET DEFAULT nextval('"ConnectedAccounts_id_seq"'::regclass);
 E   ALTER TABLE public."ConnectedAccounts" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    206    205         �           2604    18585063    ExpenseHistories hid    DEFAULT     r   ALTER TABLE ONLY "ExpenseHistories" ALTER COLUMN hid SET DEFAULT nextval('"ExpenseHistories_hid_seq"'::regclass);
 E   ALTER TABLE public."ExpenseHistories" ALTER COLUMN hid DROP DEFAULT;
       public       opencollective    false    210    209         �           2604    18585064    Expenses id    DEFAULT     `   ALTER TABLE ONLY "Expenses" ALTER COLUMN id SET DEFAULT nextval('"Expenses_id_seq"'::regclass);
 <   ALTER TABLE public."Expenses" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    212    211         �           2604    18585075 
   Members id    DEFAULT     a   ALTER TABLE ONLY "Members" ALTER COLUMN id SET DEFAULT nextval('"UserGroups_id_seq"'::regclass);
 ;   ALTER TABLE public."Members" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    230    229         �           2604    18585067    Notifications id    DEFAULT     j   ALTER TABLE ONLY "Notifications" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq"'::regclass);
 A   ALTER TABLE public."Notifications" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    223    217         �           2604    18585061 	   Orders id    DEFAULT     _   ALTER TABLE ONLY "Orders" ALTER COLUMN id SET DEFAULT nextval('"Donations_id_seq"'::regclass);
 :   ALTER TABLE public."Orders" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    208    207         �           2604    18585068 
   Paykeys id    DEFAULT     ^   ALTER TABLE ONLY "Paykeys" ALTER COLUMN id SET DEFAULT nextval('"Paykeys_id_seq"'::regclass);
 ;   ALTER TABLE public."Paykeys" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    219    218         �           2604    18585069    PaymentMethods id    DEFAULT     c   ALTER TABLE ONLY "PaymentMethods" ALTER COLUMN id SET DEFAULT nextval('"Cards_id_seq"'::regclass);
 B   ALTER TABLE public."PaymentMethods" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    204    203         �           2604    18585072    Subscriptions id    DEFAULT     k   ALTER TABLE ONLY "Subscriptions" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq1"'::regclass);
 A   ALTER TABLE public."Subscriptions" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    224    222         �           2604    18585073    Tiers id    DEFAULT     Z   ALTER TABLE ONLY "Tiers" ALTER COLUMN id SET DEFAULT nextval('"Tiers_id_seq"'::regclass);
 9   ALTER TABLE public."Tiers" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    226    225         �           2604    18585074    Transactions id    DEFAULT     h   ALTER TABLE ONLY "Transactions" ALTER COLUMN id SET DEFAULT nextval('"Transactions_id_seq"'::regclass);
 @   ALTER TABLE public."Transactions" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    228    227         �           2604    18585076    Users id    DEFAULT     Z   ALTER TABLE ONLY "Users" ALTER COLUMN id SET DEFAULT nextval('"Users_id_seq"'::regclass);
 9   ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    232    231         �          0    18584865 
   Activities 
   TABLE DATA               g   COPY "Activities" (id, type, data, "createdAt", "CollectiveId", "UserId", "TransactionId") FROM stdin;
    public       opencollective    false    201       4009.dat �           0    0    Activities_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('"Activities_id_seq"', 27901, true);
            public       opencollective    false    202         �           0    0    Cards_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('"Cards_id_seq"', 3023, true);
            public       opencollective    false    204         �          0    18584947    CollectiveHistories 
   TABLE DATA               �  COPY "CollectiveHistories" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", hid, "archivedAt", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong") FROM stdin;
    public       opencollective    false    213       4021.dat �          0    18584955    Collectives 
   TABLE DATA               �  COPY "Collectives" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong") FROM stdin;
    public       opencollective    false    215       4023.dat �          0    18584903    ConnectedAccounts 
   TABLE DATA               �   COPY "ConnectedAccounts" (id, service, username, "clientId", token, data, "createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", "refreshToken") FROM stdin;
    public       opencollective    false    205       4013.dat �           0    0    ConnectedAccounts_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('"ConnectedAccounts_id_seq"', 1023, true);
            public       opencollective    false    206         �           0    0    Donations_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('"Donations_id_seq"', 2912, true);
            public       opencollective    false    208         �          0    18584930    ExpenseHistories 
   TABLE DATA                 COPY "ExpenseHistories" (id, "UserId", "CollectiveId", currency, amount, description, "payoutMethod", "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", hid, "archivedAt") FROM stdin;
    public       opencollective    false    209       4017.dat �           0    0    ExpenseHistories_hid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('"ExpenseHistories_hid_seq"', 1607, true);
            public       opencollective    false    210         �          0    18584938    Expenses 
   TABLE DATA               �   COPY "Expenses" (id, "UserId", "CollectiveId", currency, amount, description, "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", "payoutMethod") FROM stdin;
    public       opencollective    false    211       4019.dat �           0    0    Expenses_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('"Expenses_id_seq"', 1159, true);
            public       opencollective    false    212         �           0    0    GroupHistories_hid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('"GroupHistories_hid_seq"', 31393, true);
            public       opencollective    false    214         �           0    0    Groups_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('"Groups_id_seq"', 848, true);
            public       opencollective    false    216         �          0    18585038    Members 
   TABLE DATA               �   COPY "Members" ("createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", role, id, description, "MemberCollectiveId", "TierId") FROM stdin;
    public       opencollective    false    229       4037.dat �          0    18584966    Notifications 
   TABLE DATA                  COPY "Notifications" (id, channel, type, active, "createdAt", "updatedAt", "UserId", "CollectiveId", "webhookUrl") FROM stdin;
    public       opencollective    false    217       4025.dat �          0    18584911    Orders 
   TABLE DATA                 COPY "Orders" (id, "CreatedByUserId", "CollectiveId", currency, "totalAmount", description, "SubscriptionId", "createdAt", "updatedAt", "deletedAt", "PaymentMethodId", "processedAt", "privateMessage", "TierId", "FromCollectiveId", "publicMessage", quantity) FROM stdin;
    public       opencollective    false    207       4015.dat �          0    18584974    Paykeys 
   TABLE DATA               �   COPY "Paykeys" (id, "trackingId", paykey, status, payload, data, error, "createdAt", "updatedAt", "deletedAt", "TransactionId") FROM stdin;
    public       opencollective    false    218       4026.dat �           0    0    Paykeys_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('"Paykeys_id_seq"', 1, false);
            public       opencollective    false    219         �          0    18584886    PaymentMethods 
   TABLE DATA               �   COPY "PaymentMethods" (id, name, token, "customerId", service, data, "createdAt", "updatedAt", "confirmedAt", "deletedAt", "CreatedByUserId", "expiryDate", uuid, "CollectiveId", "archivedAt", "monthlyLimitPerMember", "primary", currency) FROM stdin;
    public       opencollective    false    203       4011.dat �          0    18584991    SequelizeMeta 
   TABLE DATA               (   COPY "SequelizeMeta" (name) FROM stdin;
    public       opencollective    false    220       4028.dat �          0    18584994    Sessions 
   TABLE DATA               K   COPY "Sessions" (sid, expires, data, "createdAt", "updatedAt") FROM stdin;
    public       opencollective    false    221       4029.dat �          0    18585008    Subscriptions 
   TABLE DATA               �   COPY "Subscriptions" (id, amount, currency, "interval", "isActive", data, "stripeSubscriptionId", "activatedAt", "deactivatedAt", "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public       opencollective    false    222       4030.dat �           0    0    Subscriptions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('"Subscriptions_id_seq"', 17102, true);
            public       opencollective    false    223         �           0    0    Subscriptions_id_seq1    SEQUENCE SET     A   SELECT pg_catalog.setval('"Subscriptions_id_seq1"', 2214, true);
            public       opencollective    false    224         �          0    18585020    Tiers 
   TABLE DATA               �   COPY "Tiers" (id, name, description, amount, currency, "maxQuantity", password, "startsAt", "endsAt", "createdAt", "updatedAt", "deletedAt", slug, "maxQuantityPerUser", goal, type, "CollectiveId", "interval", button, presets) FROM stdin;
    public       opencollective    false    225       4033.dat �           0    0    Tiers_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('"Tiers_id_seq"', 200, true);
            public       opencollective    false    226         �          0    18585029    Transactions 
   TABLE DATA               �  COPY "Transactions" (id, type, description, amount, currency, "createdAt", "updatedAt", "CollectiveId", "CreatedByUserId", "PaymentMethodId", "deletedAt", data, "OrderId", "platformFeeInHostCurrency", "hostFeeInHostCurrency", "paymentProcessorFeeInHostCurrency", "hostCurrency", "hostCurrencyFxRate", "amountInHostCurrency", "netAmountInCollectiveCurrency", "ExpenseId", uuid, "FromCollectiveId", "HostCollectiveId") FROM stdin;
    public       opencollective    false    227       4035.dat �           0    0    Transactions_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('"Transactions_id_seq"', 11071, true);
            public       opencollective    false    228         �           0    0    UserGroups_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('"UserGroups_id_seq"', 4719, true);
            public       opencollective    false    230         �          0    18585044    Users 
   TABLE DATA                  COPY "Users" (id, email, _salt, refresh_token, password_hash, "createdAt", "updatedAt", "seenAt", "deletedAt", "paypalEmail", "resetPasswordTokenHash", "resetPasswordSentAt", "firstName", "lastName", "billingAddress", "isHost", "CollectiveId") FROM stdin;
    public       opencollective    false    231       4039.dat �           0    0    Users_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('"Users_id_seq"', 4973, true);
            public       opencollective    false    232         �          0    18583174    spatial_ref_sys 
   TABLE DATA               Q   COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public       opencollective    false    187       3759.dat �           2606    18585080    Activities Activities_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_pkey";
       public         opencollective    false    201    201         �           2606    18585086    PaymentMethods Cards_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_pkey" PRIMARY KEY (id);
 G   ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_pkey";
       public         opencollective    false    203    203         �           2606    18585090 (   ConnectedAccounts ConnectedAccounts_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_pkey";
       public         opencollective    false    205    205         �           2606    18585092    Orders Donations_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_pkey" PRIMARY KEY (id);
 C   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_pkey";
       public         opencollective    false    207    207         �           2606    18585096 &   ExpenseHistories ExpenseHistories_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY "ExpenseHistories"
    ADD CONSTRAINT "ExpenseHistories_pkey" PRIMARY KEY (hid);
 T   ALTER TABLE ONLY public."ExpenseHistories" DROP CONSTRAINT "ExpenseHistories_pkey";
       public         opencollective    false    209    209         �           2606    18585098    Expenses Expenses_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_pkey";
       public         opencollective    false    211    211         �           2606    18585100 '   CollectiveHistories GroupHistories_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "GroupHistories_pkey" PRIMARY KEY (hid);
 U   ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "GroupHistories_pkey";
       public         opencollective    false    213    213         �           2606    18585102    Collectives Groups_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Groups_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Groups_pkey";
       public         opencollective    false    215    215         �           2606    18585104    Paykeys Paykeys_paykey_key 
   CONSTRAINT     T   ALTER TABLE ONLY "Paykeys"
    ADD CONSTRAINT "Paykeys_paykey_key" UNIQUE (paykey);
 H   ALTER TABLE ONLY public."Paykeys" DROP CONSTRAINT "Paykeys_paykey_key";
       public         opencollective    false    218    218         �           2606    18585106    Paykeys Paykeys_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY "Paykeys"
    ADD CONSTRAINT "Paykeys_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Paykeys" DROP CONSTRAINT "Paykeys_pkey";
       public         opencollective    false    218    218         �           2606    18585110     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY "SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public         opencollective    false    220    220         �           2606    18585112    Sessions Sessions_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY "Sessions"
    ADD CONSTRAINT "Sessions_pkey" PRIMARY KEY (sid);
 D   ALTER TABLE ONLY public."Sessions" DROP CONSTRAINT "Sessions_pkey";
       public         opencollective    false    221    221         �           2606    18585116     Notifications Subscriptions_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_pkey";
       public         opencollective    false    217    217         �           2606    18585118 !   Subscriptions Subscriptions_pkey1 
   CONSTRAINT     \   ALTER TABLE ONLY "Subscriptions"
    ADD CONSTRAINT "Subscriptions_pkey1" PRIMARY KEY (id);
 O   ALTER TABLE ONLY public."Subscriptions" DROP CONSTRAINT "Subscriptions_pkey1";
       public         opencollective    false    222    222         �           2606    18585120    Tiers Tiers_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_pkey";
       public         opencollective    false    225    225         �           2606    18585122    Transactions Transactions_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_pkey";
       public         opencollective    false    227    227         �           2606    18585124    Members UserGroups_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_pkey";
       public         opencollective    false    229    229                    2606    18585126    Users Users_email_key 
   CONSTRAINT     N   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);
 C   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key";
       public         opencollective    false    231    231                    2606    18585128    Users Users_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public         opencollective    false    231    231                    2606    18585132    Users email_unique_idx 
   CONSTRAINT     M   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT email_unique_idx UNIQUE (email);
 B   ALTER TABLE ONLY public."Users" DROP CONSTRAINT email_unique_idx;
       public         opencollective    false    231    231         �           1259    18585495    CollectiveId-deletedAt    INDEX     \   CREATE INDEX "CollectiveId-deletedAt" ON "Tiers" USING btree ("CollectiveId", "deletedAt");
 ,   DROP INDEX public."CollectiveId-deletedAt";
       public         opencollective    false    225    225         �           1259    18585358 
   DonationId    INDEX     E   CREATE INDEX "DonationId" ON "Transactions" USING btree ("OrderId");
     DROP INDEX public."DonationId";
       public         opencollective    false    227         �           1259    18585493 $   MemberCollectiveId-CollectiveId-role    INDEX     {   CREATE INDEX "MemberCollectiveId-CollectiveId-role" ON "Members" USING btree ("MemberCollectiveId", "CollectiveId", role);
 :   DROP INDEX public."MemberCollectiveId-CollectiveId-role";
       public         opencollective    false    229    229    229         �           1259    18585494 $   ToCollectiveId-FromCollectiveId-type    INDEX     �   CREATE INDEX "ToCollectiveId-FromCollectiveId-type" ON "Transactions" USING btree ("CollectiveId", "FromCollectiveId", "deletedAt");
 :   DROP INDEX public."ToCollectiveId-FromCollectiveId-type";
       public         opencollective    false    227    227    227         �           1259    18585133    Transactions_GroupId    INDEX     a   CREATE INDEX "Transactions_GroupId" ON "Transactions" USING btree ("CollectiveId", "deletedAt");
 *   DROP INDEX public."Transactions_GroupId";
       public         opencollective    false    227    227         �           1259    18585135    UniqueSlugIndex    INDEX     K   CREATE UNIQUE INDEX "UniqueSlugIndex" ON "Collectives" USING btree (slug);
 %   DROP INDEX public."UniqueSlugIndex";
       public         opencollective    false    215         �           1259    18585137 %   subscriptions_type__group_id__user_id    INDEX     {   CREATE UNIQUE INDEX subscriptions_type__group_id__user_id ON "Notifications" USING btree (type, "CollectiveId", "UserId");
 9   DROP INDEX public.subscriptions_type__group_id__user_id;
       public         opencollective    false    217    217    217         �           1259    18585372    transactions_uuid    INDEX     L   CREATE UNIQUE INDEX transactions_uuid ON "Transactions" USING btree (uuid);
 %   DROP INDEX public.transactions_uuid;
       public         opencollective    false    227                    2606    18585139 "   Activities Activities_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 P   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_GroupId_fkey";
       public       opencollective    false    215    201    3813                    2606    18585144 (   Activities Activities_TransactionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_TransactionId_fkey" FOREIGN KEY ("TransactionId") REFERENCES "Transactions"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_TransactionId_fkey";
       public       opencollective    false    3835    201    227                    2606    18585149 !   Activities Activities_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 O   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_UserId_fkey";
       public       opencollective    false    201    3843    231         
           2606    18585164     PaymentMethods Cards_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 N   ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_UserId_fkey";
       public       opencollective    false    3843    231    203                    2606    18585409 <   CollectiveHistories CollectiveHistories_CreatedByUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_CreatedByUserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 j   ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_CreatedByUserId_fkey";
       public       opencollective    false    213    231    3843                    2606    18585414 =   CollectiveHistories CollectiveHistories_HostCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 k   ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_HostCollectiveId_fkey";
       public       opencollective    false    213    215    3813                    2606    18585419 ?   CollectiveHistories CollectiveHistories_ParentCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_ParentCollectiveId_fkey" FOREIGN KEY ("ParentCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 m   ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_ParentCollectiveId_fkey";
       public       opencollective    false    213    215    3813                    2606    18585383 ,   Collectives Collectives_CreatedByUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_CreatedByUserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_CreatedByUserId_fkey";
       public       opencollective    false    215    231    3843                    2606    18585388 -   Collectives Collectives_HostCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 [   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_HostCollectiveId_fkey";
       public       opencollective    false    215    215    3813                    2606    18585393 /   Collectives Collectives_ParentCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_ParentCollectiveId_fkey" FOREIGN KEY ("ParentCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_ParentCollectiveId_fkey";
       public       opencollective    false    215    215    3813                    2606    18585184 0   ConnectedAccounts ConnectedAccounts_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_GroupId_fkey";
       public       opencollective    false    215    205    3813                    2606    18585189 /   ConnectedAccounts ConnectedAccounts_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_UserId_fkey";
       public       opencollective    false    231    205    3843                    2606    18585194    Orders Donations_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_GroupId_fkey";
       public       opencollective    false    207    215    3813                    2606    18585199 %   Orders Donations_PaymentMethodId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_PaymentMethodId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_PaymentMethodId_fkey";
       public       opencollective    false    203    207    3801                    2606    18585209 $   Orders Donations_SubscriptionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_SubscriptionId_fkey" FOREIGN KEY ("SubscriptionId") REFERENCES "Subscriptions"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 R   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_SubscriptionId_fkey";
       public       opencollective    false    3827    207    222                    2606    18585214    Orders Donations_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 J   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_UserId_fkey";
       public       opencollective    false    231    3843    207                    2606    18585234    Expenses Expenses_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_GroupId_fkey";
       public       opencollective    false    3813    215    211                    2606    18585239    Expenses Expenses_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_UserId_fkey";
       public       opencollective    false    231    3843    211                    2606    18585244 %   Expenses Expenses_lastEditedById_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_lastEditedById_fkey" FOREIGN KEY ("lastEditedById") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_lastEditedById_fkey";
       public       opencollective    false    3843    231    211                    2606    18585249 *   Collectives Groups_lastEditedByUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Groups_lastEditedByUserId_fkey" FOREIGN KEY ("LastEditedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 X   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Groups_lastEditedByUserId_fkey";
       public       opencollective    false    3843    215    231         (           2606    18585483 '   Members Members_MemberCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "Members_MemberCollectiveId_fkey" FOREIGN KEY ("MemberCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 U   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "Members_MemberCollectiveId_fkey";
       public       opencollective    false    229    3813    215         )           2606    18585488    Members Members_TierId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "Members_TierId_fkey" FOREIGN KEY ("TierId") REFERENCES "Tiers"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 I   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "Members_TierId_fkey";
       public       opencollective    false    3830    229    225                    2606    18585442 #   Orders Orders_FromCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Orders_FromCollectiveId_fkey" FOREIGN KEY ("FromCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_FromCollectiveId_fkey";
       public       opencollective    false    3813    215    207                    2606    18585437    Orders Orders_TierId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Orders_TierId_fkey" FOREIGN KEY ("TierId") REFERENCES "Tiers"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_TierId_fkey";
       public       opencollective    false    207    3830    225                    2606    18585254 "   Paykeys Paykeys_TransactionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Paykeys"
    ADD CONSTRAINT "Paykeys_TransactionId_fkey" FOREIGN KEY ("TransactionId") REFERENCES "Transactions"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 P   ALTER TABLE ONLY public."Paykeys" DROP CONSTRAINT "Paykeys_TransactionId_fkey";
       public       opencollective    false    227    3835    218         	           2606    18585496 /   PaymentMethods PaymentMethods_CollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "PaymentMethods_CollectiveId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "PaymentMethods_CollectiveId_fkey";
       public       opencollective    false    3813    203    215                    2606    18585279 (   Notifications Subscriptions_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_GroupId_fkey";
       public       opencollective    false    217    215    3813                    2606    18585284 '   Notifications Subscriptions_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 U   ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_UserId_fkey";
       public       opencollective    false    3843    217    231                     2606    18585367    Tiers Tiers_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 F   ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_GroupId_fkey";
       public       opencollective    false    225    215    3813         #           2606    18585294 %   Transactions Transactions_CardId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_CardId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_CardId_fkey";
       public       opencollective    false    227    3801    203         $           2606    18585299 )   Transactions Transactions_DonationId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_DonationId_fkey" FOREIGN KEY ("OrderId") REFERENCES "Orders"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 W   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_DonationId_fkey";
       public       opencollective    false    3805    207    227         %           2606    18585304 (   Transactions Transactions_ExpenseId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_ExpenseId_fkey" FOREIGN KEY ("ExpenseId") REFERENCES "Expenses"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_ExpenseId_fkey";
       public       opencollective    false    3809    211    227         !           2606    18585452 /   Transactions Transactions_FromCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_FromCollectiveId_fkey" FOREIGN KEY ("FromCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_FromCollectiveId_fkey";
       public       opencollective    false    227    3813    215         &           2606    18585309 &   Transactions Transactions_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 T   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_GroupId_fkey";
       public       opencollective    false    3813    215    227         "           2606    18585457 /   Transactions Transactions_HostCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_HostCollectiveId_fkey";
       public       opencollective    false    3813    227    215         '           2606    18585319 %   Transactions Transactions_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_UserId_fkey";
       public       opencollective    false    231    3843    227         *           2606    18585324    Members UserGroups_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id);
 M   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_GroupId_fkey";
       public       opencollective    false    229    215    3813         +           2606    18585329    Members UserGroups_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_UserId_fkey";
       public       opencollective    false    229    231    3843         ,           2606    18585432    Users Users_CollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_CollectiveId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_CollectiveId_fkey";
       public       opencollective    false    231    3813    215                                4009.dat                                                                                            0000600 0004000 0002000 00000000005 13156021737 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4021.dat                                                                                            0000600 0004000 0002000 00000000005 13156021737 0014240 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4023.dat                                                                                            0000600 0004000 0002000 00000464732 13156021737 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        47	WWCode Delhi	WWCode inspires women to excel in technology careers.	USD	2016-03-06 16:00:00-08	2016-12-27 08:24:21.89-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Delhi**](https://www.womenwhocode.com/delhi). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeIWjjfybWImspAgeEVa_K6bnuV-3jqSt951M2x5VTrp1ymZw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeIWjjfybWImspAgeEVa_K6bnuV-3jqSt951M2x5VTrp1ymZw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeIWjjfybWImspAgeEVa_K6bnuV-3jqSt951M2x5VTrp1ymZw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedelhi#support) to support WWCode Delhi \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/MFUk1nU_IQ.png	wwcodedelhi	https://www.womenwhocode.com/dc	wwcode_delhi	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
275	WWCode Hong Kong 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:08:19.455-07	2016-12-27 08:53:38.119-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Hong Kong**](https://www.womenwhocode.com/hk). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdg4XdtRKCzgpTopZtXsshtrXO1XRrUSlWo3ga29vxAAh_AtA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdg4XdtRKCzgpTopZtXsshtrXO1XRrUSlWo3ga29vxAAh_AtA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdg4XdtRKCzgpTopZtXsshtrXO1XRrUSlWo3ga29vxAAh_AtA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodehongkong#support) to support WWCode Hong Kong \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/adea85b0-9c7a-11e6-a3da-b7d8fa4b13cd.png	wwcodehongkong	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
262	WWCode Bangalore	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:51:29.29-07	2016-12-23 08:55:34.516-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Bangalore**](https://www.womenwhocode.com/bangalore). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeKojMYDN0UYJdAZSfFteESv9WL0i2Jen4zYQpsXYJOorAjIw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeKojMYDN0UYJdAZSfFteESv9WL0i2Jen4zYQpsXYJOorAjIw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeKojMYDN0UYJdAZSfFteESv9WL0i2Jen4zYQpsXYJOorAjIw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebangalore#support) to support WWCode Bangalore\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/fe02eee0-961a-11e6-a6e9-23ce753be86b.png	wwcodebangalore	\N	wwcodebangalore	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
510	Women Who Code Richmond	\N	USD	2017-02-21 08:25:28.328-08	2017-02-21 08:25:28.5-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!	\N	wwcoderichmond	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
522	Women Who Code Vancouver	\N	CAD	2017-02-21 11:45:19.101-08	2017-02-21 11:48:46.905-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSd1osMiiyVCoIUO3ZK8qcap7tFhhzGLvJAKO37CuLN0-eGTjg/viewform)\n\n[**Attend**](https://www.womenwhocode.com/vancouver) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSd1osMiiyVCoIUO3ZK8qcap7tFhhzGLvJAKO37CuLN0-eGTjg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSd1osMiiyVCoIUO3ZK8qcap7tFhhzGLvJAKO37CuLN0-eGTjg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodevancouver#support) to support WWCode Vancouver \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodevancouver	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
283	WWCode Paris	WWCode is a global non-profit organization that inspires women to excel in technology careers.	EUR	2016-09-29 11:16:17.095-07	2016-12-27 10:09:21.598-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Paris**](https://www.womenwhocode.com/paris). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScDi0VhEDuM3nMheBFIV7F-b0tjG6SIFTXAg7FtkeVJK_P1fw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScDi0VhEDuM3nMheBFIV7F-b0tjG6SIFTXAg7FtkeVJK_P1fw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScDi0VhEDuM3nMheBFIV7F-b0tjG6SIFTXAg7FtkeVJK_P1fw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeparis#support) to support WWCode Paris \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/17525ef0-9d44-11e6-9116-db595ff259df.png	wwcodeparis	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
280	WWCode Medellín 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:13:48.754-07	2016-12-27 09:47:24.671-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Medellin**](https://www.womenwhocode.com/medellin). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeboston#support) to support WWCode Medellin \n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/85a55000-cc5c-11e6-be07-3dfc36c6d12c.png	wwcodemedellin	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
286	WWCode Recife	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:19:11.423-07	2016-12-27 10:40:34.452-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Recife**](https://www.womenwhocode.com/recife). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScE5aeYUYx6Qxflg5CT30PgMk5zqvZl5PkKiJHgcyOmL3VTAg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScE5aeYUYx6Qxflg5CT30PgMk5zqvZl5PkKiJHgcyOmL3VTAg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScE5aeYUYx6Qxflg5CT30PgMk5zqvZl5PkKiJHgcyOmL3VTAg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcoderecife#support) to support WWCode Recife \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/cc234080-9d47-11e6-9116-db595ff259df.png	wwcoderecife	\N	WWCode_Recife	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
516	Women Who Code Huntsville	\N	USD	2017-02-21 11:02:21.542-08	2017-02-21 11:05:00.852-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScu1IeDDh0ZqcKEMxfMGPgrdr1bnDKsiC94diR7AfR7LQIU6g/viewform)\n\n[**Attend**](https://www.womenwhocode.com/philadelphia) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScu1IeDDh0ZqcKEMxfMGPgrdr1bnDKsiC94diR7AfR7LQIU6g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScu1IeDDh0ZqcKEMxfMGPgrdr1bnDKsiC94diR7AfR7LQIU6g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodephiladelphia#support) to support WWCode Philadelphia\n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodehuntsville	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
14	WWCode Seattle	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 16:00:00-08	2016-12-27 11:51:31.023-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Seattle**](https://www.womenwhocode.com/seattle). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfRpz1uqBWm1MVnVTTSK1EvAAwBzLFreVS5qyDV1y6Wrxi9HQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfRpz1uqBWm1MVnVTTSK1EvAAwBzLFreVS5qyDV1y6Wrxi9HQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfRpz1uqBWm1MVnVTTSK1EvAAwBzLFreVS5qyDV1y6Wrxi9HQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcode-seattle#support) to support WWCode Seattle \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/48297200-90a8-11e6-a134-f381d4cd2713.png	wwcodeseattle	https://www.womenwhocode.com/seattle	wwcode-seattle	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
523	Women Who Code Sofia	\N	EUR	2017-02-21 12:04:48.889-08	2017-02-21 12:06:29.574-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeqyQYDNUIJRIt8q9SuZdzqOu2c2PV1oxPdtmG0D5r0fEbcwA/viewform)\n\n[**Attend**](https://www.womenwhocode.com/sofia) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeqyQYDNUIJRIt8q9SuZdzqOu2c2PV1oxPdtmG0D5r0fEbcwA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeqyQYDNUIJRIt8q9SuZdzqOu2c2PV1oxPdtmG0D5r0fEbcwA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesofia#support) to support WWCode Sofia \n\nQuestions? Email us at global@womenwhocode.com	\N	wwcodesofia	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
519	Women Who Code Cleveland	\N	USD	2017-02-21 11:25:28.662-08	2017-02-21 11:28:23.116-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdReC87KXP-eOhEI_mk0iPL0ovyADL1gnIGbzUvjt90NGCupw/viewform)\n\n[**Attend**](https://www.womenwhocode.com/cleveland) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdReC87KXP-eOhEI_mk0iPL0ovyADL1gnIGbzUvjt90NGCupw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdReC87KXP-eOhEI_mk0iPL0ovyADL1gnIGbzUvjt90NGCupw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecleveland#support) to support WWCode Cleveland \n\nQuestions? Email us at global@womenwhocode.com.\n	\N	wwcodecleveland	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
584	WWCode Edinburgh	\N	GBP	2017-04-03 09:22:45.923-07	2017-04-03 09:22:46-07	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n\n# Contribute\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSczqJwa2qByhFFHXavunDYPzXRh1p0lOVa8nfyMSvCCySkd0Q/viewform)\n[**Attend**](https://www.womenwhocode.com/edinburgh) 	\N	wwcodeedinburgh	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n\n\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3206	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
513	Women Who Code Fort Collins	\N	USD	2017-02-21 10:35:34.492-08	2017-02-21 10:37:34.054-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaU7dnlAb9cneVM1fDsuNGhNfYtOTYR0UGwGploHd70ZXaLg/viewform)\n\n[**Attend**](https://www.womenwhocode.com/fortcollins) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaU7dnlAb9cneVM1fDsuNGhNfYtOTYR0UGwGploHd70ZXaLg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaU7dnlAb9cneVM1fDsuNGhNfYtOTYR0UGwGploHd70ZXaLg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodefortcollins#support) to support WWCode Fort Collins \n\nQuestions? Email us at global@womenwhocode.com.\n	\N	wwcodefortcollins	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
517	Women Who Code Manila	\N	USD	2017-02-21 11:07:25.163-08	2017-02-21 11:09:27.391-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reWWCode is a non-profit organization that inspires women to excel in technology careers.\nach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a member\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdFBYTGWumG1PbY65unD1atkWRgBhG2bArurTMwpE6xpnHNYQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/manila) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdFBYTGWumG1PbY65unD1atkWRgBhG2bArurTMwpE6xpnHNYQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdFBYTGWumG1PbY65unD1atkWRgBhG2bArurTMwpE6xpnHNYQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemanila#support) to support WWCode Manila \n\nQuestions? Email us at global@womenwhocode.com.\n	\N	wwcodemanila	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
51	Women Who Code	WWCode is a global non-profit organization dedicated 	USD	2015-10-31 17:00:00-07	2017-05-22 12:33:15.968-07	\N	t	Women Who Code (WWCode) is a global 501(c)(3) non-profit dedicated to inspiring women to excel in technology careers. We connect amazing women with other like-minded women around the globe who unite under one simple notion – the world of technology is better with women in it. \n\nWe work hard every day to inspire engineers to advance their careers. We strongly believe in the value of diversity, and envision a world where women are representative as technical executives, founders, venture capitalists, board members, and software engineers. \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events**](https://www.womenwhocode.com/events). \n\n[**Get Involved:**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Support**](https://opencollective.com/wwcode#support) WWCode financially by making a donation below\n\nYour donations are critical in supporting this catalytic movement. Donations received here directly support our programs. A small amount also supports global development so that we can bring innovative program to cities around the world, ensuring that more women everywhere have the opportunity to excel in technology careers.\n\nQuestions? Email us at contact@womenwhocode.com. 	https://opencollective-production.s3-us-west-1.amazonaws.com/50bd4ad0-769b-11e6-90e1-0dd449fe12b2.png	wwcode	http://womenwhocode.com	wwcode	We are on a mission to inspire women to excel in tech careers.	\N	10	{"HostId": 3, "lang":"wwcode","superCollectiveTag":"wwcode","githubOrg":"wwcode","style":{"hero": {"cover":{"background":"black"}}}}	{"githubContributors":{},"repos":{}}	{wwcode,meetup,"diversity in tech"}	t	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
430	WWCode Kyiv	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2017-01-03 16:00:00-08	2017-01-04 11:36:29.052-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Kyiv**](https://www.womenwhocode.com/kyiv). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdSGUMDGoRoh5mNYBxjxgH8Y4zBpu_BmtIr7fBiaSSGP1l-DA/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdSGUMDGoRoh5mNYBxjxgH8Y4zBpu_BmtIr7fBiaSSGP1l-DA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdSGUMDGoRoh5mNYBxjxgH8Y4zBpu_BmtIr7fBiaSSGP1l-DA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodekyiv#support) to support WWCode Kyiv \n\nQuestions? Email us at global@womenwhocode.com.  \n	\N	wwcodekyiv	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
261	WWCode Al-Jazair	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:49:43.012-07	2016-12-23 08:44:45.61-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Al-Jaza'ir**](https://www.womenwhocode.com/al-jaza-ir-algeria). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfOOP_9i3fvCk5qLWvXgQFbCRUSdTaWKt020uhR4XKrVDO8kQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfOOP_9i3fvCk5qLWvXgQFbCRUSdTaWKt020uhR4XKrVDO8kQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfOOP_9i3fvCk5qLWvXgQFbCRUSdTaWKt020uhR4XKrVDO8kQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodealjazair#support) to support WWCode Al-Jaza'ir\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/5cc6b9c0-9562-11e6-add0-93faa9a7296f.png	wwcodealjazair	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
59	WWCode Portland	We are women who code: in any framework with any level of experience from any size of company for any reason (even just for fun)!	USD	2016-03-18 17:00:00-07	2017-05-22 12:33:20.319-07	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Portland**](https://www.womenwhocode.com/portland). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScxNQfvu1iPbMjG52ufF21MfgnTY9F5f_SAFAR23q1RUIg55g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScxNQfvu1iPbMjG52ufF21MfgnTY9F5f_SAFAR23q1RUIg55g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScxNQfvu1iPbMjG52ufF21MfgnTY9F5f_SAFAR23q1RUIg55g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeportland#support) to support WWCode Portland \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/WoL-XXTWSH.png	wwcodeportland	https://www.womenwhocode.com/portland	WWCodePortland	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode","githubOrg":"wwcodeportland"}	{"githubContributors":{"caterinasworld":380,"rk101288":5,"jminnier":1,"sajoy":12,"cynful":12,"aliaward":8,"Tradcliffe":5,"thejensen":1,"morganpdx":8,"Ksan8":2},"repos":{"networking-nights":{"stars":1},"wwc-speaker-series":{"stars":1},"iot-hackathon-2016":{"stars":0},"study-nights":{"stars":32},"wwcodeportland.github.io":{"stars":7},"about-us":{"stars":1},"workshops":{"stars":0}}}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
273	WWCode Greenville	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:06:00.939-07	2016-12-27 08:48:30.075-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Greenville**](https://www.womenwhocode.com/greenville). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfWyfd359XuZOQpkrxOaCmrHL7KG26wpwC68qplJ6iJNuLtwg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfWyfd359XuZOQpkrxOaCmrHL7KG26wpwC68qplJ6iJNuLtwg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfWyfd359XuZOQpkrxOaCmrHL7KG26wpwC68qplJ6iJNuLtwg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodegreenville#support) to support WWCode Greenville \n\nQuestions? Email us at global@womenwhocode.com. 	https://opencollective-production.s3-us-west-1.amazonaws.com/d1719000-8fd7-11e6-b320-5125b901f984.png	wwcodegreenville	\N	wwcodegville	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
293	WWCode Waterloo	WWCode is a global non-profit organization that inspires women to excel in technology careers.	CAD	2016-09-29 11:30:54.225-07	2016-12-28 08:29:14.91-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Waterloo**](https://www.womenwhocode.com/waterloo). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfIMqJl5wn5hDsoRQBrehopXdebDkIZBYLjrrOMNIH9M8O47A/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfIMqJl5wn5hDsoRQBrehopXdebDkIZBYLjrrOMNIH9M8O47A/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfIMqJl5wn5hDsoRQBrehopXdebDkIZBYLjrrOMNIH9M8O47A/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodewaterloo#support) to support WWCode Waterloo\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/485e6710-a6d5-11e6-bdef-45bfa9f9c1b0.png	wwcodewaterloo	\N	womenwhocodekw	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
272	WWCode East Bay	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:05:19.056-07	2016-12-27 08:38:30.14-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Oakland/East Bay**](https://www.womenwhocode.com/east-bay). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeId0Km3sYr0AEQHjzzKsxoiDfn-HhIFPXBzg0V-t8F440Olg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeId0Km3sYr0AEQHjzzKsxoiDfn-HhIFPXBzg0V-t8F440Olg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeId0Km3sYr0AEQHjzzKsxoiDfn-HhIFPXBzg0V-t8F440Olg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeeastbay#support) to support WWCode Oakland/East Bay \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/d9a7fc70-9c5f-11e6-84fe-5d5e57220970.png	wwcodeeastbay	\N	wwcode_eastbay	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
277	WWCode Kuala Lumpur	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:10:43.356-07	2016-12-27 09:02:13.485-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Kuala Lumpur**](https://www.womenwhocode.com/kl). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodekualalumpur#support) to support WWCode Kuala Lumpur\n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/35b70760-cc56-11e6-be07-3dfc36c6d12c.png	wwcodekualalumpur	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
276	WWCode Kingston	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:09:42.765-07	2016-12-27 08:58:14.247-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Kingston**](https://www.womenwhocode.com/kingston). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeboston#support) to support WWCode Kingston \n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/a7236520-cc55-11e6-be07-3dfc36c6d12c.png	wwcodekingston	\N	wwcodekingston	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
241	WWCode Taipei	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-07 15:13:23.305-07	2016-12-28 07:57:33.798-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Taipei**](https://www.womenwhocode.com/taipei). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSc9XHX8FbeC1w6cKAZ_XjnVzC4cBb0hbvASXJ05soQA0SOlTA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSc9XHX8FbeC1w6cKAZ_XjnVzC4cBb0hbvASXJ05soQA0SOlTA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSc9XHX8FbeC1w6cKAZ_XjnVzC4cBb0hbvASXJ05soQA0SOlTA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodetaipei#support) to support WWCode Taipei \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/lGiwq5JAPy.png	wwcodetaipei	\N	wwcodetaipei	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
195	WWCode Boston	WWCode is a global non-profit organization that inspires women to excel in technology careers. 	USD	2015-12-12 16:14:54.028-08	2016-12-23 09:29:46.034-08	\N	t	Women Who Code (WWCode) is a global 501(c)(3) non-profit dedicated to inspiring women to excel in technology careers. We connect amazing women with other like-minded women around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 50,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Boston**](https://www.womenwhocode.com/boston). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an upcoming event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeboston#support) to support WWCode Boston \n\nQuestions?  Email global@womenwhocode.com	https://cldup.com/E6Hx_qyE9A.png	wwcodeboston	https://www.womenwhocode.com/boston	wwcboston	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
301	WWCode Berlin	WWCode is a global non-profit organization that inspires women to excel in technology careers.	EUR	2016-09-29 11:43:48.834-07	2016-12-23 09:11:29.559-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Berlin**](https://www.womenwhocode.com/berlin). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdJ94P4XoVzynK8rqZ4O5UaoenMUEtDlgJidbGvq5ed4yHBNg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdJ94P4XoVzynK8rqZ4O5UaoenMUEtDlgJidbGvq5ed4yHBNg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdJ94P4XoVzynK8rqZ4O5UaoenMUEtDlgJidbGvq5ed4yHBNg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeberlin#support) to support WWCode Berlin \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/81940c10-8fd8-11e6-b320-5125b901f984.png	wwcodeberlin	\N	wwcodeberlin	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
266	WWCode Brisbane	WWCode is a global non-profit organization that inspires women to excel in technology careers.	AUD	2016-09-29 10:59:15.405-07	2016-12-23 09:39:30.07-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Brisbane**](https://www.womenwhocode.com/brisbane). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeGniU6iD6vig-CTBWj9EVRLPCxz5ZrdLGoprkDZlGSVHZgOg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeGniU6iD6vig-CTBWj9EVRLPCxz5ZrdLGoprkDZlGSVHZgOg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeGniU6iD6vig-CTBWj9EVRLPCxz5ZrdLGoprkDZlGSVHZgOg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebrisbane#support) to support WWCode Brisbane\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/abcc78e0-c936-11e6-9af0-47fca5e686db.png	wwcodebrisbane	\N	wwcodebrisbane	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
297	WWCode Sydney	WWCode is a global non-profit organization that inspires women to excel in technology careers.	AUD	2016-09-29 11:34:59.472-07	2016-12-28 07:55:06.005-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Sydney**](https://www.womenwhocode.com/sydney-australia). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScZnIDanwBEgvSarNoteC9emDTvctZYwySJBJUKL2fcj9K-8Q/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScZnIDanwBEgvSarNoteC9emDTvctZYwySJBJUKL2fcj9K-8Q/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScZnIDanwBEgvSarNoteC9emDTvctZYwySJBJUKL2fcj9K-8Q/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesydney#support) to support WWCode Sydney \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/405f1180-a514-11e6-b4fe-6966ef500b6b.png	wwcodesydney	\N	wwcsyd	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
259	WWCode Birmingham	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:43:14.021-07	2016-12-23 09:19:36.878-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Birmingham**](https://www.womenwhocode.com/birmingham). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeOLUr8i4gqKg09Wt9ExEh_m4rnhZHR0BZFDodXc953DZ_NjQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeOLUr8i4gqKg09Wt9ExEh_m4rnhZHR0BZFDodXc953DZ_NjQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeOLUr8i4gqKg09Wt9ExEh_m4rnhZHR0BZFDodXc953DZ_NjQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebirmingham#support) to WWCode Birmingham financially by making a donation below\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f9d834f0-c933-11e6-9af0-47fca5e686db.png	wwcodebirmingham	\N	wwcbirmingham	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
12	Women Who Code Atlanta	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 16:00:00-08	2016-12-23 08:56:56.09-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Atlanta**](https://www.womenwhocode.com/atl). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdkKQPrNlXYI2XDQcYK8rpW9PwXHzEZPrcyLq074-GmTJtxJg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdkKQPrNlXYI2XDQcYK8rpW9PwXHzEZPrcyLq074-GmTJtxJg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdkKQPrNlXYI2XDQcYK8rpW9PwXHzEZPrcyLq074-GmTJtxJg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeatl#support) to support WWCode Atlanta\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/NzLkW4RcED.png	wwcodeatl	\N	wwcodeatl	We are on a mission to inspire women to excel in tech careers.	\N	25	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
278	WWCode London	WWCode is a global non-profit organization that inspires women to excel in technology careers.	GBP	2016-09-29 11:11:53.804-07	2016-12-27 09:29:43.796-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in London**](https://www.womenwhocode.com/london). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfksXAlw11lW_lHn5JMK3pLFTWY3f_LQn9zTBajKH4JHGmUEw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfksXAlw11lW_lHn5JMK3pLFTWY3f_LQn9zTBajKH4JHGmUEw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfksXAlw11lW_lHn5JMK3pLFTWY3f_LQn9zTBajKH4JHGmUEw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodelondon#support) WWCode London \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/8df462c0-9091-11e6-a134-f381d4cd2713.png	wwcodelondon	\N	wwclondon	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
267	WWCode Bristol 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	GBP	2016-09-29 11:00:01.773-07	2016-12-23 09:54:17.915-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Bristol**](https://www.womenwhocode.com/bristol). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeUCObM0_rq9q-EVLkiiYGCkSXaRVQyiM5bVNGBUHBvQhCeig/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeUCObM0_rq9q-EVLkiiYGCkSXaRVQyiM5bVNGBUHBvQhCeig/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeUCObM0_rq9q-EVLkiiYGCkSXaRVQyiM5bVNGBUHBvQhCeig/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebristol#support) to support WWCode Bristol \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/bea58950-c938-11e6-9af0-47fca5e686db.png	wwcodebristol	\N	wwcbristol	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
281	WWCode Melbourne	WWCode is a global non-profit organization that inspires women to excel in technology careers.	AUD	2016-09-29 11:14:46.59-07	2016-12-27 09:51:32.497-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Melbourne**](https://www.womenwhocode.com/melbourne). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemelbourne#support) to support WWCode Melbourne\n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/19756e50-cc5d-11e6-be07-3dfc36c6d12c.png	wwcodemelbourne	\N	WWCodeMelbourne	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
10	WWCode Mexico City	Nos dedicamos a inspirar inspirar a más mujeres a ser parte y destacar en carreras del mundo tecnológico.	MXN	2016-01-08 16:22:34.216-08	2016-12-27 09:59:26.298-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Mexico City**](https://www.womenwhocode.com/df). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfM35OQcwHB2moghLk3ZC1Vs-chWz_NkDdbEo984Sx1sa3Trg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfM35OQcwHB2moghLk3ZC1Vs-chWz_NkDdbEo984Sx1sa3Trg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfM35OQcwHB2moghLk3ZC1Vs-chWz_NkDdbEo984Sx1sa3Trg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedf#support) to support WWCode Mexico City \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/XMv1EFIxek.png	wwcodedf	http://www.meetup.com/Women-Who-Code-Mexico-City/	wwcodedf	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
270	WWCode Chicago	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:02:54.513-07	2016-12-23 11:48:12.132-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Chicago**](https://www.womenwhocode.com/chicago). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSe4Vang3taPJd47st_fHZyaQLG7jst0g9fjS7h8FbBpitGUNA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSe4Vang3taPJd47st_fHZyaQLG7jst0g9fjS7h8FbBpitGUNA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSe4Vang3taPJd47st_fHZyaQLG7jst0g9fjS7h8FbBpitGUNA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodechicago#support) to support WWCode Chicago \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/aef68840-9b9a-11e6-b592-e7f426067276.png	wwcodechicago	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
264	WWCode Belfast	WWCode is a global non-profit organization that inspires women to excel in technology careers.	GBP	2016-09-29 10:54:53.422-07	2016-12-23 09:01:33.569-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Belfast**](https://www.womenwhocode.com/belfast). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfRGOc9xuV0n4ltXd1p3xvb_TU_VaxEXxOYex6SVZQpJmH6Aw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfRGOc9xuV0n4ltXd1p3xvb_TU_VaxEXxOYex6SVZQpJmH6Aw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfRGOc9xuV0n4ltXd1p3xvb_TU_VaxEXxOYex6SVZQpJmH6Aw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebelfast#support) to support WWCode Belfast\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/e1bb8200-96e8-11e6-baa3-69f47ab52eed.png	wwcodebelfast	\N	WWCBelfast	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
284	WWCode Phoenix	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:16:52.055-07	2016-12-27 10:33:28.693-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Phoenix**](https://www.womenwhocode.com/phoenix). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScqaw9PNkcI8jaxCbAlvRF-xUQ75PBpHeRoOwI9zz87DRJHsg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScqaw9PNkcI8jaxCbAlvRF-xUQ75PBpHeRoOwI9zz87DRJHsg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScqaw9PNkcI8jaxCbAlvRF-xUQ75PBpHeRoOwI9zz87DRJHsg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodephoenix#support) to support WWCode Phoenix \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/dd27b4d0-9d45-11e6-9116-db595ff259df.png	wwcodephoenix	\N	wwcodephoenix	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
3	WWCode New York	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2015-12-12 16:14:54.028-08	2016-12-27 10:05:42.126-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in New York City**](https://www.womenwhocode.com/nyc). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSc7votVvy_Q06MsZNEjAbjI0c9WmQugN-YxRKOlLW4nu9DKtg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSc7votVvy_Q06MsZNEjAbjI0c9WmQugN-YxRKOlLW4nu9DKtg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSc7votVvy_Q06MsZNEjAbjI0c9WmQugN-YxRKOlLW4nu9DKtg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodenyc#support) to support WWCode New York City \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/sjus3sm9uv.png	wwcodenyc	http://www.meetup.com/WomenWhoCodeNYC/	wwcodenyc	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
300	WWCode Silicon Valley	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:41:11.03-07	2016-12-28 07:46:08.715-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Silicon Valley**](https://www.womenwhocode.com/sv). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfGn_wwztPhhOYJ4LqYvswg0y0ZpagWZkXA-a81y3WKLOW0nQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfGn_wwztPhhOYJ4LqYvswg0y0ZpagWZkXA-a81y3WKLOW0nQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfGn_wwztPhhOYJ4LqYvswg0y0ZpagWZkXA-a81y3WKLOW0nQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesv#support) to support WWCode Silicon Valley \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/cc80e4c0-90ad-11e6-a134-f381d4cd2713.png	wwcodesv	\N	wwcodesv	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
268	WWCode Charleston	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:01:04.477-07	2016-12-23 11:37:13.42-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Charleston**](https://www.womenwhocode.com/charleston). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfJBAX-EQdRtOiWJWxVJhKNKTiA2Hc09jduycgYjfSLH2U7Ig/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfJBAX-EQdRtOiWJWxVJhKNKTiA2Hc09jduycgYjfSLH2U7Ig/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfJBAX-EQdRtOiWJWxVJhKNKTiA2Hc09jduycgYjfSLH2U7Ig/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecharleston#support) to support WWCode Charleston\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/a185ed40-9b95-11e6-b592-e7f426067276.png	wwcodecharleston	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
4	WWCode San Francisco	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2015-12-12 16:14:54.028-08	2016-12-27 11:54:09.597-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in San Francisco**](https://www.womenwhocode.com/sf). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSebpozJA-r33FvptTT2XFNoV66gxMm0NZn1oVDV64A1VeW0GQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSebpozJA-r33FvptTT2XFNoV66gxMm0NZn1oVDV64A1VeW0GQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSebpozJA-r33FvptTT2XFNoV66gxMm0NZn1oVDV64A1VeW0GQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesf#support) to support WWCode San Francisco\n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/6kFcX-6H5l.png	wwcodesf	http://www.meetup.com/Women-Who-Code-SF	wwcodesf	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
285	WWCode Reno/Tahoe	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:17:47.232-07	2016-12-27 11:29:59.63-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Reno/Tahoe**](https://www.womenwhocode.com/reno). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdyKO3Q1OUzIokwJp2D0yb8C_Chkjf66O3WaQAWoiAnRegk_w/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdyKO3Q1OUzIokwJp2D0yb8C_Chkjf66O3WaQAWoiAnRegk_w/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdyKO3Q1OUzIokwJp2D0yb8C_Chkjf66O3WaQAWoiAnRegk_w/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcoderenotahoe#support) to support WWCode Reno/Tahoe\n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/caae3800-a2be-11e6-b669-1f602f2f2eec.png	wwcoderenotahoe	\N	WWCodeRenoTahoe	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
291	WWCode Toronto	WWCode is a global non-profit organization that inspires women to excel in technology careers.	CAD	2016-09-29 11:28:54.255-07	2016-12-28 08:20:52.347-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Toronto**](https://www.womenwhocode.com/toronto). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeEolspLAcmEXAfO8zKWGeTV1AIUXpI5KVKpTEGVwBol8J0bA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeEolspLAcmEXAfO8zKWGeTV1AIUXpI5KVKpTEGVwBol8J0bA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeEolspLAcmEXAfO8zKWGeTV1AIUXpI5KVKpTEGVwBol8J0bA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Global**](https://opencollective.com/wwcodetoronto#support) to support WWCode Toronto \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/6dbdcea0-a519-11e6-b4fe-6966ef500b6b.png	wwcodetoronto	\N	womenwhocodeto	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
13	WWCode Washington DC	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 16:00:00-08	2016-12-27 08:21:52.463-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Washington D.C.**](https://www.womenwhocode.com/dc). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfQTzXxQVzlXSGnqhaMVNhxtfPid3fMiQt5rSISqGy8FbNtIg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfQTzXxQVzlXSGnqhaMVNhxtfPid3fMiQt5rSISqGy8FbNtIg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfQTzXxQVzlXSGnqhaMVNhxtfPid3fMiQt5rSISqGy8FbNtIg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedc#support) to support WWCode Washington D.C. \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/rhyrbLvkli.png	wwcodedc	https://www.womenwhocode.com/dc	wwcodedc	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
686	Michelle Sun	\N	USD	2016-09-29 11:08:19.492-07	\N	\N	t	\N	\N	michellesun	\N	\N	\N	\N	\N	\N	{"UserId":1328}	{user}	f	\N	1328	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
687	Dana Dalling	\N	USD	2016-09-29 11:09:42.785-07	\N	\N	t	\N	\N	danadalling	\N	\N	\N	\N	\N	\N	{"UserId":1329}	{user}	f	\N	1329	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
271	WWCode Dallas	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:03:46.779-07	2016-12-27 08:14:29.745-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Dallas/Fort Worth**](https://www.womenwhocode.com/dfw). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSew2j5mt6negxggie47RRMNuerQSFs5T5IXVIFqrcsRyClWCg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSew2j5mt6negxggie47RRMNuerQSFs5T5IXVIFqrcsRyClWCg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSew2j5mt6negxggie47RRMNuerQSFs5T5IXVIFqrcsRyClWCg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedallas#support) to support WWCode Dallas/Fort Worth\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f1679990-9a18-11e6-8650-f92e594d5de8.png	wwcodedallas	\N	wwcodedfw	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
688	Xavier Damman	Entrepreneur sharing ideas in copyleft	USD	2015-11-05 05:44:30.93-08	\N	\N	t	Tell us more about you, why you are on OpenCollective, what types of collectives you would love to contribute to, etc.\n\nProtip: you can use [markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet);	https://opencollective-production.s3-us-west-1.amazonaws.com/5c825534ad62223ae6a539f6a5076d3cjpeg_1699f6e0-917c-11e6-a567-3f53b7b5f95c.jpeg	xdamman	http://xdamman.com	xdamman	\N	\N	\N	\N	{"UserId":2}	{user}	f	\N	2	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
689	MakerSquare 	\N	USD	2016-03-02 13:31:50.497-08	\N	\N	t	\N	https://course_report_production.s3.amazonaws.com/rich/rich_files/rich_files/268/s300/makersquare-logo.png	makersquare	http://www.makersquare.com	MakerSquareATX	\N	\N	\N	\N	{"UserId":129}	{user}	f	\N	129	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
690	WWCode 	\N	USD	2017-02-21 08:55:29.631-08	\N	\N	t	\N	\N	global	\N	\N	\N	\N	\N	\N	{"UserId":3206}	{user}	f	\N	3206	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
691	Pia Mancini	\N	USD	2016-01-09 13:31:01.954-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/9EflVQqM_400x400jpg_2aee92e0-858d-11e6-9fd7-73dd31eb7c0c.jpeg	piamancini	\N	piamancini	\N	\N	\N	\N	{"UserId":30}	{user}	f	\N	30	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
693	Georgia Andrews	\N	USD	\N	\N	\N	t	\N	\N	georgia	\N	\N	\N	\N	\N	\N	{"UserId":577}	{user}	f	\N	577	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
692	null null	\N	USD	2017-02-01 09:30:43.176-08	\N	\N	t	\N	\N	androidchick88	\N	\N	\N	\N	\N	\N	{"UserId":2906}	{user}	f	\N	2906	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
694	Anne Brown	\N	USD	2017-04-11 19:05:32.736-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/92dd7480-1f24-11e7-9a73-15e29bd9381e.png	abrown1411	\N	\N	\N	\N	\N	\N	{"UserId":4173}	{user}	f	\N	4173	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
695	Chee Yim Goh	 I am generalist who are curious about a lot of things and often find myself dabble in both technical and management.	USD	2016-09-29 11:10:43.391-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/b06d105a90d849daae3cee823078ffbc_4c27ac00-0dcb-11e7-92a0-730911003b33.jpeg	cheeyimgoh	\N	\N	\N	\N	\N	\N	{"UserId":1331}	{user}	f	\N	1331	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
696	Women Who Code	\N	MXN	2015-11-19 02:07:53.479-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/wwcode_Final20Logojpg_abb42770-0335-11e7-9b56-cb401d104ebf.jpeg	adminwwc	https://www.womenwhocode.com/	\N	\N	\N	\N	\N	{"UserId":3}	{user}	f	\N	3	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
697	Sarah Olson	Director of Women Who Code Twin Cities	USD	2016-03-07 01:51:08.328-08	\N	\N	t	I'm a Senior Software Engineer, currently working on the iOS app at Trello. I'm the Director of Women Who Code Twin Cities.	https://opencollective-production.s3-us-west-1.amazonaws.com/306b9860-dd87-11e6-aabd-af731cff2f24.jpeg	saraholson	https://www.linkedin.com/in/saraheolson	\N	\N	\N	\N	\N	{"UserId":142}	{user}	f	\N	142	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
698	Tamouse Temple	\N	USD	2017-01-18 05:49:53.082-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/8e79f1498f3e4a4ab53bec89d5dfc1e5_43f16060-dd85-11e6-bf52-5b99c6274a65.jpeg	tamouse1	http://www.tamouse.org	tamouse	\N	\N	\N	\N	{"UserId":2594}	{user}	f	\N	2594	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
699	Karina 	I am web developer, Director WWcode Recife - Brazil	USD	2016-09-29 11:19:11.45-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/a6711e2eef3c42dbaa7b9e658670e44e_65470050-13c0-11e7-8edd-59205a885cb5.jpeg	karinamachado	\N	\N	\N	\N	\N	\N	{"UserId":1344}	{user}	f	\N	1344	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
700	Cameron 🐳✨	\N	USD	2016-12-18 17:41:26.473-08	\N	\N	t	\N	\N	cameron1	\N	\N	\N	\N	\N	\N	{"UserId":2220}	{user}	f	\N	2220	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
701	Amanda Folson	\N	USD	2017-01-16 10:03:53.479-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/2150894e-87e2-4dab-8ffa-894342f0336b	ambassadorawsum	http://amandafolson.net/about/#twitter	AmbassadorAwsum	\N	\N	\N	\N	{"UserId":2561}	{user}	f	\N	2561	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
702	Portland Modern Manufacturing Collective	\N	USD	2016-11-22 07:22:35.912-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/8cb68090-b0c7-11e6-8d75-191d15208aa9.png	mrlnmarce	http://www.uncorkedstudios.com	mrlnmarce	\N	\N	\N	\N	{"UserId":1846}	{user}	f	\N	1846	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
703	Shirley Hicks	Network director, Women Who Code Birmingham	USD	2016-09-29 10:43:14.052-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/7d7b2ba6c0a24e269f7853f4eb9fdced_72776110-b138-11e6-afe2-6129fbf4c498.png	shirleyhicks	\N	\N	\N	\N	\N	\N	{"UserId":1303}	{user}	f	\N	1303	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
704	Nataliia Ilchenko	WWCode Kyiv Director	USD	2017-01-03 16:00:00-08	\N	\N	t	\N	/public/images/users/avatar-04.svg	nataliia	\N	\N	\N	\N	\N	\N	{"UserId":2431}	{user}	f	\N	2431	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
705	Alaina Percival	\N	USD	2016-03-01 20:41:59.905-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/fb1f0fd9-4da7-4c66-847b-0eaaf5fe88e9	alaina	http://womenwhocode.com	alaina	\N	\N	\N	\N	{"UserId":126}	{user}	f	\N	126	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
706	Afia Owusu-Forfie	\N	USD	2016-09-29 10:44:40.419-07	\N	\N	t	\N	\N	afiaowusu-forfie	\N	\N	\N	\N	\N	\N	{"UserId":1304}	{user}	f	\N	1304	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
707	Snehal Patil	\N	USD	2016-09-29 11:41:11.059-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/eea1cd90-adc6-11e6-97ba-67ed1cda3697.png	snehalpatil	\N	\N	\N	\N	\N	\N	{"UserId":1374}	{user}	f	\N	1374	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
708	Wooga 	\N	USD	2016-11-29 02:03:21.301-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/24be6ad0-b61b-11e6-9f3b-115a2450f71e.jpg	maikesteinweller	http://www.wooga.com	wooga	\N	\N	\N	\N	{"UserId":1908}	{user}	f	\N	1908	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
709	Rigado 	\N	USD	2016-11-17 09:43:26.15-08	\N	\N	t	\N	https://logo.clearbit.com/rigado.com	christinepechette	https://www.rigado.com/	RigadoLLC	\N	\N	\N	\N	{"UserId":1808}	{user}	f	\N	1808	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
710	Kelly Erickson	\N	USD	2017-01-03 12:59:33.995-08	\N	\N	t	\N	\N	kellyerickson	\N	\N	\N	\N	\N	\N	{"UserId":2416}	{user}	f	\N	2416	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
711	Maddy Lau	\N	USD	2016-11-30 08:11:38.749-08	\N	\N	t	\N	https://logo.clearbit.com/nycda.com	maddylau	http://nycda.com	nycodedesign	\N	\N	\N	\N	{"UserId":1957}	{user}	f	\N	1957	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
712	Kristine Paas	\N	USD	2017-05-08 22:59:11.628-07	\N	\N	t	\N	\N	kjcpaas	\N	\N	\N	\N	\N	\N	{"UserId":4711}	{user}	f	\N	4711	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
713	Wei-Juin Lin	\N	USD	2016-10-07 09:49:14.297-07	\N	\N	t	\N	\N	wei-juinlin	\N	\N	\N	\N	\N	\N	{"UserId":1446}	{user}	f	\N	1446	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
714	Hector Torres	\N	USD	2016-10-06 11:36:34.986-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/7aOKGnA1_normaljpg_f6ea41c0-8bf3-11e6-8916-b3b1b8ac2e00.jpeg	hectortorres	http://summit.ulahealth.me	ulahealth	\N	\N	\N	\N	{"UserId":1438}	{user}	f	\N	1438	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
715	Britten Kuckelman	\N	USD	2016-09-29 11:32:00.979-07	\N	\N	t	\N	\N	brittenkuckelman	\N	\N	\N	\N	\N	\N	{"UserId":1357}	{user}	f	\N	1357	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
716	Ksenia Barshchyk	\N	USD	2016-09-29 11:30:08.971-07	\N	\N	t	\N	\N	kseniabarshchyk	\N	\N	\N	\N	\N	\N	{"UserId":1354}	{user}	f	\N	1354	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
717	Sarrah Vesselov	\N	USD	2016-09-29 11:28:08.475-07	\N	\N	t	\N	\N	sarrahvesselov	\N	\N	\N	\N	\N	\N	{"UserId":1352}	{user}	f	\N	1352	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
718	Grain 	\N	USD	2016-09-20 13:58:49.633-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/grainappio_20c2d740-7f75-11e6-998a-b5046561186d.png	grain_app	https://grainapp.io	grain_app	\N	\N	\N	\N	{"UserId":1244}	{user}	f	\N	1244	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
719	Travis Swicegood	\N	USD	2016-05-19 12:24:40.738-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/03134eb6a2764594808716e5c3f0dc6c_690fce70-1df7-11e6-b09a-bd4f4a904ffe.jpeg	tswicegood	http://www.travisswicegood.com	tswicegood	\N	\N	\N	\N	{"UserId":392}	{user}	f	\N	392	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
720	Dinah Shi	\N	USD	2016-09-29 11:30:54.244-07	\N	\N	t	\N	\N	dinahshi	\N	\N	\N	\N	\N	\N	{"UserId":1356}	{user}	f	\N	1356	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
721	Ria Riaz	\N	USD	2016-09-29 11:28:54.276-07	\N	\N	t	\N	\N	riariaz	\N	\N	\N	\N	\N	\N	{"UserId":1353}	{user}	f	\N	1353	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
723	Yoka Liu	\N	USD	2016-09-29 11:26:35.139-07	\N	\N	t	\N	\N	yokaliu	\N	\N	\N	\N	\N	\N	{"UserId":1350}	{user}	f	\N	1350	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
726	Barbara 	\N	USD	2016-01-29 15:19:28.648-08	\N	\N	t	\N	\N	barbara	\N	\N	\N	\N	\N	\N	{"UserId":73}	{user}	f	\N	73	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
728	Ashma Sethi	\N	USD	2016-09-29 11:24:17.802-07	\N	\N	t	\N	\N	ashmasethi	\N	\N	\N	\N	\N	\N	{"UserId":1345}	{user}	f	\N	1345	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
730	Jennifer Hoover	\N	USD	2016-09-29 11:16:52.099-07	\N	\N	t	\N	\N	jenniferhoover	\N	\N	\N	\N	\N	\N	{"UserId":1341}	{user}	f	\N	1341	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
733	Princy James	\N	USD	2016-09-29 11:14:46.606-07	\N	\N	t	\N	\N	princyjames	\N	\N	\N	\N	\N	\N	{"UserId":1338}	{user}	f	\N	1338	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
739	thirteen23 	\N	USD	2016-09-01 07:41:33.243-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/thirteen23com_805f0980-7052-11e6-8e5a-492f532f3a40.png	thirteen23	http://www.thirteen23.com	thirteen23	\N	\N	\N	\N	{"UserId":1094}	{user}	f	\N	1094	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
744	KeSha Shah	\N	USD	2016-09-29 11:06:44.745-07	\N	\N	t	\N	\N	keshashah	\N	\N	\N	\N	\N	\N	{"UserId":1326}	{user}	f	\N	1326	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
757	Marisol Acuna	\N	USD	2016-09-29 11:25:21.95-07	\N	\N	t	\N	\N	marisolacuna	\N	\N	\N	\N	\N	\N	{"UserId":1347}	{user}	f	\N	1347	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
763	Eileen C	\N	USD	2017-01-14 09:11:39.224-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/7be57fdf74ce40868c36ec561b515b9d_8a6a4900-da7c-11e6-af11-676b2b71a93b.jpeg	eileenc	\N	\N	\N	\N	\N	\N	{"UserId":2549}	{user}	f	\N	2549	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
769	Maru Lango	\N	USD	2016-02-02 08:52:02.222-08	\N	\N	t	\N	https://res.cloudinary.com/opencollective/image/upload/v1483038929/8vJ-Prbe_imotym.png	marulango	http://maruma.ru	Marulango	\N	\N	\N	\N	{"UserId":80}	{user}	f	\N	80	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
771	Smitha Radhakrishnan	\N	USD	2016-09-29 10:51:29.334-07	\N	\N	t	\N	\N	smitharadhakrishnan	\N	\N	\N	\N	\N	\N	{"UserId":1310}	{user}	f	\N	1310	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
775	Elizabeth Ferrao	\N	USD	2016-01-29 15:19:22.243-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/0addaf63-25c3-4f61-85bd-9ddec639dbaa	musingmurmurs	\N	MusingMurmurs	\N	\N	\N	\N	{"UserId":72}	{user}	f	\N	72	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
781	Fatma Djoudjou	\N	USD	2016-09-29 10:49:43.051-07	\N	\N	t	\N	\N	fatmadjoudjou	\N	\N	\N	\N	\N	\N	{"UserId":1307}	{user}	f	\N	1307	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
786	Lacey Reinoehl	\N	USD	2017-05-01 10:13:32.139-07	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/8207c9a5-55ed-41a7-a238-4ef4d22a6059	laceyreinoehl	\N	\N	\N	\N	\N	\N	{"UserId":4550}	{user}	f	\N	4550	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
787	Carola Nitz	\N	USD	2016-09-29 11:43:49.157-07	\N	\N	t	\N	\N	carolanitz	\N	\N	\N	\N	\N	\N	{"UserId":1376}	{user}	f	\N	1376	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
792	Sonia Prabhu	\N	USD	2016-09-29 11:41:11.058-07	\N	\N	t	\N	\N	soniaprabhu	\N	\N	\N	\N	\N	\N	{"UserId":1373}	{user}	f	\N	1373	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
795	Radhika Rayadu	\N	USD	2016-09-29 11:41:11.058-07	\N	\N	t	\N	\N	radhikarayadu	\N	\N	\N	\N	\N	\N	{"UserId":1372}	{user}	f	\N	1372	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
796	data.world Swider	\N	USD	2016-09-28 14:47:14.881-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/dataworld_6f037d50-85c5-11e6-9fd7-73dd31eb7c0c.png	gabrielaswider	http://data.world	datadotworld	\N	\N	\N	\N	{"UserId":1299}	{user}	f	\N	1299	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
799	Cisco 	\N	USD	2016-04-29 11:46:16.143-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/dAmHQYgjpg_6d4cc930-1130-11e6-9815-b7ee6884387f.jpg	cisco	http://cisco.com	cisco	\N	\N	\N	\N	{"UserId":308}	{user}	f	\N	308	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
800	Brian Vinci	\N	USD	2017-05-15 05:07:56.682-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/4fc0a750-3967-11e7-955e-43d656f05f49.jpg	brian1	http://expeditionhacks.com/seattle	expeditionhacks	\N	\N	\N	\N	{"UserId":4834}	{user}	f	\N	4834	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
810	Paige Hubbell	\N	USD	2016-03-19 15:11:44.881-07	\N	\N	t	\N	\N	phubbell	\N	\N	\N	\N	\N	\N	{"UserId":170}	{user}	f	\N	170	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
821	Bonsai.io 	\N	USD	2016-04-13 09:46:07.217-07	\N	\N	t	\N	https://img.stackshare.io/service/228/c0daef6c2bf692d268e53a799111789c.png	bonsai	https://bonsai.io/	bonsaisearch	\N	\N	\N	\N	{"UserId":224}	{user}	f	\N	224	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
829	Himi Sato	\N	USD	2016-09-29 11:33:37.087-07	\N	\N	t	\N	\N	himisato	\N	\N	\N	\N	\N	\N	{"UserId":1359}	{user}	f	\N	1359	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
835	Alicia 	\N	USD	2016-01-29 15:18:47.287-08	\N	\N	t	\N	\N	alicia	\N	\N	\N	\N	\N	\N	{"UserId":69}	{user}	f	\N	69	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
840	Rackspace 	\N	USD	2016-08-01 08:54:10.844-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/rackspacecom_a7d669f0-5800-11e6-a2a8-bb3ee7158535.png	rackspace	https://www.rackspace.com/	rackspace	\N	\N	\N	\N	{"UserId":883}	{user}	f	\N	883	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
841	Craft CMS	Content-first. Faceless like Jaqen.	USD	2017-04-20 02:34:08.219-07	\N	\N	t	Craft is a content-first CMS that aims to make life enjoyable for developers and content managers alike. It’s the tool of choice for thousands of [remarkably attractive](https://craftcms.com/community) web professionals around the world.	https://opencollective-production.s3-us-west-1.amazonaws.com/8e9cfe00-25ae-11e7-8c00-677620cd0201.png	craftcms	https://craftcms.com	craftcms	\N	\N	\N	\N	{"UserId":4348}	{user}	f	\N	4348	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
295	WWCode Tokyo	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:33:36.887-07	2016-12-28 08:00:36.071-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Tokyo**](https://www.womenwhocode.com/tokyo). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScKx7EivU4MO7pQbVNjLObcYqr0lt1W5az41EDV15bbGtJUSg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScKx7EivU4MO7pQbVNjLObcYqr0lt1W5az41EDV15bbGtJUSg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScKx7EivU4MO7pQbVNjLObcYqr0lt1W5az41EDV15bbGtJUSg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodetokyo#support) to support WWCode Tokyo \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/bf15e4a0-a518-11e6-b4fe-6966ef500b6b.png	wwcodetokyo	\N	wwcode_tokyo	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
722	Kathy Trammell	\N	USD	2016-09-29 11:28:08.47-07	\N	\N	t	\N	\N	kathytrammell	\N	\N	\N	\N	\N	\N	{"UserId":1351}	{user}	f	\N	1351	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
724	Qianyi Zheng	\N	USD	2016-09-29 11:26:35.133-07	\N	\N	t	\N	\N	qianyizheng	\N	\N	\N	\N	\N	\N	{"UserId":1349}	{user}	f	\N	1349	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
727	Shruti Sethi	\N	USD	2016-09-29 11:24:17.81-07	\N	\N	t	\N	\N	shrutisethi	\N	\N	\N	\N	\N	\N	{"UserId":1346}	{user}	f	\N	1346	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
729	Andreza Leite	\N	USD	2016-09-29 11:19:11.446-07	\N	\N	t	\N	\N	andrezaleite	\N	\N	\N	\N	\N	\N	{"UserId":1343}	{user}	f	\N	1343	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
731	Veronica Cannon	\N	USD	2016-09-29 11:17:47.289-07	\N	\N	t	\N	\N	veronicacannon	\N	\N	\N	\N	\N	\N	{"UserId":1342}	{user}	f	\N	1342	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
732	Emily Reese	\N	USD	2016-09-29 11:16:17.115-07	\N	\N	t	\N	\N	emilyreese	\N	\N	\N	\N	\N	\N	{"UserId":1340}	{user}	f	\N	1340	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
738	Vinita Khandelwal Rathi	\N	USD	2016-09-29 11:11:53.843-07	\N	\N	t	\N	\N	vinitakhandelwalrathi	\N	\N	\N	\N	\N	\N	{"UserId":1334}	{user}	f	\N	1334	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
748	Elijah Van Der Giessen	\N	USD	2017-05-10 16:45:43.307-07	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/d7d17c0e-20b0-40ae-a128-eaf85a311f0c	eli	\N	\N	\N	\N	\N	\N	{"UserId":4749}	{user}	f	\N	4749	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
750	Carole Bennett	\N	USD	2016-09-29 11:03:46.798-07	\N	\N	t	\N	\N	carolebennett	\N	\N	\N	\N	\N	\N	{"UserId":1322}	{user}	f	\N	1322	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
753	Amber Houle	\N	USD	2016-09-29 11:02:54.546-07	\N	\N	t	\N	\N	amberhoule	\N	\N	\N	\N	\N	\N	{"UserId":1320}	{user}	f	\N	1320	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
754	Neha Kaura	\N	USD	2016-09-29 11:01:49.703-07	\N	\N	t	\N	\N	nehakaura	\N	\N	\N	\N	\N	\N	{"UserId":1319}	{user}	f	\N	1319	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
762	Isabella Oliveira	\N	USD	2016-09-29 10:58:16.63-07	\N	\N	t	\N	\N	isabellaoliveira	\N	\N	\N	\N	\N	\N	{"UserId":1315}	{user}	f	\N	1315	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
767	Sandra 	\N	USD	2016-01-11 10:53:43.73-08	\N	\N	t	\N	https://media.licdn.com/media/p/1/000/056/1e1/1c4c4e1.jpg	sandrawwc	\N	\N	\N	\N	\N	\N	{"UserId":31}	{user}	f	\N	31	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
772	Lindsey Barrett	\N	USD	2016-06-22 13:09:43.896-07	\N	\N	t	\N	\N	lindseybarrett	\N	\N	\N	\N	\N	\N	{"UserId":646}	{user}	f	\N	646	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
777	Christina Lynch	\N	USD	2016-09-29 11:37:07.344-07	\N	\N	t	\N	\N	christinalynch	\N	\N	\N	\N	\N	\N	{"UserId":1367}	{user}	f	\N	1367	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
790	Lucy Shang	\N	USD	2016-09-29 10:53:00.502-07	\N	\N	t	\N	\N	lucyshang	\N	\N	\N	\N	\N	\N	{"UserId":1311}	{user}	f	\N	1311	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
802	null null	\N	USD	2017-02-01 07:16:17.461-08	\N	\N	t	\N	\N	ericalucaterochapman	\N	\N	\N	\N	\N	\N	{"UserId":2898}	{user}	f	\N	2898	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
811	Jamie Lu	\N	USD	2016-11-28 07:33:11.726-08	\N	\N	t	\N	https://logo.clearbit.com/narrativescience.com	jamielu	http://www.narrativescience.com	\N	\N	\N	\N	\N	{"UserId":1890}	{user}	f	\N	1890	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
812	Laura Uzcátegui	\N	USD	2016-09-29 11:37:07.337-07	\N	\N	t	\N	\N	laurauzcátegui	\N	\N	\N	\N	\N	\N	{"UserId":1365}	{user}	f	\N	1365	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
817	Brenda 	\N	USD	2016-01-29 15:19:12.899-08	\N	\N	t	\N	\N	brenda	\N	\N	\N	\N	\N	\N	{"UserId":71}	{user}	f	\N	71	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
818	Kaylyn 	\N	USD	2016-01-11 10:57:18.467-08	\N	\N	t	\N	https://res.cloudinary.com/opencollective/image/upload/v1483039249/i8n9dw-4_vxdyyi.jpg	kgibilterra	\N	\N	\N	\N	\N	\N	{"UserId":33}	{user}	f	\N	33	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
819	Aya Nakagawa	\N	USD	2016-09-29 11:33:37.088-07	\N	\N	t	\N	\N	ayanakagawa	\N	\N	\N	\N	\N	\N	{"UserId":1360}	{user}	f	\N	1360	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
831	Gen Ashley	Director, Women Who Code London	USD	2016-09-29 11:11:53.842-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/f739ff80-86fd-11e6-9561-f9be8e5da60b.jpeg	genashley	\N	\N	\N	\N	\N	\N	{"UserId":1333}	{user}	f	\N	1333	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
832	Jecelyn 	\N	USD	2016-09-29 11:10:43.392-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/8146ec1d435a48c9a5f9d45600963c05_98566490-0ab0-11e7-85e3-cf8c26b6ca26.jpeg	jecelynyeen	\N	\N	\N	\N	\N	\N	{"UserId":1332}	{user}	f	\N	1332	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
834	Laura Scholl	\N	USD	2016-09-29 11:32:00.983-07	\N	\N	t	\N	\N	laurascholl	\N	\N	\N	\N	\N	\N	{"UserId":1358}	{user}	f	\N	1358	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
836	Karen Farzam	\N	USD	2016-09-29 11:08:19.487-07	\N	\N	t	\N	\N	karenfarzam	\N	\N	\N	\N	\N	\N	{"UserId":1327}	{user}	f	\N	1327	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
837	Allie Winkelman	\N	USD	2017-04-04 12:51:02.718-07	\N	\N	t	\N	\N	lwinkelman	\N	\N	\N	\N	\N	\N	{"UserId":3999}	{user}	f	\N	3999	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
842	Erin Spiceland	\N	USD	2017-03-07 11:01:52.704-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/4dedad77-5def-4d84-8e72-47bf0051649c	erin	\N	\N	\N	\N	\N	\N	{"UserId":3419}	{user}	f	\N	3419	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
844	Pamela Wood Browne	\N	USD	2016-09-29 11:06:00.962-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/f08e3667929b4091bb398793543c458b_3c79dff0-89a8-11e6-b81f-a9802cdb670c.jpeg	pamelawoode-browne	\N	\N	\N	\N	\N	\N	{"UserId":1325}	{user}	f	\N	1325	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
845	Jigyasa Grover	\N	USD	2016-03-07 01:50:58.721-08	\N	\N	t	\N	https://res.cloudinary.com/opencollective/image/upload/v1483042743/ext_a8caeh.jpg	jigyasagrover	https://www.linkedin.com/in/jigyasagrover	\N	\N	\N	\N	\N	{"UserId":141}	{user}	f	\N	141	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
524	Women Who Code Barcelona	\N	EUR	2017-02-21 12:11:44.714-08	2017-02-21 12:13:31.987-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfyIV5MJgha1rYTlKdJ9frxSrFW55jGltiYpumAdsqCE8heKQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/barcelona) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfyIV5MJgha1rYTlKdJ9frxSrFW55jGltiYpumAdsqCE8heKQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfyIV5MJgha1rYTlKdJ9frxSrFW55jGltiYpumAdsqCE8heKQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebarcelona#support) to support WWCode Barcelona\n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodebarcelona	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
725	Roxane Castelein	\N	USD	2016-09-29 11:25:21.969-07	\N	\N	t	\N	\N	roxanecastelein	\N	\N	\N	\N	\N	\N	{"UserId":1348}	{user}	f	\N	1348	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
737	Pieceofr 	\N	USD	2016-09-09 20:42:48.933-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/2c8df290-7709-11e6-a96a-b97f0af14723.jpg	pieceofr	\N	\N	\N	\N	\N	\N	{"UserId":1158}	{user}	f	\N	1158	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
740	Jane Shih	\N	USD	2016-09-07 15:13:23.624-07	\N	\N	t	\N	\N	janeshih	\N	\N	\N	\N	\N	\N	{"UserId":1145}	{user}	f	\N	1145	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
741	FJ Genus	\N	USD	2016-09-29 11:09:42.794-07	\N	\N	t	\N	\N	fjgenus	\N	\N	\N	\N	\N	\N	{"UserId":1330}	{user}	f	\N	1330	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
746	Maira Bejamin	\N	USD	2016-09-29 11:05:19.073-07	\N	\N	t	\N	\N	mairabejamin	\N	\N	\N	\N	\N	\N	{"UserId":1323}	{user}	f	\N	1323	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
749	Radhika Malik	\N	USD	2016-08-02 17:00:00-07	\N	\N	t	\N	\N	radhikam	\N	\N	\N	\N	\N	\N	{"UserId":897}	{user}	f	\N	897	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
751	New York Code + Design Academy (Austin)	\N	USD	2016-08-01 08:55:23.132-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/rlc8ysokffcsnalr5jav_normalgif_7ff2c640-5800-11e6-a2a8-bb3ee7158535.gif	nycda	http://nycda.com/austin	atxcodedesign	\N	\N	\N	\N	{"UserId":884}	{user}	f	\N	884	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
755	Polson & Polson, P.C.	\N	USD	2017-03-09 10:29:51.939-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/9R0XXM9_normalpng_75889240-04f6-11e7-8ab4-9b0a3890c09e.png	nalini	http://www.polsonlawfirm.com/	\N	\N	\N	\N	\N	{"UserId":3442}	{user}	f	\N	3442	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
758	Sally Kingston	\N	USD	2016-09-29 11:01:04.636-07	\N	\N	t	\N	\N	sallykingston	\N	\N	\N	\N	\N	\N	{"UserId":1318}	{user}	f	\N	1318	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
764	beth laing	\N	USD	2016-01-29 15:18:53.83-08	\N	\N	t	\N	\N	beth	\N	\N	\N	\N	\N	\N	{"UserId":70}	{user}	f	\N	70	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
770	Oksana Denesiuk	\N	USD	2016-09-29 11:30:08.978-07	\N	\N	t	\N	\N	oksanadenesiuk	\N	\N	\N	\N	\N	\N	{"UserId":1355}	{user}	f	\N	1355	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
774	Zoe Madden-Wood	\N	USD	2016-01-29 15:19:53.922-08	\N	\N	t	\N	\N	zoemadden-wood	\N	\N	\N	\N	\N	\N	{"UserId":77}	{user}	f	\N	77	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
779	Fanya 	\N	USD	2016-01-29 15:20:00.061-08	\N	\N	t	\N	\N	fanya	\N	\N	\N	\N	\N	\N	{"UserId":78}	{user}	f	\N	78	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
783	Judith Agbotse	\N	USD	2016-09-29 10:44:40.429-07	\N	\N	t	\N	\N	judithagbotse	\N	\N	\N	\N	\N	\N	{"UserId":1305}	{user}	f	\N	1305	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
797	Guiti Nabavi	\N	USD	2016-09-29 11:41:11.052-07	\N	\N	t	\N	\N	guitinabavi	\N	\N	\N	\N	\N	\N	{"UserId":1371}	{user}	f	\N	1371	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
803	Erika Aguayo	\N	USD	2016-09-29 11:38:54.935-07	\N	\N	t	\N	\N	erikaaguayo	\N	\N	\N	\N	\N	\N	{"UserId":1369}	{user}	f	\N	1369	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
813	Peggy Kuo	\N	USD	2016-09-29 11:34:59.505-07	\N	\N	t	\N	\N	peggykuo	\N	\N	\N	\N	\N	\N	{"UserId":1364}	{user}	f	\N	1364	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
816	Daphne Chong	\N	USD	2016-09-29 11:34:59.499-07	\N	\N	t	\N	\N	daphnechong	\N	\N	\N	\N	\N	\N	{"UserId":1362}	{user}	f	\N	1362	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
822	Marcela Lango	\N	USD	2015-11-19 02:09:51.192-08	\N	\N	t	\N	https://pbs.twimg.com/profile_images/445400536569749504/8vJ-Prbe.png	maru	\N	\N	\N	\N	\N	\N	{"UserId":7}	{user}	f	\N	7	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
823	Fernanda 	\N	USD	2016-01-11 11:02:41.058-08	\N	\N	t	\N	https://media.licdn.com/media/AAEAAQAAAAAAAAJzAAAAJGZiYzM3MzEyLTVkYzgtNDg2Mi04Yzg3LWI1NDM0NDhhZjRhNQ.jpg	fsantander	\N	\N	\N	\N	\N	\N	{"UserId":37}	{user}	f	\N	37	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
828	Caterina Paun	Director, WWCode Portland	USD	2016-03-19 15:11:53.101-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/7446276v3s466_4d6a9940-90b9-11e6-a134-f381d4cd2713.png	cpaun	\N	\N	\N	\N	\N	\N	{"UserId":171}	{user}	f	\N	171	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
833	Mami Enomoto	\N	USD	2016-09-29 11:33:37.095-07	\N	\N	t	\N	\N	mamienomoto	\N	\N	\N	\N	\N	\N	{"UserId":1361}	{user}	f	\N	1361	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
839	Flock: Accelerating Women In Tech	\N	USD	2017-02-09 12:42:02.01-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/findmyflockcom_b7503b70-efb0-11e6-bcba-ed56440ee54a.png	kate	http://www.findmyflock.com	FindMyFlock	\N	\N	\N	\N	{"UserId":3053}	{user}	f	\N	3053	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
521	Women Who Code Raleigh Durham	\N	USD	2017-02-21 11:39:46.205-08	2017-02-21 11:41:19.26-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSf0bA8m8nAIKsVtnstXcG1fYydPvvu_sHm-zm-FzTngTAQvzg/viewform)\n\n[**Attend**](https://www.womenwhocode.com/raleigh) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSf0bA8m8nAIKsVtnstXcG1fYydPvvu_sHm-zm-FzTngTAQvzg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSf0bA8m8nAIKsVtnstXcG1fYydPvvu_sHm-zm-FzTngTAQvzg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcoderaleigh#support) to support WWCode Raleigh Durham \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcoderaleigh	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
2	WWCode Austin	WWCode is a global non-profit organization that inspires women to excel in technology careers. 	USD	2015-12-12 16:14:54.028-08	2016-12-23 07:30:21.805-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Austin**](https://www.womenwhocode.com/austin). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeAl3dRRR312S1CcQonYE72JDumGhpuh6G9INhyrJxOM1w16g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeAl3dRRR312S1CcQonYE72JDumGhpuh6G9INhyrJxOM1w16g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeAl3dRRR312S1CcQonYE72JDumGhpuh6G9INhyrJxOM1w16g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeaustin#support) to support WWCode Austin \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/mX6wUEonFH.png	wwcodeaustin	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
734	Grisel Ancona	\N	USD	2016-09-29 11:15:23.931-07	\N	\N	t	\N	\N	griselancona	\N	\N	\N	\N	\N	\N	{"UserId":1339}	{user}	f	\N	1339	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
735	Isabel Yepes	\N	USD	2016-09-29 11:13:48.772-07	\N	\N	t	\N	\N	isabelyepes	\N	\N	\N	\N	\N	\N	{"UserId":1337}	{user}	f	\N	1337	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
745	Candace Lazarou	\N	USD	2016-09-29 11:05:19.079-07	\N	\N	t	\N	\N	candacelazarou	\N	\N	\N	\N	\N	\N	{"UserId":1324}	{user}	f	\N	1324	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
747	Casey Gruppioni	\N	USD	2016-08-02 17:00:00-07	\N	\N	t	\N	\N	casey	\N	\N	\N	\N	\N	\N	{"UserId":898}	{user}	f	\N	898	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
756	Rylee 	\N	USD	2016-01-29 15:18:13.688-08	\N	\N	t	\N	\N	rylee	\N	\N	\N	\N	\N	\N	{"UserId":68}	{user}	f	\N	68	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
760	Geoff Domoracki	\N	USD	2016-08-03 10:47:13.173-07	\N	\N	t	\N	\N	geoffdomoracki	\N	\N	\N	\N	\N	\N	{"UserId":896}	{user}	f	\N	896	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
761	Mia Zhu	\N	USD	2016-09-29 10:59:15.428-07	\N	\N	t	\N	\N	miazhu	\N	\N	\N	\N	\N	\N	{"UserId":1316}	{user}	f	\N	1316	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
765	Sheree Atcheson	\N	USD	2016-09-29 10:54:53.462-07	\N	\N	t	\N	\N	shereeatcheson	\N	\N	\N	\N	\N	\N	{"UserId":1314}	{user}	f	\N	1314	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
766	Gillian Colan-O'Leary	\N	USD	2016-09-29 10:54:53.45-07	\N	\N	t	\N	\N	gilliancolan-o'leary	\N	\N	\N	\N	\N	\N	{"UserId":1313}	{user}	f	\N	1313	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
773	Shwetha Lakshman Rao	\N	USD	2016-09-29 10:51:29.333-07	\N	\N	t	\N	\N	shwethalakshmanrao	\N	\N	\N	\N	\N	\N	{"UserId":1309}	{user}	f	\N	1309	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
776	Joey Rosenberg	\N	USD	2016-06-21 09:02:52.874-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/IndianVisa_RosenbergJPG_17d93090-37ca-11e6-90ee-0555971b7ddd.JPG	joeycrose	\N	joeycrose	\N	\N	\N	\N	{"UserId":642}	{user}	f	\N	642	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
778	Racha Bella	\N	USD	2016-09-29 10:49:43.061-07	\N	\N	t	\N	\N	rachabella	\N	\N	\N	\N	\N	\N	{"UserId":1308}	{user}	f	\N	1308	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
780	Gabriela Adamova	\N	USD	2016-01-29 15:19:43.713-08	\N	\N	t	\N	\N	gabrielaadamova	\N	\N	\N	\N	\N	\N	{"UserId":75}	{user}	f	\N	75	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
785	Rose THERESA	\N	USD	2016-01-29 15:19:47.116-08	\N	\N	t	\N	\N	rosetheresa	\N	\N	\N	\N	\N	\N	{"UserId":76}	{user}	f	\N	76	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
788	Nupur Kapoor	\N	USD	2016-01-29 15:16:09.038-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/572a82f0-a28a-4e61-ba19-a0f09f1e812b	kapoornupur	\N	kapoornupur	\N	\N	\N	\N	{"UserId":67}	{user}	f	\N	67	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
789	Google Fiber	\N	USD	2016-09-12 21:15:01.959-07	\N	\N	t	\N	\N	googlefiber	http://fiber.google.com	googlefiber	\N	\N	\N	\N	{"UserId":1178}	{user}	f	\N	1178	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
791	Irina Muchnik	\N	USD	2016-09-29 11:12:58.838-07	\N	\N	t	\N	\N	irinamuchnik	\N	\N	\N	\N	\N	\N	{"UserId":1335}	{user}	f	\N	1335	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
801	Aleksandra Gavriloska	\N	USD	2016-09-29 11:43:49.211-07	\N	\N	t	\N	\N	aleksandragavriloska	\N	\N	\N	\N	\N	\N	{"UserId":1379}	{user}	f	\N	1379	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
804	null null	\N	USD	2016-07-01 15:31:42.541-07	\N	\N	t	\N	\N	pkmass	\N	\N	\N	\N	\N	\N	{"UserId":686}	{user}	f	\N	686	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
805	Ana Castro	\N	USD	2016-09-29 11:38:54.934-07	\N	\N	t	\N	\N	anacastro	\N	\N	\N	\N	\N	\N	{"UserId":1368}	{user}	f	\N	1368	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
815	Lucy Bain	\N	USD	2016-09-29 11:34:59.504-07	\N	\N	t	\N	\N	lucybain	\N	\N	\N	\N	\N	\N	{"UserId":1363}	{user}	f	\N	1363	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
824	Kelly 	\N	USD	2016-01-11 10:58:47.796-08	\N	\N	t	\N	https://pbs.twimg.com/profile_images/523157919999602688/00l1ZQIf.jpeg	kshuster	\N	\N	\N	\N	\N	\N	{"UserId":34}	{user}	f	\N	34	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
830	Anouk Ruhaak	\N	USD	2016-09-29 11:43:49.04-07	\N	\N	t	\N	\N	anoukruhaak	\N	\N	\N	\N	\N	\N	{"UserId":1375}	{user}	f	\N	1375	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
843	Nikko Patten	\N	USD	2017-04-10 18:09:47.41-07	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/2e150bf7-d054-400f-8f23-35dab9acf9c9	nikko	https://twitter.com/NikkoPatten	NikkoPatten	\N	\N	\N	\N	{"UserId":4153}	{user}	f	\N	4153	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
846	Chantal 	\N	USD	2016-01-29 15:19:36.407-08	\N	\N	t	\N	\N	chantal	\N	\N	\N	\N	\N	\N	{"UserId":74}	{user}	f	\N	74	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
290	WWCode Tampa	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:28:08.446-07	2016-11-07 10:27:01.762-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Tampa**](https://www.womenwhocode.com/tampa). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeSfKMAT2KWgG0kArwZhSAAYMwtAVyUGGK4l2Yfq3soxxLJnA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeSfKMAT2KWgG0kArwZhSAAYMwtAVyUGGK4l2Yfq3soxxLJnA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeSfKMAT2KWgG0kArwZhSAAYMwtAVyUGGK4l2Yfq3soxxLJnA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Support**](https://opencollective.com/wwcodetampa#support) WWCode Tampa financially by making a donation below\n\n\nYour donations are critical in supporting this catalytic movement. Donations received here directly support our programs. A small amount also supports global development so that we can bring innovative program to cities around the world, ensuring that more women everywhere have the opportunity to excel in technology careers.\n\n\nQuestions? Email us at contact@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/638dcdc0-a516-11e6-b4fe-6966ef500b6b.png	wwcodetampa	\N	wwcodetampa	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
260	WWCode Accra	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:44:40.394-07	2016-12-23 07:39:43.815-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Accra**](https://www.womenwhocode.com/accra). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScZq_QiHPiSwhxYe74MsWt1OiscXVo41DndphmDOTYR7cEK1w/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScZq_QiHPiSwhxYe74MsWt1OiscXVo41DndphmDOTYR7cEK1w/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScZq_QiHPiSwhxYe74MsWt1OiscXVo41DndphmDOTYR7cEK1w/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeaccra#support) to support WWCode Accra\n\nQuestions? Email us at global@womenwhocode.com.  	https://opencollective-production.s3-us-west-1.amazonaws.com/c4810040-8a89-11e6-9ae7-452ac38279da.png	wwcodeaccra	\N	wwcodeaccra	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
736	Tiffany Andrews	\N	USD	2016-09-29 11:12:58.852-07	\N	\N	t	\N	\N	tiffanyandrews	\N	\N	\N	\N	\N	\N	{"UserId":1336}	{user}	f	\N	1336	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
742	Ellevest 	\N	USD	2016-05-23 13:27:26.092-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/ellevestcom_0882df80-2125-11e6-9a76-e98f5a4a50b6.png	ellevest	http://www.ellevest.com	Ellevest	\N	\N	\N	\N	{"UserId":426}	{user}	f	\N	426	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
743	Shahnaz Kamberi	\N	USD	2016-06-06 17:53:44.829-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/dcacmorg_5f260cb0-2c4a-11e6-80e4-310475aa5f5c.png	dcacm	http://dcacm.org	dcacm	\N	\N	\N	\N	{"UserId":555}	{user}	f	\N	555	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
752	Candice Haddad	\N	USD	2016-09-29 11:02:54.555-07	\N	\N	t	\N	\N	candicehaddad	\N	\N	\N	\N	\N	\N	{"UserId":1321}	{user}	f	\N	1321	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
759	Amber Joyner	\N	USD	2016-09-29 11:01:04.636-07	\N	\N	t	\N	\N	amberjoyner	\N	\N	\N	\N	\N	\N	{"UserId":1317}	{user}	f	\N	1317	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
768	Xinhui Li	\N	USD	2016-09-29 10:53:00.503-07	\N	\N	t	\N	\N	xinhuili	\N	\N	\N	\N	\N	\N	{"UserId":1312}	{user}	f	\N	1312	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
782	Allison Canestaro	\N	USD	2016-06-06 12:04:33.418-07	\N	\N	t	\N	\N	allisoncanestaro	\N	\N	\N	\N	\N	\N	{"UserId":551}	{user}	f	\N	551	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
784	Silvia Pina	\N	USD	2016-09-29 11:43:49.189-07	\N	\N	t	\N	\N	silviapina	\N	\N	\N	\N	\N	\N	{"UserId":1377}	{user}	f	\N	1377	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
793	Isaac Potoczny-Jones	\N	USD	2016-09-22 18:07:06.058-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/466bd3a0-812a-11e6-8430-9f6ee94192cb.png	tozny	https://tozny.com	Tozny	\N	\N	\N	\N	{"UserId":1263}	{user}	f	\N	1263	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
794	Glenna Buford	\N	USD	2016-09-29 11:43:49.205-07	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/8a3d40b0-8fed-11e6-b320-5125b901f984.jpg	glennabuford	\N	\N	\N	\N	\N	\N	{"UserId":1378}	{user}	f	\N	1378	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
798	Saranya Karuppusamy	\N	USD	2016-01-11 10:54:33.296-08	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/35f74ebjpg_d2d1c140-35a4-11e7-8caa-3b6f8e012814.jpeg	saranyawwc	\N	\N	\N	\N	\N	\N	{"UserId":32}	{user}	f	\N	32	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
806	RigUp 	\N	USD	2016-03-25 08:11:02.011-07	\N	\N	t	\N	https://a2.mzstatic.com/us/r30/Purple7/v4/23/90/cc/2390cca9-c82f-6700-4f13-f1cb4ca15991/icon350x350.jpeg	rigup	https://www.rigup.com	deepinsand	\N	\N	\N	\N	{"UserId":192}	{user}	f	\N	192	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
807	Erica 	\N	USD	2016-01-11 10:59:41.948-08	\N	\N	t	\N	https://pbs.twimg.com/profile_images/672467424273395712/m0VtgmYQ.jpg	estanley	\N	\N	\N	\N	\N	\N	{"UserId":35}	{user}	f	\N	35	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
808	Vicky Twomey-Lee	\N	USD	2016-09-29 11:37:07.344-07	\N	\N	t	\N	\N	vickytwomey-lee	\N	\N	\N	\N	\N	\N	{"UserId":1366}	{user}	f	\N	1366	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
809	The Human Geo Group	\N	USD	2016-04-29 06:51:16.619-07	\N	\N	t	\N	https://logo.clearbit.com/thehumangeo.com	thehumangeo	\N	\N	\N	\N	\N	\N	{"UserId":303}	{user}	f	\N	303	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
814	Emily Heist Moss	\N	USD	2016-02-18 11:54:08.5-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/18b8dbe9-bc4b-4e82-b6db-b41eff9ca2e5	emilyheistmoss	\N	EmilyHeistMoss	\N	\N	\N	\N	{"UserId":108}	{user}	f	\N	108	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
820	Aseem Sood	Cofounder, Open Collective.	USD	2015-11-30 12:20:11.257-08	\N	\N	t	Tell us more about you, why you are on OpenCollective, what types of collectives you would love to contribute to, etc.\n\nProtip: you can use [markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)	https://opencollective-production.s3-us-west-1.amazonaws.com/jMoeGBOJjpg_d83f6890-a13d-11e6-a8af-411ab4a2c609.jpeg	aseem	\N	AseemSood_	\N	\N	\N	\N	{"UserId":8}	{user}	f	\N	8	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
825	Dev Bootcamp 	\N	USD	2016-04-28 08:01:14.69-07	\N	\N	t	\N	https://logo.clearbit.com/devbootcamp.com	devbootcamp	http://www.devbootcamp.com	devbootcamp 	\N	\N	\N	\N	{"UserId":283}	{user}	f	\N	283	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
826	Viv Del Rio	\N	USD	2016-09-29 11:38:54.951-07	\N	\N	t	\N	\N	vivdelrio	\N	\N	\N	\N	\N	\N	{"UserId":1370}	{user}	f	\N	1370	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
827	Dayra 	\N	USD	2016-01-11 11:01:43.411-08	\N	\N	t	\N	https://media.licdn.com/media/p/6/005/04f/283/2b9ae46.jpg	dchiu	\N	\N	\N	\N	\N	\N	{"UserId":36}	{user}	f	\N	36	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
838	Sue Sinclair	\N	USD	2017-02-27 16:25:15.503-08	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/c50d2350-ae0b-4347-9e9b-3b51d55fd22d	sue	\N	\N	\N	\N	\N	\N	{"UserId":3301}	{user}	f	\N	3301	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
847	Nicole Giannone	\N	USD	2017-05-09 11:14:19.572-07	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/5bd8eb7d-65e2-482e-b9dd-ff7f33bf804b	nicole1	\N	\N	\N	\N	\N	\N	{"UserId":4720}	{user}	f	\N	4720	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
848	Holly 	\N	USD	2015-12-21 08:34:26.053-08	\N	\N	t	\N	https://media.licdn.com/media/AAEAAQAAAAAAAAUUAAAAJDVjMTAxNGYxLWZhZmUtNDQ4Yi1hMzFjLWIzYmU3MTZjNGYxNA.jpg	ogibson	\N	\N	\N	\N	\N	\N	{"UserId":28}	{user}	f	\N	28	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
292	WWCode Vinnytsia	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:30:08.953-07	2016-12-28 08:27:20.161-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Vinnytsia**](https://www.womenwhocode.com/vinnytsia). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSd0I08q3ZAM8fRBchvB1oG9-8I5J3PlUwGcZreDWvtu2uSulg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSd0I08q3ZAM8fRBchvB1oG9-8I5J3PlUwGcZreDWvtu2uSulg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSd0I08q3ZAM8fRBchvB1oG9-8I5J3PlUwGcZreDWvtu2uSulg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodevinnytsia#support) to support WWCode Vinnytsia \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/fcac9e50-a51b-11e6-b4fe-6966ef500b6b.png	wwcodevinnytsia	\N	WWCodeVinnytsia	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
525	Women Who Code Pune	\N	USD	2017-02-21 12:16:59.055-08	2017-02-21 12:18:19.484-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScJkMSAeQ1r0L6uAFd-QO4-sHwEJ8BuD3tTdHSYzOkRkZGIhQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/pune) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScJkMSAeQ1r0L6uAFd-QO4-sHwEJ8BuD3tTdHSYzOkRkZGIhQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScJkMSAeQ1r0L6uAFd-QO4-sHwEJ8BuD3tTdHSYzOkRkZGIhQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodepune#support) to support WWCode Pune \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodepune	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
294	WWCode Wichita	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:32:00.962-07	2016-12-28 08:31:16.784-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Wichita**](https://www.womenwhocode.com/wichita). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSduY4sClbMfcDUnUl1_ZYK_HwA-ui81pWBcXF40sEuGL8bdTw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSduY4sClbMfcDUnUl1_ZYK_HwA-ui81pWBcXF40sEuGL8bdTw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSduY4sClbMfcDUnUl1_ZYK_HwA-ui81pWBcXF40sEuGL8bdTw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodewichita#support) to support WWCode Wichita \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/6cae1920-a6d6-11e6-bdef-45bfa9f9c1b0.png	wwcodewichita	\N	wwcodewichita	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
288	WWCode Santiago	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:25:21.912-07	2016-12-27 11:48:06.766-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Santiago**](https://www.womenwhocode.com/santiago). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdu79lAU0f0kKoLdUHsazwlPaiVRDO9SP5v9swDGHv00Nwqaw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdu79lAU0f0kKoLdUHsazwlPaiVRDO9SP5v9swDGHv00Nwqaw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdu79lAU0f0kKoLdUHsazwlPaiVRDO9SP5v9swDGHv00Nwqaw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesantiago#support) to support WWCode Santiago \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/595593e0-a2c0-11e6-b669-1f602f2f2eec.png	wwcodesantiago	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
289	WWCode Shanghai	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:26:35.114-07	2016-12-28 07:51:25.097-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Shanghai**](https://www.womenwhocode.com/shanghai). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeshanghai#support) to support WWCode Shanghai\n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/7be08da0-cd15-11e6-a033-c553d2fe46df.png	wwcodeshanghai	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
287	WWCode Sacramento 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:24:17.771-07	2016-12-27 11:44:07.667-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Sacramento**](https://www.womenwhocode.com/sacramento). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeZ9UntJll03ZeVwFkVGMc-JFd4Y1GLXpuJzRpi-JaMa30uYQ/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeZ9UntJll03ZeVwFkVGMc-JFd4Y1GLXpuJzRpi-JaMa30uYQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeZ9UntJll03ZeVwFkVGMc-JFd4Y1GLXpuJzRpi-JaMa30uYQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesacramento#support) to support WWCode Sacramento \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/dca653c0-a2bf-11e6-b669-1f602f2f2eec.png	wwcodesacramento	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
298	WWCode Dublin	WWCode is a global non-profit organization that inspires women to excel in technology careers.	EUR	2016-09-29 11:37:07.255-07	2016-12-27 08:33:19.532-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Dublin**](https://www.womenwhocode.com/wwcode-dublin). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdwrnolSbTtRkhg26WVios4q-3GxchiTiK1SNA24d-9qtMOjw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdwrnolSbTtRkhg26WVios4q-3GxchiTiK1SNA24d-9qtMOjw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdwrnolSbTtRkhg26WVios4q-3GxchiTiK1SNA24d-9qtMOjw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedublin#support) to support WWCode Dublin \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/70bbbe00-9ba5-11e6-84fe-5d5e57220970.png	wwcodedublin	\N	wwcodedublin	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
15	WWCode Boulder/Denver	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 16:00:00-08	2016-12-27 08:29:26.21-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Boulder/Denver**](https://www.womenwhocode.com/boulder). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSf8Ot4bmuje76glYnrfKKepl2EphH2Feojg9_CfbwhgmG5NAw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSf8Ot4bmuje76glYnrfKKepl2EphH2Feojg9_CfbwhgmG5NAw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSf8Ot4bmuje76glYnrfKKepl2EphH2Feojg9_CfbwhgmG5NAw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebd#support) to support WWCode Boulder/Denver \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/OSosQI7_aV.png	wwcodebd	\N	wwcodebd	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
279	WWCode Los Angeles	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:12:58.808-07	2016-12-27 09:24:20.031-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Los Angeles**](https://www.womenwhocode.com/la). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdc86zv5cSb-LuQlyA4qgmhZXjmN81qn-NAnbwNKidSrEST6g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdc86zv5cSb-LuQlyA4qgmhZXjmN81qn-NAnbwNKidSrEST6g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdc86zv5cSb-LuQlyA4qgmhZXjmN81qn-NAnbwNKidSrEST6g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodelosangeles#support) WWCode Los Angeles \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f55b4680-9097-11e6-a134-f381d4cd2713.png	wwcodelosangeles	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
265	WWCode Belo Horizonte	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:58:16.617-07	2016-12-23 09:07:51.328-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Belo Horizonte**](https://www.womenwhocode.com/belo-horizonte). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScQkF3yoa0K-EGz_ALcWXlGbWACzliOUG2k19B-kjDnAc9E-A/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScQkF3yoa0K-EGz_ALcWXlGbWACzliOUG2k19B-kjDnAc9E-A/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScQkF3yoa0K-EGz_ALcWXlGbWACzliOUG2k19B-kjDnAc9E-A/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebelohorizonte#support) to support WWCode Belo Horizonte \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	\N	wwcodebelohorizonte	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
274	WWCode Gujarat	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:06:44.732-07	2016-12-27 08:50:50.189-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Gujarat**](https://www.womenwhocode.com/gujarat). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfKPlXR-We8gxAKHZUh6eZ2cZDhSUcwDTDepFfquKPHax63mA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfKPlXR-We8gxAKHZUh6eZ2cZDhSUcwDTDepFfquKPHax63mA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfKPlXR-We8gxAKHZUh6eZ2cZDhSUcwDTDepFfquKPHax63mA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodegujarat#support) to support WWCode Gujarat\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/52506d70-9c78-11e6-a3da-b7d8fa4b13cd.png	wwcodegujarat	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
282	WWCode Merida	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:15:23.91-07	2016-12-27 09:55:44.4-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Merida**](https://www.womenwhocode.com/merida). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemerida#support) to support WWCode Merida \n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/af808880-cc5d-11e6-be07-3dfc36c6d12c.png	wwcodemerida	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
269	WWCode Chennai	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:01:49.683-07	2016-12-23 11:40:22.493-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Chennai**](https://www.womenwhocode.com/chennai). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScl5ZvmRS9Owt5CfCPbGa6Y8WnJvau5v77p-jgsto_UaeAc_A/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScl5ZvmRS9Owt5CfCPbGa6Y8WnJvau5v77p-jgsto_UaeAc_A/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScl5ZvmRS9Owt5CfCPbGa6Y8WnJvau5v77p-jgsto_UaeAc_A/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodechennai#support) to WWCode Chennai \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/f50c62b0-9b99-11e6-b592-e7f426067276.png	wwcodechennai	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
263	WWCode Beijing	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:53:00.452-07	2016-12-23 08:58:56.927-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Beijing**](https://www.womenwhocode.com/beijing). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSd7966PGrpuX1wfVL07PwwpupzTIrIi_T2WhJUe8nB4iK60dQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSd7966PGrpuX1wfVL07PwwpupzTIrIi_T2WhJUe8nB4iK60dQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSd7966PGrpuX1wfVL07PwwpupzTIrIi_T2WhJUe8nB4iK60dQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebeijing#support) to support WWCode Beijing\n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f6793200-961b-11e6-a6e9-23ce753be86b.png	wwcodebeijing	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
48	WWCode Twin Cities	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-03-06 16:00:00-08	2016-12-28 08:23:57.622-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in the Twin Cities**](https://www.womenwhocode.com/twin-cities). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSf9BXBmwX87irE9Xmvf9EntZG8Wb-VbY0xm2EOosPiMMSFP5g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSf9BXBmwX87irE9Xmvf9EntZG8Wb-VbY0xm2EOosPiMMSFP5g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSf9BXBmwX87irE9Xmvf9EntZG8Wb-VbY0xm2EOosPiMMSFP5g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodetwincities#support) to support WWCode Twin Cities \n\nQuestions? Email us at global@womenwhocode.com.  \n\n[**Sponsors**](https://drive.google.com/file/d/0ByjnHHy83oCsS3hjMjRNZktkYmM/view?usp=sharing)\n      	https://opencollective-production.s3-us-west-1.amazonaws.com/079974c0-cd1a-11e6-a033-c553d2fe46df.png	wwcodetwincities	https://www.womenwhocode.com/twin-cities	wwcodetc	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
299	WWCode Colima	WWCode is a global non-profit organization that inspires women to excel in technology careers.	MXN	2016-09-29 11:38:52.23-07	2016-12-27 08:09:39.74-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Colima**](https://www.womenwhocode.com/colima). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScHuzUYo7CGFNBBEWJEBEimY4ARGF4rpmyTtJ2K00dy8f-XiQ/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScHuzUYo7CGFNBBEWJEBEimY4ARGF4rpmyTtJ2K00dy8f-XiQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScHuzUYo7CGFNBBEWJEBEimY4ARGF4rpmyTtJ2K00dy8f-XiQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecolima#support) to support WWCode Colima \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/a02c3dc0-9ba2-11e6-84fe-5d5e57220970.png	wwcodecolima	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
512	Women Who Code Cincinnati	\N	USD	2017-02-21 10:11:30.741-08	2017-02-21 10:14:42.695-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Attend**](https://www.womenwhocode.com/cincinnati) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScMYZSUklxgo7irAfTbcOrz06jjuibholjPNS-rBoSvWLHGow/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScMYZSUklxgo7irAfTbcOrz06jjuibholjPNS-rBoSvWLHGow/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecincinnati#support) to support WWCode Cincinnati \n\nQuestions? Email us at global@womenwhocode.com.\n\n\n	\N	wwcodecincinnati	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
511	Women Who Code Monterrey	\N	MXN	2017-02-21 08:55:29.596-08	2017-02-21 09:26:29.52-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeKBYnRkINdl2_FjUOTp0hd11bK3RQnOdaEJzFDI6tlv5ntkA/viewform)\n\n[**Attend**](https://www.womenwhocode.com/monterrey) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeKBYnRkINdl2_FjUOTp0hd11bK3RQnOdaEJzFDI6tlv5ntkA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeKBYnRkINdl2_FjUOTp0hd11bK3RQnOdaEJzFDI6tlv5ntkA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemonterrey#support) to support WWCode Boston \n\n\n\n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/d32e97d0-f85a-11e6-aebb-a9d659d01ec2.png	wwcodemonterrey	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3206	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
520	Women Who Code San Diego	\N	USD	2017-02-21 11:34:46.927-08	2017-02-21 11:36:23.416-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdBi2chRGnaQrBG5-f1g2_aLxwpviZDmqgGluf0rJ3t_Uyi1Q/viewform)\n\n[**Attend**](https://www.womenwhocode.com/sandiego) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdBi2chRGnaQrBG5-f1g2_aLxwpviZDmqgGluf0rJ3t_Uyi1Q/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdBi2chRGnaQrBG5-f1g2_aLxwpviZDmqgGluf0rJ3t_Uyi1Q/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesandiego#support) to support WWCode San Diego\n\nQuestions? Email us at global@womenwhocode.com.\n\n\n\n	\N	wwcodesandiego	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
515	Women Who Code Philadelphia	\N	USD	2017-02-21 10:49:14.309-08	2017-02-21 10:55:30.087-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScOnXC5YWNaq0a4WzrYDTAhTFNmWyFGgpMJaoanAVxIQHoEIQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/philadelphia) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScOnXC5YWNaq0a4WzrYDTAhTFNmWyFGgpMJaoanAVxIQHoEIQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScOnXC5YWNaq0a4WzrYDTAhTFNmWyFGgpMJaoanAVxIQHoEIQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodephiladelphia#support) to support WWCode Philadelphia \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodephiladelphia	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
518	Women Who Code Singapore	\N	USD	2017-02-21 11:13:03.341-08	2017-02-21 11:19:36.571-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScjlltFEdGKQPEmz-VgLXm-yYaT1K8RqGqbAt-I7ozlLH4D-Q/viewform)\n\n[**Attend**](https://www.womenwhocode.com/singapore) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScjlltFEdGKQPEmz-VgLXm-yYaT1K8RqGqbAt-I7ozlLH4D-Q/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScjlltFEdGKQPEmz-VgLXm-yYaT1K8RqGqbAt-I7ozlLH4D-Q/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesingapore#support) to support WWCode Singapore\n\nQuestions? Email us at global@womenwhocode.com.\n	\N	wwcodesingapore	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	\N	696	696	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
\.


                                      4013.dat                                                                                            0000600 0004000 0002000 00000025513 13156021737 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        7	github	piamancini	*****	*****	\N	2016-05-23 10:23:51.553-07	2016-05-23 10:24:25.036-07	\N	30	\N	\N
3	github	asood123	*****	*****	\N	2016-05-23 10:14:54.648-07	2016-08-13 04:56:21.771-07	\N	8	\N	\N
4	github	xdamman	*****	*****	\N	2016-05-23 10:19:57.6-07	2017-05-03 07:31:33.249-07	\N	2	\N	\N
978	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-01-18 10:10:35.836-08	2017-09-12 11:13:49.651-07	\N	\N	\N	*****
981	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-02-10 12:36:22.327-08	2017-09-12 11:13:49.651-07	\N	\N	\N	*****
982	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-03-02 08:18:07.069-08	2017-09-12 11:13:49.651-07	\N	\N	\N	*****
984	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-03-18 10:17:15.567-07	2017-09-12 11:13:49.652-07	\N	\N	\N	*****
985	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-03-18 18:34:13.819-07	2017-09-12 11:13:49.652-07	\N	\N	\N	*****
986	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-04-18 16:31:51.161-07	2017-09-12 11:13:49.652-07	\N	\N	\N	*****
988	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-06-09 10:16:47.754-07	2017-09-12 11:13:49.653-07	\N	\N	696	*****
989	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-05-22 12:47:56.886-07	2017-09-12 11:13:49.653-07	\N	\N	\N	*****
990	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-03-01 22:36:23.209-08	2017-09-12 11:13:49.653-07	\N	\N	\N	*****
991	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-04-24 08:41:16.175-07	2017-09-12 11:13:49.653-07	\N	\N	\N	*****
992	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-02-17 12:25:21.395-08	2017-09-12 11:13:49.653-07	\N	\N	\N	*****
993	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-10-26 07:49:57.413-07	2017-09-12 11:13:49.654-07	\N	\N	\N	*****
994	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-09-28 16:39:38.673-07	2017-09-12 11:13:49.654-07	\N	\N	\N	*****
996	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-09-21 15:36:45.86-07	2017-09-12 11:13:49.654-07	\N	\N	\N	*****
997	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-04-20 08:11:46.398-07	2017-09-12 11:13:49.654-07	\N	\N	\N	*****
998	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-04-19 05:15:15.421-07	2017-09-12 11:13:49.654-07	\N	\N	\N	*****
999	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-04-17 08:38:10.658-07	2017-09-12 11:13:49.655-07	\N	\N	\N	*****
1000	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-03-24 12:03:42.687-07	2017-09-12 11:13:49.655-07	\N	\N	\N	*****
1001	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-03-23 14:31:32.501-07	2017-09-12 11:13:49.655-07	\N	\N	\N	*****
1002	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-03-13 12:40:15.721-07	2017-09-12 11:13:49.655-07	\N	\N	\N	*****
1005	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-02-10 11:25:55.396-08	2017-09-12 11:13:49.656-07	\N	\N	\N	*****
1006	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-02-24 16:19:15.877-08	2017-09-12 11:13:49.656-07	\N	\N	\N	*****
1007	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-01-24 23:20:25.482-08	2017-09-12 11:13:49.656-07	\N	\N	\N	*****
1008	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-01-31 11:23:27.546-08	2017-09-12 11:13:49.656-07	\N	\N	\N	*****
1009	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-01-14 23:46:48.547-08	2017-09-12 11:13:49.656-07	\N	\N	\N	*****
1010	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-09-13 14:08:10.496-07	2017-09-12 11:13:49.657-07	\N	\N	\N	*****
1011	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-09-13 13:07:04.929-07	2017-09-12 11:13:49.657-07	\N	\N	\N	*****
1013	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-09-07 12:14:48.228-07	2017-09-12 11:13:49.658-07	\N	\N	\N	*****
1014	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-08-09 09:47:14.143-07	2017-09-12 11:13:49.658-07	\N	\N	\N	*****
1015	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-08-09 05:25:12.058-07	2017-09-12 11:13:49.658-07	\N	\N	\N	*****
1016	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-08-04 14:37:07.487-07	2017-09-12 11:13:49.658-07	\N	\N	\N	*****
1017	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-08-03 23:04:40.337-07	2017-09-12 11:13:49.658-07	\N	\N	\N	*****
1018	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-07-12 12:16:04.867-07	2017-09-12 11:13:49.659-07	\N	\N	\N	*****
1022	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-04-21 18:39:22.397-07	2017-09-12 11:13:49.659-07	\N	\N	\N	*****
1019	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-06-30 09:08:02.669-07	2017-09-12 11:13:49.659-07	\N	\N	\N	*****
1023	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-05-17 09:40:52.217-07	2017-09-12 11:13:49.659-07	\N	\N	\N	*****
1021	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-06-08 10:39:24.034-07	2017-09-12 11:13:49.66-07	\N	\N	\N	*****
979	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-01-18 10:36:29.151-08	2017-09-12 11:13:49.65-07	\N	\N	\N	*****
980	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-01-27 14:04:28.386-08	2017-09-12 11:13:49.651-07	\N	\N	\N	*****
983	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-03-12 20:58:40.373-08	2017-09-12 11:13:49.652-07	\N	\N	\N	*****
1003	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2017-03-13 11:01:02.003-07	2017-09-12 11:13:49.655-07	\N	\N	\N	*****
987	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-03-30 00:26:00.613-07	2017-09-12 11:13:49.652-07	\N	\N	\N	*****
1012	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-09-08 00:47:48.445-07	2017-09-12 11:13:49.657-07	\N	\N	\N	*****
995	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-09-21 16:39:05.33-07	2017-09-12 11:13:49.654-07	\N	\N	\N	*****
1004	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-04-14 11:09:30.772-07	2017-09-12 11:13:49.656-07	\N	\N	\N	*****
1020	stripe	acct_15**************	\N	sk_test_XOFJ9lGbErcK5akcfdYM1D7j	{"publishableKey":"pk_test_5aBB887rPuzvWzbdRiSzV3QB","scope":"read_write","tokenType":"bearer"}	2016-06-09 10:23:07.475-07	2017-09-12 11:13:49.66-07	\N	\N	\N	*****
\.


                                                                                                                                                                                     4017.dat                                                                                            0000600 0004000 0002000 00000000005 13156021737 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4019.dat                                                                                            0000600 0004000 0002000 00000131127 13156021737 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        737	171	59	USD	2439	Event supplies for Leads	\N	******	Leadership Supplies	\N	3	PAID	2017-01-20 12:05:09.337-08	2017-01-21 12:30:22.616-08	2017-02-07 10:38:15.924-08	\N	paypal
57	28	2	USD	15316	Mar 7 Lightning Talks	\N	******	Lightning Talks	\N	3	PAID	2016-03-20 11:06:09.887-07	2016-03-20 11:06:09.887-07	2017-03-14 10:21:29.439-07	\N	paypal
887	3	282	MXN	50616	Leadership Development	\N	******	Conference	\N	3	PAID	2017-03-06 13:54:10.307-08	2017-03-07 05:02:11.16-08	2017-03-14 11:17:52.017-07	\N	manual
907	70	12	USD	20000	payment to artists (spoken word) for performance at IWD event	\N	******	Other WWCode Event	\N	3	PAID	2017-03-11 16:06:03.02-08	2017-03-12 11:10:39.133-07	2017-03-27 05:47:26.687-07	\N	paypal
101	3	13	USD	100	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-26 20:56:08.086-07	2016-04-26 20:56:08.086-07	2016-06-14 11:14:21.062-07	\N	manual
653	3	284	USD	6000	Meetup Fee	\N	******	Fees	\N	3	PAID	2016-12-27 10:13:06.365-08	2016-12-27 10:34:55.519-08	2016-12-27 10:35:08.976-08	\N	manual
650	3	282	MXN	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:56:16.269-08	2016-12-27 09:57:29.639-08	2016-12-27 09:57:54.703-08	\N	manual
648	3	280	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:48:20.364-08	2016-12-27 09:49:26.92-08	2016-12-27 09:49:40.165-08	\N	manual
649	3	281	AUD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:52:26.758-08	2016-12-27 09:53:15.394-08	2016-12-27 09:54:01.244-08	\N	manual
652	3	283	EUR	5700	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 10:10:37.485-08	2016-12-27 10:11:36.927-08	2016-12-27 10:11:52.22-08	\N	manual
651	3	10	MXN	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:58:18.741-08	2016-12-27 10:00:31.933-08	2016-12-27 10:01:07.996-08	\N	manual
654	3	59	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 10:35:56.094-08	2016-12-27 10:38:25.72-08	2016-12-27 10:38:47.561-08	\N	manual
655	3	287	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:33:09.199-08	2016-12-27 11:46:38.03-08	2016-12-27 11:46:51.448-08	\N	manual
656	3	288	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:47:27.946-08	2016-12-27 11:49:57.05-08	2016-12-27 11:50:17.29-08	\N	manual
657	3	14	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:51:59.27-08	2016-12-27 11:52:56.386-08	2016-12-27 11:53:07.813-08	\N	manual
658	3	4	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:53:23.261-08	2016-12-27 11:55:42.961-08	2016-12-28 07:44:45.209-08	\N	manual
659	3	300	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 07:46:39.253-08	2016-12-28 07:49:03.856-08	2016-12-28 07:49:16.715-08	\N	manual
660	3	289	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 07:51:51.23-08	2016-12-28 07:52:34.697-08	2016-12-28 07:53:06.333-08	\N	manual
661	3	297	AUD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 07:54:27.49-08	2016-12-28 07:56:08.504-08	2016-12-28 07:56:29.497-08	\N	manual
662	3	241	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 07:56:55.397-08	2016-12-28 07:58:20.587-08	2016-12-28 07:58:50.601-08	\N	manual
663	3	291	CAD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:20:10.433-08	2016-12-28 08:21:39.298-08	2016-12-28 08:21:52.881-08	\N	manual
664	3	48	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:24:24.058-08	2016-12-28 08:25:18.14-08	2016-12-28 08:25:49.763-08	\N	manual
665	3	292	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:26:41.188-08	2016-12-28 08:28:01.61-08	2016-12-28 08:28:16.458-08	\N	manual
736	171	59	USD	4431	Printing WWCODE pamphlets for Camas STEM Fair for middle-school girls (organized by OHSU).	\N	******	Other	\N	3	PAID	2017-01-20 12:05:09.337-08	2017-01-21 12:28:40.38-08	2017-02-07 10:40:28.327-08	\N	paypal
790	171	59	USD	9050	Food for 2017 Planning Meeting w/ leadership team (Jan. 22)	\N	******	Leadership Development	\N	3	PAID	2017-02-01 14:40:18.153-08	2017-02-01 15:46:50.968-08	2017-02-07 10:40:50.169-08	\N	paypal
80	3	59	USD	10000	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-12 11:52:16.188-07	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.052-07	\N	manual
86	3	13	USD	100	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-15 10:29:50.291-07	2016-04-15 10:29:50.291-07	2016-06-14 11:14:21.055-07	\N	manual
195	3	48	USD	3418	FedEx Office	\N	\N	Leadership Supplies	\N	3	PAID	2016-01-24 16:00:00-08	2016-01-24 16:00:00-08	2016-06-14 11:14:21.118-07	\N	manual
888	69	12	USD	54783	Plaques for IWD awards ceremony​ 	\N	******	Other WWCode Event	\N	3	PAID	2017-03-06 13:54:10.307-08	2017-03-07 07:45:43.298-08	2017-03-15 06:57:14.51-07	\N	paypal
814	142	48	USD	25700	Movie screening for "She Started It"	\N	******	Other WWCode Event	\N	3	PAID	2017-02-09 18:26:00.889-08	2017-02-10 16:22:48.586-08	2017-03-14 10:59:53.192-07	\N	paypal
74	3	14	USD	11815	Reimbursement to Kamila for coffee purchased for volunteers at CONNECT 2016	\N	\N	Conference	\N	3	PAID	2016-04-05 12:44:01.338-07	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.046-07	\N	manual
190	3	48	USD	20000	Conference Grant - Sarah Olson	\N	\N	Scholarship	\N	3	PAID	2016-05-25 09:39:09.882-07	2016-05-25 09:39:09.882-07	2016-06-14 11:14:21.116-07	\N	manual
75	3	59	USD	6500	Reimburse Caterina for travel expenses to CONNECT 2016	\N	\N	Scholarship	\N	3	PAID	2016-04-05 12:44:01.338-07	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.047-07	\N	manual
82	3	4	USD	163	Meetup Transaction Fee	\N	\N	Transaction Fees	\N	3	REJECTED	2016-04-12 11:52:16.188-07	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.052-07	\N	manual
97	3	13	USD	100	Global Developement	\N	\N	Global Development	\N	3	REJECTED	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.06-07	\N	manual
156	3	48	USD	110000	Conference Grant - Sarah Olson	Conference Grant - Airfare/Board	\N	Scholarship	\N	3	PAID	2016-05-10 12:19:21.785-07	2016-05-10 12:19:21.785-07	2016-06-14 11:14:21.099-07	\N	manual
95	3	13	USD	125	WePay fee	Jasna	\N	Transaction Fees	\N	3	PAID	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.06-07	\N	manual
189	3	3	USD	100000	Conference Grant	Google Event - Elizabeth	\N	Scholarship	\N	3	PAID	2016-05-24 12:42:50.307-07	2016-05-24 12:42:50.307-07	2016-06-14 11:14:21.116-07	\N	manual
175	3	12	USD	120000	Conference Grant	Alicia V Carr - Conference Grant	\N	Scholarship	\N	3	PAID	2016-05-19 12:07:13.723-07	2016-05-19 12:07:13.723-07	2016-06-14 11:14:21.109-07	\N	manual
136	68	15	USD	1115	Mile High Agile outreach- supplies	\N	\N	Leadership Supplies	\N	68	PAID	2016-04-02 17:00:00-07	2016-04-02 17:00:00-07	2016-06-14 11:14:21.091-07	\N	paypal
194	3	48	USD	12700	A Small Orange	\N	\N	Other WWCode Event	\N	3	PAID	2016-02-01 16:00:00-08	2016-02-01 16:00:00-08	2016-06-14 11:14:21.119-07	\N	manual
774	31	14	USD	6100	Travel to attend internal leads meeting to finalize plans for upcoming 2017 events	\N	******	Other	\N	3	PAID	2017-01-28 06:06:40.223-08	2017-01-28 15:49:43.515-08	2017-02-22 07:27:02.688-08	\N	paypal
889	3419	516	USD	14630	Stickers	\N	******	Leadership Supplies	\N	3	PAID	2017-03-06 13:54:10.307-08	2017-03-07 11:01:52.82-08	2017-04-07 05:58:45.571-07	\N	paypal
815	142	48	USD	33412	Wearable Clothing Workshop	\N	******	Workshop	\N	3	PAID	2017-02-09 18:26:00.889-08	2017-02-10 16:23:45.137-08	2017-03-14 11:00:11.49-07	\N	paypal
198	3	13	USD	80000	CONFERENCE GRANT	\N	\N	Scholarship	\N	3	PAID	2016-05-31 10:47:01.276-07	2016-05-31 10:47:01.276-07	2016-06-14 11:14:21.121-07	\N	manual
218	31	14	USD	5161	May expense: Travel and expense costs for mentoring at StartUp Weekend, Meeting w Northeeastern University for future WWC events 	\N	\N	Leadership Development	\N	3	PAID	2016-06-06 17:21:31.531-07	2016-06-06 17:21:31.531-07	2016-06-14 11:14:21.131-07	\N	paypal
79	3	4	USD	150	Global Developement	\N	\N	Global Development	\N	3	PAID	2016-04-12 11:46:49.263-07	2016-04-12 11:46:49.263-07	2016-06-14 11:14:21.05-07	\N	manual
99	3	14	USD	2452	CONNECT 2016	Reimbursement for Sara Adineh	\N	Conference	\N	3	PAID	2016-04-25 17:00:00-07	2016-04-25 17:00:00-07	2016-06-14 11:14:21.061-07	\N	manual
104	3	48	USD	400	WePay Fee	For Andrea and Leslie donation 	\N	Transaction Fees	\N	3	PAID	2016-04-10 17:00:00-07	2016-04-10 17:00:00-07	2016-06-14 11:14:21.064-07	\N	manual
92	3	15	USD	2322	Stacey Schipper Reimbursement	April 6, 2016 Expense	\N	Other WWCode Event	\N	3	REJECTED	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.058-07	\N	paypal
164	3	10	MXN	50000	Conference Grant	Conference Grant - Elsa Balderrama	\N	Scholarship	\N	3	PAID	2016-05-16 07:49:37.27-07	2016-05-16 07:49:37.27-07	2016-06-14 11:14:21.102-07	\N	manual
188	3	13	USD	15000	Conference Grant	Grant to Udisha 	\N	Scholarship	\N	3	PAID	2016-05-24 12:42:50.307-07	2016-05-24 12:42:50.307-07	2016-06-14 11:14:21.115-07	\N	manual
193	3	48	USD	65000	Photographer: Mike Ross	 	\N	Conference	\N	3	PAID	2016-01-05 16:00:00-08	2016-01-05 16:00:00-08	2016-06-14 11:14:21.118-07	\N	manual
224	3	59	USD	9995	Reimburse Caterina Paun for Program Expenses	Gift cards and thank you notes for workshop presenters	\N	Other WWCode Event	\N	3	PAID	2016-02-24 16:00:00-08	2016-02-24 16:00:00-08	2016-06-14 11:14:21.134-07	\N	manual
81	3	4	USD	163	Meetup Donation Transaction Fee	\N	\N	Transaction Fees	\N	3	PAID	2016-04-12 11:52:16.188-07	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.051-07	\N	manual
96	3	48	USD	250	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.06-07	\N	manual
225	3	59	USD	5504	Reimburse Caterina Paun for supplies and mailing expenses	\N	\N	Leadership Supplies	\N	3	PAID	2015-12-14 16:00:00-08	2015-12-14 16:00:00-08	2016-06-14 11:14:21.135-07	\N	manual
196	3	59	USD	50000	CONFERENCE GRANT	\N	\N	Scholarship	\N	3	PAID	2016-05-10 17:00:00-07	2016-05-10 17:00:00-07	2016-06-14 11:14:21.12-07	\N	manual
775	31	14	USD	5458	Lunch w Saranya during leads meeting. I lost the paper copy of the receipt so including the credit card statement 	\N	******	Other	\N	3	PAID	2017-01-28 06:06:40.223-08	2017-01-28 15:56:09.32-08	2017-02-22 07:27:45.559-08	\N	paypal
103	3	48	USD	150	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-27 09:21:00.228-07	2016-04-27 09:21:00.228-07	2016-06-14 11:14:21.063-07	\N	manual
145	3	13	USD	50000	Conference Grant	Conference Grant: Udisha	\N	Scholarship	\N	3	PAID	2016-05-04 14:14:39.136-07	2016-05-04 14:14:39.136-07	2016-06-14 11:14:21.094-07	\N	manual
227	3	59	USD	5000	Global Development	Nike Donation	\N	Global Development	\N	3	PAID	2016-02-21 16:00:00-08	2016-02-21 16:00:00-08	2016-06-14 11:14:21.135-07	\N	manual
76	3	59	USD	3798	Reimburse Caterina for program materials	\N	\N	Other WWCode Event	\N	3	PAID	2016-04-05 12:44:01.338-07	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.048-07	\N	manual
93	3	4	USD	150	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-07-08 20:52:41.064-07	\N	manual
255	31	14	USD	10294	Monthly core team lunch with Sandra Saranya Sara CiCi Tori (5 members) ; on boarding new core member Tori!	\N	******	Leadership Development	\N	31	PAID	2016-07-02 17:00:00-07	2016-07-04 13:23:49.309-07	2016-08-02 06:38:06.274-07	\N	paypal
374	171	59	USD	2077	Event Food	\N	******	Hack Night	\N	3	PAID	2016-09-27 19:15:48.098-07	2016-09-27 19:46:35.645-07	2016-10-05 09:43:29.036-07	\N	paypal
293	142	48	USD	10212	STEM Toys for Coding with Kids Event	\N	******	Other WWCode Event	\N	3	PAID	2016-07-16 17:00:00-07	2016-07-20 13:35:52.294-07	2016-08-16 07:58:32.981-07	\N	paypal
192	3	48	USD	2698	Leadership Tools (director tees)	Sarah Olson	\N	Leadership Supplies	\N	3	PAID	2015-12-14 16:00:00-08	2015-12-14 16:00:00-08	2016-06-14 11:14:21.117-07	\N	manual
294	142	48	USD	8496	STEM Toys for Coding with Kids Event	\N	******	Other WWCode Event	\N	3	PAID	2016-07-16 17:00:00-07	2016-07-20 13:41:41.183-07	2016-08-16 07:58:02.246-07	\N	paypal
318	142	48	USD	1500	Coding books for our study groups (Humble Bundle -- Joy of Coding)	\N	******	Technical Study Group	\N	3	PAID	2016-08-18 05:03:51.47-07	2016-08-18 05:07:07.685-07	2016-08-19 13:58:55.155-07	\N	paypal
346	171	59	USD	3224	Event food	\N	******	Food & Beverage	\N	3	PAID	2016-09-09 09:56:27.706-07	2016-09-09 09:56:59.265-07	2016-09-13 07:57:05.808-07	\N	paypal
345	171	59	USD	2911	Event food	\N	******	Supplies & materials	\N	3	PAID	2016-09-09 09:47:46.738-07	2016-09-09 09:56:23.297-07	2016-09-15 17:09:43.894-07	\N	paypal
366	142	48	USD	4898	Two VR headsets for our AR/VR event at Best Buy.	\N	******	Supplies & materials	\N	3	PAID	2016-09-21 13:21:09.898-07	2016-09-21 13:23:17.18-07	2016-09-27 12:31:43.772-07	\N	paypal
367	142	48	USD	2500	My coworker donated his evening to giving demos of his personal Oculus Rift for our AR/VR event, so I sent him a gift card to thank him for his help with the event.	\N	******	Other	\N	3	PAID	2016-09-22 08:22:21.436-07	2016-09-22 08:24:30.617-07	2016-09-27 12:33:54.695-07	\N	paypal
256	31	14	USD	749	Transportation for Sandra and Cici to get to meeting location with core team members	\N	******	Leadership Development	\N	31	PAID	2016-07-02 17:00:00-07	2016-07-04 13:25:35.824-07	2016-08-02 06:39:16.46-07	\N	paypal
197	3	59	USD	34750	CONFERENCE GRANT	\N	\N	Scholarship	\N	3	PAID	2016-05-26 12:05:53.771-07	2016-05-26 12:05:53.771-07	2016-06-14 11:14:21.121-07	\N	manual
222	3	4	USD	150	Global Development 	\N	\N	Global Development	\N	3	PAID	2016-06-09 11:38:16.857-07	2016-06-09 11:38:16.857-07	2016-06-14 11:14:21.133-07	\N	manual
307	31	14	USD	11757	Leadership team dinner - Sondry interview	\N	******	Scholarship	\N	31	PAID	2016-08-02 06:42:02.991-07	2016-08-02 06:43:29.423-07	2016-08-02 06:44:04.899-07	\N	paypal
333	142	48	USD	53720	Conference Travel	\N	******	Conference	\N	3	PAID	2016-08-26 17:03:45.469-07	2016-08-26 17:13:37.309-07	2016-11-03 14:27:23.523-07	\N	paypal
319	142	48	USD	13526	Dinner for last night's HackNight	\N	******	Hack Night	\N	3	PAID	2016-08-18 06:17:48.926-07	2016-08-18 06:19:12.087-07	2016-08-19 13:58:34.842-07	\N	paypal
375	171	59	USD	2715	Event supplies	\N	******	Leadership Supplies	\N	3	PAID	2016-09-27 19:46:42.795-07	2016-09-27 19:53:14.232-07	2016-10-05 09:44:00.917-07	\N	paypal
500	171	59	USD	2374	We Code Hackathon 2016	\N	******	Sponsorship	\N	3	PAID	2016-11-20 12:26:33.118-08	2016-11-20 12:29:20.497-08	2016-12-06 08:50:36.397-08	\N	paypal
158	3	48	USD	8320	Conference Expense	Sarah Olson	\N	Conference	\N	3	REJECTED	2016-05-10 12:19:21.785-07	2016-05-10 12:19:21.785-07	2016-06-14 11:14:21.1-07	\N	manual
178	3	3	USD	70000	Conference Grant	Sara Morsi Conference Grant	\N	Scholarship	\N	3	PAID	2016-05-19 12:07:13.723-07	2016-05-19 12:07:13.723-07	2016-06-14 11:14:21.11-07	\N	manual
378	171	59	USD	7167	Event Food	\N	******	Hack Night	\N	3	PAID	2016-09-27 19:55:23.801-07	2016-09-27 19:58:27.408-07	2016-10-05 09:44:48.383-07	\N	paypal
376	171	59	USD	2475	Marketing Materials	\N	******	Other	\N	3	PAID	2016-09-27 19:53:17.638-07	2016-09-27 19:54:27.309-07	2016-10-05 09:45:15.524-07	\N	paypal
377	171	59	USD	6471	Event Food	\N	******	Other WWCode Event	\N	3	PAID	2016-09-27 19:54:30.186-07	2016-09-27 19:55:20.669-07	2016-11-03 12:43:51.901-07	\N	paypal
372	142	48	USD	2200	Website - Domain Name	\N	******	Other	\N	3	PAID	2016-09-26 15:46:40.46-07	2016-09-26 15:48:04.38-07	2016-12-22 14:19:53.18-08	\N	paypal
395	3	15	USD	32000	90/10 split: Hackathon donation	\N	******	Global Development	\N	3	PAID	2016-07-14 17:00:00-07	2016-10-04 15:04:41.846-07	2016-10-04 15:05:23.579-07	\N	manual
389	3	12	USD	100000	90/10 split: AT&T Sponsorship (April 2015)	 	******	Global Development	\N	3	PAID	2016-10-04 08:40:50.076-07	2016-10-04 08:44:06.971-07	2016-10-04 08:44:29.326-07	\N	manual
387	3	12	USD	10000	Google I/O: Alicia Carr	\N	******	Scholarship	\N	3	PAID	2016-05-25 17:00:00-07	2016-10-04 08:31:40.439-07	2016-10-04 08:44:36.611-07	\N	manual
393	3	12	USD	500	90/10 split: Turner matching donation	\N	******	Global Development	\N	3	PAID	2016-10-04 08:52:24.157-07	2016-10-04 08:53:03.718-07	2016-10-04 09:06:02.71-07	\N	manual
391	3	12	USD	500	90/10 split: Beth Laing	\N	******	Global Development	\N	3	PAID	2016-10-04 08:50:56.293-07	2016-10-04 08:51:48.623-07	2016-10-04 09:06:11.584-07	\N	manual
392	3	12	USD	500	90/10 split: Beth Laing	\N	******	Global Development	\N	3	PAID	2016-10-04 08:50:56.293-07	2016-10-04 08:51:59.211-07	2016-10-04 09:06:17.663-07	\N	manual
390	3	12	USD	250	90/10 split: Syema Ailia	\N	******	Global Development	\N	3	PAID	2016-10-04 08:49:30.068-07	2016-10-04 08:50:45.734-07	2016-10-04 09:06:24.611-07	\N	manual
394	3	2	USD	56266	Net budget balance pre-Open Collective	\N	******	Other WWCode Event	\N	3	PAID	2016-01-14 16:00:00-08	2016-10-04 14:41:43.853-07	2016-10-04 14:57:46.063-07	\N	manual
411	3	59	USD	31950	WWCode Portland Stickers	\N	******	Leadership Supplies	\N	3	PAID	2016-10-10 13:10:50.586-07	2016-10-10 13:11:36.293-07	2016-10-10 13:12:34.385-07	\N	manual
412	3	195	USD	1000	Test	\N	******	Fees	\N	3	REJECTED	2016-10-11 09:11:05.021-07	2016-10-11 09:13:18.686-07	2016-10-11 09:17:02.494-07	\N	paypal
413	3	195	USD	1000	Test	\N	******	Fees	\N	3	PAID	2016-10-11 09:17:09.527-07	2016-10-11 09:18:10.423-07	2016-10-11 09:18:39.64-07	\N	manual
401	31	14	USD	3080	Monthly core team meeting. Beverages with dinner for six members 	\N	******	Other WWCode Event	\N	3	PAID	2016-10-04 20:13:51.147-07	2016-10-04 20:14:45.394-07	2016-10-31 10:59:54.551-07	\N	paypal
409	70	12	USD	2838	food/drink for organizers of NODE workshop (had to buy from on-site snack bar)	\N	******	Workshop	\N	3	PAID	2016-10-08 08:03:22.819-07	2016-10-08 08:11:18.293-07	2016-11-03 14:13:32.781-07	\N	paypal
400	31	14	USD	3323	Monthly team meeting w core six members. Food/pizza	\N	******	Other WWCode Event	\N	3	PAID	2016-10-04 20:12:18.236-07	2016-10-04 20:13:43.629-07	2016-10-31 14:02:17.181-07	\N	paypal
402	31	14	USD	729	Transportation to get to GeekWire Summit social event 	\N	******	Conference	\N	3	PAID	2016-10-04 20:14:49.674-07	2016-10-04 20:17:22.898-07	2016-11-01 09:16:03.421-07	\N	paypal
396	3	272	USD	25000	DIANA A. SCHOLARSHIP GOOGLE I/O	\N	******	Conference	\N	3	PAID	2016-10-04 15:22:45.384-07	2016-10-04 15:23:45.863-07	2016-11-21 14:59:44.22-08	\N	manual
417	1371	300	USD	48435	Costco breakfast, lunch, drinks, plates, cups, utensils, snacks, deserts ...	\N	******	Hackathon	\N	3	PAID	2016-10-12 12:47:17.894-07	2016-10-12 12:50:24.464-07	2016-10-31 14:08:49.808-07	\N	paypal
416	1371	300	USD	51962	500 gift cards, 19.62 printed awards	\N	******	Hackathon	\N	3	PAID	2016-10-12 12:45:46.133-07	2016-10-12 12:47:13.682-07	2016-10-31 14:09:12.082-07	\N	paypal
415	1371	300	USD	70000	pre payment for dinner catering	\N	******	Hackathon	\N	3	APPROVED	2016-10-12 12:44:25.684-07	2016-10-12 12:45:38.031-07	2016-10-27 14:05:29.785-07	2016-11-02 17:00:00-07	paypal
418	1371	300	USD	64978	lunch ordered at Costco	\N	******	Hackathon	\N	3	PAID	2016-10-12 12:50:37.851-07	2016-10-12 12:52:06.282-07	2016-10-28 14:31:00.087-07	\N	paypal
427	31	14	USD	1305	Google DevFest event that WWC sponsored and attended. Two large banners. Table cloth. Plus my luggage since I went directly from airport. 	\N	******	Workshop	\N	3	PAID	2016-10-15 15:59:26.409-07	2016-10-15 16:01:05.534-07	2016-10-31 10:52:13.785-07	\N	paypal
420	32	14	USD	2700	WWCode Seattle planning lunch with Sara	\N	******	Other	\N	3	PAID	2016-10-13 10:26:11.421-07	2016-10-13 10:30:27.473-07	2016-10-31 10:52:45.81-07	\N	paypal
419	171	59	USD	1446	Food for JavaScript Study Night - Oct. 11th	\N	******	Study Group	\N	3	PAID	2016-10-12 13:24:40.763-07	2016-10-12 13:48:15.148-07	2016-10-31 11:19:13.146-07	\N	paypal
453	28	2	USD	35000	DJ (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 21:34:19.335-07	2016-10-25 21:34:51.547-07	2016-10-27 14:08:49.13-07	\N	paypal
450	28	2	USD	6497	September Ruby Tuesday	\N	******	Study Group	\N	3	PAID	2016-10-25 20:53:42.508-07	2016-10-25 20:54:47.132-07	2016-10-31 14:11:37.246-07	\N	paypal
452	28	2	USD	26800	May AI Workshop	\N	******	Workshop	\N	3	PAID	2016-10-25 21:06:16.475-07	2016-10-25 21:07:27.314-07	2016-10-31 14:10:54.78-07	\N	paypal
447	28	2	USD	5518	Drinks for Happy Hour (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 17:40:29.898-07	2016-10-25 17:41:14.743-07	2016-10-31 14:13:40.764-07	\N	paypal
451	28	2	USD	20568	June South Hack Night	\N	******	Hack Night	\N	3	PAID	2016-10-25 20:57:37.783-07	2016-10-25 20:59:03.214-07	2016-10-31 14:11:21.759-07	\N	paypal
449	28	2	USD	75932	Drinks and snacks (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 20:43:46.209-07	2016-10-25 20:50:39.086-07	2016-10-31 14:13:06.494-07	\N	paypal
448	28	2	USD	2108	Markers, pens, sticky notes (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 17:41:19.411-07	2016-10-25 17:42:15.042-07	2016-10-31 14:13:20.6-07	\N	paypal
446	28	2	USD	1192	Almond milk for coffee (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 17:39:05.875-07	2016-10-25 17:40:23.911-07	2016-10-31 14:13:54.099-07	\N	paypal
445	28	2	USD	1136	Painters tape for signs  	\N	******	Hackathon	\N	3	PAID	2016-10-25 17:18:03.746-07	2016-10-25 17:39:01.083-07	2016-10-31 14:14:52.301-07	\N	paypal
470	1379	301	EUR	1019	Leadership Event in Sofia	\N	******	Other WWCode Event	\N	3	PAID	2016-11-09 12:01:53.197-08	2016-11-09 12:15:40.819-08	2016-12-07 13:30:48.755-08	\N	paypal
414	1371	300	USD	76800	second half of dinner catering	\N	******	Hackathon	\N	3	APPROVED	2016-10-12 12:28:23.372-07	2016-10-12 12:44:15.333-07	2016-10-27 14:07:24.861-07	2016-11-02 17:00:00-07	paypal
467	28	2	USD	339421	Food (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-11-02 15:10:25.089-07	2016-11-02 15:11:15.724-07	2016-11-21 07:23:08.924-08	\N	manual
464	3	14	USD	60000	Matthews Group - Leadership Development for Seattle team	Paid via PayPal	******	Leadership Development	\N	3	PAID	2016-10-31 15:03:17.783-07	2016-10-31 15:05:08.929-07	2016-11-29 13:46:31.974-08	\N	manual
466	28	2	USD	119954	Food (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-11-02 15:08:55.076-07	2016-11-02 15:10:20.431-07	2016-11-18 13:01:44.79-08	\N	paypal
494	1378	301	EUR	4728	European Leadership Development Workshop -- Transportation, Flight	\N	******	Leadership Development	\N	3	PAID	2016-09-30 17:00:00-07	2016-11-19 05:21:57.651-08	2016-11-22 14:07:58.565-08	\N	manual
498	171	59	USD	4874	Thank you cards, Christmas cards, stamps (for hackathon and all 2016 sponsors)	\N	******	Hackathon	\N	3	PAID	2016-11-20 12:18:30.305-08	2016-11-20 12:20:36.467-08	2016-11-22 13:55:11.103-08	\N	paypal
493	1378	301	EUR	4400	European Leadership Development Workshop -- Transportation, Taxi	\N	******	Leadership Development	\N	3	PAID	2016-10-26 17:00:00-07	2016-11-19 05:13:48.078-08	2016-11-22 14:07:41.878-08	\N	manual
471	1379	301	EUR	6444	Leadership Event in Sofia	\N	******	Other WWCode Event	\N	3	PAID	2016-11-09 12:15:46.133-08	2016-11-09 12:16:50.117-08	2016-12-07 13:38:07.749-08	\N	paypal
483	1325	273	USD	4351	Food for monthly hack night from Antonino Bertolo's Pizza & Wine Bar.	\N	******	Hack Night	\N	3	PAID	2016-08-31 17:00:00-07	2016-11-16 16:12:31.06-08	2016-12-06 09:58:42.358-08	\N	manual
484	1325	273	USD	7773	Food for October Hack Night.	\N	******	Hack Night	\N	3	PAID	2016-10-05 17:00:00-07	2016-11-16 16:29:48.238-08	2016-12-06 09:56:13.801-08	\N	manual
501	171	59	USD	1700	Thank you gift to an amazing sponsor!	\N	******	Hackathon	\N	3	PAID	2016-11-20 12:29:28.692-08	2016-11-20 12:34:51.872-08	2016-11-22 04:31:01.064-08	\N	paypal
499	171	59	USD	8181	Thank you bags (16) for hackathon speakers and judges, and for pre-hackathon events volunteers and sponsors.  Each bag contains a WWCode Portland coffee mug, a chocolate bar, ghirardellis squares, and a thank you card.	\N	******	Hackathon	\N	3	PAID	2016-11-20 12:20:40.018-08	2016-11-20 12:26:02.323-08	2016-11-22 13:54:34.067-08	\N	paypal
506	1333	278	GBP	6000	Food/Drinks for Leadership Team Meeting - Gen, Claire, Halima - Sept 2016	\N	******	Leadership Development	\N	3	PAID	2016-09-10 17:00:00-07	2016-11-22 12:36:49.712-08	2016-11-29 13:17:33.829-08	\N	manual
502	171	59	USD	1082	Marketing for IoT Hackathon	\N	******	Hackathon	\N	3	PAID	2016-11-20 12:36:16.598-08	2016-11-20 12:36:41.928-08	2016-12-06 08:50:57.444-08	\N	paypal
508	171	59	USD	3918	Supplies	\N	******	Hackathon	\N	3	PAID	2016-11-22 16:39:47.569-08	2016-11-22 17:16:59.692-08	2016-12-06 08:51:21.271-08	\N	paypal
509	171	59	USD	2698	T-shirt order - Design Lead	\N	******	Leadership Supplies	\N	3	PAID	2016-11-22 17:17:03.111-08	2016-11-22 17:18:21.842-08	2016-12-06 08:51:55.906-08	\N	paypal
507	1333	278	GBP	4000	Food/Drinks for Leadership Team Meeting - Gen, Claire - Oct 2016	\N	******	Leadership Development	\N	3	PAID	2016-10-01 17:00:00-07	2016-11-22 12:39:49.327-08	2016-11-29 13:17:22.193-08	\N	manual
474	31	14	USD	227646	Lodging and meals for our WWC Seattle 7 team members leadership development retreat. Under approved budget!	\N	******	Leadership Development	\N	3	PAID	2016-11-15 07:52:03.936-08	2016-11-15 07:54:05.532-08	2016-11-29 13:46:42.977-08	\N	manual
639	3	273	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:49:03.664-08	2016-12-27 08:49:52.742-08	2016-12-27 08:50:06.731-08	\N	manual
573	171	59	USD	1058	Goodie Bags	\N	******	Hackathon	\N	3	PAID	2016-12-06 19:01:09.941-08	2016-12-06 19:01:33.246-08	2016-12-07 12:49:56.687-08	\N	paypal
485	1325	273	USD	1106	October Hack Night Drinks/Food.	\N	******	Hack Night	\N	3	PAID	2016-10-05 17:00:00-07	2016-11-16 16:45:56.588-08	2016-12-06 09:58:10.939-08	\N	manual
486	1325	273	USD	4444	Food/Drinks for Anniversary Reception with guest WWCode Directors!	\N	******	Other WWCode Event	\N	3	PAID	2016-10-27 17:00:00-07	2016-11-16 17:08:09.48-08	2016-11-22 14:21:43.596-08	\N	manual
492	1325	273	USD	713	Food for Anniversary Reception	\N	******	Other WWCode Event	\N	3	PAID	2016-10-27 17:00:00-07	2016-11-17 12:36:37.444-08	2016-12-06 09:55:40.485-08	\N	manual
591	142	48	USD	30496	3D Printer & Supplies	\N	******	Hack Night	\N	3	PAID	2016-12-13 10:22:16.435-08	2016-12-13 12:33:52.789-08	2016-12-14 05:03:22.881-08	\N	paypal
602	142	48	USD	9240	Leadership - Planning for 2017 - Dinner	\N	******	Leadership Development	\N	3	PAID	2016-12-18 13:03:11.586-08	2016-12-18 13:03:54.509-08	2016-12-19 10:45:09.955-08	\N	paypal
604	142	48	USD	20397	Robotics: Coding with Your Kids HackNight Supplies	\N	******	Hack Night	\N	3	PAID	2016-12-18 13:04:48.665-08	2016-12-18 13:05:52.891-08	2016-12-19 08:20:41.101-08	\N	paypal
601	142	48	USD	1175	Leadership - Planning for 2017 - Afternoon Coffee	\N	******	Leadership Development	\N	3	PAID	2016-12-18 12:54:41.356-08	2016-12-18 13:03:08.099-08	2016-12-19 10:42:59.885-08	\N	paypal
613	3	260	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:32:39.612-08	2016-12-23 08:35:32.89-08	2016-12-23 08:37:59.658-08	\N	manual
603	142	48	USD	875	Leadership - Planning for 2017 - Evening Coffee	\N	******	Leadership Development	\N	3	PAID	2016-12-18 13:03:57.719-08	2016-12-18 13:04:44.175-08	2016-12-19 10:43:54.758-08	\N	paypal
605	1374	300	USD	46419	Mugs for WWCode-SV	\N	******	Global Development	\N	3	PAID	2016-12-19 14:19:05.439-08	2016-12-19 14:20:00.599-08	2016-12-20 10:57:28.737-08	\N	paypal
607	3	2	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-21 10:50:58.117-08	2016-12-21 10:53:15.213-08	2016-12-21 10:53:47.768-08	\N	manual
608	3	3	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-21 10:51:15.967-08	2016-12-21 10:54:08.982-08	2016-12-21 10:54:31.514-08	\N	manual
619	3	265	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:06:10.893-08	2016-12-23 09:09:46.554-08	2016-12-23 09:10:35.083-08	\N	manual
614	3	261	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:45:31.739-08	2016-12-23 08:48:42.88-08	2016-12-23 08:49:17.798-08	\N	manual
617	3	263	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:58:06.292-08	2016-12-23 09:00:11.888-08	2016-12-23 09:00:26.307-08	\N	manual
615	3	12	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:51:12.278-08	2016-12-23 08:52:04.132-08	2016-12-23 08:52:23.784-08	\N	manual
616	3	262	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:52:52.588-08	2016-12-23 08:55:02.457-08	2016-12-23 08:56:04.914-08	\N	manual
618	3	264	GBP	4900	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:03:12.871-08	2016-12-23 09:05:23.588-08	2016-12-23 09:05:42.262-08	\N	manual
621	3	259	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:20:24.371-08	2016-12-23 09:21:36.713-08	2016-12-23 09:21:53.364-08	\N	manual
620	3	301	EUR	5700	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:13:56.172-08	2016-12-23 09:14:45.703-08	2016-12-23 09:15:16.44-08	\N	manual
622	3	195	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:26:09.212-08	2016-12-23 09:32:25.111-08	2016-12-23 09:32:56.293-08	\N	manual
623	3	266	AUD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:41:23.136-08	2016-12-23 09:42:05.736-08	2016-12-23 09:42:19.013-08	\N	manual
624	3	267	GBP	4900	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:43:55.758-08	2016-12-23 09:58:18.148-08	2016-12-23 10:04:06.163-08	\N	manual
626	3	268	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 11:36:30.003-08	2016-12-23 11:38:32.584-08	2016-12-23 11:38:47.127-08	\N	manual
644	3	279	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:25:07.236-08	2016-12-27 09:26:20.227-08	2016-12-27 09:27:10.046-08	\N	manual
627	3	269	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 11:39:34.326-08	2016-12-23 11:41:36.646-08	2016-12-23 11:41:48.635-08	\N	manual
628	3	270	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 11:47:22.609-08	2016-12-23 11:49:40.181-08	2016-12-23 11:50:08.905-08	\N	manual
632	3	299	MXN	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:10:47.262-08	2016-12-27 08:12:04.183-08	2016-12-27 08:12:26.594-08	\N	manual
633	3	271	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:13:47.179-08	2016-12-27 08:15:24.708-08	2016-12-27 08:16:27.404-08	\N	manual
640	3	274	USD	6000	Meetup Fee	\N	******	Fees	\N	3	PAID	2016-12-27 08:51:06.223-08	2016-12-27 08:52:25.022-08	2016-12-27 08:52:46.541-08	\N	manual
634	3	13	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:22:16.78-08	2016-12-27 08:23:20.484-08	2016-12-27 08:23:36.529-08	\N	manual
636	3	15	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:30:20.153-08	2016-12-27 08:31:33.602-08	2016-12-27 08:31:59.233-08	\N	manual
637	3	298	EUR	5700	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:35:19.064-08	2016-12-27 08:35:50.321-08	2016-12-27 08:36:05.685-08	\N	manual
641	3	275	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:54:08.966-08	2016-12-27 08:54:50.244-08	2016-12-27 08:55:07.749-08	\N	manual
638	3	272	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:39:04.447-08	2016-12-27 08:41:02.05-08	2016-12-27 08:41:27.62-08	\N	manual
642	3	276	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:58:36.204-08	2016-12-27 08:59:15.911-08	2016-12-27 08:59:34.226-08	\N	manual
647	3	278	GBP	4900	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:28:20.017-08	2016-12-27 09:33:16.816-08	2016-12-27 09:34:46.927-08	\N	manual
643	3	277	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:02:39.037-08	2016-12-27 09:03:12.312-08	2016-12-27 09:03:23.471-08	\N	manual
666	3	293	CAD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:28:38.36-08	2016-12-28 08:30:00.14-08	2016-12-28 08:30:16.798-08	\N	manual
667	3	294	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:30:41.349-08	2016-12-28 08:32:05.407-08	2016-12-28 08:32:19.79-08	\N	manual
62	31	14	USD	1000	Nike Dinner	Ride home after Nike dinner. Shared ride with Sara Adineh. 	******	Conference	\N	31	PAID	2016-03-17 17:00:00-07	2016-03-17 17:00:00-07	2016-06-14 11:14:21.031-07	\N	paypal
72	32	14	USD	6800	Connect 2016 event setup day dinner	\N	******	Conference	\N	32	PAID	2016-03-17 17:00:00-07	2016-03-17 17:00:00-07	2016-06-14 11:14:21.044-07	\N	paypal
635	3	47	INR	6000	Meetup Fees	\N	******	Fees	\N	141	APPROVED	2016-12-27 08:24:45.938-08	2016-12-27 08:25:59.379-08	2017-01-11 02:50:47.014-08	\N	manual
724	142	48	USD	2093	Drinks (La Croix water) for Jan HackNight	\N	******	Hack Night	\N	3	PAID	2017-01-15 16:34:19.312-08	2017-01-16 12:30:30.683-08	2017-01-25 10:41:34.763-08	\N	paypal
725	142	48	USD	22137	Amazon Echo Dot devices for HackNight and first book for our book club.	\N	******	Hack Night	\N	3	PAID	2017-01-15 16:34:19.312-08	2017-01-16 12:32:05.491-08	2017-01-25 10:44:34.015-08	\N	paypal
743	70	12	USD	30000	travel to NY for bell ringing at NYSE	\N	******	Other WWCode Event	\N	3	PAID	2017-01-23 13:57:02.837-08	2017-01-23 18:35:07.349-08	2017-01-25 10:20:55.157-08	\N	paypal
167	31	14	USD	2948	Connect Conference video footage review	Date is 4/28/2016	******	Conference	\N	31	PAID	2016-05-16 17:31:54.682-07	2016-05-16 17:31:54.682-07	2016-06-14 11:14:21.103-07	\N	paypal
768	3	278	GBP	40970	Travel Scholarship for WWCode Director	\N	******	Leadership Development	\N	3	PAID	2017-01-26 15:23:43.983-08	2017-01-27 07:34:47.447-08	2017-04-17 15:32:02.795-07	\N	manual
46	68	15	USD	14000	Food for March Boulder, CO event	\N	******	Other WWCode Event	\N	68	PAID	2016-03-17 11:48:54.413-07	2016-03-17 11:48:54.413-07	2016-06-14 11:14:21.021-07	\N	paypal
53	28	2	USD	10284	Feb 4 hack night	\N	******	Hack Night	\N	28	PAID	2016-03-20 11:06:09.887-07	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.026-07	\N	paypal
55	28	2	USD	4951	Mar 3 hack night	\N	******	Hack Night	\N	28	PAID	2016-03-20 11:06:09.887-07	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.026-07	\N	paypal
785	3	47	INR	6000	Meetup Fees	\N	******	Leadership Development	\N	3	REJECTED	2017-01-30 15:17:44.823-08	2017-01-31 08:46:45.519-08	2017-02-14 13:17:53.548-08	\N	manual
497	171	59	USD	1798	Domain name for hackathon and study night projects	\N	******	Fees	\N	3	PAID	2016-11-20 12:00:51.642-08	2016-11-20 12:06:26.088-08	2017-02-20 12:53:02.93-08	\N	paypal
56	28	2	USD	22568	Feb 1, Lightning Talks	\N	******	Lightning Talks	\N	28	PAID	2016-03-20 11:06:09.887-07	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.027-07	\N	paypal
137	68	15	USD	14100	WWC Boulder- April event's food	\N	******	Other WWCode Event	\N	3	PAID	2016-04-06 17:00:00-07	2016-04-06 17:00:00-07	2016-06-14 11:14:21.09-07	\N	paypal
138	68	15	USD	7000	WWC Stickers	\N	******	Network supplies	\N	68	REJECTED	2016-03-17 17:00:00-07	2016-03-17 17:00:00-07	2016-06-14 11:14:21.091-07	\N	paypal
184	28	2	USD	8979	May 2 Lightning Talks	\N	******	Lightning Talks	\N	28	PAID	2016-05-22 16:46:04.647-07	2016-05-22 16:46:04.647-07	2016-06-14 11:14:21.113-07	\N	paypal
183	28	2	USD	13315	April 4 Lightning Talks	\N	******	Lightning Talks	\N	28	PAID	2016-05-22 16:46:04.647-07	2016-05-22 16:46:04.647-07	2016-06-14 11:14:21.113-07	\N	paypal
180	28	2	USD	5037	April 7 South Hack Night	\N	******	Hack Night	\N	28	PAID	2016-05-22 16:46:04.647-07	2016-05-22 16:46:04.647-07	2016-06-14 11:14:21.112-07	\N	paypal
181	28	2	USD	5325	May 5 South Hack Night	\N	******	Hack Night	\N	28	PAID	2016-05-22 16:46:04.647-07	2016-05-22 16:46:04.647-07	2016-06-14 11:14:21.112-07	\N	paypal
147	32	14	USD	14000	Quarterly planning meeting	\N	******	Leadership Development	\N	32	PAID	2016-05-05 17:18:43.265-07	2016-05-05 17:18:43.265-07	2016-06-14 11:14:21.095-07	\N	paypal
211	28	2	USD	20000	6/2/16 Fireside Chat at Orange Coworking	\N	******	Fireside Chat	\N	3	PAID	2016-06-04 14:37:03.991-07	2016-06-04 14:37:03.991-07	2016-06-14 11:14:21.127-07	\N	paypal
186	28	2	USD	30000	05-21-16 AI workshop	\N	******	Workshop	\N	3	PAID	2016-05-22 17:26:36.061-07	2016-05-22 17:26:36.061-07	2016-10-31 14:16:10.268-07	\N	paypal
213	28	2	USD	2400	3/30/16 Python Gameathon prize - Udemy course	\N	******	Hackathon	\N	3	PAID	2016-06-04 14:37:03.991-07	2016-06-04 14:37:03.991-07	2016-06-14 11:14:21.128-07	\N	paypal
48	68	15	USD	7800	Order for stickers of our official WWC Boulder/Denver chapter logo	We'll include these at our booth at the Mile High Agile conference in two weeks.	******	Leadership Supplies	\N	3	PAID	2016-03-17 20:23:34.628-07	2016-03-17 20:23:34.628-07	2016-11-03 12:45:25.209-07	\N	paypal
59	31	14	USD	4656	WwConnect planning meeting	Seattle team ordered in an evening meal to continue planning meeting	******	Conference	\N	31	PAID	2016-03-10 16:00:00-08	2016-03-10 16:00:00-08	2016-06-14 11:14:21.029-07	\N	paypal
60	31	14	USD	2519	WwConnect Planning Meeting	Two bottles of beverage for the Seattle team to have dinner brought in while working	******	Conference	\N	31	PAID	2016-03-10 16:00:00-08	2016-03-10 16:00:00-08	2016-06-14 11:14:21.03-07	\N	paypal
61	31	14	USD	709	WwConnect Conference Set Up Day 1	Cab ride to get on location	******	Conference	\N	31	PAID	2016-03-18 17:00:00-07	2016-03-18 17:00:00-07	2016-06-14 11:14:21.03-07	\N	paypal
64	31	14	USD	1025	WwConnect2016	Coffee for team. Day2	******	Conference	\N	31	PAID	2016-03-19 17:00:00-07	2016-03-19 17:00:00-07	2016-06-14 11:14:21.032-07	\N	paypal
34	7	10	MXN	166080	IVA Libretas Hackathon	Impuesto por la factura para las libretas	******	Hackathon	\N	3	REJECTED	2016-02-16 10:58:04.663-08	2016-02-16 10:58:04.663-08	2016-08-16 08:05:09.996-07	\N	paypal
63	31	14	USD	658	WwConnect Conference	Morning coffee day 2	******	Conference	\N	31	PAID	2016-03-19 17:00:00-07	2016-03-19 17:00:00-07	2016-06-14 11:14:21.032-07	\N	paypal
33	7	10	MXN	1038000	Libretas Hackathon	Pago entero para libretas de Hack for Equality	******	Hackathon	\N	3	REJECTED	2016-02-16 10:56:17.216-08	2016-02-16 10:56:17.216-08	2016-08-16 08:05:15.471-07	\N	paypal
776	31	14	USD	59040	Last minute (less than 7 day advance purchase) airline price purchase from SFO to JFK. Emailed Joey to alert of higher fare. 	\N	******	Other WWCode Event	\N	3	PAID	2017-01-28 06:06:40.223-08	2017-01-28 15:59:18.982-08	2017-02-07 10:32:49.378-08	\N	paypal
820	28	2	USD	10680	February Lightning Talks food	\N	******	Lightning Talks	\N	3	PAID	2017-02-11 19:22:39.341-08	2017-02-12 19:04:37.319-08	2017-03-14 10:17:54.1-07	\N	paypal
899	70	12	USD	20950	meetup with speaker, Heather VanCura, in conjunction with DevNexus conference	\N	******	Other WWCode Event	\N	3	PAID	2017-03-08 20:15:52.943-08	2017-03-08 21:17:56.148-08	2017-03-14 10:22:10.775-07	\N	paypal
900	70	12	USD	9732	IWD event -- wine for event	\N	******	Other WWCode Event	\N	3	PAID	2017-03-08 20:15:52.943-08	2017-03-08 21:20:17.878-08	2017-03-14 10:22:31.507-07	\N	paypal
858	171	59	USD	5798	Supplies for Agile workshop (2/26)	\N	******	Workshop	\N	3	PAID	2017-02-25 13:41:40.394-08	2017-02-26 13:29:05.754-08	2017-03-14 11:16:43.254-07	\N	paypal
886	3	511	MXN	14915	Leadership Development	\N	******	Conference	\N	3	PAID	2017-03-06 13:54:10.307-08	2017-03-07 04:57:52.472-08	2017-03-14 11:18:46.39-07	\N	manual
924	1332	277	USD	100000	To redeem travel stipend to Google I/O	\N	******	Conference	\N	3	PAID	2017-03-16 13:16:54.952-07	2017-03-16 18:25:25.526-07	2017-03-20 08:39:23.558-07	\N	paypal
926	1333	278	GBP	85000	Travel Stipend for Google I/O, now that I have secured my I/O Ticket via Google - see enclosed I/O Ticket Receipt)	\N	******	Scholarship	\N	3	PAID	2017-03-16 13:16:54.952-07	2017-03-16 23:43:54.949-07	2017-03-27 09:01:27.361-07	\N	paypal
935	1331	277	USD	100000	To redeem travel stipend to Google I/O	\N	******	Conference	\N	3	PAID	2017-03-20 12:19:06.997-07	2017-03-20 17:17:43.895-07	2017-03-27 10:54:16.852-07	\N	paypal
952	69	12	USD	50000	Google I/O	\N	******	Conference	\N	3	PAID	2017-03-26 09:01:07.917-07	2017-03-27 06:44:34.926-07	2017-03-27 10:11:39.352-07	\N	paypal
949	69	12	USD	37500	Google I/O ticket	\N	******	Conference	\N	3	PAID	2017-03-25 06:46:14.921-07	2017-03-25 08:06:03.662-07	2017-03-27 10:12:00.205-07	\N	paypal
965	1344	286	USD	37500	Google I/O Ticket  2017	\N	******	Leadership Development	\N	1344	APPROVED	2017-03-29 10:01:30.368-07	2017-03-29 13:36:36.032-07	2017-03-31 06:27:39.284-07	\N	paypal
966	171	59	USD	3405	Snacks for Unity 101 workshop.	\N	******	Workshop	\N	171	APPROVED	2017-03-29 10:01:30.368-07	2017-03-29 19:17:35.707-07	2017-03-29 19:19:03.184-07	\N	manual
967	171	59	USD	2085	Small thank you gifts for workshop instructors,	\N	******	Workshop	\N	171	APPROVED	2017-03-29 10:01:30.368-07	2017-03-29 19:21:03.723-07	2017-03-29 19:21:29.532-07	\N	manual
962	1344	286	USD	100000	Travel stipend to attend the Google I/O 2017 Conference.	\N	******	Conference	\N	3	PAID	2017-03-28 09:31:20.932-07	2017-03-29 09:18:26.633-07	2017-03-31 15:33:59.762-07	\N	paypal
974	3	286	USD	20000	Leadership Development: Conference Support: Karina M. 	\N	******	Conference	\N	1344	APPROVED	2017-03-31 10:33:05.687-07	2017-03-31 15:54:08.585-07	2017-03-31 18:11:20.009-07	\N	manual
988	3	295	USD	6000	Meetup Fees	\N	******	Leadership Development	\N	3	PAID	2017-04-05 07:08:17.838-07	2017-04-05 07:18:18.821-07	2017-04-05 07:19:21.382-07	\N	manual
998	3	12	USD	235699	Atlanta IWD Event	\N	******	Other WWCode Event	\N	3	PAID	2017-04-07 07:53:35.266-07	2017-04-07 13:27:41.491-07	2017-04-17 12:17:23.077-07	\N	manual
1001	171	59	USD	2891	Hackathon 2017 planning meeting	\N	******	Hackathon	\N	3	PAID	2017-04-09 08:46:01.525-07	2017-04-09 15:04:51.227-07	2017-04-11 12:15:09.869-07	\N	paypal
1002	171	59	USD	1527	Event supplies	\N	******	Leadership Supplies	\N	3	PAID	2017-04-09 08:46:01.525-07	2017-04-09 15:37:03.724-07	2017-04-11 12:13:28.739-07	\N	paypal
1016	1333	278	GBP	85000	WWCode CONNECT Conference Travel Stipend	\N	******	Conference	\N	3	PAID	2017-04-11 14:35:01.731-07	2017-04-12 07:42:51.103-07	2017-04-17 14:18:35.71-07	\N	paypal
1003	171	59	USD	3306	Event supplies	\N	******	Leadership Supplies	\N	171	APPROVED	2017-04-09 08:33:04.72-07	2017-04-09 15:37:53.717-07	2017-04-09 15:38:34.586-07	\N	manual
1007	142	48	USD	11948	Business cards and stickers	\N	******	Leadership Supplies	\N	3	PAID	2017-04-10 09:14:55.686-07	2017-04-10 14:31:17.015-07	2017-05-16 15:00:30.445-07	\N	manual
1027	3	270	USD	100000	Network Development: Attend CapOne WIT 2017 Kickoff to announce partnership for re-launch	\N	******	Other WWCode Event	\N	3	PAID	2017-04-17 12:15:50.71-07	2017-04-17 15:11:05.461-07	2017-04-17 15:12:23.057-07	\N	manual
1028	3	430	USD	100000	Google I/O Travel Grant: Yelyzaveta\tL.	Reimbursed via Western Union	******	Conference	\N	3	APPROVED	2017-04-17 12:15:52.793-07	2017-04-17 15:41:52.852-07	2017-04-17 15:42:06.121-07	2017-05-04 17:00:00-07	manual
1054	171	59	USD	2390	Planning meetings - Unity + VR workshops	\N	******	Workshop	\N	171	APPROVED	2017-04-24 15:33:05.343-07	2017-04-24 19:53:38.096-07	2017-04-24 20:08:41.521-07	\N	manual
1056	171	59	USD	33534	Hotel - Connect 2017	\N	******	Conference	\N	171	APPROVED	2017-04-24 15:31:39.131-07	2017-04-24 19:55:35.127-07	2017-04-24 20:08:38.705-07	\N	manual
1055	171	59	USD	13896	Flights for Connect 2017	\N	******	Conference	\N	171	APPROVED	2017-04-24 15:31:39.131-07	2017-04-24 19:54:40.938-07	2017-04-24 20:08:40.259-07	\N	manual
1084	142	48	USD	1554	Snacks and batteries for our robots	\N	******	Hack Night	\N	3	PAID	2017-04-18 17:00:00-07	2017-05-02 11:26:59.045-07	2017-05-16 15:00:04.484-07	\N	manual
1070	171	59	USD	1785	Tech Summit Lunch	\N	******	Conference	\N	171	APPROVED	2017-04-28 16:37:09.548-07	2017-04-29 14:42:39.653-07	2017-04-29 14:42:52.753-07	\N	manual
1093	171	59	USD	6513	Transportation - Connect 2017	\N	******	Conference	\N	171	APPROVED	2017-05-02 17:47:33.174-07	2017-05-03 13:05:13.476-07	2017-05-03 13:15:30.301-07	\N	manual
1099	3	430	USD	101200	Google i/o travel stipend for Yelyzaveta (plus $12 transfer fees)	\N	******	Scholarship	\N	3	PAID	2017-05-03 18:36:17.701-07	2017-05-04 12:05:15.03-07	2017-05-04 12:06:09.066-07	\N	manual
1085	142	48	USD	9777	Supplies for decorating our robots	\N	******	Hack Night	\N	3	PAID	2017-04-18 17:00:00-07	2017-05-02 11:28:49.091-07	2017-05-16 15:00:15.589-07	\N	manual
1086	142	48	USD	2989	Leadership meeting	\N	******	Leadership Development	\N	3	PAID	2017-04-21 17:00:00-07	2017-05-02 11:29:43.581-07	2017-05-16 14:59:48.244-07	\N	manual
1088	142	48	USD	100000	Google I/O Travel Stipend	\N	******	Conference	\N	3	PAID	2017-03-14 17:00:00-07	2017-05-02 11:34:08.158-07	2017-05-16 15:00:40.397-07	\N	manual
1092	171	59	USD	1950	Transportation - Connect 2017	\N	******	Conference	\N	171	APPROVED	2017-05-02 18:02:09.827-07	2017-05-03 12:52:47.919-07	2017-05-03 13:15:31.455-07	\N	manual
1137	171	59	USD	2680	Nametags	\N	******	Leadership Supplies	\N	171	APPROVED	2017-05-16 12:37:26.124-07	2017-05-16 15:26:29.898-07	2017-05-16 15:30:08.546-07	\N	paypal
1120	1378	301	EUR	2700	Regional Leadership Event: Barcelona	\N	******	Workshop	\N	1378	PENDING	2017-05-08 17:00:00-07	2017-05-10 13:08:43.707-07	2017-05-10 13:08:43.707-07	\N	paypal
1121	1378	301	EUR	2505	Regional Leadership Event: Barcelona	\N	******	Workshop	\N	1378	PENDING	2017-05-08 17:00:00-07	2017-05-10 13:09:17.149-07	2017-05-10 13:09:17.149-07	\N	paypal
1119	32	14	USD	11500	Farewell lunch for Clarissa + Welcome lunch for Pranoti 	\N	******	Other	\N	3	PAID	2017-05-10 03:03:37.039-07	2017-05-10 10:19:29.682-07	2017-05-16 14:55:26.77-07	\N	manual
1138	171	59	USD	3450	Color printing - flyers and signage for events. 	\N	******	Other	\N	171	APPROVED	2017-05-16 12:37:26.124-07	2017-05-16 15:41:15.044-07	2017-05-16 15:42:18.673-07	\N	paypal
1122	1378	301	EUR	19398	Regional Leadership Event: Barcelona	\N	******	Workshop	\N	3	PAID	2017-05-09 22:18:16.903-07	2017-05-10 13:10:54.588-07	2017-05-16 14:49:07.922-07	\N	manual
1123	3206	12	USD	500000	Deposit- We Rise Conference Hosting Location	\N	******	Conference	\N	3	PAID	2017-05-09 22:18:16.903-07	2017-05-10 18:32:36.838-07	2017-05-16 14:51:10.633-07	\N	manual
1143	32	14	USD	19017	Intro to Docker workshop food for attendees	\N	******	Workshop	\N	32	PENDING	2017-05-18 13:25:06.712-07	2017-05-18 21:24:00.964-07	2017-05-18 21:24:00.964-07	\N	paypal
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                         4037.dat                                                                                            0000600 0004000 0002000 00000050506 13156021737 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2016-01-08 16:22:34.641-08	2016-01-08 16:22:34.64-08	\N	3	10	HOST	27	\N	696	\N
2016-01-12 16:00:00-08	\N	\N	3	12	HOST	29	\N	696	\N
2016-01-12 16:00:00-08	\N	\N	3	13	HOST	30	\N	696	\N
2016-01-12 16:00:00-08	\N	\N	3	14	HOST	31	\N	696	\N
2016-09-01 07:41:37.755-07	2016-09-01 07:41:37.755-07	\N	1094	2	BACKER	1388	\N	739	64
2016-08-01 08:55:26.732-07	2016-08-01 08:55:26.732-07	\N	884	2	BACKER	1131	\N	751	64
2016-06-22 13:09:46.034-07	2016-06-22 13:09:46.034-07	\N	646	2	BACKER	846	\N	772	64
2016-06-06 12:04:36.955-07	2016-06-06 12:04:36.955-07	\N	551	2	BACKER	702	\N	782	64
2016-09-28 14:47:19.401-07	2016-09-28 14:47:19.401-07	\N	1299	2	BACKER	1634	\N	796	64
2016-05-03 06:07:28-07	2016-05-03 06:07:28-07	\N	308	2	BACKER	437	\N	799	64
2016-06-06 17:53:47.104-07	2016-06-06 17:53:47.104-07	\N	555	13	BACKER	708	\N	743	78
2016-03-25 08:11:05.1-07	2016-03-25 08:11:05.1-07	\N	192	2	BACKER	268	\N	806	64
2016-02-02 15:09:06.035-08	2016-02-02 15:09:06.035-08	\N	2	13	BACKER	109	\N	688	79
2016-04-29 06:51:18.812-07	2016-04-29 06:51:18.812-07	\N	303	13	BACKER	425	\N	809	78
2016-04-28 08:01:17.535-07	2016-04-28 08:01:17.535-07	\N	283	13	BACKER	407	\N	825	78
2016-08-01 08:54:14.068-07	2016-08-01 08:54:14.068-07	\N	883	2	BACKER	1130	\N	840	64
2016-04-13 09:46:10.223-07	2016-04-13 09:46:10.223-07	\N	224	2	BACKER	330	\N	821	64
2016-02-18 11:54:08.738-08	2016-02-18 11:54:08.738-08	\N	108	2	BACKER	138	\N	814	64
2016-06-21 09:05:00.99-07	2016-06-21 09:05:00.99-07	\N	642	4	BACKER	842	\N	776	85
2016-08-03 10:47:17.3-07	2016-08-03 10:47:17.3-07	\N	896	4	BACKER	1147	\N	760	84
2016-06-09 10:28:14.08-07	2016-06-09 10:28:14.08-07	\N	8	3	BACKER	717	\N	820	95
2016-06-21 09:02:55.799-07	2016-06-21 09:02:55.799-07	\N	642	12	BACKER	841	\N	776	107
2016-09-09 20:42:51.435-07	2016-09-09 20:42:51.435-07	\N	1158	241	BACKER	1471	\N	737	123
2016-01-18 15:54:06.501-08	2016-01-18 15:54:06.501-08	\N	2	10	BACKER	61	\N	688	98
2016-06-21 09:06:05.21-07	2016-06-21 09:06:05.21-07	\N	642	48	BACKER	843	\N	776	155
2016-09-22 18:07:10.698-07	2016-09-22 18:07:10.698-07	\N	1263	59	BACKER	1568	\N	793	147
2016-06-09 17:00:00-07	\N	\N	577	4	ADMIN	738	\N	693	\N
2016-02-02 13:46:44.979-08	2016-02-02 13:46:44.979-08	\N	8	14	BACKER	108	\N	820	194
2016-09-29 11:10:43.419-07	2016-09-29 11:10:43.419-07	\N	1331	277	ADMIN	1666	\N	695	\N
2016-03-06 16:00:00-08	\N	\N	142	48	ADMIN	204	\N	697	\N
2016-09-29 11:43:49.259-07	2016-09-29 11:43:49.259-07	\N	3	301	HOST	1715	\N	696	\N
2017-02-27 16:25:20.392-08	2017-02-27 16:25:20.392-08	\N	3301	522	BACKER	3424	\N	838	56
2017-02-10 08:47:34.941-08	2017-02-10 08:47:34.941-08	\N	3053	15	BACKER	3214	\N	839	66
2016-11-28 07:33:15.87-08	2016-11-28 07:33:15.87-08	\N	1890	2	BACKER	2289	\N	811	64
2017-01-14 09:11:43.287-08	2017-01-14 09:11:43.287-08	\N	2549	270	BACKER	2767	\N	763	103
2017-02-01 07:16:22.449-08	2017-02-01 07:16:22.449-08	\N	2898	48	BACKER	3042	\N	802	153
2016-09-29 11:30:08.999-07	2016-09-29 11:30:08.999-07	\N	1355	292	ADMIN	1690	\N	770	\N
2016-09-29 11:37:07.378-07	2016-09-29 11:37:07.378-07	\N	1367	298	ADMIN	1701	\N	777	\N
2016-09-29 11:43:49.259-07	2016-09-29 11:43:49.259-07	\N	1377	301	ADMIN	1713	\N	784	\N
2016-09-29 11:43:49.259-07	2016-09-29 11:43:49.259-07	\N	1376	301	ADMIN	1712	\N	787	\N
2016-09-29 11:41:11.097-07	2016-09-29 11:41:11.097-07	\N	1373	300	ADMIN	1709	\N	792	\N
2016-09-29 11:43:49.259-07	2016-09-29 11:43:49.259-07	\N	1378	301	ADMIN	1714	\N	794	\N
2016-09-29 11:41:11.089-07	2016-09-29 11:41:11.089-07	\N	1372	300	ADMIN	1707	\N	795	\N
2016-09-29 11:41:11.077-07	2016-09-29 11:41:11.077-07	\N	1371	300	ADMIN	1706	\N	797	\N
2016-09-29 11:43:49.258-07	2016-09-29 11:43:49.258-07	\N	1379	301	ADMIN	1711	\N	801	\N
2016-09-29 11:38:54.983-07	2016-09-29 11:38:54.983-07	\N	1369	299	ADMIN	1704	\N	803	\N
2016-09-29 11:38:54.974-07	2016-09-29 11:38:54.974-07	\N	1368	299	ADMIN	1703	\N	805	\N
2016-09-29 11:37:07.378-07	2016-09-29 11:37:07.378-07	\N	1366	298	ADMIN	1702	\N	808	\N
2016-09-29 11:34:59.53-07	2016-09-29 11:34:59.53-07	\N	1364	297	ADMIN	1699	\N	813	\N
2016-09-29 11:37:07.37-07	2016-09-29 11:37:07.37-07	\N	1365	298	ADMIN	1700	\N	812	\N
2016-09-29 11:34:59.53-07	2016-09-29 11:34:59.53-07	\N	1363	297	ADMIN	1698	\N	815	\N
2016-09-29 11:34:59.522-07	2016-09-29 11:34:59.522-07	\N	1362	297	ADMIN	1697	\N	816	\N
2016-09-29 11:33:37.221-07	2016-09-29 11:33:37.221-07	\N	1360	295	ADMIN	1696	\N	819	\N
2016-09-29 11:38:54.983-07	2016-09-29 11:38:54.983-07	\N	1370	299	ADMIN	1705	\N	826	\N
2016-09-29 11:33:37.213-07	2016-09-29 11:33:37.213-07	\N	1359	295	ADMIN	1694	\N	829	\N
2016-09-29 11:43:49.24-07	2016-09-29 11:43:49.24-07	\N	1375	301	ADMIN	1710	\N	830	\N
2016-09-29 11:33:37.221-07	2016-09-29 11:33:37.221-07	\N	1361	295	ADMIN	1695	\N	833	\N
2016-09-29 11:32:01.003-07	2016-09-29 11:32:01.003-07	\N	1358	294	ADMIN	1693	\N	834	\N
2016-01-12 16:00:00-08	\N	\N	3	15	HOST	32	\N	696	\N
2016-03-06 16:00:00-08	\N	\N	3	47	HOST	203	\N	696	\N
2016-03-06 16:00:00-08	\N	\N	3	48	HOST	205	\N	696	\N
2015-10-31 17:00:00-07	2015-10-31 17:00:00-07	\N	3	51	HOST	213	\N	696	\N
2016-01-31 16:00:00-08	\N	\N	3	2	HOST	18	\N	696	\N
2016-01-31 16:00:00-08	\N	\N	3	3	HOST	19	\N	696	\N
2016-01-31 16:00:00-08	\N	\N	3	4	HOST	20	\N	696	\N
2016-03-18 17:00:00-07	2016-03-18 17:00:00-07	\N	3	59	HOST	246	\N	696	\N
2016-08-01 17:00:00-07	2016-08-01 17:00:00-07	\N	3	195	HOST	1149	\N	696	\N
2016-09-07 15:13:23.811-07	2016-09-07 15:13:23.811-07	\N	3	241	HOST	1458	\N	696	\N
2016-09-29 11:41:11.097-07	2016-09-29 11:41:11.097-07	\N	3	300	HOST	1716	\N	696	\N
2016-09-29 11:38:54.983-07	2016-09-29 11:38:54.983-07	\N	3	299	HOST	1717	\N	696	\N
2016-09-29 11:37:07.378-07	2016-09-29 11:37:07.378-07	\N	3	298	HOST	1718	\N	696	\N
2016-09-29 11:34:59.53-07	2016-09-29 11:34:59.53-07	\N	3	297	HOST	1719	\N	696	\N
2016-09-29 11:33:37.221-07	2016-09-29 11:33:37.221-07	\N	3	295	HOST	1720	\N	696	\N
2016-09-29 11:32:01.003-07	2016-09-29 11:32:01.003-07	\N	3	294	HOST	1721	\N	696	\N
2016-09-29 11:30:54.26-07	2016-09-29 11:30:54.26-07	\N	3	293	HOST	1722	\N	696	\N
2016-09-29 11:30:08.999-07	2016-09-29 11:30:08.999-07	\N	3	292	HOST	1723	\N	696	\N
2016-09-29 11:28:54.298-07	2016-09-29 11:28:54.298-07	\N	3	291	HOST	1724	\N	696	\N
2016-09-29 11:28:08.494-07	2016-09-29 11:28:08.494-07	\N	3	290	HOST	1725	\N	696	\N
2016-09-29 11:26:35.16-07	2016-09-29 11:26:35.16-07	\N	3	289	HOST	1726	\N	696	\N
2016-09-29 11:25:22.012-07	2016-09-29 11:25:22.012-07	\N	3	288	HOST	1727	\N	696	\N
2016-09-29 11:24:17.83-07	2016-09-29 11:24:17.83-07	\N	3	287	HOST	1728	\N	696	\N
2016-09-29 11:19:11.467-07	2016-09-29 11:19:11.467-07	\N	3	286	HOST	1729	\N	696	\N
2016-09-29 11:17:47.337-07	2016-09-29 11:17:47.337-07	\N	3	285	HOST	1730	\N	696	\N
2016-09-29 11:16:52.145-07	2016-09-29 11:16:52.145-07	\N	3	284	HOST	1732	\N	696	\N
2016-09-29 11:16:17.13-07	2016-09-29 11:16:17.13-07	\N	3	283	HOST	1733	\N	696	\N
2016-09-29 11:15:23.948-07	2016-09-29 11:15:23.948-07	\N	3	282	HOST	1734	\N	696	\N
2016-09-29 11:14:46.62-07	2016-09-29 11:14:46.62-07	\N	3	281	HOST	1735	\N	696	\N
2016-09-29 11:13:48.784-07	2016-09-29 11:13:48.784-07	\N	3	280	HOST	1736	\N	696	\N
2016-09-29 11:12:58.888-07	2016-09-29 11:12:58.888-07	\N	3	279	HOST	1737	\N	696	\N
2016-09-29 11:11:53.87-07	2016-09-29 11:11:53.87-07	\N	3	278	HOST	1738	\N	696	\N
2016-09-29 11:10:43.445-07	2016-09-29 11:10:43.445-07	\N	3	277	HOST	1739	\N	696	\N
2016-09-29 11:09:42.812-07	2016-09-29 11:09:42.812-07	\N	3	276	HOST	1740	\N	696	\N
2016-09-29 11:08:19.528-07	2016-09-29 11:08:19.528-07	\N	3	275	HOST	1741	\N	696	\N
2016-09-29 11:06:44.758-07	2016-09-29 11:06:44.758-07	\N	3	274	HOST	1742	\N	696	\N
2016-09-29 11:06:00.979-07	2016-09-29 11:06:00.979-07	\N	3	273	HOST	1743	\N	696	\N
2016-09-29 11:05:19.101-07	2016-09-29 11:05:19.101-07	\N	3	272	HOST	1744	\N	696	\N
2016-09-29 11:03:46.814-07	2016-09-29 11:03:46.814-07	\N	3	271	HOST	1745	\N	696	\N
2016-09-29 11:02:54.581-07	2016-09-29 11:02:54.581-07	\N	3	270	HOST	1746	\N	696	\N
2016-09-29 11:01:49.724-07	2016-09-29 11:01:49.724-07	\N	3	269	HOST	1747	\N	696	\N
2016-09-29 11:01:04.753-07	2016-09-29 11:01:04.753-07	\N	3	268	HOST	1748	\N	696	\N
2016-09-29 11:00:01.891-07	2016-09-29 11:00:01.891-07	\N	3	267	HOST	1749	\N	696	\N
2016-09-29 10:59:15.446-07	2016-09-29 10:59:15.446-07	\N	3	266	HOST	1750	\N	696	\N
2016-09-29 10:58:16.643-07	2016-09-29 10:58:16.643-07	\N	3	265	HOST	1751	\N	696	\N
2016-09-29 10:54:53.501-07	2016-09-29 10:54:53.501-07	\N	3	264	HOST	1752	\N	696	\N
2016-09-29 10:53:00.559-07	2016-09-29 10:53:00.559-07	\N	3	263	HOST	1753	\N	696	\N
2016-09-29 10:51:29.396-07	2016-09-29 10:51:29.396-07	\N	3	262	HOST	1754	\N	696	\N
2016-09-29 10:49:43.088-07	2016-09-29 10:49:43.088-07	\N	3	261	HOST	1755	\N	696	\N
2016-09-29 10:44:40.461-07	2016-09-29 10:44:40.461-07	\N	3	260	HOST	1756	\N	696	\N
2016-09-29 10:43:14.112-07	2016-09-29 10:43:14.112-07	\N	3	259	HOST	1757	\N	696	\N
2017-01-03 16:00:00-08	2017-01-03 16:00:00-08	\N	3	430	HOST	2682	\N	696	\N
2017-02-21 08:25:28.555-08	2017-02-21 08:25:28.555-08	\N	3	510	HOST	3326	\N	696	\N
2017-02-21 08:55:29.765-08	2017-02-21 08:55:29.765-08	\N	3	511	HOST	3328	\N	696	\N
2017-02-21 10:11:30.855-08	2017-02-21 10:11:30.855-08	\N	3	512	HOST	3332	\N	696	\N
2017-02-21 10:35:34.613-08	2017-02-21 10:35:34.613-08	\N	3	513	HOST	3334	\N	696	\N
2017-02-21 10:49:14.435-08	2017-02-21 10:49:14.435-08	\N	3	515	HOST	3338	\N	696	\N
2017-02-21 11:02:21.646-08	2017-02-21 11:02:21.646-08	\N	3	516	HOST	3341	\N	696	\N
2017-02-21 11:07:25.321-08	2017-02-21 11:07:25.321-08	\N	3	517	HOST	3343	\N	696	\N
2017-02-21 11:13:03.538-08	2017-02-21 11:13:03.538-08	\N	3	518	HOST	3345	\N	696	\N
2017-02-21 11:25:28.822-08	2017-02-21 11:25:28.822-08	\N	3	519	HOST	3347	\N	696	\N
2017-02-21 11:34:47.427-08	2017-02-21 11:34:47.427-08	\N	3	520	HOST	3349	\N	696	\N
2017-02-21 11:39:46.29-08	2017-02-21 11:39:46.29-08	\N	3	521	HOST	3351	\N	696	\N
2017-02-21 11:45:19.309-08	2017-02-21 11:45:19.309-08	\N	3	522	HOST	3353	\N	696	\N
2017-02-21 12:04:49.156-08	2017-02-21 12:04:49.156-08	\N	3	523	HOST	3355	\N	696	\N
2017-02-21 12:11:44.893-08	2017-02-21 12:11:44.893-08	\N	3	524	HOST	3357	\N	696	\N
2017-02-21 12:16:59.184-08	2017-02-21 12:16:59.184-08	\N	3	525	HOST	3359	\N	696	\N
2017-04-03 09:22:46.049-07	2017-04-03 09:22:46.049-07	\N	3	584	HOST	3951	\N	696	\N
2015-11-19 02:07:53.479-08	2017-09-12 11:13:43.447-07	\N	3	696	HOST	4719	\N	696	\N
2017-05-10 16:45:46.804-07	2017-05-10 16:45:46.804-07	\N	4749	522	BACKER	4528	\N	748	56
2016-09-12 21:15:05.534-07	2016-09-12 21:15:05.534-07	\N	1178	2	BACKER	1494	\N	789	64
2017-04-11 19:05:36.09-07	2017-04-11 19:05:36.09-07	\N	4173	13	BACKER	4093	\N	694	78
2017-04-04 12:51:04.96-07	2017-04-04 12:51:04.96-07	\N	3999	2	BACKER	3972	\N	837	64
2017-05-09 11:14:23.365-07	2017-05-09 11:14:23.365-07	\N	4720	2	BACKER	4500	\N	847	64
2016-03-02 13:31:50.622-08	2016-03-02 13:31:50.622-08	\N	129	2	BACKER	178	\N	689	64
2016-01-29 14:23:53.527-08	2016-01-29 14:23:53.527-08	\N	30	12	BACKER	87	\N	691	107
2017-03-09 10:29:55.806-08	2017-03-09 10:29:55.806-08	\N	3442	259	BACKER	3521	\N	755	116
2016-12-18 17:41:29.216-08	2016-12-18 17:41:29.216-08	\N	2220	259	BACKER	2545	\N	700	116
2017-04-20 03:17:23.321-07	2017-04-20 03:17:23.321-07	\N	4348	59	BACKER	4200	\N	841	147
2017-01-16 10:03:56.965-08	2017-01-16 10:03:56.965-08	\N	2561	48	BACKER	2772	\N	701	153
2017-05-01 10:13:36.311-07	2017-05-01 10:13:36.311-07	\N	4550	516	BACKER	4371	\N	786	186
2016-09-29 11:08:19.528-07	2016-09-29 11:08:19.528-07	\N	1328	275	ADMIN	1663	\N	686	\N
2016-02-02 08:36:39.043-08	2016-02-02 08:36:39.043-08	\N	30	14	BACKER	101	\N	691	194
2016-09-29 11:09:42.806-07	2016-09-29 11:09:42.806-07	\N	1329	276	ADMIN	1664	\N	687	\N
2017-04-03 09:22:45.962-07	2017-04-03 09:22:45.962-07	\N	3206	584	ADMIN	3950	\N	690	\N
2016-05-23 13:27:28.294-07	2016-05-23 13:27:28.294-07	\N	426	2	BACKER	573	\N	742	64
2016-07-01 15:31:46.068-07	2016-07-01 15:31:46.068-07	\N	686	2	BACKER	894	\N	804	65
2016-03-01 20:42:00.064-08	2016-03-01 20:42:00.064-08	\N	126	13	BACKER	169	\N	705	79
2016-11-30 08:11:42.605-08	2016-11-30 08:11:42.605-08	\N	1957	2	BACKER	2339	\N	711	64
2016-10-07 09:49:20.388-07	2016-10-07 09:49:20.388-07	\N	1446	241	BACKER	1822	\N	713	122
2016-11-29 02:03:23.974-08	2016-11-29 02:03:23.974-08	\N	1908	301	BACKER	2296	\N	708	126
2016-11-17 09:43:31.221-08	2016-11-17 09:43:31.221-08	\N	1808	59	BACKER	2202	\N	709	147
2016-11-22 07:22:40.419-08	2016-11-22 07:22:40.419-08	\N	1846	59	BACKER	2246	\N	702	147
2017-05-08 22:59:17.562-07	2017-05-08 22:59:17.562-07	\N	4711	517	BACKER	4493	\N	712	163
2017-05-15 05:07:59.716-07	2017-05-15 05:07:59.716-07	\N	4834	14	BACKER	4597	\N	800	193
2016-09-29 11:30:08.992-07	2016-09-29 11:30:08.992-07	\N	1354	292	ADMIN	1689	\N	716	\N
2016-09-29 11:30:54.26-07	2016-09-29 11:30:54.26-07	\N	1356	293	ADMIN	1691	\N	720	\N
2016-09-29 11:26:35.16-07	2016-09-29 11:26:35.16-07	\N	1350	289	ADMIN	1685	\N	723	\N
2016-10-06 11:36:39.082-07	2016-10-06 11:36:39.082-07	\N	1438	2	BACKER	1815	\N	714	64
2017-01-03 16:00:00-08	2017-01-03 16:00:00-08	\N	2431	430	ADMIN	2681	\N	704	\N
2016-09-29 11:32:00.998-07	2016-09-29 11:32:00.998-07	\N	1357	294	ADMIN	1692	\N	715	\N
2016-02-02 09:04:56.333-08	2016-02-02 09:04:56.333-08	\N	30	13	BACKER	103	\N	691	79
2016-02-02 08:52:02.312-08	2016-02-02 08:52:02.312-08	\N	80	10	BACKER	102	\N	769	98
2017-04-30 18:40:31.703-07	2017-04-30 18:40:31.703-07	\N	3419	516	BACKER	4353	\N	842	186
2016-09-29 10:44:40.454-07	2016-09-29 10:44:40.454-07	\N	1304	260	ADMIN	1638	\N	706	\N
2016-09-29 11:41:11.097-07	2016-09-29 11:41:11.097-07	\N	1374	300	ADMIN	1708	\N	707	\N
2016-09-29 11:28:54.298-07	2016-09-29 11:28:54.298-07	\N	1353	291	ADMIN	1688	\N	721	\N
2016-09-29 11:28:08.489-07	2016-09-29 11:28:08.489-07	\N	1351	290	ADMIN	1686	\N	722	\N
2017-02-01 09:30:50.44-08	2017-02-01 09:30:50.44-08	\N	2906	271	BACKER	3045	\N	692	70
2017-04-10 18:09:50.695-07	2017-04-10 18:09:50.695-07	\N	4153	13	BACKER	4088	\N	843	78
2016-05-19 12:24:42.921-07	2016-05-19 12:24:42.921-07	\N	392	2	BACKER	533	\N	719	64
2017-01-03 12:59:38.784-08	2017-01-03 12:59:38.784-08	\N	2416	2	BACKER	2665	\N	710	64
2016-09-20 13:58:51.903-07	2016-09-20 13:58:51.903-07	\N	1244	4	BACKER	1544	\N	718	85
2017-01-18 05:54:51.032-08	2017-01-18 05:54:51.032-08	\N	2594	48	BACKER	2794	\N	698	153
2016-09-29 11:25:22.012-07	2016-09-29 11:25:22.012-07	\N	1348	288	ADMIN	1683	\N	725	\N
2016-01-31 16:00:00-08	\N	\N	73	3	ADMIN	94	\N	726	\N
2016-09-29 11:24:17.83-07	2016-09-29 11:24:17.83-07	\N	1346	287	ADMIN	1681	\N	727	\N
2016-09-29 11:24:17.825-07	2016-09-29 11:24:17.825-07	\N	1345	287	ADMIN	1680	\N	728	\N
2016-09-29 11:19:11.462-07	2016-09-29 11:19:11.462-07	\N	1343	286	ADMIN	1678	\N	729	\N
2016-09-29 11:16:52.145-07	2016-09-29 11:16:52.145-07	\N	1341	284	ADMIN	1676	\N	730	\N
2016-09-29 11:17:47.337-07	2016-09-29 11:17:47.337-07	\N	1342	285	ADMIN	1677	\N	731	\N
2016-09-29 11:16:17.13-07	2016-09-29 11:16:17.13-07	\N	1340	283	ADMIN	1675	\N	732	\N
2016-09-29 11:14:46.62-07	2016-09-29 11:14:46.62-07	\N	1338	281	ADMIN	1673	\N	733	\N
2016-09-29 11:15:23.948-07	2016-09-29 11:15:23.948-07	\N	1339	282	ADMIN	1674	\N	734	\N
2016-09-29 11:13:48.784-07	2016-09-29 11:13:48.784-07	\N	1337	280	ADMIN	1672	\N	735	\N
2016-09-29 11:12:58.888-07	2016-09-29 11:12:58.888-07	\N	1336	279	ADMIN	1671	\N	736	\N
2016-09-29 11:11:53.87-07	2016-09-29 11:11:53.87-07	\N	1334	278	ADMIN	1669	\N	738	\N
2016-09-07 15:13:23.641-07	2016-09-07 15:13:23.641-07	\N	1145	241	ADMIN	1457	\N	740	\N
2016-09-29 11:09:42.812-07	2016-09-29 11:09:42.812-07	\N	1330	276	ADMIN	1665	\N	741	\N
2016-09-29 11:06:44.758-07	2016-09-29 11:06:44.758-07	\N	1326	274	ADMIN	1661	\N	744	\N
2016-09-29 11:05:19.093-07	2016-09-29 11:05:19.093-07	\N	1323	272	ADMIN	1658	\N	746	\N
2016-09-29 11:05:19.101-07	2016-09-29 11:05:19.101-07	\N	1324	272	ADMIN	1659	\N	745	\N
2016-08-01 17:00:00-07	2016-08-01 17:00:00-07	\N	898	195	ADMIN	1151	\N	747	\N
2016-08-01 17:00:00-07	2016-08-01 17:00:00-07	\N	897	195	ADMIN	1150	\N	749	\N
2016-09-29 11:03:46.814-07	2016-09-29 11:03:46.814-07	\N	1322	271	ADMIN	1657	\N	750	\N
2016-09-29 11:02:54.581-07	2016-09-29 11:02:54.581-07	\N	1321	270	ADMIN	1656	\N	752	\N
2016-09-29 11:02:54.576-07	2016-09-29 11:02:54.576-07	\N	1320	270	ADMIN	1655	\N	753	\N
2016-09-29 11:01:49.724-07	2016-09-29 11:01:49.724-07	\N	1319	269	ADMIN	1654	\N	754	\N
2016-01-31 16:00:00-08	\N	\N	68	15	ADMIN	89	\N	756	\N
2016-09-29 11:25:22-07	2016-09-29 11:25:22-07	\N	1347	288	ADMIN	1682	\N	757	\N
2016-09-29 11:01:04.753-07	2016-09-29 11:01:04.753-07	\N	1318	268	ADMIN	1653	\N	758	\N
2016-09-29 11:01:04.72-07	2016-09-29 11:01:04.72-07	\N	1317	268	ADMIN	1652	\N	759	\N
2016-09-29 10:59:15.446-07	2016-09-29 10:59:15.446-07	\N	1316	266	ADMIN	1650	\N	761	\N
2016-09-29 10:58:16.643-07	2016-09-29 10:58:16.643-07	\N	1315	265	ADMIN	1649	\N	762	\N
2016-01-31 16:00:00-08	\N	\N	70	12	ADMIN	91	\N	764	\N
2016-09-29 10:54:53.501-07	2016-09-29 10:54:53.501-07	\N	1314	264	ADMIN	1648	\N	765	\N
2016-09-29 11:00:01.891-07	2016-09-29 11:00:01.891-07	\N	1314	267	ADMIN	1651	\N	765	\N
2016-09-29 10:54:53.485-07	2016-09-29 10:54:53.485-07	\N	1313	264	ADMIN	1647	\N	766	\N
2016-01-10 16:00:00-08	\N	\N	31	14	ADMIN	13	\N	767	\N
2016-09-29 10:53:00.559-07	2016-09-29 10:53:00.559-07	\N	1312	263	ADMIN	1646	\N	768	\N
2016-09-29 10:51:29.396-07	2016-09-29 10:51:29.396-07	\N	1310	262	ADMIN	1644	\N	771	\N
2016-01-31 16:00:00-08	\N	\N	77	4	ADMIN	98	\N	774	\N
2016-09-29 10:51:29.377-07	2016-09-29 10:51:29.377-07	\N	1309	262	ADMIN	1643	\N	773	\N
2016-01-31 16:00:00-08	\N	\N	72	3	ADMIN	93	\N	775	\N
2016-09-29 10:49:43.088-07	2016-09-29 10:49:43.088-07	\N	1308	261	ADMIN	1642	\N	778	\N
2016-01-31 16:00:00-08	\N	\N	78	4	ADMIN	99	\N	779	\N
2016-01-31 16:00:00-08	\N	\N	75	4	ADMIN	96	\N	780	\N
2016-09-29 10:49:43.081-07	2016-09-29 10:49:43.081-07	\N	1307	261	ADMIN	1641	\N	781	\N
2016-09-29 10:44:40.461-07	2016-09-29 10:44:40.461-07	\N	1305	260	ADMIN	1639	\N	783	\N
2016-01-31 16:00:00-08	\N	\N	76	4	ADMIN	97	\N	785	\N
2016-01-31 16:00:00-08	\N	\N	67	13	ADMIN	88	\N	788	\N
2016-09-29 10:53:00.559-07	2016-09-29 10:53:00.559-07	\N	1311	263	ADMIN	1645	\N	790	\N
2016-09-29 11:12:58.877-07	2016-09-29 11:12:58.877-07	\N	1335	279	ADMIN	1670	\N	791	\N
2016-01-10 16:00:00-08	\N	\N	32	14	ADMIN	14	\N	798	\N
2016-01-10 16:00:00-08	\N	\N	35	12	ADMIN	11	\N	807	\N
2016-03-18 17:00:00-07	2016-03-18 17:00:00-07	\N	170	59	ADMIN	247	\N	810	\N
2016-01-31 16:00:00-08	\N	\N	71	3	ADMIN	92	\N	817	\N
2016-01-10 16:00:00-08	\N	\N	33	13	ADMIN	12	\N	818	\N
2016-01-10 16:00:00-08	\N	\N	7	10	ADMIN	8	\N	822	\N
2016-01-10 16:00:00-08	\N	\N	37	10	ADMIN	10	\N	823	\N
2016-01-10 16:00:00-08	\N	\N	34	15	ADMIN	15	\N	824	\N
2016-01-10 16:00:00-08	\N	\N	36	10	ADMIN	9	\N	827	\N
2016-03-18 17:00:00-07	2016-03-18 17:00:00-07	\N	171	59	ADMIN	248	\N	828	\N
2016-09-29 11:11:53.863-07	2016-09-29 11:11:53.863-07	\N	1333	278	ADMIN	1668	\N	831	\N
2016-09-29 11:10:43.445-07	2016-09-29 11:10:43.445-07	\N	1332	277	ADMIN	1667	\N	832	\N
2016-01-31 16:00:00-08	\N	\N	69	12	ADMIN	90	\N	835	\N
2016-09-29 11:08:19.514-07	2016-09-29 11:08:19.514-07	\N	1327	275	ADMIN	1662	\N	836	\N
2016-09-29 11:06:00.979-07	2016-09-29 11:06:00.979-07	\N	1325	273	ADMIN	1660	\N	844	\N
2016-03-06 16:00:00-08	\N	\N	141	47	ADMIN	202	\N	845	\N
2016-01-31 16:00:00-08	\N	\N	74	4	ADMIN	95	\N	846	\N
2015-05-02 17:00:00-07	\N	\N	28	2	ADMIN	5	\N	848	\N
2017-02-21 08:25:28.457-08	2017-02-21 08:25:28.457-08	\N	3	510	ADMIN	3325	\N	696	\N
2017-02-21 10:11:30.773-08	2017-02-21 10:11:30.773-08	\N	3	512	ADMIN	3331	\N	696	\N
2017-02-21 08:55:29.655-08	2017-02-21 08:55:29.655-08	\N	3	511	ADMIN	3327	\N	696	\N
2017-02-21 10:35:34.524-08	2017-02-21 10:35:34.524-08	\N	3	513	ADMIN	3333	\N	696	\N
2017-02-21 10:49:14.345-08	2017-02-21 10:49:14.345-08	\N	3	515	ADMIN	3337	\N	696	\N
2017-02-21 11:02:21.568-08	2017-02-21 11:02:21.568-08	\N	3	516	ADMIN	3340	\N	696	\N
2017-02-21 11:07:25.188-08	2017-02-21 11:07:25.188-08	\N	3	517	ADMIN	3342	\N	696	\N
2017-02-21 11:13:03.394-08	2017-02-21 11:13:03.394-08	\N	3	518	ADMIN	3344	\N	696	\N
2017-02-21 11:25:28.725-08	2017-02-21 11:25:28.725-08	\N	3	519	ADMIN	3346	\N	696	\N
2017-02-21 11:34:47.02-08	2017-02-21 11:34:47.02-08	\N	3	520	ADMIN	3348	\N	696	\N
2017-02-21 11:39:46.239-08	2017-02-21 11:39:46.239-08	\N	3	521	ADMIN	3350	\N	696	\N
2017-02-21 11:45:19.169-08	2017-02-21 11:45:19.169-08	\N	3	522	ADMIN	3352	\N	696	\N
2017-02-21 12:04:48.979-08	2017-02-21 12:04:48.979-08	\N	3	523	ADMIN	3354	\N	696	\N
2017-02-21 12:11:44.767-08	2017-02-21 12:11:44.767-08	\N	3	524	ADMIN	3356	\N	696	\N
2017-02-21 12:16:59.092-08	2017-02-21 12:16:59.092-08	\N	3	525	ADMIN	3358	\N	696	\N
2016-09-29 11:19:11.467-07	2016-09-29 11:19:11.467-07	\N	1344	286	ADMIN	1679	\N	699	\N
2016-09-29 10:43:14.112-07	2016-09-29 10:43:14.112-07	\N	1303	259	ADMIN	1637	\N	703	\N
2016-09-29 11:28:08.494-07	2016-09-29 11:28:08.494-07	\N	1352	290	ADMIN	1687	\N	717	\N
2016-09-29 11:26:35.151-07	2016-09-29 11:26:35.151-07	\N	1349	289	ADMIN	1684	\N	724	\N
\.


                                                                                                                                                                                          4025.dat                                                                                            0000600 0004000 0002000 00000162062 13156021737 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        8141	email	mailinglist.host	t	2017-02-21 12:04:49.157-08	2017-02-21 12:04:49.157-08	3	523	http://****
8147	email	mailinglist.host	t	2017-02-21 12:11:44.894-08	2017-02-21 12:11:44.894-08	3	524	http://****
8153	email	mailinglist.host	t	2017-02-21 12:16:59.184-08	2017-02-21 12:16:59.184-08	3	525	http://****
595	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	286	http://****
596	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	287	http://****
597	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	195	http://****
598	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	288	http://****
599	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	289	http://****
735	email	mailinglist.backers	t	2016-10-10 13:37:16.762-07	2016-10-10 13:37:16.762-07	108	2	http://****
16243	email	mailinglist.backers	t	2017-05-09 11:14:23.366-07	2017-05-09 11:14:23.366-07	4720	2	http://****
1360	email	mailinglist.backers	t	2016-10-10 13:37:16.984-07	2016-10-10 13:37:16.984-07	686	2	http://****
1911	email	mailinglist.backers	t	2016-10-10 13:37:17.146-07	2016-10-10 13:37:17.146-07	1178	2	http://****
2645	email	mailinglist.backers	t	2016-11-22 07:22:40.421-08	2016-11-22 07:22:40.421-08	1846	59	http://****
6351	email	mailinglist.backers	t	2017-01-14 09:11:43.288-08	2017-01-14 09:11:43.288-08	2549	270	http://****
6368	email	mailinglist.backers	t	2017-01-16 10:03:56.966-08	2017-01-16 10:03:56.966-08	2561	48	http://****
6433	email	mailinglist.backers	t	2017-01-18 05:54:51.032-08	2017-01-18 05:54:51.032-08	2594	48	http://****
16640	email	mailinglist.backers	t	2017-05-15 05:07:59.717-07	2017-05-15 05:07:59.717-07	4834	14	http://****
7122	email	mailinglist.backers	t	2017-02-01 09:30:50.441-08	2017-02-01 09:30:50.441-08	2906	271	http://****
7610	email	mailinglist.backers	t	2017-02-10 08:47:34.942-08	2017-02-10 08:47:34.942-08	3053	15	http://****
8040	email	mailinglist.host	t	2017-02-21 08:25:28.556-08	2017-02-21 08:25:28.556-08	3	510	http://****
8048	email	mailinglist.host	t	2017-02-21 08:55:29.765-08	2017-02-21 08:55:29.765-08	3	511	http://****
8064	email	mailinglist.host	t	2017-02-21 10:11:30.856-08	2017-02-21 10:11:30.856-08	3	512	http://****
8074	email	mailinglist.host	t	2017-02-21 10:35:34.614-08	2017-02-21 10:35:34.614-08	3	513	http://****
8140	email	collective.monthlyreport	t	2017-02-21 12:04:48.984-08	2017-02-21 12:04:48.984-08	3	523	http://****
8146	email	collective.monthlyreport	t	2017-02-21 12:11:44.769-08	2017-02-21 12:11:44.769-08	3	524	http://****
8152	email	collective.monthlyreport	t	2017-02-21 12:16:59.094-08	2017-02-21 12:16:59.094-08	3	525	http://****
8039	email	collective.monthlyreport	t	2017-02-21 08:25:28.459-08	2017-02-21 08:25:28.459-08	3	510	http://****
8047	email	collective.monthlyreport	t	2017-02-21 08:55:29.66-08	2017-02-21 08:55:29.66-08	3206	511	http://****
8063	email	collective.monthlyreport	t	2017-02-21 10:11:30.775-08	2017-02-21 10:11:30.775-08	3	512	http://****
8073	email	collective.monthlyreport	t	2017-02-21 10:35:34.526-08	2017-02-21 10:35:34.526-08	3	513	http://****
8142	email	collective.transaction.created	t	2017-02-21 12:04:49.157-08	2017-02-21 12:04:49.157-08	3	523	http://****
8148	email	collective.transaction.created	t	2017-02-21 12:11:44.895-08	2017-02-21 12:11:44.895-08	3	524	http://****
8154	email	collective.transaction.created	t	2017-02-21 12:16:59.185-08	2017-02-21 12:16:59.185-08	3	525	http://****
8041	email	collective.transaction.created	t	2017-02-21 08:25:28.556-08	2017-02-21 08:25:28.556-08	3	510	http://****
8049	email	collective.transaction.created	t	2017-02-21 08:55:29.765-08	2017-02-21 08:55:29.765-08	3	511	http://****
8065	email	collective.transaction.created	t	2017-02-21 10:11:30.856-08	2017-02-21 10:11:30.856-08	3	512	http://****
8145	email	collective.expense.created	t	2017-02-21 12:11:44.769-08	2017-02-21 12:11:44.769-08	3	524	http://****
8151	email	collective.expense.created	t	2017-02-21 12:16:59.094-08	2017-02-21 12:16:59.094-08	3	525	http://****
2919	email	collective.expense.created	t	2016-11-28 14:28:52.444-08	2017-01-10 16:00:00-08	3	295	http://****
2926	email	collective.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	288	http://****
2931	email	collective.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	283	http://****
2936	email	collective.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	278	http://****
5772	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1339	282	http://****
5558	email	collective.expense.created	f	2016-12-28 16:13:56.268-08	2017-01-17 16:00:00-08	34	15	http://****
5789	email	collective.expense.created	f	2016-12-28 16:13:56.345-08	2017-01-17 16:00:00-08	1371	300	http://****
16437	email	collective.donation.created	f	2017-05-11 09:41:40.872-07	2017-05-11 09:41:40.872-07	171	59	http://****
8088	email	mailinglist.host	t	2017-02-21 10:49:14.435-08	2017-02-21 10:49:14.435-08	3	515	http://****
8095	email	mailinglist.host	t	2017-02-21 11:02:21.647-08	2017-02-21 11:02:21.647-08	3	516	http://****
16332	email	mailinglist.backers	t	2017-05-10 16:45:46.805-07	2017-05-10 16:45:46.805-07	4749	522	http://****
8426	email	mailinglist.backers	f	2017-02-27 16:25:20.393-08	2017-02-27 16:25:20.393-08	3301	522	http://****
12034	email	mailinglist.backers	t	2017-03-09 10:29:55.807-08	2017-03-09 10:29:55.807-08	3442	259	http://****
16214	email	mailinglist.backers	t	2017-05-08 22:59:17.564-07	2017-05-08 22:59:17.564-07	4711	517	http://****
13800	email	mailinglist.host	t	2017-04-03 09:22:46.049-07	2017-04-03 09:22:46.049-07	3	584	http://****
13887	email	mailinglist.backers	t	2017-04-04 12:51:04.96-07	2017-04-04 12:51:04.96-07	3999	2	http://****
14398	email	mailinglist.backers	t	2017-04-10 18:09:50.696-07	2017-04-10 18:09:50.696-07	4153	13	http://****
14447	email	mailinglist.backers	t	2017-04-11 19:05:36.091-07	2017-04-11 19:05:36.091-07	4173	13	http://****
15002	email	mailinglist.backers	t	2017-04-20 03:17:23.322-07	2017-04-20 03:17:23.322-07	4348	59	http://****
15657	email	mailinglist.backers	t	2017-04-30 18:40:31.704-07	2017-04-30 18:40:31.704-07	3419	516	http://****
15717	email	mailinglist.backers	t	2017-05-01 10:13:36.324-07	2017-05-01 10:13:36.324-07	4550	516	http://****
79	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	2	http://****
80	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	3	http://****
81	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	4	http://****
82	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	10	http://****
83	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	12	http://****
84	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	13	http://****
85	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	14	http://****
86	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	15	http://****
87	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	47	http://****
88	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	48	http://****
89	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	59	http://****
566	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	261	http://****
567	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	10	http://****
568	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	268	http://****
569	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	262	http://****
570	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	269	http://****
8087	email	collective.monthlyreport	t	2017-02-21 10:49:14.347-08	2017-02-21 10:49:14.347-08	3	515	http://****
8094	email	collective.monthlyreport	t	2017-02-21 11:02:21.57-08	2017-02-21 11:02:21.57-08	3	516	http://****
13799	email	collective.monthlyreport	t	2017-04-03 09:22:45.964-07	2017-04-03 09:22:45.964-07	3206	584	http://****
8089	email	collective.transaction.created	t	2017-02-21 10:49:14.436-08	2017-02-21 10:49:14.436-08	3	515	http://****
13801	email	collective.transaction.created	t	2017-04-03 09:22:46.049-07	2017-04-03 09:22:46.049-07	3	584	http://****
70	email	collective.transaction.created	t	2016-07-06 17:00:00-07	2016-07-06 17:00:00-07	577	4	http://****
39	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	142	48	http://****
40	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	28	2	http://****
41	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	33	13	http://****
42	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	67	13	http://****
43	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	71	3	http://****
44	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	72	3	http://****
45	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	73	3	http://****
46	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	170	59	http://****
47	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	171	59	http://****
48	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	35	12	http://****
49	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	69	12	http://****
50	email	collective.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	70	12	http://****
8093	email	collective.expense.created	t	2017-02-21 11:02:21.57-08	2017-02-21 11:02:21.57-08	3	516	http://****
13798	email	collective.expense.created	t	2017-04-03 09:22:45.964-07	2017-04-03 09:22:45.964-07	3206	584	http://****
13802	email	collective.expense.created	t	2017-04-03 09:22:46.05-07	2017-04-03 09:22:46.05-07	3	584	http://****
571	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	263	http://****
572	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	270	http://****
573	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	264	http://****
574	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	265	http://****
575	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	15	http://****
576	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	259	http://****
577	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	266	http://****
578	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	271	http://****
579	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	260	http://****
580	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	267	http://****
581	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	272	http://****
582	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	273	http://****
583	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	14	http://****
584	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	274	http://****
585	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	275	http://****
586	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	276	http://****
587	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	277	http://****
588	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	279	http://****
589	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	280	http://****
590	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	281	http://****
591	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	282	http://****
592	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	283	http://****
593	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	284	http://****
594	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	285	http://****
600	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	290	http://****
601	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	291	http://****
602	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	292	http://****
603	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	293	http://****
604	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	294	http://****
605	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	295	http://****
606	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	297	http://****
607	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	298	http://****
608	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	299	http://****
609	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	13	http://****
610	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	278	http://****
611	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	59	http://****
612	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	2	http://****
613	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	51	http://****
614	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	241	http://****
615	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	3	http://****
616	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	48	http://****
617	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	47	http://****
618	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	4	http://****
619	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	300	http://****
620	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	301	http://****
621	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	12	http://****
655	email	mailinglist.backers	t	2016-10-10 13:37:16.676-07	2016-10-10 13:37:16.676-07	126	13	http://****
658	email	mailinglist.backers	t	2016-10-10 13:37:16.677-07	2016-10-10 13:37:16.677-07	2	10	http://****
698	email	mailinglist.backers	t	2016-10-10 13:37:16.722-07	2016-10-10 13:37:16.722-07	2	13	http://****
865	email	mailinglist.backers	t	2016-10-10 13:37:16.826-07	2016-10-10 13:37:16.826-07	192	2	http://****
1003	email	mailinglist.backers	t	2016-10-10 13:37:16.887-07	2016-10-10 13:37:16.887-07	308	2	http://****
680	email	mailinglist.backers	t	2016-10-10 13:37:16.704-07	2016-10-10 13:37:16.704-07	30	12	http://****
690	email	mailinglist.backers	t	2016-10-10 13:37:16.719-07	2016-10-10 13:37:16.719-07	30	14	http://****
691	email	mailinglist.backers	t	2016-10-10 13:37:16.72-07	2016-10-10 13:37:16.72-07	80	10	http://****
697	email	mailinglist.backers	t	2016-10-10 13:37:16.722-07	2016-10-10 13:37:16.722-07	8	14	http://****
912	email	mailinglist.backers	t	2016-10-10 13:37:16.84-07	2016-10-10 13:37:16.84-07	224	2	http://****
990	email	mailinglist.backers	t	2016-10-10 13:37:16.883-07	2016-10-10 13:37:16.883-07	303	13	http://****
1089	email	mailinglist.backers	t	2016-10-10 13:37:16.922-07	2016-10-10 13:37:16.922-07	392	2	http://****
692	email	mailinglist.backers	t	2016-10-10 13:37:16.72-07	2016-10-10 13:37:16.72-07	30	13	http://****
799	email	mailinglist.backers	t	2016-10-10 13:37:16.803-07	2016-10-10 13:37:16.803-07	129	2	http://****
987	email	mailinglist.backers	t	2016-10-10 13:37:16.883-07	2016-10-10 13:37:16.883-07	283	13	http://****
1244	email	mailinglist.backers	t	2016-10-10 13:37:16.958-07	2016-10-10 13:37:16.958-07	8	3	http://****
1322	email	mailinglist.backers	t	2016-10-10 13:37:16.976-07	2016-10-10 13:37:16.976-07	642	48	http://****
1232	email	mailinglist.backers	t	2016-10-10 13:37:16.955-07	2016-10-10 13:37:16.955-07	551	2	http://****
1237	email	mailinglist.backers	t	2016-10-10 13:37:16.956-07	2016-10-10 13:37:16.956-07	555	13	http://****
1321	email	mailinglist.backers	t	2016-10-10 13:37:16.975-07	2016-10-10 13:37:16.975-07	642	4	http://****
1128	email	mailinglist.backers	t	2016-10-10 13:37:16.931-07	2016-10-10 13:37:16.931-07	426	2	http://****
1320	email	mailinglist.backers	t	2016-10-10 13:37:16.975-07	2016-10-10 13:37:16.975-07	642	12	http://****
1325	email	mailinglist.backers	t	2016-10-10 13:37:16.976-07	2016-10-10 13:37:16.976-07	646	2	http://****
1595	email	mailinglist.backers	t	2016-10-10 13:37:17.04-07	2016-10-10 13:37:17.04-07	884	2	http://****
1609	email	mailinglist.backers	t	2016-10-10 13:37:17.062-07	2016-10-10 13:37:17.062-07	896	4	http://****
1594	email	mailinglist.backers	t	2016-10-10 13:37:17.04-07	2016-10-10 13:37:17.04-07	883	2	http://****
1805	email	mailinglist.backers	t	2016-10-10 13:37:17.119-07	2016-10-10 13:37:17.119-07	1094	2	http://****
1888	email	mailinglist.backers	t	2016-10-10 13:37:17.141-07	2016-10-10 13:37:17.141-07	1158	241	http://****
1961	email	mailinglist.backers	t	2016-10-10 13:37:17.158-07	2016-10-10 13:37:17.158-07	1244	4	http://****
1985	email	mailinglist.backers	t	2016-10-10 13:37:17.168-07	2016-10-10 13:37:17.168-07	1263	59	http://****
2045	email	mailinglist.backers	t	2016-10-10 13:37:17.194-07	2016-10-10 13:37:17.194-07	1299	2	http://****
2233	email	mailinglist.backers	t	2016-10-10 13:37:17.237-07	2016-10-10 13:37:17.237-07	1446	241	http://****
2226	email	mailinglist.backers	t	2016-10-10 13:37:17.235-07	2016-10-10 13:37:17.235-07	1438	2	http://****
2392	email	collective.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1303	259	http://****
2397	email	collective.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1309	262	http://****
2401	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1313	264	http://****
2406	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1317	268	http://****
2411	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1322	271	http://****
2416	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1327	275	http://****
2421	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1332	277	http://****
2426	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1337	280	http://****
2431	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1342	285	http://****
2436	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1347	288	http://****
2441	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1352	290	http://****
2446	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1357	294	http://****
2451	email	collective.monthlyreport	t	2016-11-06 16:37:19.111-08	2016-11-06 16:37:19.111-08	1362	297	http://****
2456	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1366	298	http://****
2461	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1372	300	http://****
2466	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1376	301	http://****
2597	email	mailinglist.backers	t	2016-11-17 09:43:31.222-08	2016-11-17 09:43:31.222-08	1808	59	http://****
2697	email	mailinglist.backers	t	2016-11-28 07:33:15.871-08	2016-11-28 07:33:15.871-08	1890	2	http://****
3000	email	mailinglist.backers	t	2016-11-29 02:03:23.975-08	2016-11-29 02:03:23.975-08	1908	301	http://****
3047	email	mailinglist.backers	t	2016-11-30 08:11:42.607-08	2016-11-30 08:11:42.607-08	1957	2	http://****
3286	email	mailinglist.backers	t	2016-12-18 17:41:29.217-08	2016-12-18 17:41:29.217-08	2220	259	http://****
6045	email	mailinglist.backers	t	2017-01-03 12:59:38.785-08	2017-01-03 12:59:38.785-08	2416	2	http://****
2917	email	collective.expense.created	t	2016-11-28 14:28:52.443-08	2017-01-10 16:00:00-08	3	298	http://****
2922	email	collective.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	292	http://****
2927	email	collective.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	287	http://****
2932	email	collective.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	282	http://****
2937	email	collective.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	277	http://****
2942	email	collective.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	272	http://****
2947	email	collective.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	267	http://****
2953	email	collective.expense.created	t	2016-11-28 14:28:52.451-08	2017-01-10 16:00:00-08	3	261	http://****
2897	email	collective.expense.created	t	2016-11-28 14:28:52.436-08	2017-01-10 16:00:00-08	3	241	http://****
2915	email	collective.expense.created	t	2016-11-28 14:28:52.443-08	2017-01-10 16:00:00-08	3	300	http://****
2920	email	collective.expense.created	t	2016-11-28 14:28:52.444-08	2017-01-10 16:00:00-08	3	294	http://****
2925	email	collective.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	289	http://****
2929	email	collective.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	285	http://****
2935	email	collective.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	279	http://****
2939	email	collective.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	275	http://****
7114	email	mailinglist.backers	t	2017-02-01 07:16:22.45-08	2017-02-01 07:16:22.45-08	2898	48	http://****
8101	email	mailinglist.host	t	2017-02-21 11:07:25.322-08	2017-02-21 11:07:25.322-08	3	517	http://****
8107	email	mailinglist.host	t	2017-02-21 11:13:03.539-08	2017-02-21 11:13:03.539-08	3	518	http://****
8113	email	mailinglist.host	t	2017-02-21 11:25:28.823-08	2017-02-21 11:25:28.823-08	3	519	http://****
8119	email	mailinglist.host	t	2017-02-21 11:34:47.428-08	2017-02-21 11:34:47.428-08	3	520	http://****
8125	email	mailinglist.host	t	2017-02-21 11:39:46.291-08	2017-02-21 11:39:46.291-08	3	521	http://****
8131	email	mailinglist.host	t	2017-02-21 11:45:19.314-08	2017-02-21 11:45:19.314-08	3	522	http://****
8144	email	mailinglist.admins	t	2017-02-21 12:11:44.768-08	2017-02-21 12:11:44.768-08	3	524	http://****
8150	email	mailinglist.admins	t	2017-02-21 12:16:59.093-08	2017-02-21 12:16:59.093-08	3	525	http://****
763	email	mailinglist.admins	t	2016-10-10 13:37:16.793-07	2016-10-10 13:37:16.793-07	70	12	http://****
764	email	mailinglist.admins	t	2016-10-10 13:37:16.793-07	2016-10-10 13:37:16.793-07	71	3	http://****
769	email	mailinglist.admins	t	2016-10-10 13:37:16.795-07	2016-10-10 13:37:16.795-07	76	4	http://****
2052	email	mailinglist.admins	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1307	261	http://****
2059	email	mailinglist.admins	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1314	264	http://****
2064	email	mailinglist.admins	t	2016-10-10 13:37:17.198-07	2016-10-10 13:37:17.198-07	1318	268	http://****
8099	email	collective.monthlyreport	t	2017-02-21 11:07:25.189-08	2017-02-21 11:07:25.189-08	3	517	http://****
8106	email	collective.monthlyreport	t	2017-02-21 11:13:03.397-08	2017-02-21 11:13:03.397-08	3	518	http://****
8112	email	collective.monthlyreport	t	2017-02-21 11:25:28.726-08	2017-02-21 11:25:28.726-08	3	519	http://****
8118	email	collective.monthlyreport	t	2017-02-21 11:34:47.023-08	2017-02-21 11:34:47.023-08	3	520	http://****
8124	email	collective.monthlyreport	t	2017-02-21 11:39:46.24-08	2017-02-21 11:39:46.24-08	3	521	http://****
8130	email	collective.monthlyreport	t	2017-02-21 11:45:19.171-08	2017-02-21 11:45:19.171-08	3	522	http://****
8075	email	collective.transaction.created	t	2017-02-21 10:35:34.614-08	2017-02-21 10:35:34.614-08	3	513	http://****
8096	email	collective.transaction.created	t	2017-02-21 11:02:21.647-08	2017-02-21 11:02:21.647-08	3	516	http://****
8102	email	collective.transaction.created	t	2017-02-21 11:07:25.322-08	2017-02-21 11:07:25.322-08	3	517	http://****
8108	email	collective.transaction.created	t	2017-02-21 11:13:03.539-08	2017-02-21 11:13:03.539-08	3	518	http://****
8114	email	collective.transaction.created	t	2017-02-21 11:25:28.823-08	2017-02-21 11:25:28.823-08	3	519	http://****
5770	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1337	280	http://****
5759	email	collective.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1317	268	http://****
5760	email	collective.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1319	269	http://****
5788	email	collective.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1365	298	http://****
5781	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1353	291	http://****
5765	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1325	273	http://****
5782	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1354	292	http://****
5768	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1331	277	http://****
8037	email	mailinglist.admins	t	2017-02-21 08:25:28.458-08	2017-02-21 08:25:28.458-08	3	510	http://****
8045	email	mailinglist.admins	t	2017-02-21 08:55:29.657-08	2017-02-21 08:55:29.657-08	3206	511	http://****
8061	email	mailinglist.admins	t	2017-02-21 10:11:30.774-08	2017-02-21 10:11:30.774-08	3	512	http://****
8071	email	mailinglist.admins	t	2017-02-21 10:35:34.525-08	2017-02-21 10:35:34.525-08	3	513	http://****
8085	email	mailinglist.admins	t	2017-02-21 10:49:14.347-08	2017-02-21 10:49:14.347-08	3	515	http://****
8092	email	mailinglist.admins	t	2017-02-21 11:02:21.569-08	2017-02-21 11:02:21.569-08	3	516	http://****
13797	email	mailinglist.admins	t	2017-04-03 09:22:45.963-07	2017-04-03 09:22:45.963-07	3206	584	http://****
624	email	mailinglist.admins	t	2016-10-10 13:37:16.649-07	2016-10-10 13:37:16.649-07	7	10	http://****
625	email	mailinglist.admins	t	2016-10-10 13:37:16.65-07	2016-10-10 13:37:16.65-07	36	10	http://****
626	email	mailinglist.admins	t	2016-10-10 13:37:16.65-07	2016-10-10 13:37:16.65-07	37	10	http://****
627	email	mailinglist.admins	t	2016-10-10 13:37:16.651-07	2016-10-10 13:37:16.651-07	35	12	http://****
628	email	mailinglist.admins	t	2016-10-10 13:37:16.652-07	2016-10-10 13:37:16.652-07	33	13	http://****
629	email	mailinglist.admins	t	2016-10-10 13:37:16.652-07	2016-10-10 13:37:16.652-07	31	14	http://****
630	email	mailinglist.admins	t	2016-10-10 13:37:16.654-07	2016-10-10 13:37:16.654-07	32	14	http://****
633	email	mailinglist.admins	t	2016-10-10 13:37:16.654-07	2016-10-10 13:37:16.654-07	34	15	http://****
669	email	mailinglist.admins	t	2016-10-10 13:37:16.688-07	2016-10-10 13:37:16.688-07	141	47	http://****
671	email	mailinglist.admins	t	2016-10-10 13:37:16.69-07	2016-10-10 13:37:16.69-07	142	48	http://****
765	email	mailinglist.admins	t	2016-10-10 13:37:16.794-07	2016-10-10 13:37:16.794-07	72	3	http://****
770	email	mailinglist.admins	t	2016-10-10 13:37:16.795-07	2016-10-10 13:37:16.795-07	77	4	http://****
705	email	mailinglist.admins	t	2016-10-10 13:37:16.725-07	2016-10-10 13:37:16.725-07	28	2	http://****
844	email	mailinglist.admins	t	2016-10-10 13:37:16.819-07	2016-10-10 13:37:16.819-07	170	59	http://****
761	email	mailinglist.admins	t	2016-10-10 13:37:16.792-07	2016-10-10 13:37:16.792-07	68	15	http://****
768	email	mailinglist.admins	t	2016-10-10 13:37:16.795-07	2016-10-10 13:37:16.795-07	75	4	http://****
760	email	mailinglist.admins	t	2016-10-10 13:37:16.792-07	2016-10-10 13:37:16.792-07	67	13	http://****
766	email	mailinglist.admins	t	2016-10-10 13:37:16.794-07	2016-10-10 13:37:16.794-07	73	3	http://****
771	email	mailinglist.admins	t	2016-10-10 13:37:16.796-07	2016-10-10 13:37:16.796-07	78	4	http://****
762	email	mailinglist.admins	t	2016-10-10 13:37:16.793-07	2016-10-10 13:37:16.793-07	69	12	http://****
767	email	mailinglist.admins	t	2016-10-10 13:37:16.794-07	2016-10-10 13:37:16.794-07	74	4	http://****
845	email	mailinglist.admins	t	2016-10-10 13:37:16.819-07	2016-10-10 13:37:16.819-07	171	59	http://****
1261	email	mailinglist.admins	t	2016-10-10 13:37:16.962-07	2016-10-10 13:37:16.962-07	577	4	http://****
1613	email	mailinglist.admins	t	2016-10-10 13:37:17.063-07	2016-10-10 13:37:17.063-07	898	195	http://****
1612	email	mailinglist.admins	t	2016-10-10 13:37:17.063-07	2016-10-10 13:37:17.063-07	897	195	http://****
1873	email	mailinglist.admins	t	2016-10-10 13:37:17.137-07	2016-10-10 13:37:17.137-07	1145	241	http://****
2069	email	mailinglist.admins	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1323	272	http://****
2075	email	mailinglist.admins	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1329	276	http://****
2080	email	mailinglist.admins	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1334	278	http://****
2085	email	mailinglist.admins	t	2016-10-10 13:37:17.203-07	2016-10-10 13:37:17.203-07	1339	282	http://****
2091	email	mailinglist.admins	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1345	287	http://****
2096	email	mailinglist.admins	t	2016-10-10 13:37:17.205-07	2016-10-10 13:37:17.205-07	1350	289	http://****
2100	email	mailinglist.admins	t	2016-10-10 13:37:17.206-07	2016-10-10 13:37:17.206-07	1355	292	http://****
2104	email	mailinglist.admins	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1358	294	http://****
2109	email	mailinglist.admins	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1363	297	http://****
2114	email	mailinglist.admins	t	2016-10-10 13:37:17.209-07	2016-10-10 13:37:17.209-07	1368	299	http://****
2119	email	mailinglist.admins	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1374	300	http://****
2124	email	mailinglist.admins	t	2016-10-10 13:37:17.212-07	2016-10-10 13:37:17.212-07	1377	301	http://****
2049	email	mailinglist.admins	t	2016-10-10 13:37:17.195-07	2016-10-10 13:37:17.195-07	1304	260	http://****
2055	email	mailinglist.admins	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1310	262	http://****
2060	email	mailinglist.admins	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1315	265	http://****
2065	email	mailinglist.admins	t	2016-10-10 13:37:17.198-07	2016-10-10 13:37:17.198-07	1319	269	http://****
2070	email	mailinglist.admins	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1324	272	http://****
2076	email	mailinglist.admins	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1330	276	http://****
2081	email	mailinglist.admins	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1335	279	http://****
2086	email	mailinglist.admins	t	2016-10-10 13:37:17.203-07	2016-10-10 13:37:17.203-07	1340	283	http://****
2090	email	mailinglist.admins	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1344	286	http://****
2093	email	mailinglist.admins	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1347	288	http://****
2101	email	mailinglist.admins	t	2016-10-10 13:37:17.206-07	2016-10-10 13:37:17.206-07	1354	292	http://****
2107	email	mailinglist.admins	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1360	295	http://****
2112	email	mailinglist.admins	t	2016-10-10 13:37:17.209-07	2016-10-10 13:37:17.209-07	1367	298	http://****
2117	email	mailinglist.admins	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1371	300	http://****
2122	email	mailinglist.admins	t	2016-10-10 13:37:17.211-07	2016-10-10 13:37:17.211-07	1379	301	http://****
2050	email	mailinglist.admins	t	2016-10-10 13:37:17.195-07	2016-10-10 13:37:17.195-07	1305	260	http://****
2056	email	mailinglist.admins	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1311	263	http://****
2061	email	mailinglist.admins	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1316	266	http://****
2066	email	mailinglist.admins	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1320	270	http://****
2071	email	mailinglist.admins	t	2016-10-10 13:37:17.2-07	2016-10-10 13:37:17.2-07	1325	273	http://****
2072	email	mailinglist.admins	t	2016-10-10 13:37:17.2-07	2016-10-10 13:37:17.2-07	1326	274	http://****
2077	email	mailinglist.admins	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1331	277	http://****
2082	email	mailinglist.admins	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1336	279	http://****
2087	email	mailinglist.admins	t	2016-10-10 13:37:17.203-07	2016-10-10 13:37:17.203-07	1341	284	http://****
2094	email	mailinglist.admins	t	2016-10-10 13:37:17.205-07	2016-10-10 13:37:17.205-07	1348	288	http://****
2099	email	mailinglist.admins	t	2016-10-10 13:37:17.206-07	2016-10-10 13:37:17.206-07	1353	291	http://****
2106	email	mailinglist.admins	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1361	295	http://****
2111	email	mailinglist.admins	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1365	298	http://****
2116	email	mailinglist.admins	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1370	299	http://****
2121	email	mailinglist.admins	t	2016-10-10 13:37:17.211-07	2016-10-10 13:37:17.211-07	1375	301	http://****
2125	email	mailinglist.admins	t	2016-10-10 13:37:17.212-07	2016-10-10 13:37:17.212-07	1378	301	http://****
2053	email	mailinglist.admins	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1308	261	http://****
2057	email	mailinglist.admins	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1312	263	http://****
2062	email	mailinglist.admins	t	2016-10-10 13:37:17.198-07	2016-10-10 13:37:17.198-07	1314	267	http://****
2067	email	mailinglist.admins	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1321	270	http://****
2074	email	mailinglist.admins	t	2016-10-10 13:37:17.2-07	2016-10-10 13:37:17.2-07	1328	275	http://****
2079	email	mailinglist.admins	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1333	278	http://****
2083	email	mailinglist.admins	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1337	280	http://****
2088	email	mailinglist.admins	t	2016-10-10 13:37:17.203-07	2016-10-10 13:37:17.203-07	1342	285	http://****
2095	email	mailinglist.admins	t	2016-10-10 13:37:17.205-07	2016-10-10 13:37:17.205-07	1349	289	http://****
2098	email	mailinglist.admins	t	2016-10-10 13:37:17.206-07	2016-10-10 13:37:17.206-07	1352	290	http://****
2105	email	mailinglist.admins	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1359	295	http://****
2110	email	mailinglist.admins	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1364	297	http://****
2115	email	mailinglist.admins	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1369	299	http://****
2120	email	mailinglist.admins	t	2016-10-10 13:37:17.211-07	2016-10-10 13:37:17.211-07	1373	300	http://****
2048	email	mailinglist.admins	t	2016-10-10 13:37:17.195-07	2016-10-10 13:37:17.195-07	1303	259	http://****
2054	email	mailinglist.admins	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1309	262	http://****
2058	email	mailinglist.admins	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1313	264	http://****
2063	email	mailinglist.admins	t	2016-10-10 13:37:17.198-07	2016-10-10 13:37:17.198-07	1317	268	http://****
2068	email	mailinglist.admins	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1322	271	http://****
2073	email	mailinglist.admins	t	2016-10-10 13:37:17.2-07	2016-10-10 13:37:17.2-07	1327	275	http://****
2078	email	mailinglist.admins	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1332	277	http://****
2084	email	mailinglist.admins	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1338	281	http://****
2089	email	mailinglist.admins	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1343	286	http://****
2092	email	mailinglist.admins	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1346	287	http://****
2097	email	mailinglist.admins	t	2016-10-10 13:37:17.205-07	2016-10-10 13:37:17.205-07	1351	290	http://****
2102	email	mailinglist.admins	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1356	293	http://****
2103	email	mailinglist.admins	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1357	294	http://****
2108	email	mailinglist.admins	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1362	297	http://****
2113	email	mailinglist.admins	t	2016-10-10 13:37:17.209-07	2016-10-10 13:37:17.209-07	1366	298	http://****
2118	email	mailinglist.admins	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1372	300	http://****
2123	email	mailinglist.admins	t	2016-10-10 13:37:17.211-07	2016-10-10 13:37:17.211-07	1376	301	http://****
8098	email	mailinglist.admins	t	2017-02-21 11:07:25.188-08	2017-02-21 11:07:25.188-08	3	517	http://****
8104	email	mailinglist.admins	t	2017-02-21 11:13:03.396-08	2017-02-21 11:13:03.396-08	3	518	http://****
8110	email	mailinglist.admins	t	2017-02-21 11:25:28.726-08	2017-02-21 11:25:28.726-08	3	519	http://****
8116	email	mailinglist.admins	t	2017-02-21 11:34:47.023-08	2017-02-21 11:34:47.023-08	3	520	http://****
8122	email	mailinglist.admins	t	2017-02-21 11:39:46.24-08	2017-02-21 11:39:46.24-08	3	521	http://****
8128	email	mailinglist.admins	t	2017-02-21 11:45:19.17-08	2017-02-21 11:45:19.17-08	3	522	http://****
8138	email	mailinglist.admins	t	2017-02-21 12:04:48.982-08	2017-02-21 12:04:48.982-08	3	523	http://****
99	email	collective.monthlyreport	t	2016-08-10 17:22:42.133-07	2016-08-10 17:22:42.133-07	7	10	http://****
100	email	collective.monthlyreport	t	2016-08-10 17:22:42.133-07	2016-08-10 17:22:42.133-07	36	10	http://****
101	email	collective.monthlyreport	t	2016-08-10 17:22:42.134-07	2016-08-10 17:22:42.134-07	37	10	http://****
102	email	collective.monthlyreport	t	2016-08-10 17:22:42.135-07	2016-08-10 17:22:42.135-07	35	12	http://****
103	email	collective.monthlyreport	t	2016-08-10 17:22:42.136-07	2016-08-10 17:22:42.136-07	33	13	http://****
104	email	collective.monthlyreport	t	2016-08-10 17:22:42.136-07	2016-08-10 17:22:42.136-07	31	14	http://****
105	email	collective.monthlyreport	t	2016-08-10 17:22:42.137-07	2016-08-10 17:22:42.137-07	32	14	http://****
106	email	collective.monthlyreport	t	2016-08-10 17:22:42.139-07	2016-08-10 17:22:42.139-07	34	15	http://****
115	email	collective.monthlyreport	t	2016-08-10 17:22:42.145-07	2016-08-10 17:22:42.145-07	141	47	http://****
116	email	collective.monthlyreport	t	2016-08-10 17:22:42.146-07	2016-08-10 17:22:42.146-07	142	48	http://****
124	email	collective.monthlyreport	t	2016-08-10 17:22:42.149-07	2016-08-10 17:22:42.149-07	28	2	http://****
148	email	collective.monthlyreport	t	2016-08-10 17:22:42.162-07	2016-08-10 17:22:42.162-07	67	13	http://****
149	email	collective.monthlyreport	t	2016-08-10 17:22:42.164-07	2016-08-10 17:22:42.164-07	68	15	http://****
150	email	collective.monthlyreport	t	2016-08-10 17:22:42.164-07	2016-08-10 17:22:42.164-07	69	12	http://****
151	email	collective.monthlyreport	t	2016-08-10 17:22:42.164-07	2016-08-10 17:22:42.164-07	70	12	http://****
152	email	collective.monthlyreport	t	2016-08-10 17:22:42.165-07	2016-08-10 17:22:42.165-07	71	3	http://****
153	email	collective.monthlyreport	t	2016-08-10 17:22:42.165-07	2016-08-10 17:22:42.165-07	72	3	http://****
154	email	collective.monthlyreport	t	2016-08-10 17:22:42.166-07	2016-08-10 17:22:42.166-07	73	3	http://****
155	email	collective.monthlyreport	t	2016-08-10 17:22:42.166-07	2016-08-10 17:22:42.166-07	74	4	http://****
156	email	collective.monthlyreport	t	2016-08-10 17:22:42.166-07	2016-08-10 17:22:42.166-07	75	4	http://****
157	email	collective.monthlyreport	t	2016-08-10 17:22:42.167-07	2016-08-10 17:22:42.167-07	76	4	http://****
158	email	collective.monthlyreport	t	2016-08-10 17:22:42.167-07	2016-08-10 17:22:42.167-07	77	4	http://****
159	email	collective.monthlyreport	t	2016-08-10 17:22:42.168-07	2016-08-10 17:22:42.168-07	78	4	http://****
194	email	collective.monthlyreport	t	2016-08-10 17:22:42.182-07	2016-08-10 17:22:42.182-07	170	59	http://****
335	email	collective.monthlyreport	t	2016-08-10 17:22:42.23-07	2016-08-10 17:22:42.23-07	577	4	http://****
472	email	collective.monthlyreport	t	2016-08-10 17:22:42.274-07	2016-08-10 17:22:42.274-07	898	195	http://****
471	email	collective.monthlyreport	t	2016-08-10 17:22:42.273-07	2016-08-10 17:22:42.273-07	897	195	http://****
195	email	collective.monthlyreport	t	2016-08-10 17:22:42.182-07	2016-08-10 17:22:42.182-07	171	59	http://****
2393	email	collective.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1304	260	http://****
2398	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1310	262	http://****
2403	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1315	265	http://****
2408	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1319	269	http://****
2413	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1324	272	http://****
2418	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1329	276	http://****
2423	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1334	278	http://****
2428	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1339	282	http://****
2433	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1344	286	http://****
2438	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1349	289	http://****
2442	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1353	291	http://****
2447	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1358	294	http://****
2452	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1363	297	http://****
2457	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1368	299	http://****
2462	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1374	300	http://****
2467	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1377	301	http://****
2394	email	collective.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1305	260	http://****
2399	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1311	263	http://****
2405	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1314	267	http://****
2409	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1320	270	http://****
2414	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1325	273	http://****
2419	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1330	276	http://****
2424	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1335	279	http://****
2429	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1340	283	http://****
2435	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1346	287	http://****
2440	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1351	290	http://****
2444	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1355	292	http://****
2449	email	collective.monthlyreport	t	2016-11-06 16:37:19.111-08	2016-11-06 16:37:19.111-08	1361	295	http://****
2455	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1367	298	http://****
2460	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1371	300	http://****
2465	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1379	301	http://****
2395	email	collective.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1307	261	http://****
2400	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1312	263	http://****
2404	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1316	266	http://****
2410	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1321	270	http://****
2415	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1326	274	http://****
2420	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1331	277	http://****
2425	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1336	279	http://****
2430	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1341	284	http://****
2434	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1345	287	http://****
2439	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1350	289	http://****
2445	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1356	293	http://****
2450	email	collective.monthlyreport	t	2016-11-06 16:37:19.111-08	2016-11-06 16:37:19.111-08	1360	295	http://****
2454	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1365	298	http://****
2459	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1370	299	http://****
2464	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1375	301	http://****
2348	email	collective.monthlyreport	t	2016-11-06 16:37:19.095-08	2016-11-06 16:37:19.095-08	1145	241	http://****
2396	email	collective.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1308	261	http://****
2402	email	collective.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1314	264	http://****
2407	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1318	268	http://****
2412	email	collective.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1323	272	http://****
2417	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1328	275	http://****
2422	email	collective.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1333	278	http://****
2427	email	collective.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1338	281	http://****
2432	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1343	286	http://****
2437	email	collective.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1348	288	http://****
2443	email	collective.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1354	292	http://****
2448	email	collective.monthlyreport	t	2016-11-06 16:37:19.111-08	2016-11-06 16:37:19.111-08	1359	295	http://****
2453	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1364	297	http://****
2458	email	collective.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1369	299	http://****
2463	email	collective.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1373	300	http://****
2468	email	collective.monthlyreport	t	2016-11-06 16:37:19.114-08	2016-11-06 16:37:19.114-08	1378	301	http://****
8120	email	collective.transaction.created	t	2017-02-21 11:34:47.428-08	2017-02-21 11:34:47.428-08	3	520	http://****
8127	email	collective.transaction.created	t	2017-02-21 11:39:46.291-08	2017-02-21 11:39:46.291-08	3	521	http://****
8132	email	collective.transaction.created	t	2017-02-21 11:45:19.315-08	2017-02-21 11:45:19.315-08	3	522	http://****
5769	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1335	279	http://****
5777	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1345	287	http://****
5556	email	collective.expense.created	f	2016-12-28 16:13:56.266-08	2017-01-17 16:00:00-08	35	12	http://****
5775	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1342	285	http://****
5596	email	collective.expense.created	f	2016-12-28 16:13:56.284-08	2017-01-17 16:00:00-08	170	59	http://****
5753	email	collective.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1307	261	http://****
5570	email	collective.expense.created	f	2016-12-28 16:13:56.274-08	2017-01-17 16:00:00-08	71	3	http://****
5790	email	collective.expense.created	f	2016-12-28 16:13:56.345-08	2017-01-17 16:00:00-08	1375	301	http://****
5571	email	collective.expense.created	f	2016-12-28 16:13:56.275-08	2017-01-17 16:00:00-08	74	4	http://****
5778	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1347	288	http://****
5773	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1340	283	http://****
5784	email	collective.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1359	295	http://****
5761	email	collective.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1320	270	http://****
5752	email	collective.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1304	260	http://****
5787	email	collective.expense.created	f	2016-12-28 16:13:56.345-08	2017-01-17 16:00:00-08	1368	299	http://****
8038	email	collective.expense.created	t	2017-02-21 08:25:28.459-08	2017-02-21 08:25:28.459-08	3	510	http://****
8046	email	collective.expense.created	t	2017-02-21 08:55:29.658-08	2017-02-21 08:55:29.658-08	3206	511	http://****
8050	email	collective.expense.created	t	2017-02-21 08:55:29.766-08	2017-02-21 08:55:29.766-08	3	511	http://****
8062	email	collective.expense.created	t	2017-02-21 10:11:30.775-08	2017-02-21 10:11:30.775-08	3	512	http://****
8072	email	collective.expense.created	t	2017-02-21 10:35:34.525-08	2017-02-21 10:35:34.525-08	3	513	http://****
2945	email	collective.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	269	http://****
2950	email	collective.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	264	http://****
2955	email	collective.expense.created	t	2016-11-28 14:28:52.451-08	2017-01-10 16:00:00-08	3	259	http://****
2916	email	collective.expense.created	t	2016-11-28 14:28:52.443-08	2017-01-10 16:00:00-08	3	299	http://****
2921	email	collective.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	293	http://****
2924	email	collective.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	290	http://****
2930	email	collective.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	284	http://****
2934	email	collective.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	280	http://****
2940	email	collective.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	274	http://****
2944	email	collective.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	270	http://****
2949	email	collective.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	265	http://****
2914	email	collective.expense.created	t	2016-11-28 14:28:52.443-08	2017-01-10 16:00:00-08	3	301	http://****
2941	email	collective.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	273	http://****
2946	email	collective.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	268	http://****
2951	email	collective.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	263	http://****
2701	email	collective.expense.created	t	2016-11-28 14:28:52.359-08	2017-01-10 16:00:00-08	3	10	http://****
2703	email	collective.expense.created	t	2016-11-28 14:28:52.36-08	2017-01-10 16:00:00-08	3	12	http://****
2704	email	collective.expense.created	t	2016-11-28 14:28:52.361-08	2017-01-10 16:00:00-08	3	13	http://****
2705	email	collective.expense.created	t	2016-11-28 14:28:52.362-08	2017-01-10 16:00:00-08	3	14	http://****
2706	email	collective.expense.created	t	2016-11-28 14:28:52.362-08	2017-01-10 16:00:00-08	3	15	http://****
2708	email	collective.expense.created	t	2016-11-28 14:28:52.365-08	2017-01-10 16:00:00-08	3	47	http://****
2709	email	collective.expense.created	t	2016-11-28 14:28:52.368-08	2017-01-10 16:00:00-08	3	48	http://****
2712	email	collective.expense.created	t	2016-11-28 14:28:52.373-08	2017-01-10 16:00:00-08	3	51	http://****
2723	email	collective.expense.created	t	2016-11-28 14:28:52.376-08	2017-01-10 16:00:00-08	3	2	http://****
2724	email	collective.expense.created	t	2016-11-28 14:28:52.377-08	2017-01-10 16:00:00-08	3	3	http://****
2725	email	collective.expense.created	t	2016-11-28 14:28:52.377-08	2017-01-10 16:00:00-08	3	4	http://****
2751	email	collective.expense.created	t	2016-11-28 14:28:52.388-08	2017-01-10 16:00:00-08	3	59	http://****
2954	email	collective.expense.created	t	2016-11-28 14:28:52.451-08	2017-01-10 16:00:00-08	3	260	http://****
2851	email	collective.expense.created	t	2016-11-28 14:28:52.427-08	2017-01-10 16:00:00-08	3	195	http://****
2918	email	collective.expense.created	t	2016-11-28 14:28:52.444-08	2017-01-10 16:00:00-08	3	297	http://****
2923	email	collective.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	291	http://****
2928	email	collective.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	286	http://****
2933	email	collective.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	281	http://****
2938	email	collective.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	276	http://****
2943	email	collective.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	271	http://****
2948	email	collective.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	266	http://****
2952	email	collective.expense.created	t	2016-11-28 14:28:52.451-08	2017-01-10 16:00:00-08	3	262	http://****
5766	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1329	276	http://****
5780	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1351	290	http://****
5557	email	collective.expense.created	f	2016-12-28 16:13:56.267-08	2017-01-17 16:00:00-08	33	13	http://****
5774	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1341	284	http://****
5751	email	collective.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1303	259	http://****
5589	email	collective.expense.created	f	2016-12-28 16:13:56.281-08	2017-01-17 16:00:00-08	142	48	http://****
5552	email	collective.expense.created	f	2016-12-28 16:13:56.264-08	2017-01-17 16:00:00-08	28	2	http://****
5563	email	collective.expense.created	f	2016-12-28 16:13:56.267-08	2017-01-17 16:00:00-08	31	14	http://****
5767	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1333	278	http://****
5786	email	collective.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1357	294	http://****
5776	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1343	286	http://****
5771	email	collective.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1338	281	http://****
5588	email	collective.expense.created	f	2016-12-28 16:13:56.281-08	2017-01-17 16:00:00-08	141	47	http://****
5555	email	collective.expense.created	f	2016-12-28 16:13:56.265-08	2017-01-17 16:00:00-08	7	10	http://****
5757	email	collective.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1316	266	http://****
5763	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1326	274	http://****
5764	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1327	275	http://****
5779	email	collective.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1349	289	http://****
5758	email	collective.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1314	267	http://****
5689	email	collective.expense.created	f	2016-12-28 16:13:56.324-08	2017-01-17 16:00:00-08	897	195	http://****
5733	email	collective.expense.created	f	2016-12-28 16:13:56.333-08	2017-01-17 16:00:00-08	1145	241	http://****
5762	email	collective.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1323	272	http://****
5783	email	collective.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1356	293	http://****
5785	email	collective.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1362	297	http://****
5756	email	collective.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1315	265	http://****
5754	email	collective.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1309	262	http://****
5755	email	collective.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1313	264	http://****
8086	email	collective.expense.created	t	2017-02-21 10:49:14.347-08	2017-02-21 10:49:14.347-08	3	515	http://****
8100	email	collective.expense.created	t	2017-02-21 11:07:25.189-08	2017-02-21 11:07:25.189-08	3	517	http://****
8105	email	collective.expense.created	t	2017-02-21 11:13:03.396-08	2017-02-21 11:13:03.396-08	3	518	http://****
8111	email	collective.expense.created	t	2017-02-21 11:25:28.726-08	2017-02-21 11:25:28.726-08	3	519	http://****
8117	email	collective.expense.created	t	2017-02-21 11:34:47.023-08	2017-02-21 11:34:47.023-08	3	520	http://****
8123	email	collective.expense.created	t	2017-02-21 11:39:46.24-08	2017-02-21 11:39:46.24-08	3	521	http://****
8129	email	collective.expense.created	t	2017-02-21 11:45:19.17-08	2017-02-21 11:45:19.17-08	3	522	http://****
8139	email	collective.expense.created	t	2017-02-21 12:04:48.983-08	2017-02-21 12:04:48.983-08	3	523	http://****
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                              4015.dat                                                                                            0000600 0004000 0002000 00000045645 13156021737 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1801	3053	15	USD	84241	Donation to WWCode Boulder/Denver	\N	2017-02-10 08:47:30.962-08	2017-02-10 08:47:34.968-08	\N	1890	2017-02-10 08:47:30.962-08	\N	66	839	\N	\N
489	884	2	USD	20000	Donation to WWCode Austin	\N	2016-08-01 08:55:26.677-07	2017-02-02 07:06:19.797-08	\N	562	2016-08-01 08:55:26.677-07	\N	64	751	\N	\N
258	426	2	USD	50000	Donation to WWCode Austin	\N	2016-05-23 13:27:28.19-07	2017-02-02 07:06:17.13-08	\N	306	2016-05-23 13:27:28.19-07	\N	64	742	\N	\N
191	308	2	USD	150000	Donation to WWCode Austin	\N	2016-05-03 06:07:27.747-07	2017-02-02 07:06:16.352-08	\N	230	2016-05-03 06:07:27.747-07	\N	64	799	\N	\N
386	686	2	USD	1000	Monthly donation to wwcode austin	286	2016-07-01 15:31:45.982-07	2017-02-02 07:06:19.11-08	\N	461	2016-07-01 15:31:45.982-07	\N	65	804	\N	\N
513	192	2	USD	150000	Donation to WWCode Austin	\N	2016-08-05 13:48:07.943-07	2017-02-02 07:06:20.648-08	\N	589	2016-08-05 13:48:07.943-07	\N	64	806	\N	\N
64	192	2	USD	30000	Donation to WWCode Austin	\N	2016-04-01 07:32:16.52-07	2017-02-02 07:06:15.499-08	\N	152	2016-04-01 07:32:16.52-07	\N	64	806	\N	\N
1712	2906	271	USD	2500	Monthly donation to WWCode Dallas	1366	2017-02-01 09:30:44.044-08	2017-02-01 09:30:50.454-08	\N	1804	2017-02-01 09:30:44.044-08	\N	70	692	\N	\N
102	2	13	USD	100	Recurring subscription	2	2016-04-01 07:32:16.704-07	2016-04-01 07:32:16.704-07	2016-04-07 07:32:16.691-07	\N	\N	\N	79	688	\N	\N
72	2	13	USD	100	Monthly donation to wwcode washington dc	2	2016-04-01 07:32:16.577-07	2017-02-02 07:06:15.583-08	\N	46	2016-04-01 07:32:16.577-07	\N	79	688	\N	\N
316	555	13	USD	100000	Donation to WWCode Washington DC	\N	2016-06-06 17:53:47.064-07	2017-02-02 07:06:18.126-08	\N	381	2016-06-06 17:53:47.064-07	\N	78	743	\N	\N
183	303	13	USD	50000	Donation to WWCode Washington DC	\N	2016-04-29 06:51:18.715-07	2017-02-02 07:06:16.329-08	\N	216	2016-04-29 06:51:18.715-07	\N	78	809	\N	\N
181	283	13	USD	50000	Donation to WWCode Washington DC	\N	2016-04-28 08:01:17.431-07	2017-02-02 07:06:16.319-08	\N	213	2016-04-28 08:01:17.431-07	\N	78	825	\N	\N
99	30	13	USD	100	Recurring subscription	7	2016-04-01 07:32:16.691-07	2016-04-01 07:32:16.691-07	2016-04-07 07:32:16.691-07	\N	\N	\N	79	691	\N	\N
69	30	13	USD	100	Monthly donation to wwcode washington dc	7	2016-04-01 07:32:16.561-07	2017-02-02 07:06:15.552-08	\N	43	2016-04-01 07:32:16.561-07	\N	79	691	\N	\N
100	30	13	USD	100	Recurring subscription	3	2016-04-01 07:32:16.697-07	2016-04-01 07:32:16.697-07	2016-04-07 07:32:16.691-07	\N	\N	\N	79	691	\N	\N
70	30	13	USD	100	Monthly donation to wwcode washington dc	3	2016-04-01 07:32:16.57-07	2017-02-02 07:06:21.68-08	\N	44	2016-04-01 07:32:16.57-07	\N	79	691	\N	\N
95	126	13	USD	100	Monthly donation to wwcode washington dc	33	2016-04-01 07:32:16.673-07	2017-02-02 07:06:15.838-08	\N	93	2016-04-01 07:32:16.673-07	\N	79	705	\N	\N
246	392	2	USD	50000	Donation to WWCode Austin	\N	2016-05-19 12:24:42.786-07	2017-02-02 07:06:17.118-08	\N	288	2016-05-19 12:24:42.786-07	\N	64	719	\N	\N
1466	2416	2	USD	20000	Donation to WWCode Austin	\N	2017-01-03 12:59:34.554-08	2017-01-03 12:59:38.801-08	\N	1553	2017-01-03 12:59:34.554-08	\N	64	710	\N	\N
808	1438	2	USD	12500	Donation to WWCode Austin	\N	2016-10-06 11:36:35.208-07	2016-10-06 11:36:39.093-07	\N	880	2016-10-06 11:36:35.208-07	\N	64	714	\N	\N
1215	1957	2	USD	20000	Donation to WWCode Austin	\N	2016-11-30 08:11:39.696-08	2016-11-30 08:11:42.626-08	\N	1296	2016-11-30 08:11:39.696-08	\N	64	711	\N	\N
25	129	2	USD	30000	Donation to WWCode Austin	\N	2016-04-01 07:32:16.462-07	2017-02-02 07:06:14.962-08	\N	94	2016-04-01 07:32:16.462-07	\N	64	689	\N	\N
1167	1890	2	USD	4000	Donation to WWCode Austin	\N	2016-11-28 07:33:12.038-08	2016-11-28 07:33:15.883-08	\N	1249	2016-11-28 07:33:12.038-08	\N	64	811	\N	\N
488	883	2	USD	150000	Donation to WWCode Austin	\N	2016-08-01 08:54:13.775-07	2017-02-02 07:06:19.784-08	\N	561	2016-08-01 08:54:13.775-07	\N	64	840	\N	\N
153	224	2	USD	20000	Donation to WWCode Austin	\N	2016-04-13 09:46:10.093-07	2017-02-02 07:06:16.24-08	\N	173	2016-04-13 09:46:10.093-07	\N	64	821	\N	\N
15	108	2	USD	30000	Donation to WWCode Austin	\N	2016-04-01 07:32:16.447-07	2017-02-02 07:06:14.785-08	\N	71	2016-04-01 07:32:16.447-07	\N	64	814	\N	\N
360	642	4	USD	100	Donation to WWCode San Francisco	\N	2016-06-21 09:05:00.946-07	2017-02-02 07:06:18.844-08	\N	431	2016-06-21 09:05:00.946-07	\N	85	776	\N	\N
686	1244	4	USD	0	Monthly donation to wwcode san francisco	530	2016-09-20 13:58:49.811-07	2016-10-14 13:08:32.409-07	\N	773	2016-09-20 13:58:49.811-07	\N	85	718	\N	\N
498	896	4	USD	10000	Monthly donation to wwcode san francisco	378	2016-08-03 10:47:17.188-07	2017-02-02 07:06:20.1-08	\N	571	2016-08-03 10:47:17.188-07	\N	84	760	\N	\N
320	8	3	USD	100	Monthly donation to wwcode new york	224	2016-06-09 10:28:13.93-07	2017-02-02 07:06:18.32-08	\N	385	2016-06-09 10:28:13.93-07	\N	95	820	\N	\N
65	2	10	USD	500	Monthly donation to wwcode mexico city	1	2016-04-01 07:32:16.527-07	2017-02-02 07:06:21.656-08	\N	34	2016-04-01 07:32:16.527-07	\N	98	688	\N	\N
68	80	10	MXN	500	Monthly donation to wwcode mexico city	4	2016-04-01 07:32:16.557-07	2017-02-02 07:06:15.653-08	\N	42	2016-04-01 07:32:16.557-07	\N	98	769	\N	\N
98	80	10	MXN	500	Recurring subscription	4	2016-04-01 07:32:16.686-07	2016-04-01 07:32:16.686-07	2016-04-07 07:32:16.686-07	\N	\N	\N	98	769	\N	\N
1531	2549	270	USD	1000	Monthly donation to WWCode Chicago	1238	2017-01-14 09:11:39.405-08	2017-01-14 09:11:43.298-08	\N	1616	2017-01-14 09:11:39.405-08	\N	103	763	\N	\N
2151	3	12	USD	50000	Leadership Development: Google i/o grant for Alicia C.	\N	2017-03-27 10:10:04.532-07	2017-03-27 10:10:04.637-07	\N	\N	2017-03-27 10:10:04.532-07		106	696	\N	\N
359	642	12	USD	100	Donation to WWCode Atlanta	\N	2016-06-21 09:02:55.605-07	2017-02-02 07:06:18.833-08	\N	430	2016-06-21 09:02:55.605-07	\N	107	776	\N	\N
13	30	12	USD	1000	Donation to WWCode Atlanta	\N	2016-04-01 07:32:16.445-07	2017-02-02 07:06:14.763-08	\N	39	2016-04-01 07:32:16.445-07	\N	107	691	\N	\N
1388	2220	259	USD	2500	Donation to WWCode Birmingham	\N	2016-12-18 17:41:26.702-08	2016-12-18 17:41:29.227-08	\N	1471	2016-12-18 17:41:26.702-08	\N	116	700	\N	\N
1389	2220	259	USD	2500	Donation to WWCode Birmingham	\N	2016-12-18 17:41:58.846-08	2016-12-18 17:42:01.434-08	2016-12-27 16:00:00-08	1472	2016-12-18 17:41:58.846-08	\N	116	700	\N	\N
2003	3442	259	USD	6000	Donation to WWCode Birmingham	\N	2017-03-09 10:29:52.29-08	2017-03-09 10:29:55.868-08	\N	2104	2017-03-09 10:29:52.29-08	\N	116	755	\N	\N
647	1158	241	USD	1000	Monthly donation to wwcode taipei	496	2016-09-09 20:42:49.15-07	2016-10-14 13:08:32.241-07	\N	731	2016-09-09 20:42:49.15-07	\N	123	737	\N	\N
812	1446	241	USD	2500	Donation to WWCode Taipei	\N	2016-10-07 09:49:14.682-07	2016-10-07 09:49:20.396-07	\N	884	2016-10-07 09:49:14.682-07	\N	122	713	\N	\N
1175	1908	301	EUR	25000	Donation to WWCode Berlin	\N	2016-11-29 02:03:21.531-08	2016-11-29 02:03:23.984-08	\N	1257	2016-11-29 02:03:21.531-08	\N	126	708	\N	\N
2154	3	277	USD	100000	Leadership Development: Google I/O Travel Grant: Lydia L.	\N	2017-03-27 10:53:48.436-07	2017-03-27 10:53:48.659-07	\N	\N	2017-03-27 10:53:48.436-07		128	696	\N	\N
700	1263	59	USD	25000	Donation to WWCode Portland	\N	2016-09-22 18:07:06.293-07	2016-09-22 18:07:10.714-07	\N	790	2016-09-22 18:07:06.293-07	\N	147	793	\N	\N
1953	1263	59	USD	25000	Donation to WWCode Portland	\N	2017-03-01 14:51:17.006-08	2017-03-01 14:51:20.789-08	\N	2048	2017-03-01 14:51:17.006-08	\N	147	793	\N	\N
2152	3	59	USD	20000	Google I/O travel grant: Kezia W. 	\N	2017-03-27 10:45:17.489-07	2017-03-27 10:45:17.596-07	\N	\N	2017-03-27 10:45:17.489-07		147	696	\N	\N
1098	1808	59	USD	50000	Donation to WWCode Portland	\N	2016-11-17 09:43:26.405-08	2016-11-17 09:43:31.282-08	\N	1179	2016-11-17 09:43:26.405-08	\N	147	709	\N	\N
1129	1846	59	USD	30000	Donation to WWCode Portland	\N	2016-11-22 07:22:36.145-08	2016-11-22 07:22:40.436-08	\N	1211	2016-11-22 07:22:36.145-08	\N	147	702	\N	\N
361	642	48	USD	100	Donation to WWCode Twin Cities	\N	2016-06-21 09:06:05.176-07	2017-02-02 07:06:18.855-08	\N	432	2016-06-21 09:06:05.176-07	\N	155	776	\N	\N
1709	2898	48	USD	22500	Donation to WWCode Twin Cities	\N	2017-02-01 07:16:17.78-08	2017-02-01 07:16:22.469-08	\N	1801	2017-02-01 07:16:17.78-08	\N	153	802	\N	\N
1537	2561	48	USD	50000	Donation to WWCode Twin Cities	\N	2017-01-16 10:03:53.812-08	2017-01-16 10:03:57.019-08	\N	1622	2017-01-16 10:03:53.812-08	\N	153	701	\N	\N
71	8	14	USD	100	Monthly donation to wwcode seattle	8	2016-04-01 07:32:16.574-07	2017-02-02 07:06:15.567-08	\N	45	2016-04-01 07:32:16.574-07	\N	194	820	\N	\N
67	30	14	USD	100	Monthly donation to wwcode seattle	6	2016-04-01 07:32:16.552-07	2017-02-02 07:06:15.538-08	\N	41	2016-04-01 07:32:16.552-07	\N	194	691	\N	\N
97	30	14	USD	100	Recurring subscription	6	2016-04-01 07:32:16.68-07	2016-04-01 07:32:16.68-07	2016-04-07 07:32:16.68-07	\N	\N	\N	194	691	\N	\N
1935	3301	522	CAD	30000	Donation to Women Who Code Vancouver	\N	2017-02-27 16:25:15.618-08	2017-02-27 16:25:20.42-08	\N	2030	2017-02-27 16:25:15.618-08	\N	56	838	\N	\N
2783	4749	522	CAD	1000	Donation to Women Who Code Vancouver	\N	2017-05-10 16:45:43.437-07	2017-05-10 16:45:46.821-07	\N	2888	2017-05-10 16:45:43.437-07	\N	56	748	\N	\N
622	1094	2	USD	200000	Donation to WWCode Austin	\N	2016-09-01 07:41:33.696-07	2016-09-01 07:41:37.79-07	\N	707	2016-09-01 07:41:33.696-07	\N	64	739	\N	\N
312	551	2	USD	150000	Donation to WWCode Austin	\N	2016-06-06 12:04:36.791-07	2017-02-02 07:06:18.114-08	\N	377	2016-06-06 12:04:36.791-07	\N	64	782	\N	\N
364	646	2	USD	75000	Donation to WWCode Austin	\N	2016-06-22 13:09:45.975-07	2017-02-02 07:06:18.866-08	\N	435	2016-06-22 13:09:45.975-07	\N	64	772	\N	\N
768	1299	2	USD	19000	Donation to WWCode Austin	\N	2016-09-28 14:47:15.105-07	2016-09-28 14:47:19.41-07	\N	842	2016-09-28 14:47:15.105-07	\N	64	796	\N	\N
653	1178	2	USD	50000	Donation to WWCode Austin	\N	2016-09-12 21:15:02.18-07	2016-09-12 21:15:05.541-07	\N	737	2016-09-12 21:15:02.18-07	\N	64	789	\N	\N
2649	3	13	USD	154800	iOS Dev Camp 2016 (Capital One)	\N	2017-05-01 11:02:20.457-07	2017-05-01 11:02:20.53-07	\N	\N	2017-05-01 11:02:20.457-07		78	696	\N	\N
2430	4173	13	USD	2500	Donation to WWCode Washington DC	\N	2017-04-11 19:05:32.82-07	2017-04-11 19:05:36.109-07	\N	2546	2017-04-11 19:05:32.82-07	\N	78	694	\N	\N
2421	4153	13	USD	25000	Donation to WWCode Washington DC	\N	2017-04-10 18:09:47.558-07	2017-04-10 18:09:50.716-07	\N	2535	2017-04-10 18:09:47.558-07	\N	78	843	\N	\N
2332	3999	2	USD	20000	Donation to WWCode Austin	\N	2017-04-04 12:51:02.781-07	2017-04-04 12:51:04.976-07	\N	2438	2017-04-04 12:51:02.781-07	\N	64	837	\N	\N
2204	3	2	USD	50000	Google I/O Travel Grant: Patricia C. 	\N	2017-03-31 10:17:51.642-07	2017-03-31 10:17:51.712-07	\N	\N	2017-03-31 10:17:51.642-07		64	696	\N	\N
2519	3	2	USD	1480	PayPal Fee for Google I/O Ticket	\N	2017-04-19 11:18:17.942-07	2017-04-19 11:18:19.333-07	\N	\N	2017-04-19 11:18:17.942-07		65	696	\N	\N
2520	3	3	USD	40000	Google I/O Travel Expense	\N	2017-04-19 11:26:01.156-07	2017-04-19 11:26:01.247-07	\N	\N	2017-04-19 11:26:01.156-07		94	696	\N	\N
2521	3	3	USD	1190	PayPal Fees for Google I/O	\N	2017-04-19 11:26:58.952-07	2017-04-19 11:26:59.01-07	\N	\N	2017-04-19 11:26:58.952-07		95	696	\N	\N
2662	3	3	USD	2930	PayPal fees for Google I/O	\N	2017-05-01 17:33:45.604-07	2017-05-01 17:33:45.819-07	\N	\N	2017-05-01 17:33:45.604-07		94	696	\N	\N
83	7	10	MXN	100	Monthly donation to wwcode mexico city	16	2016-04-01 07:32:16.636-07	2016-10-14 13:08:31.996-07	\N	\N	\N	\N	98	822	\N	\N
122	7	10	MXN	100	Recurring subscription	16	2016-04-01 07:32:16.774-07	2016-04-01 07:32:16.774-07	2016-04-01 07:32:16.774-07	\N	\N	\N	98	822	\N	\N
2505	3	12	USD	1198	PayPal Fees Google I/O Ticket	\N	2017-04-18 17:19:14.259-07	2017-04-18 17:19:14.339-07	\N	\N	2017-04-18 17:19:14.259-07		107	696	\N	\N
2696	3	12	USD	75000	Zapier - Global Development	\N	2017-05-03 10:44:10.796-07	2017-05-03 10:44:10.856-07	\N	\N	2017-05-03 10:44:10.796-07		106	696	\N	\N
2209	3	278	GBP	39800	Google I/O travel grant: Anastasia D. 	\N	2017-03-31 11:01:48.379-07	2017-03-31 11:01:48.43-07	\N	\N	2017-03-31 11:01:48.379-07		108	696	\N	\N
2474	3	278	GBP	85000	Travel Stipend for CONNECT	\N	2017-04-17 14:05:14.99-07	2017-04-17 14:05:15.087-07	\N	\N	2017-04-17 14:05:14.99-07		108	696	\N	\N
2208	3	278	GBP	80500	Google I/O travel grant: Kanke I.	\N	2017-03-31 10:54:33.373-07	2017-03-31 10:54:33.566-07	\N	\N	2017-03-31 10:54:33.373-07		108	696	\N	\N
2475	3	278	GBP	4250	PayPal Fees	\N	2017-04-17 14:06:54.729-07	2017-04-17 14:06:54.818-07	\N	\N	2017-04-17 14:06:54.729-07		108	696	\N	\N
2486	3	278	GBP	41000	Leadership Development: Director Stipend to attend NY Stock Exchange Bell Ringing	\N	2017-04-17 15:31:52.609-07	2017-04-17 15:31:52.754-07	\N	\N	2017-04-17 15:31:52.609-07		108	696	\N	\N
2503	3	278	GBP	3562	PayPal Fees for Google I/O travel stipend	\N	2017-04-18 12:41:30.217-07	2017-04-18 12:41:30.305-07	\N	\N	2017-04-18 12:41:30.217-07		108	696	\N	\N
2206	3	267	GBP	79600	Google I/O Travel Grant: Rabeb O. 	\N	2017-03-31 10:20:23.87-07	2017-03-31 10:20:23.928-07	\N	\N	2017-03-31 10:20:23.87-07		110	696	\N	\N
2470	3	267	GBP	4000	PayPal Fees to transfer Google I/O stipend	\N	2017-04-17 12:31:52.832-07	2017-04-17 12:31:52.941-07	\N	\N	2017-04-17 12:31:52.832-07		110	696	\N	\N
2702	3	259	USD	2175	Catherine L. - fees and Global development	\N	2017-05-03 17:12:19.758-07	2017-05-03 17:12:19.828-07	\N	\N	2017-05-03 17:12:19.758-07		117	696	\N	\N
2507	3	195	USD	1400	PayPal Fees for Google I/O	\N	2017-04-18 17:31:31.884-07	2017-04-18 17:31:31.962-07	\N	\N	2017-04-18 17:31:31.884-07		124	696	\N	\N
2741	3	301	EUR	16563	Regional Leadership Event: Sofia	\N	2017-05-08 08:30:18.503-07	2017-05-08 08:30:18.616-07	\N	\N	2017-05-08 08:30:18.503-07		126	696	\N	\N
2471	3	277	USD	9000	PayPal fees to transfer Google I/O stipend	\N	2017-04-17 12:41:07.575-07	2017-04-17 12:41:07.676-07	\N	\N	2017-04-17 12:41:07.575-07		128	696	\N	\N
2153	3	277	USD	100000	Leadership Development: Google I/O travel grant: Chee Yim G.	\N	2017-03-27 10:52:38.07-07	2017-03-27 10:52:38.138-07	\N	\N	2017-03-27 10:52:38.07-07		128	696	\N	\N
2710	3	276	USD	2175	In honour of Maya Johnston	\N	2017-05-04 09:21:53.626-07	2017-05-04 09:21:53.703-07	\N	\N	2017-05-04 09:21:53.626-07		131	696	\N	\N
2532	4348	59	USD	10000	Donation to WWCode Portland	\N	2017-04-20 03:17:20.169-07	2017-04-20 03:17:23.35-07	\N	2643	2017-04-20 03:17:20.169-07	\N	147	841	\N	\N
2522	3	59	USD	610	PayPal Fees for Google I/O	\N	2017-04-19 11:35:02.98-07	2017-04-19 11:35:03.062-07	\N	\N	2017-04-19 11:35:02.98-07		149	696	\N	\N
2794	3	59	USD	90000	Adroit Resources - Global Development	\N	2017-05-11 09:41:16.673-07	2017-05-11 09:41:16.796-07	\N	\N	2017-05-11 09:41:16.673-07		147	696	\N	\N
2677	3	51	USD	60000	Fullstory + WWCode Atlanta	\N	2017-05-02 11:45:44.196-07	2017-05-02 11:45:44.266-07	\N	\N	2017-05-02 11:45:44.196-07		152	696	\N	\N
2694	3	51	USD	30000	User Testing and WWCode ATL	\N	2017-05-03 10:33:13.357-07	2017-05-03 10:33:13.7-07	\N	\N	2017-05-03 10:33:13.357-07		152	696	\N	\N
2697	3	51	USD	15000	Zapier + WWCode Atlanta	\N	2017-05-03 10:44:48.667-07	2017-05-03 10:44:48.731-07	\N	\N	2017-05-03 10:44:48.667-07		152	696	\N	\N
2713	3	430	USD	1200	Western Union Fees for Google I/O grant	\N	2017-05-04 11:58:24.782-07	2017-05-04 11:58:24.948-07	\N	\N	2017-05-04 11:58:24.782-07		157	696	\N	\N
2490	3	430	USD	100000	Google I/O Travel Grant: Yelyzaveta L.	\N	2017-04-17 15:40:40.287-07	2017-04-17 15:40:40.376-07	\N	\N	2017-04-17 15:40:40.287-07		156	696	\N	\N
2488	3	511	MXN	18800	Leadership Development: Director travel stipend to attend CONNECT 2017	\N	2017-04-17 15:35:06.028-07	2017-04-17 15:35:06.109-07	\N	\N	2017-04-17 15:35:06.028-07		171	696	\N	\N
2212	3	286	USD	100000	Leadership Development: Google I/O Travel grant for Karina M.	\N	2017-03-31 15:32:34.085-07	2017-03-31 15:32:34.135-07	\N	\N	2017-03-31 15:32:34.085-07		195	696	\N	\N
2472	3	517	USD	100000	Director Travel Stipend CONNECT	\N	2017-04-17 13:41:37.54-07	2017-04-17 13:41:37.67-07	\N	\N	2017-04-17 13:41:37.54-07		165	696	\N	\N
2473	3	517	USD	5000	PayPal Fees	\N	2017-04-17 13:41:53.536-07	2017-04-17 13:41:53.62-07	\N	\N	2017-04-17 13:41:53.536-07		165	696	\N	\N
2393	3	516	USD	20000	Global Development	\N	2017-04-07 05:25:51.051-07	2017-04-07 05:25:51.101-07	\N	\N	2017-04-07 05:25:51.051-07		189	696	\N	\N
2489	3	511	MXN	2200	PayPal Fees	\N	2017-04-17 15:35:54.945-07	2017-04-17 15:35:55.035-07	\N	\N	2017-04-17 15:35:54.945-07		171	696	\N	\N
2636	3419	516	USD	200	Monthly donation to Women Who Code Huntsville	2031	2017-04-30 18:40:26.938-07	2017-04-30 18:40:31.729-07	\N	2749	2017-04-30 18:40:26.938-07	\N	186	842	\N	\N
2644	4550	516	USD	500	Monthly donation to Women Who Code Huntsville	2039	2017-05-01 10:13:32.223-07	2017-05-01 10:13:36.337-07	\N	2757	2017-05-01 10:13:32.223-07	\N	186	786	\N	\N
2215	3	286	USD	7500	PayPal Fees for Google I/O transfer	\N	2017-03-31 15:52:45.044-07	2017-03-31 15:52:45.089-07	\N	\N	2017-03-31 15:52:45.044-07		195	696	\N	\N
2214	3	286	USD	20000	Leadership Development: Conference support for Karina M. 	\N	2017-03-31 15:50:23.845-07	2017-03-31 15:50:23.931-07	2017-03-31 17:00:00-07	\N	2017-03-31 15:50:23.845-07		195	696	\N	\N
2508	3	14	USD	1480	PayPal fees Google I/O Travel Stipend	\N	2017-04-18 17:39:23.089-07	2017-04-18 17:39:23.171-07	\N	\N	2017-04-18 17:39:23.089-07		194	696	\N	\N
2817	4834	14	USD	20000	Donation to WWCode Seattle	\N	2017-05-15 05:07:56.843-07	2017-05-15 05:07:59.734-07	\N	2922	2017-05-15 05:07:56.843-07	\N	193	800	\N	\N
2217	3	291	CAD	50000	Google I/O Travel Grant: Evangelique L.	\N	2017-03-31 16:37:30.782-07	2017-03-31 16:37:30.831-07	\N	\N	2017-03-31 16:37:30.782-07		76	696	\N	\N
2755	4720	2	USD	84000	Donation to WWCode Austin	\N	2017-05-09 11:14:19.702-07	2017-05-09 11:14:23.386-07	\N	2860	2017-05-09 11:14:19.702-07	\N	64	847	\N	\N
2676	3	12	USD	300000	FullStory - Global Development	\N	2017-05-02 11:43:43.093-07	2017-05-02 11:43:43.175-07	\N	\N	2017-05-02 11:43:43.093-07		106	696	\N	\N
1557	2594	48	USD	10000	Donation to WWCode Twin Cities	\N	2017-01-18 05:54:47.782-08	2017-01-18 05:54:51.04-08	\N	1647	2017-01-18 05:54:47.782-08	\N	153	698	\N	\N
2750	4711	517	USD	1000	Monthly donation to Women Who Code Manila	2103	2017-05-08 22:59:11.956-07	2017-05-08 22:59:17.596-07	\N	2855	2017-05-08 22:59:11.956-07	\N	163	712	\N	\N
101	8	14	USD	100	Recurring subscription	8	2016-04-01 07:32:16.701-07	2016-04-01 07:32:16.701-07	2016-04-07 07:32:16.701-07	\N	\N	\N	194	820	\N	\N
87	2	10	USD	500	Recurring subscription	1	2016-04-01 07:32:16.648-07	2016-04-01 07:32:16.648-07	2016-04-07 07:32:16.648-07	\N	\N	\N	98	688	\N	\N
2477	3	270	USD	100000	Network Development: Attend CapOne WIT 2017 Kickoff to announce partnership for re-launch	\N	2017-04-17 15:09:42.506-07	2017-04-17 15:09:42.582-07	\N	\N	2017-04-17 15:09:42.506-07		102	696	\N	\N
2506	3	12	USD	1480	PayPal Fees Google I/O Ticket	\N	2017-04-18 17:20:11.451-07	2017-04-18 17:20:11.557-07	\N	\N	2017-04-18 17:20:11.451-07		107	696	\N	\N
2693	3	12	USD	150000	User Testing - Global Development	\N	2017-05-03 10:32:39.617-07	2017-05-03 10:32:39.663-07	\N	\N	2017-05-03 10:32:39.617-07		106	696	\N	\N
2487	3	511	MXN	25000	Leadership Development: Director Travel Stipend to attend CONNECT 2017	\N	2017-04-17 15:34:32.173-07	2017-04-17 15:34:32.292-07	\N	\N	2017-04-17 15:34:32.173-07		171	696	\N	\N
\.


                                                                                           4026.dat                                                                                            0000600 0004000 0002000 00000000005 13156021737 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4011.dat                                                                                            0000600 0004000 0002000 00000071447 13156021737 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        19	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 01:42:57.058-08	2015-12-16 10:22:05.853-08	\N	2015-12-16 10:22:05.842-08	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
26	*****@paypal.com	*****	*****	paypal	\N	2015-12-18 12:07:43.76-08	2016-05-26 08:38:39.069-07	2015-12-18 13:52:39.247-08	2016-05-26 08:38:39.068-07	3	\N	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
320	*****@paypal.com	*****	*****	paypal	\N	2016-05-26 08:37:59.825-07	2016-05-26 08:38:38.996-07	2016-05-26 08:38:38.994-07	2016-08-03 14:40:05.198-07	3	\N	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
884	*****@paypal.com	*****	*****	stripe	\N	2016-10-07 09:49:14.672-07	2016-10-07 09:49:15.283-07	\N	\N	1446	\N	\N	713	2017-09-12 11:13:43.498-07	\N	f	\N
880	*****@paypal.com	*****	*****	stripe	\N	2016-10-06 11:36:35.196-07	2016-10-06 11:36:35.794-07	\N	\N	1438	\N	\N	714	2017-09-12 11:13:43.509-07	\N	f	\N
773	*****@paypal.com	*****	*****	stripe	\N	2016-09-20 13:58:49.788-07	2016-09-20 13:58:50.526-07	\N	\N	1244	\N	\N	718	2017-09-12 11:13:43.53-07	\N	f	\N
731	*****@paypal.com	*****	*****	stripe	\N	2016-09-09 20:42:49.13-07	2016-09-09 20:42:49.63-07	\N	\N	1158	\N	\N	737	2017-09-12 11:13:43.593-07	\N	f	\N
707	*****@paypal.com	*****	*****	stripe	\N	2016-09-01 07:41:33.663-07	2016-09-01 07:41:34.394-07	\N	\N	1094	\N	\N	739	2017-09-12 11:13:43.594-07	\N	f	\N
306	*****@paypal.com	*****	*****	stripe	\N	2016-05-23 13:27:26.16-07	2016-05-23 13:27:26.962-07	\N	\N	426	\N	\N	742	2017-09-12 11:13:43.619-07	\N	f	\N
381	*****@paypal.com	*****	*****	stripe	\N	2016-06-06 17:53:45.068-07	2016-06-06 17:53:45.674-07	\N	\N	555	\N	\N	743	2017-09-12 11:13:43.621-07	\N	f	\N
562	*****@paypal.com	*****	*****	stripe	\N	2016-08-01 08:55:23.426-07	2016-08-01 08:55:24.6-07	\N	\N	884	\N	\N	751	2017-09-12 11:13:43.642-07	\N	f	\N
571	*****@paypal.com	*****	*****	stripe	\N	2016-08-03 10:47:13.706-07	2016-08-03 10:47:14.326-07	\N	\N	896	\N	\N	760	2017-09-12 11:13:43.667-07	\N	f	\N
42	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 08:52:00.333-08	2016-02-02 08:52:00.333-08	\N	\N	80	\N	\N	769	2017-09-12 11:13:43.689-07	\N	f	\N
435	*****@paypal.com	*****	*****	stripe	\N	2016-06-22 13:09:44.066-07	2016-06-22 13:09:44.651-07	\N	\N	646	\N	\N	772	2017-09-12 11:13:43.703-07	\N	f	\N
430	*****@paypal.com	*****	*****	stripe	\N	2016-06-21 09:02:53.255-07	2016-06-21 09:02:53.912-07	\N	\N	642	\N	\N	776	2017-09-12 11:13:43.705-07	\N	f	\N
431	*****@paypal.com	*****	*****	stripe	\N	2016-06-21 09:04:57.958-07	2016-06-21 09:04:59.511-07	\N	\N	642	\N	\N	776	2017-09-12 11:13:43.705-07	\N	f	\N
432	*****@paypal.com	*****	*****	stripe	\N	2016-06-21 09:06:02.746-07	2016-06-21 09:06:03.475-07	\N	\N	642	\N	\N	776	2017-09-12 11:13:43.705-07	\N	f	\N
377	*****@paypal.com	*****	*****	stripe	\N	2016-06-06 12:04:34.62-07	2016-06-06 12:04:35.385-07	\N	\N	551	\N	\N	782	2017-09-12 11:13:43.728-07	\N	f	\N
737	*****@paypal.com	*****	*****	stripe	\N	2016-09-12 21:15:02.169-07	2016-09-12 21:15:02.814-07	\N	\N	1178	\N	\N	789	2017-09-12 11:13:43.748-07	\N	f	\N
790	*****@paypal.com	*****	*****	stripe	\N	2016-09-22 18:07:06.282-07	2016-09-22 18:07:07.667-07	\N	\N	1263	\N	\N	793	2017-09-12 11:13:43.758-07	\N	f	\N
842	*****@paypal.com	*****	*****	stripe	\N	2016-09-28 14:47:15.094-07	2016-09-28 14:47:16.348-07	\N	\N	1299	\N	\N	796	2017-09-12 11:13:43.768-07	\N	f	\N
219	*****@paypal.com	*****	*****	stripe	\N	2016-04-29 11:46:16.188-07	2016-04-29 11:46:16.688-07	\N	\N	308	\N	\N	799	2017-09-12 11:13:43.786-07	\N	f	\N
230	*****@paypal.com	*****	*****	stripe	\N	2016-05-03 06:07:25.728-07	2016-05-03 06:07:26.509-07	\N	\N	308	\N	\N	799	2017-09-12 11:13:43.786-07	\N	f	\N
461	*****@paypal.com	*****	*****	stripe	\N	2016-07-01 15:31:42.782-07	2016-07-01 15:31:43.38-07	\N	\N	686	\N	\N	804	2017-09-12 11:13:43.794-07	\N	f	\N
152	*****@paypal.com	*****	*****	stripe	\N	2016-03-25 08:11:03.086-07	2016-03-25 08:11:03.086-07	\N	\N	192	\N	\N	806	2017-09-12 11:13:43.8-07	\N	f	\N
589	*****@paypal.com	*****	*****	stripe	\N	2016-08-05 13:48:05.525-07	2016-08-05 13:48:06.15-07	\N	\N	192	\N	\N	806	2017-09-12 11:13:43.8-07	\N	f	\N
216	*****@paypal.com	*****	*****	stripe	\N	2016-04-29 06:51:16.73-07	2016-04-29 06:51:17.252-07	\N	\N	303	\N	\N	809	2017-09-12 11:13:43.814-07	\N	f	\N
71	*****@paypal.com	*****	*****	stripe	\N	2016-02-18 11:54:06.513-08	2016-02-18 11:54:06.513-08	\N	\N	108	\N	\N	814	2017-09-12 11:13:43.826-07	\N	f	\N
45	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 13:46:42.678-08	2016-02-02 13:46:42.678-08	\N	\N	8	\N	\N	820	2017-09-12 11:13:43.848-07	\N	f	\N
90	*****@paypal.com	*****	*****	stripe	\N	2016-02-29 17:35:13.096-08	2016-02-29 17:35:13.096-08	\N	\N	8	\N	\N	820	2017-09-12 11:13:43.848-07	\N	f	\N
124	*****@paypal.com	*****	*****	stripe	\N	2016-03-17 08:29:28.675-07	2016-03-17 08:29:28.674-07	\N	\N	8	\N	\N	820	2017-09-12 11:13:43.848-07	\N	f	\N
110	*****@paypal.com	*****	*****	stripe	\N	2016-03-07 19:35:50.332-08	2016-03-07 19:35:50.332-08	\N	\N	8	\N	\N	820	2017-09-12 11:13:43.848-07	\N	f	\N
189	*****@paypal.com	*****	*****	paypal	\N	2016-04-20 07:14:38.754-07	2016-04-20 07:15:18.774-07	2016-04-20 07:15:18.772-07	\N	8	\N	\N	820	2017-09-12 11:13:43.848-07	\N	f	\N
385	*****@paypal.com	*****	*****	stripe	\N	2016-06-09 10:28:10.609-07	2016-06-09 10:28:11.319-07	\N	\N	8	\N	\N	820	2017-09-12 11:13:43.848-07	\N	f	\N
587	*****@paypal.com	*****	*****	stripe	\N	2016-08-04 14:49:06.957-07	2016-08-04 14:49:07.534-07	\N	\N	8	\N	\N	820	2017-09-12 11:13:43.848-07	\N	f	\N
701	*****@paypal.com	*****	*****	stripe	\N	2016-08-31 01:34:48.855-07	2016-08-31 01:34:49.606-07	\N	\N	8	\N	\N	820	2017-09-12 11:13:43.848-07	\N	f	\N
789	*****@paypal.com	*****	*****	stripe	\N	2016-09-22 11:56:45.915-07	2016-09-22 11:56:47.116-07	\N	\N	8	\N	\N	820	2017-09-12 11:13:43.848-07	\N	f	\N
885	*****@paypal.com	*****	*****	stripe	\N	2016-10-07 13:46:31.454-07	2016-10-07 13:46:32.168-07	\N	\N	8	\N	\N	820	2017-09-12 11:13:43.848-07	\N	f	\N
911	*****@paypal.com	*****	*****	stripe	\N	2016-10-15 08:47:38.174-07	2016-10-15 08:47:38.802-07	\N	\N	8	\N	\N	820	2017-09-12 11:13:43.848-07	\N	f	\N
173	*****@paypal.com	*****	*****	stripe	\N	2016-04-13 09:46:07.391-07	2016-04-13 09:46:08.785-07	\N	\N	224	\N	\N	821	2017-09-12 11:13:43.85-07	\N	f	\N
64	*****@paypal.com	*****	*****	stripe	\N	2016-02-15 10:46:04.238-08	2016-02-15 10:46:04.238-08	\N	\N	7	\N	\N	822	2017-09-12 11:13:43.85-07	\N	f	\N
213	*****@paypal.com	*****	*****	stripe	\N	2016-04-28 08:01:14.747-07	2016-04-28 08:01:15.975-07	\N	\N	283	\N	\N	825	2017-09-12 11:13:43.862-07	\N	f	\N
561	*****@paypal.com	*****	*****	stripe	\N	2016-08-01 08:54:11.721-07	2016-08-01 08:54:12.394-07	\N	\N	883	\N	\N	840	2017-09-12 11:13:43.905-07	\N	f	\N
1804	*****@paypal.com	*****	*****	stripe	\N	2017-02-01 09:30:44.023-08	2017-02-01 09:30:45.232-08	\N	\N	2906	\N	\N	692	2017-09-12 11:13:43.409-07	\N	f	\N
2546	*****@paypal.com	*****	*****	stripe	\N	2017-04-11 19:05:32.807-07	2017-04-11 19:05:33.502-07	\N	\N	4173	\N	\N	694	2017-09-12 11:13:43.413-07	\N	f	\N
1645	*****@paypal.com	*****	*****	stripe	\N	2017-01-18 05:51:43.462-08	2017-01-18 05:51:44.621-08	\N	\N	2594	\N	\N	698	2017-09-12 11:13:43.447-07	\N	f	\N
1646	*****@paypal.com	*****	*****	stripe	\N	2017-01-18 05:53:28.297-08	2017-01-18 05:53:29.29-08	\N	\N	2594	\N	\N	698	2017-09-12 11:13:43.447-07	\N	f	\N
1647	*****@paypal.com	*****	*****	stripe	\N	2017-01-18 05:54:47.775-08	2017-01-18 05:54:48.732-08	\N	\N	2594	\N	\N	698	2017-09-12 11:13:43.447-07	\N	f	\N
971	*****@paypal.com	*****	*****	paypal	\N	2016-10-22 03:52:05.33-07	2016-10-22 03:52:05.881-07	\N	2016-10-27 14:01:07.137-07	3	\N	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
573	*****@paypal.com	*****	*****	paypal	\N	2016-08-03 14:38:52.082-07	2016-08-03 14:40:05.094-07	2016-08-03 14:40:05.093-07	2016-10-27 14:02:50.674-07	3	\N	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
1043	*****@paypal.com	*****	*****	paypal	\N	2016-10-31 14:12:07.923-07	2016-10-31 14:12:53.002-07	2016-10-31 14:12:53.002-07	2016-10-31 14:34:17.33-07	3	\N	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
1024	*****@paypal.com	*****	*****	paypal	\N	2016-10-27 14:01:07.153-07	2016-10-27 14:02:50.617-07	2016-10-27 14:02:50.616-07	2016-10-31 14:08:26.464-07	3	\N	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
1042	*****@paypal.com	*****	*****	paypal	\N	2016-10-31 14:04:38.968-07	2016-10-31 14:08:26.416-07	2016-10-31 14:08:26.414-07	2016-10-31 14:12:53.305-07	3	\N	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
1114	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 12:32:01.482-07	2016-11-03 12:32:02.116-07	\N	2016-11-03 12:33:52.634-07	3	\N	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
1044	*****@paypal.com	*****	*****	paypal	\N	2016-10-31 14:33:13-07	2016-10-31 14:34:17.306-07	2016-10-31 14:34:17.306-07	2016-11-03 12:34:26.577-07	3	\N	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
1115	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 12:33:52.773-07	2016-11-03 12:34:26.403-07	2016-11-03 12:34:26.402-07	2016-11-03 12:41:28.484-07	3	\N	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
1116	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 12:35:14.952-07	2016-11-03 12:35:15.487-07	\N	2016-11-03 12:39:59.781-07	3	\N	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2104	*****@paypal.com	*****	*****	stripe	\N	2017-03-09 10:29:52.21-08	2017-03-09 10:29:53.195-08	\N	\N	3442	\N	\N	755	2017-09-12 11:13:43.654-07	\N	f	\N
1616	*****@paypal.com	*****	*****	stripe	\N	2017-01-14 09:11:39.386-08	2017-01-14 09:11:39.965-08	\N	\N	2549	\N	\N	763	2017-09-12 11:13:43.677-07	\N	f	\N
2048	*****@paypal.com	*****	*****	stripe	\N	2017-03-01 14:51:16.983-08	2017-03-01 14:51:18.471-08	\N	\N	1263	\N	\N	793	2017-09-12 11:13:43.758-07	\N	f	\N
1801	*****@paypal.com	*****	*****	stripe	\N	2017-02-01 07:16:17.747-08	2017-02-01 07:16:18.471-08	\N	\N	2898	\N	\N	802	2017-09-12 11:13:43.79-07	\N	f	\N
1249	*****@paypal.com	*****	*****	stripe	\N	2016-11-28 07:33:12.012-08	2016-11-28 07:33:12.766-08	\N	\N	1890	\N	\N	811	2017-09-12 11:13:43.821-07	\N	f	\N
1111	*****@paypal.com	*****	*****	stripe	\N	2016-11-03 08:52:11.942-07	2016-11-03 08:52:12.638-07	\N	\N	8	\N	\N	820	2017-09-12 11:13:43.848-07	\N	f	\N
1348	*****@paypal.com	*****	*****	stripe	\N	2016-12-02 11:17:05.459-08	2016-12-02 11:17:06.168-08	\N	\N	8	\N	\N	820	2017-09-12 11:13:43.848-07	\N	f	\N
1744	*****@paypal.com	*****	*****	stripe	\N	2017-01-28 16:05:21.392-08	2017-01-28 16:05:21.978-08	\N	\N	8	\N	\N	820	2017-09-12 11:13:43.848-07	\N	f	\N
2091	*****@paypal.com	*****	*****	stripe	\N	2017-03-07 13:36:22.758-08	2017-03-07 13:36:23.955-08	\N	\N	8	\N	\N	820	2017-09-12 11:13:43.848-07	\N	f	\N
2438	*****@paypal.com	*****	*****	stripe	\N	2017-04-04 12:51:02.77-07	2017-04-04 12:51:03.349-07	\N	\N	3999	\N	\N	837	2017-09-12 11:13:43.902-07	\N	f	\N
2030	*****@paypal.com	*****	*****	stripe	\N	2017-02-27 16:25:15.595-08	2017-02-27 16:25:16.385-08	\N	\N	3301	\N	\N	838	2017-09-12 11:13:43.903-07	\N	f	\N
1890	*****@paypal.com	*****	*****	stripe	\N	2017-02-10 08:47:30.914-08	2017-02-10 08:47:31.716-08	\N	\N	3053	\N	\N	839	2017-09-12 11:13:43.905-07	\N	f	\N
2642	*****@paypal.com	*****	*****	stripe	\N	2017-04-20 02:34:08.282-07	2017-04-20 02:34:09.518-07	\N	\N	4348	\N	\N	841	2017-09-12 11:13:43.907-07	\N	f	\N
2643	*****@paypal.com	*****	*****	stripe	\N	2017-04-20 03:17:20.159-07	2017-04-20 03:17:21.398-07	\N	\N	4348	\N	\N	841	2017-09-12 11:13:43.907-07	\N	f	\N
2535	*****@paypal.com	*****	*****	stripe	\N	2017-04-10 18:09:47.541-07	2017-04-10 18:09:48.354-07	\N	\N	4153	\N	\N	843	2017-09-12 11:13:43.912-07	\N	f	\N
1793	*****@paypal.com	*****	*****	stripe	\N	2017-01-31 07:51:34.575-08	2017-01-31 07:51:36.336-08	\N	\N	1325	\N	\N	844	2017-09-12 11:13:43.921-07	\N	f	\N
94	*****@paypal.com	*****	*****	stripe	\N	2016-03-02 13:31:48.638-08	2016-03-02 13:31:48.638-08	\N	\N	129	\N	\N	689	2017-09-12 11:13:43.405-07	\N	f	\N
18	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 01:42:53.531-08	2015-12-16 01:42:57.019-08	\N	2015-12-16 01:42:57.018-08	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
17	*****@paypal.com	*****	*****	paypal	\N	2015-12-15 19:05:01.805-08	2015-12-16 10:22:39.715-08	2015-12-15 19:05:25.467-08	2015-12-16 10:22:39.714-08	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
24	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 10:28:34.146-08	2015-12-16 10:28:36.228-08	\N	2015-12-16 10:28:36.227-08	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
29	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 09:51:35.761-08	2016-01-12 09:54:45.421-08	2016-01-12 09:52:16.235-08	2016-01-12 09:54:45.421-08	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
27	*****@paypal.com	*****	*****	stripe	\N	2016-01-06 16:55:36.615-08	2016-01-06 16:55:36.615-08	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
25	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 10:28:36.264-08	2016-01-12 09:52:16.325-08	2015-12-16 10:29:24.829-08	2016-01-12 09:52:16.323-08	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
30	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 09:53:19.259-08	2016-01-12 09:53:20.842-08	\N	2016-01-12 09:53:20.841-08	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
31	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 09:53:20.88-08	2016-01-12 09:54:22.364-08	\N	2016-01-12 09:54:22.343-08	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
34	*****@paypal.com	*****	*****	stripe	\N	2016-01-18 15:54:03.69-08	2016-01-18 15:54:03.69-08	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
32	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 09:54:22.442-08	2016-01-21 22:25:25.222-08	2016-01-12 09:54:45.399-08	2016-01-21 22:25:25.222-08	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
36	*****@paypal.com	*****	*****	paypal	\N	2016-01-23 10:23:35.682-08	2016-03-10 08:54:14.551-08	2016-01-23 10:23:58.941-08	2016-03-10 08:54:14.542-08	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
119	*****@paypal.com	*****	*****	paypal	\N	2016-03-11 13:34:11.535-08	2016-03-25 21:12:54.174-07	\N	2016-03-25 21:12:54.171-07	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
46	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 15:09:03.515-08	2016-02-02 15:09:03.515-08	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
68	*****@paypal.com	*****	*****	stripe	\N	2016-02-16 16:12:43.167-08	2016-02-16 16:12:43.165-08	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
105	*****@paypal.com	*****	*****	paypal	\N	2016-03-05 10:48:06.494-08	2016-03-10 08:53:49.77-08	\N	2016-03-10 08:53:49.769-08	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
117	*****@paypal.com	*****	*****	paypal	\N	2016-03-10 08:53:49.777-08	2016-03-10 08:54:14.484-08	2016-03-10 08:54:14.479-08	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
35	*****@paypal.com	*****	*****	paypal	\N	2016-01-21 22:24:39.343-08	2016-01-23 10:23:58.964-08	2016-01-21 22:25:25.199-08	2016-01-23 10:23:58.964-08	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
109	*****@paypal.com	*****	*****	stripe	\N	2016-03-07 18:43:27.661-08	2016-03-07 18:43:27.661-08	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
252	*****@paypal.com	*****	*****	stripe	\N	2016-05-10 10:19:56.78-07	2016-05-10 10:19:58.837-07	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
494	*****@paypal.com	*****	*****	stripe	\N	2016-07-08 09:25:56.621-07	2016-07-08 09:25:58.207-07	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
495	*****@paypal.com	*****	*****	stripe	\N	2016-07-08 10:24:14.577-07	2016-07-08 10:24:15.71-07	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
524	*****@paypal.com	*****	*****	stripe	\N	2016-07-18 14:00:51.641-07	2016-07-18 14:00:52.921-07	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
567	*****@paypal.com	*****	*****	stripe	\N	2016-08-02 21:54:45.226-07	2016-08-02 21:54:46.256-07	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
1040	*****@paypal.com	*****	*****	stripe	\N	2016-10-31 06:27:24.403-07	2016-10-31 06:27:25.268-07	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
1106	*****@paypal.com	*****	*****	stripe	\N	2016-11-02 15:49:22.021-07	2016-11-02 15:49:23.61-07	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
1262	*****@paypal.com	*****	*****	stripe	\N	2016-11-29 10:35:19.012-08	2016-11-29 10:35:20.055-08	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
1701	*****@paypal.com	*****	*****	stripe	\N	2017-01-24 05:28:17.965-08	2017-01-24 05:28:21.097-08	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
1742	*****@paypal.com	*****	*****	stripe	\N	2017-01-28 15:51:03.682-08	2017-01-28 15:51:05.032-08	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
1986	*****@paypal.com	*****	*****	stripe	\N	2017-02-22 10:25:00.347-08	2017-02-22 10:25:00.347-08	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
2071	*****@paypal.com	*****	*****	stripe	\N	2017-03-04 08:55:18.286-08	2017-03-04 08:55:19.53-08	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
2074	*****@paypal.com	*****	*****	stripe	\N	2017-03-04 21:40:45.496-08	2017-03-04 21:40:48.337-08	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
2246	*****@paypal.com	*****	*****	stripe	\N	2017-03-25 07:33:48.263-07	2017-03-25 07:33:51.315-07	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
2208	*****@paypal.com	*****	*****	stripe	\N	2017-03-21 20:28:09.493-07	2017-03-21 20:28:11.234-07	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
2247	*****@paypal.com	*****	*****	stripe	\N	2017-03-25 08:36:50.843-07	2017-03-25 08:36:53.712-07	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
9	*****@paypal.com	*****	*****	paypal	\N	2015-11-23 10:13:00.576-08	2015-12-15 19:05:25.484-08	2015-11-30 09:00:17.828-08	2015-12-15 19:05:25.484-08	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
160	*****@paypal.com	*****	*****	stripe	\N	2016-04-01 08:09:24.215-07	2016-04-01 08:09:25.585-07	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
23	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 10:22:06.064-08	2015-12-16 10:29:24.85-08	2015-12-16 10:22:39.681-08	2015-12-16 10:29:24.848-08	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
153	*****@paypal.com	*****	*****	paypal	\N	2016-03-25 21:12:54.185-07	2016-03-25 21:12:54.98-07	\N	\N	2	\N	\N	688	2017-09-12 11:13:43.406-07	\N	f	\N
43	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 09:04:53.229-08	2016-02-02 09:04:53.229-08	\N	\N	30	\N	\N	691	2017-09-12 11:13:43.409-07	\N	f	\N
41	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 08:36:35.761-08	2016-02-02 08:36:35.761-08	\N	\N	30	\N	\N	691	2017-09-12 11:13:43.409-07	\N	f	\N
44	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 09:09:19.757-08	2016-02-02 09:09:19.757-08	\N	\N	30	\N	\N	691	2017-09-12 11:13:43.409-07	\N	f	\N
39	*****@paypal.com	*****	*****	stripe	\N	2016-01-29 14:23:51.784-08	2016-01-29 14:23:51.784-08	\N	\N	30	\N	\N	691	2017-09-12 11:13:43.409-07	\N	f	\N
51	*****@paypal.com	*****	*****	stripe	\N	2016-02-09 20:12:33.556-08	2016-02-09 20:12:33.556-08	\N	\N	30	\N	\N	691	2017-09-12 11:13:43.409-07	\N	f	\N
80	*****@paypal.com	*****	*****	stripe	\N	2016-02-25 15:45:02.363-08	2016-02-25 15:45:02.363-08	\N	\N	30	\N	\N	691	2017-09-12 11:13:43.409-07	\N	f	\N
203	*****@paypal.com	*****	*****	stripe	\N	2016-04-25 07:42:01.738-07	2016-04-25 07:42:02.272-07	\N	\N	30	\N	\N	691	2017-09-12 11:13:43.409-07	\N	f	\N
1117	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 12:39:59.972-07	2016-11-03 12:41:28.432-07	2016-11-03 12:41:28.432-07	2016-11-18 13:01:23.135-08	3	\N	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
1189	*****@paypal.com	*****	*****	paypal	\N	2016-11-18 13:00:56.092-08	2016-11-18 13:01:23.091-08	2016-11-18 13:01:23.091-08	2016-11-18 13:02:50.88-08	3	\N	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
1190	*****@paypal.com	*****	*****	paypal	\N	2016-11-18 13:02:28.687-08	2016-11-18 13:02:50.197-08	2016-11-18 13:02:50.193-08	2016-11-18 13:03:32.325-08	3	\N	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2888	*****@paypal.com	*****	*****	stripe	\N	2017-05-10 16:45:43.414-07	2017-05-10 16:45:44.785-07	\N	\N	4749	\N	\N	748	2017-09-12 11:13:43.625-07	\N	f	\N
2757	*****@paypal.com	*****	*****	stripe	\N	2017-05-01 10:13:32.205-07	2017-05-01 10:13:32.817-07	\N	\N	4550	\N	\N	786	2017-09-12 11:13:43.737-07	\N	f	\N
2922	*****@paypal.com	*****	*****	stripe	\N	2017-05-15 05:07:56.825-07	2017-05-15 05:07:57.556-07	\N	\N	4834	\N	\N	800	2017-09-12 11:13:43.787-07	\N	f	\N
2659	*****@paypal.com	*****	*****	stripe	\N	2017-04-20 14:31:48-07	2017-04-20 14:31:49.294-07	\N	\N	8	\N	\N	820	2017-09-12 11:13:43.848-07	\N	f	\N
2847	*****@paypal.com	*****	*****	stripe	\N	2017-05-08 13:06:11.209-07	2017-05-08 13:06:11.921-07	\N	\N	8	\N	\N	820	2017-09-12 11:13:43.848-07	\N	f	\N
159	*****@paypal.com	*****	*****	stripe	\N	2016-04-01 07:33:31.759-07	2016-04-01 07:33:32.893-07	\N	\N	8	\N	\N	820	2017-09-12 11:13:43.848-07	\N	f	\N
11	*****@paypal.com	*****	*****	paypal	\N	2015-11-30 10:25:48.501-08	2015-12-03 15:53:17.763-08	\N	2015-12-03 15:53:17.762-08	7	\N	\N	822	2017-09-12 11:13:43.85-07	\N	f	\N
12	*****@paypal.com	*****	*****	paypal	\N	2015-12-03 15:53:17.772-08	2015-12-03 15:54:56.087-08	2015-12-03 15:54:56.084-08	\N	7	\N	\N	822	2017-09-12 11:13:43.85-07	\N	f	\N
2749	*****@paypal.com	*****	*****	stripe	\N	2017-04-30 18:40:26.919-07	2017-04-30 18:40:28.231-07	\N	\N	3419	\N	\N	842	2017-09-12 11:13:43.908-07	\N	f	\N
2860	*****@paypal.com	*****	*****	stripe	\N	2017-05-09 11:14:19.686-07	2017-05-09 11:14:21.05-07	\N	\N	4720	\N	\N	847	2017-09-12 11:13:43.925-07	\N	f	\N
323	*****@paypal.com	*****	*****	stripe	\N	2016-05-26 17:52:12.759-07	2016-05-26 17:52:14.148-07	\N	\N	30	\N	\N	691	2017-09-12 11:13:43.409-07	\N	f	\N
507	*****@paypal.com	*****	*****	stripe	\N	2016-07-12 14:19:35.579-07	2016-07-12 14:19:36.177-07	\N	\N	30	\N	\N	691	2017-09-12 11:13:43.409-07	\N	f	\N
572	*****@paypal.com	*****	*****	stripe	\N	2016-08-03 12:30:20.399-07	2016-08-03 12:30:20.964-07	\N	\N	30	\N	\N	691	2017-09-12 11:13:43.409-07	\N	f	\N
703	*****@paypal.com	*****	*****	stripe	\N	2016-08-31 11:22:18.085-07	2016-08-31 11:22:28.874-07	\N	\N	30	\N	\N	691	2017-09-12 11:13:43.409-07	\N	f	\N
715	*****@paypal.com	*****	*****	stripe	\N	2016-09-05 09:25:43.529-07	2016-09-05 09:25:44.192-07	\N	\N	30	\N	\N	691	2017-09-12 11:13:43.409-07	\N	f	\N
176	*****@paypal.com	*****	*****	stripe	\N	2016-04-14 11:12:55.955-07	2016-04-14 11:12:56.555-07	\N	\N	30	\N	\N	691	2017-09-12 11:13:43.409-07	\N	f	\N
1811	*****@paypal.com	*****	*****	stripe	\N	2017-02-01 13:53:00.461-08	2017-02-01 13:53:01.901-08	\N	\N	30	\N	\N	691	2017-09-12 11:13:43.409-07	\N	f	\N
1211	*****@paypal.com	*****	*****	stripe	\N	2016-11-22 07:22:36.125-08	2016-11-22 07:22:37.512-08	\N	\N	1846	\N	\N	702	2017-09-12 11:13:43.453-07	\N	f	\N
93	*****@paypal.com	*****	*****	stripe	\N	2016-03-01 20:41:57.377-08	2016-03-01 20:41:57.377-08	\N	\N	126	\N	\N	705	2017-09-12 11:13:43.47-07	\N	f	\N
1553	*****@paypal.com	*****	*****	stripe	\N	2017-01-03 12:59:34.532-08	2017-01-03 12:59:35.653-08	\N	\N	2416	\N	\N	710	2017-09-12 11:13:43.493-07	\N	f	\N
1296	*****@paypal.com	*****	*****	stripe	\N	2016-11-30 08:11:39.675-08	2016-11-30 08:11:40.34-08	\N	\N	1957	\N	\N	711	2017-09-12 11:13:43.495-07	\N	f	\N
2855	*****@paypal.com	*****	*****	stripe	\N	2017-05-08 22:59:11.913-07	2017-05-08 22:59:13.104-07	\N	\N	4711	\N	\N	712	2017-09-12 11:13:43.496-07	\N	f	\N
1191	*****@paypal.com	*****	*****	paypal	\N	2016-11-18 13:03:06.664-08	2016-11-18 13:03:32.285-08	2016-11-18 13:03:32.285-08	2016-12-20 08:50:13.592-08	3	\N	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
1476	*****@paypal.com	*****	*****	paypal	\N	2016-12-20 08:45:05.334-08	2016-12-20 10:53:04.678-08	2016-12-20 10:53:04.677-08	2017-01-25 10:43:43.363-08	3	\N	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
1718	*****@paypal.com	*****	*****	paypal	\N	2017-01-25 10:42:33.289-08	2017-01-25 10:43:43.316-08	2017-01-25 10:43:43.315-08	2017-02-10 12:19:25.564-08	3	\N	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
1893	*****@paypal.com	*****	*****	paypal	\N	2017-02-10 12:18:58.618-08	2017-03-14 10:47:25.438-07	2017-03-14 10:47:25.433-07	2017-03-14 10:48:00.117-07	3	\N	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2149	*****@paypal.com	*****	*****	paypal	\N	2017-03-14 10:47:32.51-07	2017-03-17 08:34:02.314-07	2017-03-17 08:34:02.314-07	2017-03-17 08:34:41.542-07	3	2018-03-14 10:47:32.043-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2218	*****@paypal.com	*****	*****	paypal	\N	2017-03-22 13:58:36.077-07	2017-03-27 09:00:11.768-07	2017-03-27 09:00:11.767-07	2017-03-27 09:01:06.921-07	3	2018-03-22 13:58:35.533-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2180	*****@paypal.com	*****	*****	paypal	\N	2017-03-17 08:34:13.62-07	2017-03-22 13:58:30.022-07	2017-03-22 13:58:30.021-07	2017-03-22 13:59:49.26-07	3	2018-03-17 08:34:13.106-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2264	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 08:58:40.001-07	2017-03-27 08:58:40.001-07	\N	2017-03-27 09:01:06.923-07	3	2018-03-27 08:58:39.313-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2265	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 09:00:15.115-07	2017-03-27 10:46:18.273-07	2017-03-27 10:46:18.272-07	2017-03-27 10:46:43.247-07	3	2018-03-27 09:00:14.596-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2266	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 10:46:21.637-07	2017-03-27 10:54:36.2-07	2017-03-27 10:54:36.199-07	2017-03-27 10:55:03.518-07	3	2018-03-27 10:46:21.041-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2267	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 10:54:38.499-07	2017-03-31 10:54:59.737-07	2017-03-31 10:54:59.736-07	2017-03-31 10:57:17.587-07	3	2018-03-27 10:54:37.975-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2318	*****@paypal.com	*****	*****	paypal	\N	2017-03-31 10:55:08.767-07	2017-03-31 15:33:10.929-07	2017-03-31 15:33:10.928-07	2017-03-31 15:33:37.928-07	3	2018-03-31 10:55:08.252-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2601	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:15:58.306-07	2017-04-17 14:15:58.306-07	\N	2017-04-17 14:17:31.155-07	3	2018-04-17 14:15:57.816-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2560	*****@paypal.com	*****	*****	paypal	\N	2017-04-13 13:50:41.094-07	2017-04-13 13:57:22.555-07	2017-04-13 13:57:22.534-07	2017-04-17 12:34:05.25-07	3	2018-04-13 13:50:40.609-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2561	*****@paypal.com	*****	*****	paypal	\N	2017-04-13 13:52:22.989-07	2017-04-13 13:52:22.989-07	\N	2017-04-13 13:57:22.804-07	3	2018-04-13 13:52:22.424-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2321	*****@paypal.com	*****	*****	paypal	\N	2017-03-31 15:33:13.922-07	2017-03-31 15:33:37.801-07	2017-03-31 15:33:37.801-07	2017-04-13 13:57:22.795-07	3	2018-03-31 15:33:13.429-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2589	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 07:29:51.502-07	2017-04-17 07:29:51.502-07	\N	2017-04-17 12:34:05.252-07	3	2018-04-17 07:29:50.969-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2592	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 12:32:22.818-07	2017-04-17 12:32:22.818-07	\N	2017-04-17 12:34:05.253-07	3	2018-04-17 12:32:22.311-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2593	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 12:32:25.362-07	2017-04-17 12:32:25.362-07	\N	2017-04-17 12:34:05.254-07	3	2018-04-17 12:32:24.902-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2595	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 12:33:26.483-07	2017-04-17 12:33:26.483-07	\N	2017-04-17 12:34:05.255-07	3	2018-04-17 12:33:26.015-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2602	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:16:50.566-07	2017-04-17 14:17:30.886-07	2017-04-17 14:17:30.886-07	\N	3	2018-04-17 14:16:49.999-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2596	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:03:48.29-07	2017-04-17 14:03:48.29-07	\N	2017-04-17 14:17:31.145-07	3	2018-04-17 14:03:47.645-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2597	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:08:47.699-07	2017-04-17 14:08:47.699-07	\N	2017-04-17 14:17:31.148-07	3	2018-04-17 14:08:47.299-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2599	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:14:29.551-07	2017-04-17 14:14:29.551-07	\N	2017-04-17 14:17:31.151-07	3	2018-04-17 14:14:29.12-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2600	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:15:56.101-07	2017-04-17 14:15:56.101-07	\N	2017-04-17 14:17:31.153-07	3	2018-04-17 14:15:55.67-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2594	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 12:33:22.594-07	2017-04-17 14:16:44.162-07	2017-04-17 14:16:44.162-07	2017-04-17 14:17:31.156-07	3	2018-04-17 12:33:22.134-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
2846	*****@paypal.com	*****	*****	paypal	\N	2017-05-08 08:30:40.035-07	2017-05-08 08:30:40.035-07	\N	\N	3	2018-05-08 08:30:39.371-07	\N	696	2017-09-12 11:13:43.447-07	\N	f	\N
1622	*****@paypal.com	*****	*****	stripe	\N	2017-01-16 10:03:53.804-08	2017-01-16 10:03:54.509-08	\N	\N	2561	\N	\N	701	2017-09-12 11:13:43.45-07	\N	f	\N
1471	*****@paypal.com	*****	*****	stripe	\N	2016-12-18 17:41:26.69-08	2016-12-18 17:41:27.187-08	\N	\N	2220	\N	\N	700	2017-09-12 11:13:43.45-07	\N	f	\N
1472	*****@paypal.com	*****	*****	stripe	\N	2016-12-18 17:41:58.818-08	2016-12-18 17:41:59.328-08	\N	\N	2220	\N	\N	700	2017-09-12 11:13:43.45-07	\N	f	\N
288	*****@paypal.com	*****	*****	stripe	\N	2016-05-19 12:24:40.781-07	2016-05-19 12:24:41.33-07	\N	\N	392	\N	\N	719	2017-09-12 11:13:43.53-07	\N	f	\N
1257	*****@paypal.com	*****	*****	stripe	\N	2016-11-29 02:03:21.517-08	2016-11-29 02:03:22.16-08	\N	\N	1908	\N	\N	708	2017-09-12 11:13:43.491-07	\N	f	\N
1179	*****@paypal.com	*****	*****	stripe	\N	2016-11-17 09:43:26.371-08	2016-11-17 09:43:27.368-08	\N	\N	1808	\N	\N	709	2017-09-12 11:13:43.492-07	\N	f	\N
\.


                                                                                                                                                                                                                         4028.dat                                                                                            0000600 0004000 0002000 00000010303 13156021737 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        00-stripemanaged-model.js
01-transaction-model.js
02-group-model.js
03-card-model.js
04-application-model.js
05-user-model.js
06-paykey-model.js
07-activity-model.js
08-usergroup-model.js
09-application-group-model.js
10-transaction-model-relations.js
11-activity-model-relation.js
12-card-model-relation.js
20151030150110-addpaypalfield.js
20151208112311-add_group_public_flag.js
20151209114845-add_email_to_stripe_managed_account.js
20151221110406-add_stripesubscriptionid_to_transaction.js
20151230143257-add-longdescription-logo-video-image-expensePolicy-to-Group-migration.js
20151230150937-rename-membership_type-to-membershipType-migration.js
20151230160803-add_group_slug.js
20160105163703-add_transaction_payment_method.js
20160108134935-merge-name-field-and-add-website-and-twitter-handle-migration.js
20160108145839-updating-longDescription-datatype-migration.js
20160109164217-addVAT-migration.js
20160111104412-switch-expensepolicy-to-be-larger-migration.js
20160112093010-reshape_stripe_managed_account.js
20160113172636-add_stripe_accountid_to_user.js
20160113172933-replace-usergroup-role.js
20160115105814-add-website-twitter-to-group.js
20160119121646-add-pending-subscription.js
20160121133658-subscriptions-migration.js
20160128142427-add_reset_token_to_user.js
20160211190935-add-group-tiers.js
20160216121153-add-interval-to-transaction.js
20160218164134-add-new-constraint-to-UserGroups.js
20160219151355-add-usergroup-id.js
201602242300-add-vendor.js
20160225133109-rename-subscriptions-to-notifications.js
20160226153046-subscription-remodel.js
20160226154559-transactions-subscription-reshape.js
20160309143800-notifications-webhook.js
20160311090652-connected-account-migration.js
20160311113816-transaction-paranoid-migration.js
20160321114955-transaction-data.js
20160322231916-rename-card-to-paymentmethod-migration.js
20160323121731-rename-CardId-to-PaymentsMethodId-in-Transactions-migration.js
20160323133617-add-donations-table-migration.js
20160323152724-add-fields-to-transactions-migration.js
20160402120725-add-fee-fields-to-transactions-migration.js
20160405133705-add-burnrate-and-mission-to-group.js
201604150000-add-backgroundImage.js
201604150000-add-referer-to-users.js
20160415194252-add-netAmountInGroupCurrency-to-Transactions-migration.js
20160416141204-add-hostCommissionPercent-migration.js
20160505173300-add-connected-account-group-id.js
20160511222234-group-settings-and-whyjoin.js
20160519162112-make-group.slug-unique-migration.js
20160520153932-remove-user.email-unique-constraint-migration.js
20160602124940-group-data.js
20160608001600-add-expenses-table.js
20160610103923-add-payoutmethod-to-expense-migration.js
20160616161932-group-tags-and-supercollective-field-migration.js
20160610161454-add-users-description-organization.js
20160613174610-temporal-migration.js
20160713221132-user-add-longDescription.js
20160716003148-users-add-mission.js
20160802180635-add-paymentmethod-to-donation.js
20160815115600-add-sessions-table.js
20160822191515-processedAt-in-Donation-migration.js
20160918000000-users-add-firstname.js
20161007172819-lastEditedBy-in-Groups-migration.js
20161007175650-add-grouphistories-migration.js
20161012000000-comments.js
20161117000000-users-add-billingAddress.js
20161204000000-add-index.js
20161205175944-increase-group-mission-length-migration.js
201701040000-group-isActive.js
20170116163901-create-Event-migration.js
20170116170650-create-Tier-migration.js
20170116190354-create-Response-migration.js
20170124210251-New-fields-Event-Tier-Response-migration.js
20170125005855-Add-Lat-Long-in-Event-migration.js
20170127211709-remove-unused-transaction-fields-migration.js
20170127223729-change-amounts-to-ints-migration.js
20170209212119-add-response-to-migration.js
20170220000000-transactions-add-uuid.js
20170228184811-add-fields-to-PaymentMethod-migration.js
201703150000-add-timezone-events.js
20170310165323-add-notes-to-donations-migration.js
201704100000-updateTiers.js
20170525000000-event-addIndex.js
201706030000-add-HostId.js
201706300000-addTransactionDonationIndex.js
201707080000-add-tiers-maxQuantityPerUser.js
201707100000-add-tiers-to-group.js
201707120000-updatePaymentMethod.js
201707140000-GroupToCollective.js
201709020000-AddPaymentMethodData.js
201709110000-DoubleEntry.js
\.


                                                                                                                                                                                                                                                                                                                             4029.dat                                                                                            0000600 0004000 0002000 00000000005 13156021737 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4030.dat                                                                                            0000600 0004000 0002000 00000004437 13156021737 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        6	100	USD	month	f	\N	*****	2016-02-02 08:36:36-08	2016-06-01 17:00:00-07	2016-02-29 17:07:14.394-08	2016-02-29 17:07:14.394-08	\N
7	100	USD	month	f	\N	*****	2016-02-02 09:04:54-08	2016-06-01 17:00:00-07	2016-02-29 17:07:14.807-08	2016-02-29 17:07:14.807-08	\N
3	100	USD	month	f	\N	*****	2016-02-02 09:09:20-08	2016-06-01 17:00:00-07	2016-02-29 17:07:13.303-08	2016-02-29 17:07:13.303-08	\N
8	100	USD	month	f	\N	*****	2016-02-02 13:46:43-08	2016-06-01 17:00:00-07	2016-02-29 17:07:15.151-08	2016-02-29 17:07:15.151-08	\N
2	100	USD	month	f	\N	*****	2016-02-02 15:09:04-08	2016-06-01 17:00:00-07	2016-02-29 17:07:12.938-08	2016-02-29 17:07:12.938-08	\N
16	100	MXN	month	f	\N	*****	2016-02-15 10:46:05-08	\N	2016-02-29 17:07:18.292-08	2016-02-29 17:07:18.292-08	\N
1	500	USD	month	f	\N	*****	\N	\N	2016-02-29 17:07:12.45-08	2016-02-29 17:07:12.45-08	\N
496	1000	USD	month	t	\N	*****	2016-09-09 20:42:55.758-07	\N	2016-09-09 20:42:49.141-07	2016-09-09 20:42:55.759-07	\N
33	100	USD	month	f	\N	*****	2016-03-01 20:42:15.671-08	2016-06-01 17:00:00-07	2016-03-01 20:41:59.934-08	2016-03-01 20:42:15.673-08	\N
4	500	MXN	month	f	\N	*****	2016-02-02 08:52:01-08	\N	2016-02-29 17:07:13.684-08	2016-02-29 17:07:13.684-08	\N
378	10000	USD	month	f	\N	*****	2016-08-03 10:47:24.609-07	2016-08-03 10:48:03.066-07	2016-08-03 10:47:17.197-07	2016-08-03 10:48:03.067-07	\N
2031	200	USD	month	t	\N	*****	2017-04-30 18:40:31.674-07	\N	2017-04-30 18:40:26.929-07	2017-04-30 18:40:31.674-07	\N
224	100	USD	month	t	\N	*****	2016-06-09 10:28:30.06-07	\N	2016-06-09 10:28:13.943-07	2016-06-09 10:28:30.069-07	\N
1366	2500	USD	month	t	\N	*****	2017-02-01 09:30:50.219-08	\N	2017-02-01 09:30:44.034-08	2017-02-01 09:30:50.219-08	\N
2039	500	USD	month	t	\N	*****	2017-05-01 10:13:36.243-07	\N	2017-05-01 10:13:32.216-07	2017-05-01 10:13:36.243-07	\N
286	1000	USD	month	t	\N	*****	2016-07-01 15:38:36.9-07	\N	2016-07-01 15:31:45.99-07	2016-07-01 15:38:36.9-07	\N
530	0	USD	month	f	\N	*****	2016-09-20 13:59:00.661-07	2017-01-16 07:00:35.909-08	2016-09-20 13:58:49.798-07	2017-01-16 07:00:35.909-08	\N
2103	1000	USD	month	t	\N	*****	2017-05-08 22:59:17.481-07	\N	2017-05-08 22:59:11.936-07	2017-05-08 22:59:17.482-07	\N
1238	1000	USD	month	f	\N	*****	2017-01-14 09:12:00.516-08	2017-02-22 15:10:02.422-08	2017-01-14 09:11:39.397-08	2017-02-22 15:10:02.422-08	\N
\.


                                                                                                                                                                                                                                 4033.dat                                                                                            0000600 0004000 0002000 00000052161 13156021737 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        40	backer	\N	200	EUR	\N	\N	\N	\N	2017-09-12 11:13:43.945-07	\N	\N	backers	\N	\N	TIER	524	month	\N	[200,1000,2500]
41	donor	\N	\N	EUR	\N	\N	\N	\N	2017-09-12 11:13:43.945-07	\N	\N	donors	\N	\N	TIER	524	\N	\N	\N
42	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:43.946-07	\N	\N	backers	\N	\N	TIER	47	\N	Become a backer	[2500,5000,10000]
43	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:43.946-07	\N	\N	donors	\N	\N	TIER	47	\N	\N	\N
44	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:43.946-07	\N	\N	backers	\N	\N	TIER	292	\N	Become a backer	[2500,5000,10000]
45	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:43.946-07	\N	\N	donors	\N	\N	TIER	292	\N	\N	\N
46	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:43.946-07	\N	\N	backers	\N	\N	TIER	275	\N	Become a backer	[2500,5000,10000]
47	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:43.946-07	\N	\N	donors	\N	\N	TIER	275	\N	\N	\N
48	backer	\N	200	USD	\N	\N	\N	\N	2017-09-12 11:13:43.946-07	\N	\N	backers	\N	\N	TIER	521	month	\N	[200,1000,2500]
49	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-09-12 11:13:43.946-07	\N	\N	sponsors	\N	\N	TIER	521	month	\N	[10000,25000,50000]
50	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:43.946-07	\N	\N	donors	\N	\N	TIER	521	\N	\N	\N
51	backer	\N	200	USD	\N	\N	\N	\N	2017-09-12 11:13:43.947-07	\N	\N	backers	\N	\N	TIER	525	month	\N	[200,1000,2500]
52	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-09-12 11:13:43.947-07	\N	\N	sponsors	\N	\N	TIER	525	month	\N	[10000,25000,50000]
53	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:43.947-07	\N	\N	donors	\N	\N	TIER	525	\N	\N	\N
54	backer	\N	200	CAD	\N	\N	\N	\N	2017-09-12 11:13:43.947-07	\N	\N	backers	\N	\N	TIER	522	month	\N	[200,1000,2500]
55	sponsor	\N	10000	CAD	\N	\N	\N	\N	2017-09-12 11:13:43.947-07	\N	\N	sponsors	\N	\N	TIER	522	month	\N	[10000,25000,50000]
56	donor	\N	\N	CAD	\N	\N	\N	\N	2017-09-12 11:13:43.947-07	\N	\N	donors	\N	\N	TIER	522	\N	\N	\N
57	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:43.947-07	\N	\N	backers	\N	\N	TIER	262	\N	Become a backer	[2500,5000,10000]
58	backer	\N	200	USD	\N	\N	\N	\N	2017-09-12 11:13:43.947-07	\N	\N	backers	\N	\N	TIER	510	month	\N	[200,1000,2500]
59	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:43.947-07	\N	\N	donors	\N	\N	TIER	262	\N	\N	\N
60	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-09-12 11:13:43.948-07	\N	\N	sponsors	\N	\N	TIER	510	month	\N	[10000,25000,50000]
61	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:43.948-07	\N	\N	donors	\N	\N	TIER	510	\N	\N	\N
62	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:43.948-07	\N	\N	backers	\N	\N	TIER	295	\N	Become a backer	[2500,5000,10000]
63	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:43.948-07	\N	\N	donors	\N	\N	TIER	295	\N	\N	\N
64	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.003-07	\N	\N	backers	\N	\N	TIER	2	\N	Become a backer	[2500,5000,10000]
65	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.003-07	\N	\N	donors	\N	\N	TIER	2	\N	\N	\N
66	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.004-07	\N	\N	backers	\N	\N	TIER	15	\N	Become a backer	[2500,5000,10000]
67	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.005-07	\N	\N	donors	\N	\N	TIER	15	\N	\N	\N
68	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.005-07	\N	\N	backers	\N	\N	TIER	290	\N	Become a backer	[2500,5000,10000]
69	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.005-07	\N	\N	donors	\N	\N	TIER	290	\N	\N	\N
70	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.006-07	\N	\N	backers	\N	\N	TIER	271	\N	Become a backer	[2500,5000,10000]
71	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.006-07	\N	\N	donors	\N	\N	TIER	271	\N	\N	\N
72	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.006-07	\N	\N	backers	\N	\N	TIER	288	\N	Become a backer	[2500,5000,10000]
73	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.006-07	\N	\N	donors	\N	\N	TIER	288	\N	\N	\N
74	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.007-07	\N	\N	backers	\N	\N	TIER	285	\N	Become a backer	[2500,5000,10000]
75	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.008-07	\N	\N	donors	\N	\N	TIER	285	\N	\N	\N
76	Backers	Support us with a donation and help us continue our activities.	2500	CAD	\N	\N	\N	\N	2017-09-12 11:13:44.008-07	\N	\N	backers	\N	\N	TIER	291	\N	Become a backer	[2500,5000,10000]
77	donor	\N	\N	CAD	\N	\N	\N	\N	2017-09-12 11:13:44.009-07	\N	\N	donors	\N	\N	TIER	291	\N	\N	\N
78	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.009-07	\N	\N	backers	\N	\N	TIER	13	\N	Become a backer	[2500,5000,10000]
79	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.009-07	\N	\N	donors	\N	\N	TIER	13	\N	\N	\N
80	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.01-07	\N	\N	backers	\N	\N	TIER	289	\N	Become a backer	[2500,5000,10000]
81	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.01-07	\N	\N	donors	\N	\N	TIER	289	\N	\N	\N
82	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.019-07	\N	\N	backers	\N	\N	TIER	300	\N	Become a backer	[2500,5000,10000]
83	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.019-07	\N	\N	donors	\N	\N	TIER	300	\N	\N	\N
84	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.071-07	\N	\N	backers	\N	\N	TIER	4	\N	Become a backer	[2500,5000,10000]
85	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.072-07	\N	\N	donors	\N	\N	TIER	4	\N	\N	\N
86	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.072-07	\N	\N	backers	\N	\N	TIER	268	\N	Become a backer	[2500,5000,10000]
87	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.072-07	\N	\N	donors	\N	\N	TIER	268	\N	\N	\N
88	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.074-07	\N	\N	backers	\N	\N	TIER	287	\N	Become a backer	[2500,5000,10000]
89	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.074-07	\N	\N	donors	\N	\N	TIER	287	\N	\N	\N
90	Backers	Support us with a donation and help us continue our activities.	2500	GBP	\N	\N	\N	\N	2017-09-12 11:13:44.091-07	\N	\N	backers	\N	\N	TIER	264	\N	Become a backer	[2500,5000,10000]
91	donor	\N	\N	GBP	\N	\N	\N	\N	2017-09-12 11:13:44.091-07	\N	\N	donors	\N	\N	TIER	264	\N	\N	\N
92	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.094-07	\N	\N	backers	\N	\N	TIER	284	\N	Become a backer	[2500,5000,10000]
93	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.094-07	\N	\N	donors	\N	\N	TIER	284	\N	\N	\N
94	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.1-07	\N	\N	backers	\N	\N	TIER	3	\N	Become a backer	[2500,5000,10000]
95	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.1-07	\N	\N	donors	\N	\N	TIER	3	\N	\N	\N
96	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.102-07	\N	\N	backers	\N	\N	TIER	282	\N	Become a backer	[2500,5000,10000]
97	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.102-07	\N	\N	donors	\N	\N	TIER	282	\N	\N	\N
98	donor	\N	\N	MXN	\N	\N	\N	\N	2017-09-12 11:13:44.104-07	\N	\N	donors	\N	\N	TIER	10	\N	\N	\N
99	Backers	Support us with a donation and help us continue our activities.	5000	MXN	\N	\N	\N	\N	2017-09-12 11:13:44.104-07	\N	\N	backers	\N	\N	TIER	10	\N	Become a backer	[5000,10000,25000,50000,100000]
100	Backers	Support us with a donation and help us continue our activities.	2500	AUD	\N	\N	\N	\N	2017-09-12 11:13:44.12-07	\N	\N	backers	\N	\N	TIER	281	\N	Become a backer	[2500,5000,10000]
101	donor	\N	\N	AUD	\N	\N	\N	\N	2017-09-12 11:13:44.12-07	\N	\N	donors	\N	\N	TIER	281	\N	\N	\N
102	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.136-07	\N	\N	backers	\N	\N	TIER	270	\N	Become a backer	[2500,5000,10000]
103	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.137-07	\N	\N	donors	\N	\N	TIER	270	\N	\N	\N
105	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.141-07	\N	\N	donors	\N	\N	TIER	269	\N	\N	\N
104	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.141-07	\N	\N	backers	\N	\N	TIER	269	\N	Become a backer	[2500,5000,10000]
109	donor	\N	\N	GBP	\N	\N	\N	\N	2017-09-12 11:13:44.152-07	\N	\N	donors	\N	\N	TIER	278	\N	\N	\N
113	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.158-07	\N	\N	donors	\N	\N	TIER	279	\N	\N	\N
121	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.174-07	\N	\N	donors	\N	\N	TIER	265	\N	\N	\N
129	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.21-07	\N	\N	donors	\N	\N	TIER	277	\N	\N	\N
139	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.227-07	\N	\N	donors	\N	\N	TIER	273	\N	\N	\N
140	Backers	Support us with a donation and help us continue our activities.	2500	CAD	\N	\N	\N	\N	2017-09-12 11:13:44.241-07	\N	\N	backers	\N	\N	TIER	293	\N	Become a backer	[2500,5000,10000]
146	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.269-07	\N	\N	backers	\N	\N	TIER	261	\N	Become a backer	[2500,5000,10000]
156	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.274-07	\N	\N	backers	\N	\N	TIER	430	\N	Become a backer	[2500,5000,10000]
162	donor	\N	\N	GBP	\N	\N	\N	\N	2017-09-12 11:13:44.281-07	\N	\N	donors	\N	\N	TIER	584	\N	\N	\N
163	backer	\N	200	USD	\N	\N	\N	\N	2017-09-12 11:13:44.301-07	\N	\N	backers	\N	\N	TIER	517	month	\N	[200,1000,2500]
166	backer	\N	200	USD	\N	\N	\N	\N	2017-09-12 11:13:44.322-07	\N	\N	backers	\N	\N	TIER	513	month	\N	[200,1000,2500]
170	sponsor	\N	10000	MXN	\N	\N	\N	\N	2017-09-12 11:13:44.325-07	\N	\N	sponsors	\N	\N	TIER	511	month	\N	[10000,25000,50000]
173	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-09-12 11:13:44.327-07	\N	\N	sponsors	\N	\N	TIER	512	month	\N	[10000,25000,50000]
176	backer	\N	200	EUR	\N	\N	\N	\N	2017-09-12 11:13:44.336-07	\N	\N	backers	\N	\N	TIER	523	month	\N	[200,1000,2500]
187	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-09-12 11:13:44.344-07	\N	\N	sponsors	\N	\N	TIER	518	month	\N	[10000,25000,50000]
192	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.345-07	\N	\N	donors	\N	\N	TIER	515	\N	\N	\N
195	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.38-07	\N	\N	backers	\N	\N	TIER	286	\N	Become a backer	[2500,5000,10000]
198	donor	\N	\N	EUR	\N	\N	\N	\N	2017-09-12 11:13:44.382-07	\N	\N	donors	\N	\N	TIER	283	\N	\N	\N
106	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.146-07	\N	\N	backers	\N	\N	TIER	12	\N	Become a backer	[2500,5000,10000]
110	Backers	Support us with a donation and help us continue our activities.	2500	GBP	\N	\N	\N	\N	2017-09-12 11:13:44.153-07	\N	\N	backers	\N	\N	TIER	267	\N	Become a backer	[2500,5000,10000]
122	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.195-07	\N	\N	backers	\N	\N	TIER	241	\N	Become a backer	[2500,5000,10000]
132	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.216-07	\N	\N	backers	\N	\N	TIER	274	\N	Become a backer	[2500,5000,10000]
134	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.218-07	\N	\N	backers	\N	\N	TIER	263	\N	Become a backer	[2500,5000,10000]
143	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.258-07	\N	\N	donors	\N	\N	TIER	272	\N	\N	\N
149	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.269-07	\N	\N	donors	\N	\N	TIER	59	\N	\N	\N
152	donor	Become a donor and help us support all the local Women Who Code collectives	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.271-07	\N	\N	donors	\N	\N	TIER	51	\N	\N	["other",100000,500000,1000000]
161	backer	\N	200	GBP	\N	\N	\N	\N	2017-09-12 11:13:44.28-07	\N	\N	backers	\N	\N	TIER	584	month	\N	[200,1000,2500]
164	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-09-12 11:13:44.301-07	\N	\N	sponsors	\N	\N	TIER	517	month	\N	[10000,25000,50000]
168	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.322-07	\N	\N	donors	\N	\N	TIER	513	\N	\N	\N
178	backer	\N	200	USD	\N	\N	\N	\N	2017-09-12 11:13:44.339-07	\N	\N	backers	\N	\N	TIER	520	month	\N	[200,1000,2500]
182	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-09-12 11:13:44.341-07	\N	\N	sponsors	\N	\N	TIER	519	month	\N	[10000,25000,50000]
186	backer	\N	200	USD	\N	\N	\N	\N	2017-09-12 11:13:44.344-07	\N	\N	backers	\N	\N	TIER	516	month	\N	[200,1000,2500]
191	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-09-12 11:13:44.345-07	\N	\N	sponsors	\N	\N	TIER	515	month	\N	[10000,25000,50000]
196	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.38-07	\N	\N	donors	\N	\N	TIER	286	\N	\N	\N
199	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.387-07	\N	\N	backers	\N	\N	TIER	280	\N	Become a backer	[2500,5000,10000]
107	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.146-07	\N	\N	donors	\N	\N	TIER	12	\N	\N	\N
112	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.157-07	\N	\N	backers	\N	\N	TIER	279	\N	Become a backer	[2500,5000,10000]
116	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.172-07	\N	\N	backers	\N	\N	TIER	259	\N	Become a backer	[2500,5000,10000]
118	Backers	Support us with a donation and help us continue our activities.	2500	AUD	\N	\N	\N	\N	2017-09-12 11:13:44.174-07	\N	\N	backers	\N	\N	TIER	297	\N	Become a backer	[2500,5000,10000]
124	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.204-07	\N	\N	donors	\N	\N	TIER	195	\N	\N	\N
127	donor	\N	\N	EUR	\N	\N	\N	\N	2017-09-12 11:13:44.209-07	\N	\N	donors	\N	\N	TIER	301	\N	\N	\N
133	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.216-07	\N	\N	donors	\N	\N	TIER	274	\N	\N	\N
136	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.221-07	\N	\N	backers	\N	\N	TIER	294	\N	Become a backer	[2500,5000,10000]
141	donor	\N	\N	CAD	\N	\N	\N	\N	2017-09-12 11:13:44.241-07	\N	\N	donors	\N	\N	TIER	293	\N	\N	\N
145	donor	\N	\N	EUR	\N	\N	\N	\N	2017-09-12 11:13:44.267-07	\N	\N	donors	\N	\N	TIER	298	\N	\N	\N
147	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.269-07	\N	\N	backers	\N	\N	TIER	59	\N	Become a backer	[2500,5000,10000]
150	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.27-07	\N	\N	backers	\N	\N	TIER	260	\N	Become a backer	[2500,5000,10000]
154	Sponsors	Become a Sponsor and help us fulfill our mission to inspire women to excel in tech careers. See the description above for more info.	150000	USD	\N	\N	\N	\N	2017-09-12 11:13:44.272-07	\N	\N	sponsors	\N	\N	TIER	48	\N	Become a Sponsor	[150000,300000,500000]
159	donor	\N	\N	MXN	\N	\N	\N	\N	2017-09-12 11:13:44.277-07	\N	\N	donors	\N	\N	TIER	299	\N	\N	\N
172	backer	\N	200	USD	\N	\N	\N	\N	2017-09-12 11:13:44.327-07	\N	\N	backers	\N	\N	TIER	512	month	\N	[200,1000,2500]
175	sponsor	\N	10000	EUR	\N	\N	\N	\N	2017-09-12 11:13:44.336-07	\N	\N	sponsors	\N	\N	TIER	523	month	\N	[10000,25000,50000]
180	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.339-07	\N	\N	donors	\N	\N	TIER	520	\N	\N	\N
188	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-09-12 11:13:44.344-07	\N	\N	sponsors	\N	\N	TIER	516	month	\N	[10000,25000,50000]
194	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.378-07	\N	\N	donors	\N	\N	TIER	14	\N	\N	\N
197	Backers	Support us with a donation and help us continue our activities.	2500	EUR	\N	\N	\N	\N	2017-09-12 11:13:44.382-07	\N	\N	backers	\N	\N	TIER	283	\N	Become a backer	[2500,5000,10000]
108	Backers	Support us with a donation and help us continue our activities.	2500	GBP	\N	\N	\N	\N	2017-09-12 11:13:44.151-07	\N	\N	backers	\N	\N	TIER	278	\N	Become a backer	[2500,5000,10000]
115	Backers	Support us with a donation and help us continue our activities.	2500	AUD	\N	\N	\N	\N	2017-09-12 11:13:44.162-07	\N	\N	backers	\N	\N	TIER	266	\N	Become a backer	[2500,5000,10000]
117	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.172-07	\N	\N	donors	\N	\N	TIER	259	\N	\N	\N
120	donor	\N	\N	AUD	\N	\N	\N	\N	2017-09-12 11:13:44.174-07	\N	\N	donors	\N	\N	TIER	297	\N	\N	\N
123	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.195-07	\N	\N	donors	\N	\N	TIER	241	\N	\N	\N
125	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.204-07	\N	\N	backers	\N	\N	TIER	195	\N	Become a backer	[2500,5000,10000]
130	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.215-07	\N	\N	backers	\N	\N	TIER	276	\N	Become a backer	[2500,5000,10000]
135	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.218-07	\N	\N	donors	\N	\N	TIER	263	\N	\N	\N
148	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.269-07	\N	\N	donors	\N	\N	TIER	261	\N	\N	\N
151	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.27-07	\N	\N	donors	\N	\N	TIER	260	\N	\N	\N
155	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.272-07	\N	\N	donors	\N	\N	TIER	48	\N	\N	\N
158	Backers	Support us with a donation and help us continue our activities.	2500	MXN	\N	\N	\N	\N	2017-09-12 11:13:44.276-07	\N	\N	backers	\N	\N	TIER	299	\N	Become a backer	[2500,5000,10000]
160	sponsor	\N	10000	GBP	\N	\N	\N	\N	2017-09-12 11:13:44.28-07	\N	\N	sponsors	\N	\N	TIER	584	month	\N	[10000,25000,50000]
165	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.301-07	\N	\N	donors	\N	\N	TIER	517	\N	\N	\N
167	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-09-12 11:13:44.322-07	\N	\N	sponsors	\N	\N	TIER	513	month	\N	[10000,25000,50000]
171	donor	\N	\N	MXN	\N	\N	\N	\N	2017-09-12 11:13:44.325-07	\N	\N	donors	\N	\N	TIER	511	\N	\N	\N
174	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.327-07	\N	\N	donors	\N	\N	TIER	512	\N	\N	\N
177	donor	\N	\N	EUR	\N	\N	\N	\N	2017-09-12 11:13:44.336-07	\N	\N	donors	\N	\N	TIER	523	\N	\N	\N
181	backer	\N	200	USD	\N	\N	\N	\N	2017-09-12 11:13:44.341-07	\N	\N	backers	\N	\N	TIER	519	month	\N	[200,1000,2500]
185	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.344-07	\N	\N	donors	\N	\N	TIER	518	\N	\N	\N
190	backer	\N	200	USD	\N	\N	\N	\N	2017-09-12 11:13:44.345-07	\N	\N	backers	\N	\N	TIER	515	month	\N	[200,1000,2500]
193	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.377-07	\N	\N	backers	\N	\N	TIER	14	\N	Become a backer	[2500,5000,10000]
200	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.388-07	\N	\N	donors	\N	\N	TIER	280	\N	\N	\N
111	donor	\N	\N	GBP	\N	\N	\N	\N	2017-09-12 11:13:44.153-07	\N	\N	donors	\N	\N	TIER	267	\N	\N	\N
114	donor	\N	\N	AUD	\N	\N	\N	\N	2017-09-12 11:13:44.163-07	\N	\N	donors	\N	\N	TIER	266	\N	\N	\N
119	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.174-07	\N	\N	backers	\N	\N	TIER	265	\N	Become a backer	[2500,5000,10000]
126	Backers	Support us with a donation and help us continue our activities.	2500	EUR	\N	\N	\N	\N	2017-09-12 11:13:44.209-07	\N	\N	backers	\N	\N	TIER	301	\N	Become a backer	[2500,5000,10000]
128	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.21-07	\N	\N	backers	\N	\N	TIER	277	\N	Become a backer	[2500,5000,10000]
131	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.215-07	\N	\N	donors	\N	\N	TIER	276	\N	\N	\N
137	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.221-07	\N	\N	donors	\N	\N	TIER	294	\N	\N	\N
138	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.227-07	\N	\N	backers	\N	\N	TIER	273	\N	Become a backer	[2500,5000,10000]
142	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.258-07	\N	\N	backers	\N	\N	TIER	272	\N	Become a backer	[2500,5000,10000]
144	Backers	Support us with a donation and help us continue our activities.	2500	EUR	\N	\N	\N	\N	2017-09-12 11:13:44.267-07	\N	\N	backers	\N	\N	TIER	298	\N	Become a backer	[2500,5000,10000]
153	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-09-12 11:13:44.272-07	\N	\N	backers	\N	\N	TIER	48	\N	Become a backer	[2500,5000,10000]
157	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.274-07	\N	\N	donors	\N	\N	TIER	430	\N	\N	\N
169	backer	\N	200	MXN	\N	\N	\N	\N	2017-09-12 11:13:44.325-07	\N	\N	backers	\N	\N	TIER	511	month	\N	[200,1000,2500]
179	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-09-12 11:13:44.339-07	\N	\N	sponsors	\N	\N	TIER	520	month	\N	[10000,25000,50000]
183	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.342-07	\N	\N	donors	\N	\N	TIER	519	\N	\N	\N
184	backer	\N	200	USD	\N	\N	\N	\N	2017-09-12 11:13:44.344-07	\N	\N	backers	\N	\N	TIER	518	month	\N	[200,1000,2500]
189	donor	\N	\N	USD	\N	\N	\N	\N	2017-09-12 11:13:44.344-07	\N	\N	donors	\N	\N	TIER	516	\N	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                               4035.dat                                                                                            0000600 0004000 0002000 00001054534 13156021737 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        211	DEBIT	Order for stickers of our official WWC Boulder/Denver chapter logo	-7800	USD	2016-03-17 20:23:34.628-07	2016-06-14 11:14:21.77-07	15	68	\N	2016-06-14 11:14:22.448-07	\N	\N	\N	\N	\N	\N	\N	\N	-7800	48	33473cbd-5d6e-4231-a8f5-eb5453ae7eb1	756	696
208	DEBIT	Food for March Boulder, CO event	-14000	USD	2016-03-17 11:48:54.413-07	2016-06-14 11:14:21.77-07	15	68	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-14000	46	614a8194-5d1d-483a-b0ac-231a1f17a036	756	696
459	DEBIT	WWC Boulder- April event's food	-14100	USD	2016-04-06 17:00:00-07	2016-06-14 11:14:21.989-07	15	68	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-14100	137	d79ac9f7-4158-4fea-be4d-6c95b1858509	756	696
460	DEBIT	Mile High Agile outreach- supplies	-1115	USD	2016-04-02 17:00:00-07	2016-06-14 11:14:21.989-07	15	68	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1115	136	4423d89d-fb84-4db4-acee-0adf95f0492e	756	696
5275	DEBIT	travel to NY for bell ringing at NYSE	-30000	USD	2017-01-25 10:20:51.642-08	2017-01-25 10:20:54.592-08	12	70	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	-30000	743	db2e9b39-0096-457f-9db4-a5bb6814f55c	764	696
7073	DEBIT	IWD event -- wine for event	-9732	USD	2017-03-14 10:22:31.446-07	2017-03-14 10:22:31.46-07	12	70	1893	\N	\N	\N	\N	\N	312	USD	1	-9732	-10044	900	22a98043-eb9c-4d56-b246-f3529b741284	764	696
3841	DEBIT	Food/Drinks for Anniversary Reception with guest WWCode Directors!	-4400	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4444	486	534b6b59-e66e-4781-9a64-b546b15e08b6	844	696
3842	DEBIT	Food for Anniversary Reception	-700	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-713	492	5ea9a1f3-af86-44ce-a16f-5c2b3fd2a5e3	844	696
821	DEBIT	6/2/16 Fireside Chat at Orange Coworking	-20000	USD	2016-06-04 14:37:03.991-07	2016-06-14 11:14:22.145-07	2	28	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	211	ba544502-40c0-46d0-83d2-419108dfee18	848	696
7070	DEBIT	February Lightning Talks food	-10680	USD	2017-03-14 10:17:53.891-07	2017-03-14 10:17:53.957-07	2	28	1893	\N	\N	\N	\N	\N	340	USD	1	-10680	-11020	820	0b174ca7-35b7-4eb0-b540-345b64730630	848	696
3535	CREDIT	Banner	2000	USD	2016-11-29 15:07:15.153-08	2016-11-29 15:07:15.39-08	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	3dc39835-0671-450e-bd85-9d5622676954	696	696
466	CREDIT	Recurring subscription	100	USD	2016-05-01 22:44:10.046-07	2016-05-01 22:44:10.072-07	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	21f38ce7-f977-4526-92c4-f488bc43b39d	705	696
726	CREDIT	Recurring subscription	100	USD	2016-06-01 22:48:36.714-07	2016-06-01 22:48:36.745-07	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	23ced910-fe09-4e51-b681-2c4a67ec8eac	705	696
124	CREDIT	Donation to WWCode Washington DC	100	USD	2016-03-01 20:41:59.916-08	2016-04-16 13:40:58.728-07	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	2cd7b544-2cdd-4060-9426-eeb4bed04fb5	705	696
277	CREDIT	Recurring subscription	100	USD	2016-04-02 08:43:33.706-07	2016-04-16 13:40:58.808-07	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	6572dba9-3912-444c-96f4-5ddbec5c098c	705	696
3199	CREDIT	\N	50000	USD	2016-11-17 09:43:29.797-08	2016-11-17 09:43:29.797-08	59	1808	1179	\N	\N	1098	2500	5000	1130	USD	1	50000	41370	\N	2d80d646-083c-4910-a320-cda0edc1cb3b	709	696
3590	CREDIT	\N	20000	USD	2016-11-30 08:11:42.049-08	2016-11-30 08:11:42.049-08	2	1957	1296	\N	\N	1215	1000	2000	470	USD	1	20000	16530	\N	a7479297-dc89-46e1-bbdb-c34a5e6bd385	711	696
4655	CREDIT	\N	20000	USD	2017-01-03 12:59:37.749-08	2017-01-03 12:59:37.749-08	2	2416	1553	\N	\N	1466	1000	2000	470	USD	1	20000	16530	\N	9d9ae433-8160-4ad4-abba-284759515132	710	696
1787	CREDIT	\N	200000	USD	2016-09-01 07:41:36.24-07	2016-09-01 07:41:36.24-07	2	1094	707	\N	\N	622	10000	20000	4430	USD	1	200000	165570	\N	b7a1007d-6e00-4764-b983-c9d27abc2296	739	696
837	CREDIT	Donation to WWCode Austin	150000	USD	2016-06-06 12:04:37.186-07	2016-06-06 12:04:37.308-07	2	551	377	\N	\N	312	7500	15000	4380	USD	1	150000	123120	\N	7b775e3a-0634-4723-9638-3b8d28089e89	782	696
2310	CREDIT	\N	12500	USD	2016-10-06 11:36:38.382-07	2016-10-06 11:36:38.382-07	2	1438	880	\N	\N	808	625	1250	305	USD	1	12500	10320	\N	21b39b65-f892-4961-bed4-4648745d3d23	714	696
9863	CREDIT	\N	1000	USD	2017-05-08 22:59:15.573-07	2017-05-08 22:59:15.573-07	517	4711	2855	\N	\N	2750	50	100	52	USD	1	1000	798	\N	e3494f7e-351e-478a-937b-32ca9c60513f	712	696
2336	CREDIT	\N	2500	USD	2016-10-07 09:49:19.978-07	2016-10-07 09:49:19.978-07	241	1446	884	\N	\N	812	125	250	85	USD	1	2500	2040	\N	2ac309ea-89ad-4880-b72a-67054d83865d	713	696
842	CREDIT	Donation to WWCode Washington DC	100000	USD	2016-06-06 17:53:47.603-07	2016-06-06 17:53:47.649-07	13	555	381	\N	\N	316	5000	10000	2930	USD	1	100000	82070	\N	9921b890-042c-4506-b8c0-2a77793a0783	743	696
9926	CREDIT	\N	1000	CAD	2017-05-10 16:45:46.737-07	2017-05-10 16:45:46.737-07	522	4749	2888	\N	\N	2783	36	71	46	USD	1.39860139860139854	715	786	\N	52d35c0c-9b28-47ca-973a-07470814a70b	748	696
2941	DEBIT	Order for stickers of our official WWC Boulder/Denver chapter logo	-7800	USD	2016-11-03 12:45:23.582-07	2016-11-03 12:45:24.25-07	15	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7800	48	920fcb4b-a53d-48d7-8294-2914e6c5df81	696	696
2942	DEBIT	food/drink for organizers of NODE workshop (had to buy from on-site snack bar)	-2838	USD	2016-11-03 14:13:31.956-07	2016-11-03 14:13:32.241-07	12	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2838	409	edf0f89b-9f88-4050-a39b-a1c03329fd49	696	696
3291	DEBIT	TShirts	-145786	USD	2016-11-21 13:26:37.469-08	2016-11-21 13:26:37.469-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-145786	\N	c9204456-a67b-4951-a271-157ab6819d8b	696	696
3292	DEBIT	Leadership Development Lodging	-64600	USD	2016-11-21 13:26:46.916-08	2016-11-21 13:26:46.916-08	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-64600	\N	96bf91be-3e65-4ccc-932d-61631b570de0	696	696
3331	DEBIT	Thank you bags (16) for hackathon speakers and judges, and for pre-hackathon events volunteers and sponsors.  Each bag contains a WWCode Portland coffee mug, a chocolate bar, ghirardellis squares, and a thank you card.	-8181	USD	2016-11-22 13:54:33.366-08	2016-11-22 13:54:33.644-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-8181	499	bf974271-bd1f-43fd-b113-f1c26a528e73	696	696
4406	DEBIT	Meetup Fees	-6000	USD	2016-12-27 11:46:50.958-08	2016-12-27 11:46:50.958-08	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	655	b66b4d98-0d80-41e7-8f34-1092f16b136c	696	696
4408	DEBIT	Meetup Fees	-6000	USD	2016-12-27 11:50:16.992-08	2016-12-27 11:50:16.992-08	288	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	656	70608aa8-79be-468e-a263-d28237b8531a	696	696
507	DEBIT	Quarterly planning meeting	-14000	USD	2016-05-05 17:18:43.265-07	2016-06-14 11:14:22.011-07	14	32	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-14000	147	fbf72440-5d58-4805-afb9-5d67606dfa8c	798	696
10125	DEBIT	Farewell lunch for Clarissa + Welcome lunch for Pranoti 	-11500	USD	2017-05-16 14:55:26.725-07	2017-05-16 14:55:26.725-07	14	32	\N	\N	\N	\N	\N	\N	0	USD	1	-11500	-11500	1119	200f5721-452d-4ec0-bb90-0970b254c841	798	696
2840	DEBIT	Cash for Prizes/Bartender (the extra money, $50, was not used for the hackathon)	-70000	USD	2016-11-01 08:16:29.544-07	2016-11-01 08:16:30.012-07	2	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-70000	\N	be4916cc-ebfc-4a00-8c1f-6fdec9dad74c	696	696
2396	DEBIT	Conference stipend Elizabeth M.	-75000	USD	2016-10-11 09:01:27.317-07	2016-10-11 09:01:28.351-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75000	\N	6b335f4d-a920-4cfc-90a9-6dfe40dfef58	696	696
1170	DEBIT	Global Development	-150	USD	2016-07-08 20:52:40.722-07	2016-07-08 20:52:40.722-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-150	93	88b9402f-6888-45e1-b572-0f7b29199c39	696	696
2111	DEBIT	My coworker donated his evening to giving demos of his personal Oculus Rift for our AR/VR event, so I sent him a gift card to thank him for his help with the event.	-2500	USD	2016-09-27 12:33:54.08-07	2016-09-27 12:33:54.272-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2500	367	4593d1b5-cc34-42f2-9f9a-00a5e0bb8366	696	696
2261	DEBIT	Beverage for Denver June meetup	-2279	USD	2016-10-04 15:09:25.159-07	2016-10-04 15:09:26.045-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2279	\N	392b3edc-b418-4e67-81a4-4a3310f969c7	696	696
387	DEBIT	Global Developement	-100	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	13	3	\N	2016-06-14 11:14:22.48-07	\N	\N	\N	\N	\N	\N	\N	\N	-100	97	a30c4579-0d08-49fa-b863-e379e17e4cc4	696	696
703	DEBIT	CONFERENCE GRANT	-80000	USD	2016-05-31 10:47:01.276-07	2016-06-14 11:14:22.123-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-80000	198	b08560a4-b373-40d8-91ef-20b273f83d98	696	696
401	DEBIT	CONNECT 2016	-2452	USD	2016-04-25 17:00:00-07	2016-06-14 11:14:21.896-07	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2452	99	9a5b52f2-5dcb-4760-8d33-ce2e4a2c24ef	696	696
305	DEBIT	test 	-100	USD	2016-04-06 10:39:39.954-07	2016-04-06 10:46:25.532-07	14	3	\N	2016-04-06 10:46:25.531-07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5161e6cf-8e5c-43e1-b626-da7e129d3fe6	696	696
2400	DEBIT	Test	-1000	USD	2016-10-11 09:18:39.252-07	2016-10-11 09:18:39.252-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	413	8d592b72-b737-4fca-995c-a0cee11c26fe	696	696
408	DEBIT	Global Development	-100	USD	2016-04-26 20:56:08.086-07	2016-06-14 11:14:21.897-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100	101	bad5555b-64cf-4f72-85c7-124b7809ade5	696	696
350	DEBIT	Global Development	-100	USD	2016-04-15 10:29:50.291-07	2016-06-14 11:14:21.861-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100	86	5d9c2c63-1706-434b-976f-38c44f019e58	696	696
2800	DEBIT	WWCode Seattle planning lunch with Sara	-2700	USD	2016-10-31 10:52:44.962-07	2016-10-31 10:52:45.274-07	14	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2700	420	de0990ce-e767-47a3-8594-d6d7dc3f62c7	696	696
2802	DEBIT	Pizza for our monthly October event	-9276	USD	2016-10-31 11:07:11.805-07	2016-10-31 11:07:12.736-07	15	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9276	\N	91ddc1e2-b108-4f6a-b156-e7b4f593af89	696	696
2801	DEBIT	Monthly core team meeting. Beverages with dinner for six members 	-3080	USD	2016-10-31 10:59:53.602-07	2016-10-31 10:59:53.96-07	14	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3080	401	6071a2e5-9c4e-4724-98ef-faa4c9b34169	696	696
2805	DEBIT	Food for JavaScript Study Night - Oct. 11th	-1446	USD	2016-10-31 11:19:11.822-07	2016-10-31 11:19:12.067-07	59	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1446	419	e2c41034-2610-460e-814d-b143dc9280fe	696	696
612	CREDIT	Women Techmaker WWCode Partnership Grant	120000	USD	2016-05-19 12:10:52.797-07	2016-05-19 12:10:54.053-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	120000	\N	9615350f-4370-4c3b-bfab-2f2c48fe511c	696	696
866	CREDIT	Nike Donation	50000	USD	2016-06-09 21:08:56.525-07	2016-06-09 21:08:56.991-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	6187d107-e599-47d8-8ca5-8ad365ac9df8	696	696
4388	DEBIT	Meetup Fees	-4900	GBP	2016-12-27 09:34:46.469-08	2016-12-27 09:34:46.469-08	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4900	647	63c1fa30-5905-47e2-9922-3e50406c41e5	696	696
4390	DEBIT	Meetup Fees	-6000	USD	2016-12-27 09:49:39.83-08	2016-12-27 09:49:39.83-08	280	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	648	d59f9559-52ea-4838-86ac-9a89171e4edb	696	696
4392	DEBIT	Meetup Fees	-6000	AUD	2016-12-27 09:54:00.843-08	2016-12-27 09:54:00.843-08	281	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	649	4041ac58-5270-4993-8579-372862540f19	696	696
4394	DEBIT	Meetup Fees	-6000	MXN	2016-12-27 09:57:54.314-08	2016-12-27 09:57:54.314-08	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	650	3d47c24e-fc5a-4254-80eb-cc221aae8a7e	696	696
4396	DEBIT	Meetup Fees	-6000	MXN	2016-12-27 10:01:07.417-08	2016-12-27 10:01:07.417-08	10	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	651	c45178a3-9a29-4d14-b424-414faa770220	696	696
4401	DEBIT	Meetup Fee	-6000	USD	2016-12-27 10:35:08.624-08	2016-12-27 10:35:08.624-08	284	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	653	21af77e9-057a-48e4-bc42-cf6de40a4d0b	696	696
4403	DEBIT	Meetup Fees	-6000	USD	2016-12-27 10:38:46.887-08	2016-12-27 10:38:46.887-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	654	46876e47-95e8-4b16-ad0e-63703c1710c6	696	696
4425	DEBIT	Meetup Fees	-6000	USD	2016-12-28 07:44:44.222-08	2016-12-28 07:44:44.222-08	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	658	70f09e97-2754-4f16-9e9f-007e253cc35b	696	696
9658	CREDIT	\N	300000	USD	2017-05-02 11:43:43.157-07	2017-05-02 11:43:43.157-07	12	3	\N	\N	\N	2676	0	0	0	USD	1	300000	300000	\N	5e069863-b163-4534-a856-d24c10ad1c67	696	696
2230	CREDIT	Conference Grant: Google/IO Alicia Carr	10000	USD	2016-10-04 08:25:59.981-07	2016-10-04 08:26:00.186-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	382ee140-1ddc-4000-b079-00cd1f595da2	696	696
10119	DEBIT	Deposit- We Rise Conference Hosting Location	-500000	USD	2017-05-16 14:51:10.574-07	2017-05-16 14:51:10.574-07	12	3206	\N	\N	\N	\N	\N	\N	0	USD	1	-500000	-500000	1123	6f7e4a95-e8f5-408b-b4a6-c32168791436	690	696
7527	DEBIT	To redeem travel stipend to Google I/O	-100000	USD	2017-03-27 10:54:16.729-07	2017-03-27 10:54:16.758-07	277	1331	2266	\N	\N	\N	\N	\N	4430	USD	1	-100000	-104430	935	8fcc5228-26e5-41ca-8db6-80fd5ffe1d51	695	696
10131	DEBIT	Leadership meeting	-2989	USD	2017-05-16 14:59:48.206-07	2017-05-16 14:59:48.206-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-2989	-2989	1086	f3f420fc-da24-41e2-ac54-8d18166e5162	697	696
407	CREDIT	Mary Griffus	1000	USD	2016-04-26 21:41:38.126-07	2016-04-26 21:41:38.474-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	980ba0b0-ae38-48a2-9488-013c6634622b	696	696
349	CREDIT	Jasna Rodulfa	1000	USD	2016-04-15 07:17:21.126-07	2016-04-16 13:40:58.829-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	4cb4c4ab-f5d6-4d63-a937-8af026b8759d	696	696
5016	CREDIT	WWCode Boston t-shirt sales	1964	USD	2017-01-17 19:19:47.816-08	2017-01-17 19:19:48.024-08	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1964	\N	06f8f818-4527-4882-a50c-40de00ed8711	696	696
5017	CREDIT	WWCode t-shirt sales	4397	USD	2017-01-17 19:20:52.226-08	2017-01-17 19:20:52.436-08	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4397	\N	232dcd17-1057-4c79-ade5-b368a259f68f	696	696
2405	CREDIT	Donation Scott Z. in honor of his sister	1800	USD	2016-10-11 10:01:23.313-07	2016-10-11 10:01:23.731-07	291	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1800	\N	99b8d53c-6e5b-40ee-a937-5d414c12adc6	696	696
10624	DEBIT	Global Development	-20000	USD	2016-11-29 15:34:32.59-08	2016-11-29 15:34:32.817-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	96ba35bb-49f4-4f33-8dea-bfb590fb407e	259	696
10629	DEBIT	Global Development	-19100	USD	2016-11-29 14:17:18.389-08	2016-11-29 14:17:18.558-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-19100	\N	08044ec5-17fa-4e21-b068-bfc586218922	287	696
10634	DEBIT	Global Development	-20000	USD	2016-11-29 13:56:45.442-08	2016-11-29 13:56:45.713-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	07b81c09-01b4-45a9-b00c-98ec7f02c238	290	696
10638	DEBIT	$1000 Mozilla hackathon support - Global Development	-90000	USD	2016-11-17 10:21:06.154-08	2016-11-17 10:21:07.268-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-90000	\N	f9ef6ed6-f563-4e6d-8c95-63ae4dca31da	59	696
5948	CREDIT	Macy's donation - fees and global development	435000	USD	2017-02-13 16:21:10.361-08	2017-02-13 16:21:10.558-08	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	435000	\N	31a781ff-5d17-4026-96c3-a5134a2aff92	696	696
2337	CREDIT	Quotient Hackathon support	90000	USD	2016-10-07 12:52:59.206-07	2016-10-07 12:52:59.391-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	90000	\N	9790ad68-05b0-4f76-a64a-0bfb9ffb7686	696	696
2303	CREDIT	Network development (stickers)	58590	USD	2016-10-06 09:08:20.916-07	2016-10-06 09:08:21.09-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	58590	\N	3169934f-3f78-4faa-959d-7141ff24163b	696	696
8756	CREDIT	AJUG - Global and fees	26250	USD	2017-04-20 14:39:17.741-07	2017-04-20 14:39:18.323-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	a365b026-a438-43c2-9628-8abfa5258787	696	696
330	CREDIT	Intel Donation	100000	USD	2016-04-12 13:32:35.997-07	2016-04-16 13:40:58.826-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	\N	925c1460-bda7-448f-8dd9-83291db33330	696	696
334	CREDIT	From Deepa	1500	USD	2016-04-12 14:19:00.212-07	2016-04-12 14:19:00.529-07	4	3	\N	2016-04-14 14:19:00.529-07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3be9f7b2-c97b-41ac-b2bf-2e8dbd11ca27	696	696
3320	CREDIT	\N	30000	USD	2016-11-22 07:22:39.097-08	2016-11-22 07:22:39.097-08	59	1846	1211	\N	\N	1129	1500	3000	1050	USD	1	30000	24450	\N	3413acd7-804a-4bc1-9689-e91da23b2bdc	702	696
3490	CREDIT	\N	25000	EUR	2016-11-29 02:03:23.71-08	2016-11-29 02:03:23.71-08	301	1908	1257	\N	\N	1175	1301	2601	910	USD	0.961057932572175422	26013	20375	\N	49c565db-0a28-4269-8164-4c0ac9a96fe3	708	696
4123	CREDIT	\N	2500	USD	2016-12-18 17:41:29.006-08	2016-12-18 17:41:29.006-08	259	2220	1471	\N	\N	1388	125	250	85	USD	1	2500	2040	\N	c13eb052-de5b-4e23-b45b-e405f937cfd7	700	696
2539	DEBIT	Director t-shirt	-3325	USD	2016-10-17 14:01:02.872-07	2016-10-17 14:01:02.925-07	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3325	\N	73b25042-c1cc-45c6-9089-ec29736609fb	696	696
5044	CREDIT	\N	10000	USD	2017-01-18 05:54:50.597-08	2017-01-18 05:54:50.597-08	48	2594	1647	\N	\N	1557	500	1000	250	USD	1	10000	8250	\N	629c628a-29cb-4690-b71e-ad06f390ea21	698	696
130	CREDIT	Donation to WWCode Austin	30000	USD	2016-03-02 13:31:50.516-08	2016-04-16 13:40:58.67-07	2	129	94	\N	\N	25	0	3000	900	USD	1	30000	26100	\N	00dfdd70-caa9-4d07-9a89-7157a9464d5c	689	696
6700	CREDIT	\N	25000	USD	2017-03-01 14:51:20.759-08	2017-03-01 14:51:20.759-08	59	1263	2048	\N	\N	1953	1250	2500	580	USD	1	25000	20670	\N	bd4cecda-d52c-4c14-9ffa-5831f212eb3f	793	696
2240	DEBIT	90/10 split: Beth Laing	-500	USD	2016-10-04 09:06:16.796-07	2016-10-04 09:06:16.796-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-500	392	0c5e3510-cf16-42de-bde2-147e6ab9a46d	696	696
2241	DEBIT	90/10 split: Syema Ailia	-250	USD	2016-10-04 09:06:23.454-07	2016-10-04 09:06:23.454-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-250	390	3e7d1081-0039-41e3-b36f-4b37b44b3e0c	696	696
2302	DEBIT	Network Stickers	-58590	USD	2016-10-06 09:08:07.615-07	2016-10-06 09:08:07.66-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-58590	\N	b48ad8e6-3729-4d25-be11-03328df1f7b8	696	696
2260	DEBIT	Food at our Sept. monthly event	-11478	USD	2016-10-04 15:07:11.046-07	2016-10-04 15:07:11.615-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-11478	\N	bbb5901e-3328-4653-a858-b80c40422cd0	696	696
671	DEBIT	A Small Orange	-12700	USD	2016-02-01 16:00:00-08	2016-06-14 11:14:22.114-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-12700	194	d40ca73f-6c26-4d43-9c22-6e36ab38f02c	696	696
132	CREDIT	Recurring subscription	100	USD	2016-03-02 16:24:57.083-08	2016-04-16 13:40:58.834-07	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	3a77dd06-45f7-43cd-94e3-dffec6785c2b	688	696
78	CREDIT	Donation to WWCode Washington DC	100	USD	2016-02-02 15:09:05.702-08	2016-04-16 13:40:58.699-07	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	24dc1b5d-5ff4-456c-9765-3306cc4ce7bc	688	696
104	CREDIT	Recurring subscription	500	USD	2016-02-18 17:11:10.784-08	2016-04-16 13:40:58.716-07	10	2	34	\N	\N	65	25	50	45	USD	1	500	380	\N	c7a4ed19-aed5-411a-a5a9-72a1296ba3d3	688	696
10135	DEBIT	Google I/O Travel Stipend	-100000	USD	2017-05-16 15:00:40.275-07	2017-05-16 15:00:40.275-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-100000	-100000	1088	d1a78d7e-acb9-4d9b-b6fd-2928ebfe9236	697	696
5284	DEBIT	Drinks (La Croix water) for Jan HackNight	-2093	USD	2017-01-25 10:41:33.613-08	2017-01-25 10:41:34.163-08	48	142	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2093	724	d365e630-ae76-45cb-b68c-cf1cf918566c	697	696
5285	DEBIT	Amazon Echo Dot devices for HackNight and first book for our book club.	-22137	USD	2017-01-25 10:44:31.311-08	2017-01-25 10:44:33.251-08	48	142	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-22137	725	37f44afb-0604-4a3b-b8a4-62a32c582d49	697	696
10132	DEBIT	Snacks and batteries for our robots	-1554	USD	2017-05-16 15:00:04.449-07	2017-05-16 15:00:04.449-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-1554	-1554	1084	51159051-f7cc-4e7d-b285-4d94027c3ab4	697	696
10134	DEBIT	Business cards and stickers	-11948	USD	2017-05-16 15:00:30.412-07	2017-05-16 15:00:30.412-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-11948	-11948	1007	3747993e-5291-4be4-be3f-043e95561284	697	696
10133	DEBIT	Supplies for decorating our robots	-9777	USD	2017-05-16 15:00:15.557-07	2017-05-16 15:00:15.557-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-9777	-9777	1085	00f439f0-30e3-49f5-bc30-40d828f34f7e	697	696
7079	DEBIT	Movie screening for "She Started It"	-25700	USD	2017-03-14 10:59:53.142-07	2017-03-14 10:59:53.153-07	48	142	2149	\N	\N	\N	\N	\N	775	USD	1	-25700	-26475	814	af730af1-7a84-42eb-8443-96f03e6c8347	697	696
7080	DEBIT	Wearable Clothing Workshop	-33412	USD	2017-03-14 11:00:11.436-07	2017-03-14 11:00:11.448-07	48	142	2149	\N	\N	\N	\N	\N	999	USD	1	-33412	-34411	815	cc901377-56a8-4787-a296-673763a20a9e	697	696
1407	DEBIT	Leadership team dinner - Sondry interview	-11757	USD	2016-08-02 06:44:04.201-07	2016-08-02 06:44:04.214-07	14	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-11757	307	ba0bff8a-9a64-499e-8d6d-99cb47c0787b	767	696
1402	DEBIT	Monthly core team lunch with Sandra Saranya Sara CiCi Tori (5 members) ; on boarding new core member Tori!	-10294	USD	2016-08-02 06:38:05.215-07	2016-08-02 06:38:05.831-07	14	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10294	255	3a3bfae0-f068-407d-a9ab-031441913c3a	767	696
249	DEBIT	WwConnect planning meeting	-4656	USD	2016-03-10 16:00:00-08	2016-06-14 11:14:21.794-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4656	59	a8e050d7-a0ba-4b7c-8dac-f15e091454e1	767	696
251	DEBIT	WwConnect Conference Set Up Day 1	-709	USD	2016-03-18 17:00:00-07	2016-06-14 11:14:21.805-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-709	61	ebea2a47-93be-4832-8bc9-85f559270863	767	696
252	DEBIT	Nike Dinner	-1000	USD	2016-03-17 17:00:00-07	2016-06-14 11:14:21.805-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	62	6ee48c71-0f0b-4cd8-b3c1-ad7860c9cdf5	767	696
6270	DEBIT	Travel to attend internal leads meeting to finalize plans for upcoming 2017 events	-6100	USD	2017-02-22 07:27:02.607-08	2017-02-22 07:27:02.62-08	14	31	1893	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6100	774	534ed69b-fc23-4c7d-8acc-b1efd554f7b9	767	696
6271	DEBIT	Lunch w Saranya during leads meeting. I lost the paper copy of the receipt so including the credit card statement 	-5458	USD	2017-02-22 07:27:45.429-08	2017-02-22 07:27:45.466-08	14	31	1893	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5458	775	3cbee278-6d55-4ec8-b437-04378120a652	767	696
841	DEBIT	May expense: Travel and expense costs for mentoring at StartUp Weekend, Meeting w Northeeastern University for future WWC events 	-5161	USD	2016-06-06 17:21:31.531-07	2016-06-14 11:14:22.165-07	14	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5161	218	003cb730-5a3d-4db1-a7b2-32bd980c6452	767	696
254	DEBIT	WwConnect2016	-1025	USD	2016-03-19 17:00:00-07	2016-06-14 11:14:21.806-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1025	64	f42fde8c-31a0-49b2-ae8e-8a12eca9f4f5	767	696
1403	DEBIT	Transportation for Sandra and Cici to get to meeting location with core team members	-749	USD	2016-08-02 06:39:15.789-07	2016-08-02 06:39:15.797-07	14	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-749	256	c50bb623-b773-41c6-b71f-c815f6a3394c	767	696
250	DEBIT	WwConnect Planning Meeting	-2519	USD	2016-03-10 16:00:00-08	2016-06-14 11:14:21.794-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2519	60	007274b9-395d-410d-837a-e4c2863db761	767	696
10342	CREDIT	Order for stickers of our official WWC Boulder/Denver chapter logo	7800	USD	2016-03-17 20:23:34.628-07	2016-06-14 11:14:21.77-07	756	68	\N	2016-06-14 11:14:22.448-07	\N	\N	\N	\N	\N	\N	\N	\N	7800	48	093a2233-53a1-44e7-b8db-5fd3ea3b34df	15	696
10343	CREDIT	Food for March Boulder, CO event	14000	USD	2016-03-17 11:48:54.413-07	2016-06-14 11:14:21.77-07	756	68	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	14000	46	84b24d54-6db3-4fb6-b9ea-268026937b09	15	696
10344	CREDIT	WWC Boulder- April event's food	14100	USD	2016-04-06 17:00:00-07	2016-06-14 11:14:21.989-07	756	68	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	14100	137	a075f972-cb87-4697-837d-055c8801b672	15	696
10345	CREDIT	Mile High Agile outreach- supplies	1115	USD	2016-04-02 17:00:00-07	2016-06-14 11:14:21.989-07	756	68	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	1115	136	0e221df1-999e-4b5f-a01a-9d4fe3106505	15	696
10346	CREDIT	travel to NY for bell ringing at NYSE	30000	USD	2017-01-25 10:20:51.642-08	2017-01-25 10:20:54.592-08	764	70	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	30000	743	6347681d-d189-478a-a996-5208c0885166	12	696
10347	CREDIT	IWD event -- wine for event	10044	USD	2017-03-14 10:22:31.446-07	2017-03-14 10:22:31.46-07	764	70	1893	\N	\N	\N	\N	\N	312	USD	1	-9732	9732	900	750ad3c5-76aa-43fc-b54f-4ca0823421b2	12	696
10348	CREDIT	Food/Drinks for Anniversary Reception with guest WWCode Directors!	4444	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	844	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4400	486	d19ef241-03c2-46c9-a17a-6f6b870b6084	273	696
10349	CREDIT	Food for Anniversary Reception	713	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	844	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	700	492	27f3a089-1d53-4bbe-80a2-224f7d7ad3c4	273	696
10350	CREDIT	6/2/16 Fireside Chat at Orange Coworking	20000	USD	2016-06-04 14:37:03.991-07	2016-06-14 11:14:22.145-07	848	28	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	211	8fe307af-1538-47bb-953d-dc1e44af0647	2	696
10351	CREDIT	February Lightning Talks food	11020	USD	2017-03-14 10:17:53.891-07	2017-03-14 10:17:53.957-07	848	28	1893	\N	\N	\N	\N	\N	340	USD	1	-10680	10680	820	24c5925a-4fcc-4a03-848a-bf20148353a2	2	696
10352	CREDIT	Domain name for hackathon and study night projects	1798	USD	2017-02-20 12:53:02.864-08	2017-02-20 12:53:02.879-08	828	171	1893	\N	\N	\N	\N	\N	\N	\N	\N	\N	1798	497	98012c48-243a-47d5-87e6-53308085aced	59	696
10353	CREDIT	Food for 2017 Planning Meeting w/ leadership team (Jan. 22)	9050	USD	2017-02-07 10:40:49.494-08	2017-02-07 10:40:49.852-08	828	171	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	9050	790	612ebd2d-e342-4c6a-81cd-acfc6166dc46	59	696
10354	DEBIT	monthly recurring subscription	-53	USD	2017-02-09 10:29:30.017-08	2017-02-09 10:29:30.017-08	820	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	41f8d062-12c9-45e6-b48c-d99011de373b	3	696
10355	DEBIT	Recurring subscription	-53	USD	2017-01-09 10:28:29.701-08	2017-01-09 10:28:29.701-08	820	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	86c193a4-5751-4291-8d17-12d74733229e	3	696
10356	DEBIT	Recurring subscription	-53	USD	2016-12-09 10:29:17.341-08	2016-12-09 10:29:17.341-08	820	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	023fe957-9f18-4a24-85cf-1cf23e369895	3	696
10357	DEBIT	Recurring subscription	-52	USD	2016-03-02 15:01:26.771-08	2016-04-16 13:40:58.719-07	820	8	45	\N	\N	71	5	10	33	USD	1	100	-100	\N	11b3e55d-bad6-432a-8e18-7d004cdf98ee	14	696
10358	DEBIT	Recurring subscription	-53	USD	2016-11-09 10:29:23.967-08	2016-11-09 10:29:23.967-08	820	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	2a8d3ec2-e1a2-40ea-b481-4cfb793faf69	3	696
10359	DEBIT	monthly recurring subscription	-798	USD	2017-02-01 15:34:44.326-08	2017-02-01 15:34:44.326-08	804	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	1570b538-500e-4356-840b-71f535989cd1	2	696
10360	DEBIT	Recurring subscription	-798	USD	2016-12-01 15:32:26.764-08	2016-12-01 15:32:26.764-08	804	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	d680770f-7194-4216-b159-334ad7cb2301	2	696
10361	DEBIT	monthly recurring subscription	-798	USD	2017-05-01 16:34:11.708-07	2017-05-01 16:34:11.708-07	804	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	e90cd48a-cbc9-433a-bc02-74a27779e4c7	2	696
10362	DEBIT	monthly recurring subscription	-798	USD	2017-02-09 20:43:49.515-08	2017-02-09 20:43:49.515-08	737	1158	731	\N	\N	647	50	100	52	USD	1	1000	-1000	\N	a54f862b-b410-4ef0-8781-2cb44c0505ca	241	696
10363	DEBIT	Recurring subscription	-798	USD	2016-12-09 20:43:00.244-08	2016-12-09 20:43:00.244-08	737	1158	731	\N	\N	647	50	100	52	USD	1	1000	-1000	\N	14f0e4f9-b538-4949-bf4c-6b251177e7cd	241	696
10364	DEBIT	Recurring subscription	-798	USD	2016-11-09 20:43:57.271-08	2016-11-09 20:43:57.271-08	737	1158	731	\N	\N	647	50	100	52	USD	1	1000	-1000	\N	3b85672c-895b-4603-8ba8-18898b02c1c5	241	696
10365	DEBIT	Recurring subscription	-798	USD	2016-10-09 21:49:33.558-07	2016-10-09 21:49:33.558-07	737	1158	731	\N	\N	647	50	100	52	USD	1	1000	-1000	\N	4fede6a4-d18a-4778-a7ec-6da1f861bed3	241	696
10366	DEBIT	monthly recurring subscription	-798	USD	2017-05-09 21:43:13.462-07	2017-05-09 21:43:13.462-07	737	1158	731	\N	\N	647	50	100	52	USD	1	1000	-1000	\N	44dbfa21-9bbf-4ef7-8026-4e89b35812c5	241	696
10367	DEBIT	Recurring subscription	-798	USD	2017-01-09 20:43:19.956-08	2017-01-09 20:43:19.956-08	737	1158	731	\N	\N	647	50	100	52	USD	1	1000	-1000	\N	0354f68a-ee90-41d9-95af-712bbcf0dfce	241	696
10368	DEBIT	monthly recurring subscription	-798	USD	2017-04-09 21:43:06.965-07	2017-04-09 21:43:06.965-07	737	1158	731	\N	\N	647	50	100	52	USD	1	1000	-1000	\N	22bf7460-88a7-4d84-a230-5bae26f691a7	241	696
5787	DEBIT	Food for 2017 Planning Meeting w/ leadership team (Jan. 22)	-9050	USD	2017-02-07 10:40:49.494-08	2017-02-07 10:40:49.852-08	59	171	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9050	790	e25d3885-580e-477b-ac27-6dfaa2ab8466	828	696
6199	DEBIT	Domain name for hackathon and study night projects	-1798	USD	2017-02-20 12:53:02.864-08	2017-02-20 12:53:02.879-08	59	171	1893	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1798	497	3aae7b32-dbf9-4383-94eb-9c339211043a	828	696
10369	DEBIT	monthly recurring subscription	-798	USD	2017-03-09 20:43:47.943-08	2017-03-09 20:43:47.943-08	737	1158	731	\N	\N	647	50	100	52	USD	1	1000	-1000	\N	19dc08a8-21c7-465a-92c0-8a5a8aa141d0	241	696
10374	CREDIT	Transportation for Sandra and Cici to get to meeting location with core team members	749	USD	2016-08-02 06:39:15.789-07	2016-08-02 06:39:15.797-07	767	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	749	256	cee41524-2ab6-4a9a-95d1-efad941eeb34	14	696
10378	CREDIT	Travel to attend internal leads meeting to finalize plans for upcoming 2017 events	6100	USD	2017-02-22 07:27:02.607-08	2017-02-22 07:27:02.62-08	767	31	1893	\N	\N	\N	\N	\N	\N	\N	\N	\N	6100	774	29a7b09a-56e7-45bd-bdac-b30a30b6be44	14	696
10385	CREDIT	Movie screening for "She Started It"	26475	USD	2017-03-14 10:59:53.142-07	2017-03-14 10:59:53.153-07	697	142	2149	\N	\N	\N	\N	\N	775	USD	1	-25700	25700	814	c43e2095-e496-4a6b-ab98-6a312fd38b9a	48	696
10390	CREDIT	Drinks (La Croix water) for Jan HackNight	2093	USD	2017-01-25 10:41:33.613-08	2017-01-25 10:41:34.163-08	697	142	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	2093	724	096ea08a-990a-4c8c-a143-be43b5edad56	48	696
10395	DEBIT	Recurring subscription	-52	USD	2016-05-02 11:15:35.25-07	2016-05-02 11:15:35.307-07	691	30	44	\N	\N	70	5	10	33	USD	1	100	-100	\N	94331771-a64a-4a37-81c9-23a90004a8e7	13	696
10401	DEBIT	Recurring subscription	-52	USD	2016-04-02 11:13:51.122-07	2016-04-16 13:40:58.81-07	691	30	43	\N	\N	69	5	10	33	USD	1	100	-100	\N	3ebe2d64-40e0-4d90-9f99-e52f12a285a1	13	696
10407	DEBIT	Recurring subscription	-52	USD	2016-05-02 10:46:41.832-07	2016-05-02 10:46:41.894-07	691	30	41	\N	\N	67	5	10	33	USD	1	100	-100	\N	ad6d6aea-805e-4bb1-8b63-6ec476645050	14	696
10414	CREDIT	3/30/16 Python Gameathon prize - Udemy course	2400	USD	2016-06-04 14:37:03.991-07	2016-06-14 11:14:22.155-07	848	28	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	2400	213	a5489bdb-b422-49cf-8a79-e0b8e145d108	2	696
10419	DEBIT	Donation to WWCode Austin	-26100	USD	2016-03-02 13:31:50.516-08	2016-04-16 13:40:58.67-07	689	129	94	\N	\N	25	0	3000	900	USD	1	30000	-30000	\N	27b64ba9-7430-4a7e-ab13-531ac8201787	2	696
10424	CREDIT	Leadership Development	14915	MXN	2017-03-14 11:18:46.358-07	2017-03-14 11:18:46.358-07	696	3	\N	\N	\N	\N	\N	\N	0	MXN	1	-14915	14915	886	dd9e46e6-3a75-4214-b708-4e5d238eaa54	511	696
10429	CREDIT	Post-hackathon shipping supplies + supplies for Women + Tech Holiday Party	3776	USD	2016-12-13 10:41:20.962-08	2016-12-13 10:41:21.652-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	3776	\N	f17673b7-860f-4b42-8e09-4ef2571470f9	59	696
10434	CREDIT	Event supplies	1797	USD	2016-08-19 10:24:23.638-07	2016-08-19 10:24:24.362-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	1797	\N	8f505f17-2ecd-414e-b121-de458d1e93f0	59	696
10439	CREDIT	WePay fee	125	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	125	95	65498e3f-b33f-4d54-a839-388d84a08413	13	696
10444	CREDIT	Meetup Fees	6000	AUD	2016-12-23 09:42:18.688-08	2016-12-23 09:42:18.688-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	623	31f986c7-8e4f-478c-9188-226a7e723910	266	696
10449	CREDIT	Meetup Fees	6000	USD	2016-12-23 09:00:25.987-08	2016-12-23 09:00:25.987-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	617	64e9cda9-e31e-4ef0-9fb2-220c7f474690	263	696
10452	CREDIT	Leadership Development - Conference Travel Stipend Google I/O	130000	USD	2016-11-30 13:06:48.939-08	2016-11-30 13:06:49.116-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	130000	\N	7806413f-c32b-43ba-92c1-ea7e22974516	241	696
10457	CREDIT	Conference Grant	100000	USD	2016-05-24 12:42:50.307-07	2016-06-14 11:14:22.103-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	189	bcfede47-bada-42c9-8a3e-ee41d79d830f	3	696
10462	CREDIT	90/10 split: Beth Laing	500	USD	2016-10-04 09:06:16.796-07	2016-10-04 09:06:16.796-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500	392	17221ed4-979b-42e6-ad85-0aed168a3573	12	696
10467	DEBIT	Recurring subscription	-53	USD	2016-10-09 11:36:17.958-07	2016-10-09 11:36:17.958-07	820	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	287bbbdd-207f-4376-a9e0-257a06ea941c	3	696
10472	DEBIT	\N	-3282	USD	2016-11-28 07:33:14.428-08	2016-11-28 07:33:14.428-08	811	1890	1249	\N	\N	1167	200	400	118	USD	1	4000	-4000	\N	aff237df-ce07-43fa-b3e7-2db317a02393	2	696
10478	DEBIT	Donation to WWCode Austin	-123120	USD	2016-05-03 06:07:28.39-07	2016-05-03 06:07:28.452-07	799	308	230	\N	\N	191	7500	15000	4380	USD	1	150000	-150000	\N	8764bf67-59ab-4520-9104-3e8ad54b0ca5	2	696
10483	DEBIT	monthly recurring subscription	-798	USD	2017-02-14 10:13:04.109-08	2017-02-14 10:13:04.109-08	763	2549	1616	\N	\N	1531	50	100	52	USD	1	1000	-1000	\N	f85383bc-5d43-4e58-bbf0-e2d0ede78544	270	696
10489	DEBIT	WWCode t-shirt sales	-1229	USD	2017-01-17 19:23:59.112-08	2017-01-17 19:23:59.247-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1229	\N	eb12824f-11e3-49cc-9c47-e1dc3ad6b54c	48	696
10494	DEBIT	\N	-20375	EUR	2016-11-29 02:03:23.71-08	2016-11-29 02:03:23.71-08	708	1908	1257	\N	\N	1175	1301	2601	910	USD	0.961057932572174978	26013	-25000	\N	6eb9d4c5-43e7-473e-a638-c172895cb27e	301	696
10498	DEBIT	AJUG - Global and fees	0	USD	2017-04-20 14:39:17.741-07	2017-04-20 14:39:18.323-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-26250	\N	cc08f895-a012-4392-a426-9a39e25b4b99	12	696
10503	DEBIT	\N	-26301	CAD	2017-02-27 16:25:20.325-08	2017-02-27 16:25:20.325-08	838	3301	2030	\N	\N	1935	1121	1120	523	USD	1.33832976445396001	22416	-30000	\N	072d69a1-7f67-4a17-9169-abb298ef8297	522	696
10509	DEBIT	\N	-40000	USD	2017-04-19 11:26:01.228-07	2017-04-19 11:26:01.228-07	696	3	\N	\N	\N	2520	0	0	0	USD	1	40000	-40000	\N	bfc5b7b0-04f1-44f4-95a8-cb162ec7dd63	3	696
10514	DEBIT	\N	-100000	USD	2017-03-31 15:32:34.123-07	2017-03-31 15:32:34.123-07	696	3	\N	\N	\N	2212	0	0	0	USD	1	100000	-100000	\N	2d57e9e2-b10e-4c6b-a020-40b305f933e1	286	696
10519	DEBIT	\N	-50000	USD	2017-03-31 10:17:51.695-07	2017-03-31 10:17:51.695-07	696	3	\N	\N	\N	2204	0	0	0	USD	1	50000	-50000	\N	4541b00d-e01d-428e-88d3-977dd507953e	2	696
10524	DEBIT	VMWare Network Support	-195000	USD	2016-10-07 12:55:50.273-07	2016-10-07 12:55:50.509-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-195000	\N	e50b114e-61e9-4a4f-a22d-94bd8d0a122d	300	696
10527	DEBIT	\N	-25000	MXN	2017-04-17 15:34:32.259-07	2017-04-17 15:34:32.259-07	696	3	\N	\N	\N	2487	0	0	0	MXN	1	25000	-25000	\N	c3bd6829-8e2c-4095-851a-a6158d698245	511	696
10532	DEBIT	\N	-85000	GBP	2017-04-17 14:05:15.067-07	2017-04-17 14:05:15.067-07	696	3	\N	\N	\N	2474	0	0	0	GBP	1	85000	-85000	\N	11150f29-e24d-4301-8138-65c8524ff818	278	696
10537	DEBIT	International Women's Day Celebrations - Global	-51750	USD	2017-03-28 11:27:16.525-07	2017-03-28 11:27:16.748-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-51750	\N	ed472c41-3dbd-472c-9e02-0c69bcd0da0a	12	696
10542	DEBIT	Quotient Hackathon support	-90000	USD	2016-10-07 12:52:59.206-07	2016-10-07 12:52:59.391-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-90000	\N	6e3fef4c-0978-4366-9580-3b85f3673819	300	696
10547	DEBIT	\N	-90000	USD	2017-05-11 09:41:16.759-07	2017-05-11 09:41:16.759-07	696	3	\N	\N	\N	2794	0	0	0	USD	1	90000	-90000	\N	303fdbd5-dc93-460b-87cf-98a8e6bf1db1	59	696
10552	DEBIT	\N	-20670	USD	2017-04-10 18:09:50.621-07	2017-04-10 18:09:50.621-07	843	4153	2535	\N	\N	2421	1250	2500	580	USD	1	25000	-25000	\N	e6a1e9b3-d4aa-488c-96bb-217925e6b804	13	696
10557	DEBIT	Donations via meetup - fees/global development	-20	USD	2017-02-06 14:56:24.306-08	2017-02-06 14:56:24.52-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	e16d0ae7-750e-44c9-a8f6-dddacc5ffc23	272	696
10564	DEBIT	WWCode t-shirt sales	-7570	USD	2017-01-17 19:34:31.424-08	2017-01-17 19:34:31.75-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7570	\N	ade10b59-8ff0-4d20-8d76-07d66a0edb89	300	696
10569	DEBIT	WWCode t-shirt sales	-982	USD	2017-01-17 19:30:10.748-08	2017-01-17 19:30:10.906-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-982	\N	2aa2dda5-a57d-4d10-9854-50a3630969a5	259	696
10572	DEBIT	Leadership Development: Google I/O grant for Luisa M.	-100000	USD	2017-03-22 10:56:10.528-07	2017-03-22 10:56:10.804-07	696	3	\N	\N	\N	\N	\N	\N	\N	USD	1	\N	-100000	\N	b31f4709-fc0a-4126-acd2-896e6626e787	3	696
10577	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-28 07:51:42.465-08	2016-12-28 07:51:38.84-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	96216c90-ee35-4aea-bb82-295f96939258	289	696
10582	DEBIT	Global Development for Meetup Fee	-6000	MXN	2016-12-27 09:59:52.939-08	2016-12-27 09:59:53.047-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	90782000-af1f-441d-b297-4bab4eb4183d	10	696
10587	DEBIT	Global Development for Meetup Fee	-6000	INR	2016-12-27 08:24:37.915-08	2016-12-27 08:24:38.038-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	1f31f833-9b60-454a-994a-49388432dec2	47	696
10589	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 08:14:47.836-08	2016-12-27 08:14:47.951-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	239cc34e-b893-40e3-a1ab-b08cb87b33e2	271	696
10594	DEBIT	Global Development for Meetup Fee	-6000	JPY	2016-12-28 08:00:53.27-08	2016-12-28 08:00:49.939-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	60db3603-16ad-4690-a285-37dfd355b161	295	696
10597	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 11:37:32.49-08	2016-12-23 11:37:32.668-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	a6770171-bae3-44c7-9681-e90ea9604fcc	268	696
10601	DEBIT	\N	-16300	USD	2017-04-04 12:51:04.916-07	2017-04-04 12:51:04.916-07	837	3999	2438	\N	\N	2332	1000	2000	700	USD	1	20000	-20000	\N	d91552ed-4357-467f-a18f-25ecf84ac415	2	696
10604	DEBIT	Travel Stipend for Google I/O	-100000	USD	2017-03-20 08:17:43.622-07	2017-03-20 08:17:42.994-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100000	\N	b872cda8-5a37-4fcf-9af2-30d95abca255	277	696
10609	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 11:51:47.92-08	2016-12-27 11:51:48.117-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	58b13195-afed-47a0-b386-6126df537f66	14	696
10614	DEBIT	Global Development	-80000	GBP	2016-11-29 13:14:00.118-08	2016-11-29 13:14:01.107-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-80000	\N	c277569b-786c-4d04-b6bd-7f4a8901afa2	278	696
10619	DEBIT	Conference Travel Stipend - Google I/O Elese	-75000	USD	2016-11-30 13:25:31.161-08	2016-11-30 13:25:41.165-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75000	\N	f9571f4a-6f41-4092-8596-8f5bb44b17c6	276	696
10370	DEBIT	Donation to WWCode Austin	-41020	USD	2016-05-19 12:24:43.134-07	2016-05-19 12:24:43.182-07	719	392	288	\N	\N	246	2500	5000	1480	USD	1	50000	-50000	\N	10d3f0f5-838a-4853-8942-d67fcd3b9df2	2	696
10375	CREDIT	WwConnect2016	1025	USD	2016-03-19 17:00:00-07	2016-06-14 11:14:21.806-07	767	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	1025	64	947b0458-a196-4033-b971-e45bbab25530	14	696
10380	CREDIT	WwConnect Conference Set Up Day 1	709	USD	2016-03-18 17:00:00-07	2016-06-14 11:14:21.805-07	767	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	709	61	1e1ab16f-bf7b-487e-8b21-03442a287155	14	696
10384	CREDIT	Wearable Clothing Workshop	34411	USD	2017-03-14 11:00:11.436-07	2017-03-14 11:00:11.448-07	697	142	2149	\N	\N	\N	\N	\N	999	USD	1	-33412	33412	815	1e7d6e4b-51cc-4bb7-ae4d-e7f1cb47cc51	48	696
10389	CREDIT	Amazon Echo Dot devices for HackNight and first book for our book club.	22137	USD	2017-01-25 10:44:31.311-08	2017-01-25 10:44:33.251-08	697	142	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	22137	725	c779e06f-7b3b-4288-bb60-659e409fcc94	48	696
10394	DEBIT	monthly recurring subscription	-2040	USD	2017-05-01 11:32:00.085-07	2017-05-01 11:32:00.085-07	692	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	-2500	\N	e0870d3c-c503-4fd7-8198-41bda6a709e9	271	696
10398	DEBIT	Recurring subscription	-52	USD	2016-03-02 09:53:54.346-08	2016-04-16 13:40:58.736-07	691	30	41	\N	\N	67	5	10	33	USD	1	100	-100	\N	8ebe1e24-d431-4f49-aae4-3ba8ba81acd2	14	696
10403	DEBIT	Recurring subscription	-52	USD	2016-03-02 10:19:33.362-08	2016-04-16 13:40:58.737-07	691	30	43	\N	\N	69	5	10	33	USD	1	100	-100	\N	320ae7b8-eb44-4e66-8f7c-0703af0d7b22	13	696
10406	DEBIT	Recurring subscription	-52	USD	2016-03-02 10:26:05.731-08	2016-04-16 13:40:58.833-07	691	30	44	\N	\N	70	5	10	33	USD	1	100	-100	\N	4e493987-6133-46e6-be1b-293eee755366	13	696
10411	DEBIT	Donation to WWCode Washington DC	-52	USD	2016-02-02 15:09:05.702-08	2016-04-16 13:40:58.699-07	688	2	46	\N	\N	72	5	10	33	USD	1	100	-100	\N	fe90673c-6787-4d30-9f03-68173c982165	13	696
10416	CREDIT	Supplies for Agile workshop (2/26)	5996	USD	2017-03-14 11:16:43.183-07	2017-03-14 11:16:43.22-07	828	171	2149	\N	\N	\N	\N	\N	198	USD	1	-5798	5798	858	6d02974c-aade-4d74-beca-dedfde1001fd	59	696
10421	CREDIT	Stacey Schipper	2322	USD	2016-11-03 12:45:04.691-07	2016-11-03 12:45:04.691-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2322	\N	0cef9b87-5bf8-4559-bdd9-15e1393e6d6a	15	696
10425	CREDIT	Leadership Development	50616	MXN	2017-03-14 11:17:51.969-07	2017-03-14 11:17:51.969-07	696	3	\N	\N	\N	\N	\N	\N	0	MXN	1	-50616	50616	887	a9f1a195-c454-4831-abdc-13f61655c19d	282	696
10430	CREDIT	Thank you gift to an amazing sponsor!	1700	USD	2016-11-22 04:31:00.49-08	2016-11-22 04:31:00.691-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	1700	501	390029c3-db3c-40e0-b085-ca424a14db84	59	696
10435	CREDIT	Reimburse Caterina Paun for Program Expenses	9995	USD	2016-02-24 16:00:00-08	2016-06-14 11:14:22.175-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9995	224	26db3c5b-5b74-41d8-93f4-93b5e0913618	59	696
10440	CREDIT	Conference Expense	8320	USD	2016-05-10 12:19:21.785-07	2016-06-14 11:14:22.042-07	696	3	\N	2016-06-14 11:14:22.515-07	\N	\N	\N	\N	\N	\N	\N	\N	8320	158	2aac7a26-1b2e-4fa9-92a7-25c9167f2d79	48	696
10445	CREDIT	Meetup Fees	6000	USD	2016-12-23 09:21:53.018-08	2016-12-23 09:21:53.018-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	621	a2fa68e2-bf8b-4606-a473-e4ed64e2b6ff	259	696
10450	CREDIT	Regional Leadership Director Meeting 	7500	USD	2016-11-30 13:20:31.263-08	2016-11-30 13:20:31.464-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7500	\N	f27d1f17-9989-4154-a311-b92e1d35f215	269	696
10455	CREDIT	Photos for sponsor gifts	2104	USD	2016-11-30 08:11:36.238-08	2016-11-30 08:11:36.377-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	2104	\N	28b9ef5c-e758-4050-9102-3180e9d77fb8	2	696
10460	CREDIT	Network Stickers	58590	USD	2016-10-06 09:08:07.615-07	2016-10-06 09:08:07.66-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	58590	\N	a9329eb0-46c4-4ea6-a3ba-18b4db649369	3	696
10464	DEBIT	\N	-69722	USD	2017-02-10 08:47:34.349-08	2017-02-10 08:47:34.349-08	839	3053	1890	\N	\N	1801	4212	8424	1883	USD	1	84241	-84241	\N	544aed35-6ab1-40f2-834e-caa589e3fe34	15	696
10469	DEBIT	Recurring subscription	-53	USD	2016-08-09 11:30:50.866-07	2016-08-09 11:30:50.915-07	820	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	377e6bd8-5fdb-4d54-b162-a6e3063d1b79	3	696
10473	DEBIT	Donation to WWCode Austin	-122250	USD	2016-08-05 13:48:08.414-07	2016-08-05 13:48:08.458-07	806	192	589	\N	\N	513	7500	15000	5250	USD	1	150000	-150000	\N	8a132621-c051-4427-b773-fecb7cf9fc64	2	696
10479	DEBIT	\N	-15485	USD	2016-09-28 14:47:18.302-07	2016-09-28 14:47:18.302-07	796	1299	842	\N	\N	768	950	1900	665	USD	1	19000	-19000	\N	771b4a8e-93d8-4d83-962b-801030fca7f6	2	696
10484	DEBIT	Recurring subscription	-798	USD	2017-01-14 09:12:01.244-08	2017-01-14 09:12:01.244-08	763	2549	1616	\N	\N	1531	50	100	52	USD	1	1000	-1000	\N	a3342549-64d9-43f4-8990-9f2e08e2c02d	270	696
10488	DEBIT	WWCode t-shirt sales	-982	USD	2017-01-17 19:24:31.362-08	2017-01-17 19:24:31.504-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-982	\N	6e2a7ee5-a086-47ee-8cf5-e724112bd1c7	13	696
10493	DEBIT	\N	-2040	USD	2016-12-18 17:41:29.006-08	2016-12-18 17:41:29.006-08	700	2220	1471	\N	\N	1388	125	250	85	USD	1	2500	-2500	\N	5594f18b-08f9-4c41-b6c6-6d678892dfeb	259	696
10497	DEBIT	Intel Donation	-100000	USD	2016-04-12 13:32:35.997-07	2016-04-16 13:40:58.826-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100000	\N	f84377a4-f895-485a-b867-b2fd47789192	59	696
10504	DEBIT	\N	-16530	USD	2017-05-15 05:07:59.63-07	2017-05-15 05:07:59.63-07	800	4834	2922	\N	\N	2817	1000	2000	470	USD	1	20000	-20000	\N	0d06df3e-b42b-41d0-a4cd-196e3f387e44	14	696
10508	DEBIT	\N	-1190	USD	2017-04-19 11:26:58.997-07	2017-04-19 11:26:58.997-07	696	3	\N	\N	\N	2521	0	0	0	USD	1	1190	-1190	\N	83164a13-69a3-4337-bc60-36aaedaf6245	3	696
10513	DEBIT	\N	-7500	USD	2017-03-31 15:52:45.079-07	2017-03-31 15:52:45.079-07	696	3	\N	\N	\N	2215	0	0	0	USD	1	7500	-7500	\N	470c40d7-6213-408e-859f-3c5d495e9aaa	286	696
10517	DEBIT	\N	-79600	GBP	2017-03-31 10:20:23.917-07	2017-03-31 10:20:23.917-07	696	3	\N	\N	\N	2206	0	0	0	GBP	1	79600	-79600	\N	e8cf60fc-4a19-420f-9f9e-92686b87531f	267	696
10522	DEBIT	\N	-1198	USD	2017-04-18 17:19:14.321-07	2017-04-18 17:19:14.321-07	696	3	\N	\N	\N	2505	0	0	0	USD	1	1198	-1198	\N	6e73a52c-6c72-43dd-a1c8-f77350b1df2b	12	696
10528	DEBIT	\N	-18800	MXN	2017-04-17 15:35:06.093-07	2017-04-17 15:35:06.093-07	696	3	\N	\N	\N	2488	0	0	0	MXN	1	18800	-18800	\N	3cbe7c45-48c2-417a-97eb-2d0d0dfc9e6f	511	696
10533	DEBIT	\N	-5000	USD	2017-04-17 13:41:53.602-07	2017-04-17 13:41:53.602-07	696	3	\N	\N	\N	2473	0	0	0	USD	1	5000	-5000	\N	cefa0dd9-ca8a-4d17-8c9d-a8eeb474e88b	517	696
10539	DEBIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	-34750	USD	2016-05-26 13:50:28.413-07	2016-05-26 13:50:28.721-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-34750	\N	589082eb-0fe4-4cb9-a3cc-dd9822d13bab	59	696
10545	DEBIT	Event sponsorship - transaction fees and global development 	-856500	USD	2017-03-01 22:00:43.46-08	2017-03-01 22:00:44.182-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-856500	\N	1284e422-df1d-48ec-913e-cc1fc5cd93a3	12	696
10549	DEBIT	\N	-154800	USD	2017-05-01 11:02:20.511-07	2017-05-01 11:02:20.511-07	696	3	\N	\N	\N	2649	0	0	0	USD	1	154800	-154800	\N	0140e420-99dc-48a5-a04b-891c77ba5804	13	696
10555	DEBIT	Recurring subscription	-798	USD	2017-01-01 15:32:21.416-08	2017-01-01 15:32:21.416-08	804	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	f845a011-1948-471a-88e6-e22a34d72e21	2	696
10560	DEBIT	Global Network Development	-500000	USD	2017-01-25 10:27:46.907-08	2017-01-25 10:27:47.421-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-500000	\N	d898ec8e-2440-4a8a-a4b7-dc0b669c5117	51	696
10565	DEBIT	WWCode t-shirt sales	-2371	USD	2017-01-17 19:33:30.061-08	2017-01-17 19:33:30.587-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2371	\N	a8308355-42a2-4e39-8d2c-67b11414cf24	271	696
10570	DEBIT	WWCode t-shirt sales	-1964	USD	2017-01-17 19:29:40.155-08	2017-01-17 19:29:40.284-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1964	\N	78aac851-4ae0-493d-ad68-d33e12f62123	273	696
10575	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-28 07:57:55.359-08	2016-12-28 07:57:51.831-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	809d820f-8217-43ec-8d93-b2e6f82ed3e2	241	696
10578	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-28 07:46:26.348-08	2016-12-28 07:46:22.824-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	ac69ea81-0d5e-4e3e-bf7e-8e4b46ece60c	300	696
10584	DEBIT	Global Development for Meetup Fee	-6000	AUD	2016-12-27 09:52:16.09-08	2016-12-27 09:52:16.167-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	7f0ec351-ab43-4be7-9876-1050d14c08a2	281	696
10590	DEBIT	Global Development for Meetup Fees	-6000	USD	2016-12-27 10:40:49.86-08	2016-12-27 10:40:49.921-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	f9d3b693-154b-46f3-8dd2-bfe6dde37671	286	696
10595	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 11:48:39.526-08	2016-12-23 11:48:39.685-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	1963dad2-300b-47dd-820d-d02f6cdde2e4	270	696
10600	DEBIT	Global Development for Meetup Fees	-6000	USD	2016-12-23 08:50:35.869-08	2016-12-23 08:50:36.131-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	5348b6fe-78a5-4391-8b13-6265c5ab3278	12	696
10606	DEBIT	Global Development for Meetup fee	-6000	USD	2016-12-21 10:49:53.054-08	2016-12-21 10:49:53.302-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	fbe6fe4b-c311-467d-b09a-1541d5b37207	3	696
10611	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 11:44:22.123-08	2016-12-27 11:44:22.207-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	d04aaace-011f-4f56-aec1-3ccced736fe9	287	696
10615	DEBIT	Network Development	-15755	GBP	2016-10-07 07:03:54.031-07	2016-10-07 07:03:54.119-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-15755	\N	3445f1b3-0214-4f61-ae15-e3a15bc931c7	278	696
10621	DEBIT	Donation via meetup	-775	USD	2016-11-29 15:39:42.382-08	2016-11-29 15:39:42.512-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-775	\N	584883e2-172c-4ef7-8e53-1ac0ed6889f8	13	696
10626	DEBIT	Banner	-2000	USD	2016-11-29 14:34:22.96-08	2016-11-29 14:34:23.085-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	0ac8e1d3-b485-42b7-8e16-1458a493100d	47	696
10371	DEBIT	Donation to WWCode Mexico City	-148	MXN	2016-02-02 08:52:02.237-08	2016-04-16 13:40:58.703-07	769	80	42	\N	\N	68	1	2	16	USD	18.5100000000000016	27	-500	\N	cf94d7df-f92c-413c-97e9-0a6440c55ff6	10	696
10379	CREDIT	Nike Dinner	1000	USD	2016-03-17 17:00:00-07	2016-06-14 11:14:21.805-07	767	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	62	d6211462-e219-4683-8123-760993e3a632	14	696
10386	CREDIT	Supplies for decorating our robots	9777	USD	2017-05-16 15:00:15.557-07	2017-05-16 15:00:15.557-07	697	142	\N	\N	\N	\N	\N	\N	0	USD	1	-9777	9777	1085	6354622e-c7e0-4618-8630-b44f42f8717a	48	696
10391	CREDIT	Google I/O Travel Stipend	100000	USD	2017-05-16 15:00:40.275-07	2017-05-16 15:00:40.275-07	697	142	\N	\N	\N	\N	\N	\N	0	USD	1	-100000	100000	1088	e74275d8-a7a4-409a-9dfc-56a2a39f10e5	48	696
10396	DEBIT	Recurring subscription	-52	USD	2016-05-02 11:10:42.774-07	2016-05-02 11:10:42.847-07	691	30	43	\N	\N	69	5	10	33	USD	1	100	-100	\N	ee1cd9ad-34e0-4e1c-8ba6-3f5e9a82439c	13	696
10400	DEBIT	Recurring subscription	-52	USD	2016-04-02 12:09:44.502-07	2016-04-16 13:40:58.811-07	691	30	41	\N	\N	67	5	10	33	USD	1	100	-100	\N	9ef12181-2f7a-4335-bfe9-14ce72bd1688	14	696
10405	DEBIT	Donation to WWCode Washington DC	-52	USD	2016-02-02 09:09:22.069-08	2016-04-16 13:40:58.697-07	691	30	44	\N	\N	70	5	10	33	USD	1	100	-100	\N	3114f2a1-c88e-4d1f-b050-cbf07211ab22	13	696
10410	DEBIT	Recurring subscription	-380	USD	2016-02-18 17:11:10.784-08	2016-04-16 13:40:58.716-07	688	2	34	\N	\N	65	25	50	45	USD	1	500	-500	\N	243d53ca-79c9-4932-ad9f-25ff9477dfa6	10	696
10415	CREDIT	Food/Drinks for Leadership Team Meeting - Gen, Claire - Oct 2016	4000	GBP	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	831	1333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4000	507	f294350f-8d57-4f5a-ac55-e098facf7d4b	278	696
10420	CREDIT	Event Food	6471	USD	2016-11-03 12:43:50.827-07	2016-11-03 12:43:51.096-07	696	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	6471	377	a2337305-6861-4385-96d3-518a43b84d06	59	696
10426	CREDIT	Transportation to get to GeekWire Summit social event 	729	USD	2016-11-01 09:16:02.625-07	2016-11-01 09:16:02.953-07	696	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	729	402	fb3b93bc-170c-4aff-9c5b-6786e16d43ac	14	696
10431	CREDIT	Costco breakfast, lunch, drinks, plates, cups, utensils, snacks, deserts ...	48435	USD	2016-10-31 14:08:49.332-07	2016-10-31 14:08:49.517-07	696	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	48435	417	819f157b-4c50-4931-9bc2-ecb6080e2993	300	696
10438	CREDIT	Drinks for July monthly event	3316	USD	2016-08-16 07:53:42.013-07	2016-08-16 07:53:42.04-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	3316	\N	6eb75114-3ba7-4965-a8bf-59f1044b569c	15	696
10442	CREDIT	Meetup Fees	5700	EUR	2016-12-27 08:36:05.296-08	2016-12-27 08:36:05.296-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5700	637	d78e284a-cbe1-43dd-8d31-7a68a84af6ed	298	696
10446	CREDIT	Meetup Fees	5700	EUR	2016-12-23 09:15:16.054-08	2016-12-23 09:15:16.054-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5700	620	fcf3d579-efb5-4490-b9b8-3dc17dbd5f4a	301	696
10451	CREDIT	Banner	2000	USD	2016-11-30 13:19:46.014-08	2016-11-30 13:19:46.128-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	48a92229-25ee-4e7e-af6a-897a9f38c68e	269	696
10456	CREDIT	Engineering (Web) - A Small Orange	12700	USD	2016-10-11 17:44:30.933-07	2016-10-11 17:44:31.081-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12700	\N	887de0ba-c2ff-4e8e-8c92-1e08ab901eb1	48	696
10461	CREDIT	90/10 split: Syema Ailia	250	USD	2016-10-04 09:06:23.454-07	2016-10-04 09:06:23.454-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	250	390	1d5e39ce-efe9-4e96-9705-454ab6bc388b	12	696
10466	DEBIT	Donation to WWCode Austin	-16390	USD	2016-04-13 09:46:10.463-07	2016-04-16 13:40:58.845-07	821	224	173	\N	\N	153	1000	2000	610	USD	1	20000	-20000	\N	fe425d57-76fc-4eee-b892-d18fc52e4f66	2	696
10471	DEBIT	Recurring subscription	-52	USD	2016-04-02 19:02:46.616-07	2016-04-16 13:40:58.82-07	820	8	45	\N	\N	71	5	10	33	USD	1	100	-100	\N	d7e5d48d-0319-4b37-9f0a-d0207b7ca691	14	696
10476	DEBIT	Recurring subscription	-798	USD	2016-08-01 16:35:39.219-07	2016-08-01 16:35:39.244-07	804	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	34ba14f5-929e-41fd-baf3-90c3cdf0a220	2	696
10481	DEBIT	Donation to WWCode Atlanta	-53	USD	2016-06-21 09:02:56.072-07	2016-06-21 09:02:56.13-07	776	642	430	\N	\N	359	5	10	32	USD	1	100	-100	\N	20b7b51f-1f50-4f39-a4bd-7bdf53e3972e	12	696
10486	DEBIT	Donation to WWCode Austin	-41020	USD	2016-05-23 13:27:28.524-07	2016-05-23 13:27:28.599-07	742	426	306	\N	\N	258	2500	5000	1480	USD	1	50000	-50000	\N	c4df25e7-f615-441d-87a7-9ce77f5e0bef	2	696
10490	DEBIT	\N	-2040	USD	2016-12-18 17:42:01.104-08	2016-12-18 17:42:01.104-08	700	2220	1472	2016-12-27 16:00:00-08	\N	1389	125	250	85	USD	1	2500	-2500	\N	67c63f95-4816-4842-9cc8-83fe4a3a4cde	259	696
10496	DEBIT	\N	-24450	USD	2016-11-22 07:22:39.097-08	2016-11-22 07:22:39.097-08	702	1846	1211	\N	\N	1129	1500	3000	1050	USD	1	30000	-30000	\N	ce6c574c-f146-416d-a5d2-8d9de9ec479b	59	696
10500	DEBIT	\N	-8150	USD	2017-04-20 03:17:23.286-07	2017-04-20 03:17:23.286-07	841	4348	2643	\N	\N	2532	500	1000	350	USD	1	10000	-10000	\N	9821f35e-4d09-4803-96fe-4c32b22d0390	59	696
10506	DEBIT	\N	-384	USD	2017-05-01 10:13:34.851-07	2017-05-01 10:13:34.851-07	786	4550	2757	\N	\N	2644	25	50	41	USD	1	500	-500	\N	a74c7d4e-3b54-44bd-97f8-7679c2d53fad	516	696
10511	DEBIT	\N	-50000	CAD	2017-03-31 16:37:30.819-07	2017-03-31 16:37:30.819-07	696	3	\N	\N	\N	2217	0	0	0	CAD	1	50000	-50000	\N	7ffd04a4-f4c4-4193-a1df-5a11762e211a	291	696
10516	DEBIT	\N	-80500	GBP	2017-03-31 10:54:33.461-07	2017-03-31 10:54:33.461-07	696	3	\N	\N	\N	2208	0	0	0	GBP	1	80500	-80500	\N	1dcd7cc6-a8d7-4f87-b552-d53d04e734d6	278	696
10520	DEBIT	\N	-1480	USD	2017-04-18 17:20:11.527-07	2017-04-18 17:20:11.527-07	696	3	\N	\N	\N	2506	0	0	0	USD	1	1480	-1480	\N	05d167f5-69a0-4ea9-9858-a318a8b04172	12	696
10526	DEBIT	\N	-100000	USD	2017-04-17 15:40:40.357-07	2017-04-17 15:40:40.357-07	696	3	\N	\N	\N	2490	0	0	0	USD	1	100000	-100000	\N	4584b973-7e16-4168-ac81-68e926a1dfbb	430	696
10531	DEBIT	\N	-4250	GBP	2017-04-17 14:06:54.803-07	2017-04-17 14:06:54.803-07	696	3	\N	\N	\N	2475	0	0	0	GBP	1	4250	-4250	\N	e2292797-6adb-44e0-b351-fe49524981bf	278	696
10536	DEBIT	\N	-4000	GBP	2017-04-17 12:31:52.919-07	2017-04-17 12:31:52.919-07	696	3	\N	\N	\N	2470	0	0	0	GBP	1	4000	-4000	\N	da9734bf-f5d1-4c6e-bf87-59c68daa29c7	267	696
10541	DEBIT	\N	-100000	USD	2017-03-27 10:53:48.539-07	2017-03-27 10:53:48.539-07	696	3	\N	\N	\N	2154	0	0	0	USD	1	100000	-100000	\N	91edb4ea-eda4-4096-ae0d-63619f178a26	277	696
10546	DEBIT	\N	-50000	USD	2017-03-27 10:10:04.622-07	2017-03-27 10:10:04.622-07	696	3	\N	\N	\N	2151	0	0	0	USD	1	50000	-50000	\N	4a77c7a3-009d-443f-91a7-4840529f53dd	12	696
10551	DEBIT	\N	-69522	USD	2017-05-09 11:14:23.283-07	2017-05-09 11:14:23.283-07	847	4720	2860	\N	\N	2755	4200	8400	1878	USD	1	84000	-84000	\N	cac3a7d3-ea23-4029-aae3-d26b5cd47c9c	2	696
10554	DEBIT	Recurring subscription	-52	USD	2016-06-09 10:28:30.802-07	2016-06-09 10:28:30.841-07	820	8	385	\N	\N	320	5	10	33	USD	1	100	-100	\N	c3f9ba5a-b289-4c05-be2c-9c0989c05edc	3	696
10559	DEBIT	Donation - fees	-8	USD	2017-02-06 14:10:44.604-08	2017-02-06 14:10:44.763-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-800	\N	20902419-e05c-477d-a859-1e5367681e43	270	696
10563	DEBIT	Donation via meetup	-775	USD	2017-01-17 19:48:10.558-08	2017-01-17 19:48:10.699-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-775	\N	c3e0bdb3-499c-4be1-8d10-71a8a5873d7e	272	696
10568	DEBIT	WWCode t-shirt sales	-2778	USD	2017-01-17 19:30:54.132-08	2017-01-17 19:30:54.465-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2778	\N	ea08f8fe-0958-4f2c-98ee-23b1d451889b	3	696
10574	DEBIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	-50000	USD	2016-05-26 13:48:43.015-07	2016-05-26 13:48:43.336-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	058ec9e8-4851-4029-ba22-06822bead487	59	696
10580	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 10:33:56.275-08	2016-12-27 10:33:56.372-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	6f1b0d58-92f5-4038-99e2-2ef96d22b4a0	284	696
10586	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 08:30:02.12-08	2016-12-27 08:30:02.272-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	f1f7b14d-f9da-4381-b0ef-ff7cfec350b3	15	696
10592	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-28 08:24:49.292-08	2016-12-28 08:24:45.838-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	aff0781a-8511-42b7-be77-1f263b35aa7c	48	696
10598	DEBIT	Paypal Fees for Travel Stipend	-3000	USD	2017-03-20 08:38:54.453-07	2017-03-20 08:38:53.749-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3000	\N	03edf540-dcbf-41af-a962-a0cfab6e1aad	277	696
10603	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 08:32:00.456-08	2016-12-23 08:32:00.622-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	84344f00-41a5-4555-a670-f2c450a75bbc	260	696
10608	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 11:54:51.439-08	2016-12-27 11:54:51.679-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	0818a9f3-4a9f-4ac6-b95a-626443f3c7f5	4	696
10613	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 08:52:05.93-08	2016-12-27 08:52:06.061-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	7cfb1c1d-2aa0-4c93-9a75-49b7c23d4145	274	696
10618	DEBIT	Banner	-2000	USD	2016-11-30 13:33:30.25-08	2016-11-30 13:33:30.386-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	49ba4b48-bbbf-45c6-99a6-3128ee67a9cb	263	696
10623	DEBIT	Donation from Margaret - fees	-2012	USD	2016-11-29 15:37:14.82-08	2016-11-29 15:37:15.082-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2012	\N	860c81ca-acd7-4e57-85b8-e55c0b7b5e76	272	696
10628	DEBIT	Network Budget Balance Pre Open Collective	-17475	USD	2016-11-29 14:28:03.065-08	2016-11-29 14:28:03.231-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-17475	\N	3bd43c99-d11b-4a6c-b9b4-a03fb90932b8	282	696
10632	DEBIT	Network Development - 10k member bonus	-100000	USD	2016-11-29 13:58:23.625-08	2016-11-29 13:58:23.799-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100000	\N	0af0ec4d-5dff-45d8-97b3-b3da4a6caa00	4	696
10637	DEBIT	$5000 Intel Hackathon support - global development	-450000	USD	2016-11-17 10:23:08.268-08	2016-11-17 10:23:08.461-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-450000	\N	bedb8cb9-a6c4-4141-9e65-5bedf90e186b	59	696
10372	DEBIT	Recurring subscription	-125	MXN	2016-03-02 10:06:23.743-08	2016-04-16 13:40:58.731-07	769	80	42	\N	\N	68	2	3	16	USD	17.8570999999999991	28	-500	\N	4c1b5b10-13c0-4d0a-8666-446d4755b76a	10	696
10376	CREDIT	May expense: Travel and expense costs for mentoring at StartUp Weekend, Meeting w Northeeastern University for future WWC events 	5161	USD	2016-06-06 17:21:31.531-07	2016-06-14 11:14:22.165-07	767	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	5161	218	8d898f8e-fa9d-4b5d-841f-af25b72d3faa	14	696
10381	CREDIT	WwConnect planning meeting	4656	USD	2016-03-10 16:00:00-08	2016-06-14 11:14:21.794-07	767	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	4656	59	d8a4b356-c28b-47d4-a4e6-ebec8b91635f	14	696
10387	CREDIT	Business cards and stickers	11948	USD	2017-05-16 15:00:30.412-07	2017-05-16 15:00:30.412-07	697	142	\N	\N	\N	\N	\N	\N	0	USD	1	-11948	11948	1007	b74da05a-b77f-4547-856f-5c57d2c546d1	48	696
10392	DEBIT	\N	-2040	USD	2017-04-11 19:05:36.032-07	2017-04-11 19:05:36.032-07	694	4173	2546	\N	\N	2430	125	250	85	USD	1	2500	-2500	\N	b9d564c1-10d2-47cc-af4d-e663cff6755b	13	696
10397	DEBIT	Donation to WWCode Seattle	-52	USD	2016-02-02 08:36:38.327-08	2016-04-16 13:40:58.702-07	691	30	41	\N	\N	67	5	10	33	USD	1	100	-100	\N	209f2b39-402f-4379-904e-0709f7669224	14	696
10402	DEBIT	Recurring subscription	-52	USD	2016-04-02 12:27:54.641-07	2016-04-16 13:40:58.809-07	691	30	44	\N	\N	70	5	10	33	USD	1	100	-100	\N	8926e623-e9f1-405c-8157-78d6cb50255a	13	696
10409	DEBIT	Recurring subscription	-52	USD	2016-05-02 17:15:49.65-07	2016-05-02 17:15:49.711-07	688	2	46	\N	\N	72	5	10	33	USD	1	100	-100	\N	1ab81b15-ed08-47e4-bff8-266dc0ae1d7d	13	696
10412	DEBIT	Recurring subscription	-52	USD	2016-03-02 16:24:57.083-08	2016-04-16 13:40:58.834-07	688	2	46	\N	\N	72	5	10	33	USD	1	100	-100	\N	8408c438-3d9c-496c-bf65-8c7e33032364	13	696
10417	DEBIT	monthly recurring subscription	-798	USD	2017-03-01 15:40:00.024-08	2017-03-01 15:40:00.024-08	804	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	f3778c47-4c73-4745-a1fb-3c8e27c1d1ed	2	696
10422	CREDIT	More stickers to give away at events	18800	USD	2016-11-03 12:14:58.094-07	2016-11-03 12:14:58.245-07	696	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	18800	\N	42dbcb63-5236-47e2-949f-a96e23fc64ab	13	696
10427	DEBIT	\N	-8250	USD	2017-01-18 05:54:50.597-08	2017-01-18 05:54:50.597-08	698	2594	1647	\N	\N	1557	500	1000	250	USD	1	10000	-10000	\N	b97b785b-b3a2-4bd6-a5cd-90e68d5e9bd1	48	696
10432	CREDIT	Conference Grant - Sarah Olson	110000	USD	2016-05-10 12:19:21.785-07	2016-06-14 11:14:22.032-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	110000	156	98aba304-254f-42ea-94e7-6adca4b7f416	48	696
10436	CREDIT	CONFERENCE GRANT	50000	USD	2016-05-10 17:00:00-07	2016-06-14 11:14:22.114-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	196	8908f757-990e-4757-881b-56bc863aae89	59	696
10441	CREDIT	Meetup Fees	6000	USD	2017-04-05 07:19:21.293-07	2017-04-05 07:19:21.293-07	696	3	\N	\N	\N	\N	\N	\N	0	USD	1	-6000	6000	988	6881bfb8-09db-41a8-89d5-44bac7a2b56e	295	696
10448	CREDIT	Meetup Fees	6000	USD	2016-12-23 09:10:34.733-08	2016-12-23 09:10:34.733-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	619	20855877-4d1b-4c44-b508-24766afe7056	265	696
10454	CREDIT	Envelopes for hackathon sponsor prizes	907	USD	2016-11-30 08:12:35.291-08	2016-11-30 08:12:35.54-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	907	\N	b2d527df-93bd-4faf-a90d-83728789fe52	2	696
10458	CREDIT	A Small Orange	12700	USD	2016-02-01 16:00:00-08	2016-06-14 11:14:22.114-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12700	194	051decd9-9935-4250-a682-b51ef06fd918	48	696
10465	DEBIT	Donation to WWCode Washington DC	-41020	USD	2016-04-28 08:01:17.801-07	2016-04-28 08:01:17.846-07	825	283	213	\N	\N	181	2500	5000	1480	USD	1	50000	-50000	\N	5c18d294-00b9-40a3-bf02-15a83a38f248	13	696
10470	DEBIT	Recurring subscription	-53	USD	2016-07-09 11:31:14.547-07	2016-07-09 11:31:14.585-07	820	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	46c763b7-8787-480f-9c2d-94fd0bb231b3	3	696
10475	DEBIT	Recurring subscription	-798	USD	2016-09-01 16:32:42.475-07	2016-09-01 16:32:42.475-07	804	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	ac8b944b-6c94-4e33-927a-9291d167be8e	2	696
10477	DEBIT	Recurring subscription	-798	USD	2016-07-01 15:38:37.594-07	2016-07-01 15:38:37.617-07	804	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	8b5299d8-07af-496f-ac2b-5d51716e2675	2	696
10482	DEBIT	Donation to WWCode Twin Cities	-53	USD	2016-06-21 09:06:05.517-07	2016-06-21 09:06:05.626-07	776	642	432	\N	\N	361	5	10	32	USD	1	100	-100	\N	4d13c8fc-d66c-4018-9e8f-be4ba266ab50	48	696
10487	DEBIT	Recurring subscription	-798	USD	2016-09-09 20:42:56.392-07	2016-09-09 20:42:56.392-07	737	1158	731	\N	\N	647	50	100	52	USD	1	1000	-1000	\N	c97df5d3-93bd-4c59-9a92-4448571f2578	241	696
10492	DEBIT	\N	-2040	USD	2017-02-01 09:30:48.467-08	2017-02-01 09:30:48.467-08	692	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	-2500	\N	93cdec20-158c-49c4-b055-ac1a603b075a	271	696
10499	CREDIT	Director t-shirt	3325	USD	2016-10-17 14:01:02.872-07	2016-10-17 14:01:02.925-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3325	\N	2216f052-3762-4502-b49e-d3194befdcb0	298	696
10502	DEBIT	\N	-18600	USD	2017-02-01 07:16:20.999-08	2017-02-01 07:16:20.999-08	802	2898	1801	\N	\N	1709	1125	2250	525	USD	1	22500	-22500	\N	9b456b6e-3905-4dc6-884a-ad94c7fc8925	48	696
10507	DEBIT	\N	-610	USD	2017-04-19 11:35:03.04-07	2017-04-19 11:35:03.04-07	696	3	\N	\N	\N	2522	0	0	0	USD	1	610	-610	\N	51aac373-1695-478c-9a11-6224115ca4db	59	696
10512	DEBIT	\N	-20000	USD	2017-03-31 15:50:23.915-07	2017-03-31 15:50:23.915-07	696	3	\N	\N	\N	2214	0	0	0	USD	1	20000	-20000	\N	d340fba7-2b06-4bee-beb8-09374f4b753d	286	696
10518	DEBIT	\N	-1480	USD	2017-04-18 17:39:23.15-07	2017-04-18 17:39:23.15-07	696	3	\N	\N	\N	2508	0	0	0	USD	1	1480	-1480	\N	42314798-eabf-4c53-bbc4-30d24d88c062	14	696
10523	DEBIT	\N	-3562	GBP	2017-04-18 12:41:30.286-07	2017-04-18 12:41:30.286-07	696	3	\N	\N	\N	2503	0	0	0	GBP	1	3562	-3562	\N	62986fec-cff8-4724-bc15-3cc7f2ab0ff1	278	696
10529	DEBIT	\N	-41000	GBP	2017-04-17 15:31:52.729-07	2017-04-17 15:31:52.729-07	696	3	\N	\N	\N	2486	0	0	0	GBP	1	41000	-41000	\N	6ce420da-4e0a-44b0-a528-0ef77979d6ff	278	696
10534	DEBIT	\N	-100000	USD	2017-04-17 13:41:37.627-07	2017-04-17 13:41:37.627-07	696	3	\N	\N	\N	2472	0	0	0	USD	1	100000	-100000	\N	44008d30-8390-4ceb-b0f7-c63f0cf40ba3	517	696
10538	DEBIT	Women Techmaker WWcode Partnership Grant	-100000	USD	2016-05-24 13:23:16.28-07	2016-05-24 13:23:16.552-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100000	\N	3df64094-2d95-41a6-b98f-64fff565891c	3	696
10544	DEBIT	\N	-20000	USD	2017-03-27 10:45:17.58-07	2017-03-27 10:45:17.58-07	696	3	\N	\N	\N	2152	0	0	0	USD	1	20000	-20000	\N	443b7ca1-b0ff-4488-9395-bf66c6d26eda	59	696
10550	DEBIT	Macy's donation - fees and global development	-435000	USD	2017-02-13 16:21:10.361-08	2017-02-13 16:21:10.558-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-435000	\N	af43fecf-25e4-4215-a636-77676702e5b2	12	696
10556	DEBIT	Donations via meetup - fees	-12	USD	2017-02-06 14:58:38.922-08	2017-02-06 14:58:39.29-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1200	\N	4ddd439e-3a29-4758-9585-b3cb6a0e5ab9	13	696
10562	DEBIT	Donations - Fees 	-173	USD	2017-02-06 12:06:15.502-08	2017-02-06 12:06:15.622-08	696	3	\N	2017-02-05 16:00:00-08	\N	\N	\N	\N	\N	\N	\N	\N	-17328	\N	d738415f-b4ee-44e2-87c8-e02816d3d08a	2	696
10567	DEBIT	WWCode t-shirt sales	-4742	USD	2017-01-17 19:31:50.631-08	2017-01-17 19:31:50.774-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4742	\N	e8ee5f9e-e833-432a-889c-23b37be34bbc	2	696
10573	DEBIT	\N	-16563	EUR	2017-05-08 08:30:18.585-07	2017-05-08 08:30:18.585-07	696	3	\N	\N	\N	2741	0	0	0	EUR	1	16563	-16563	\N	749f40b2-e33d-4729-8b38-30502b177d2f	301	696
10579	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 10:37:31.611-08	2016-12-27 10:37:31.721-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	23b17c2d-2074-489f-92f6-2794bd25fa7d	59	696
10585	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 09:48:49.207-08	2016-12-27 09:48:49.297-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	6de44a52-e4c8-4be6-bcaf-5e5d4a502b98	280	696
10591	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-28 08:27:36.9-08	2016-12-28 08:27:33.309-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	dffcd811-3b16-4ffd-bbd9-bf1097a29535	292	696
10596	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 11:40:51.309-08	2016-12-23 11:40:51.479-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	7e9d7682-8b69-4ffb-aa8a-ab6ab1fb87f0	269	696
10602	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 08:45:15.022-08	2016-12-23 08:45:15.147-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	225ce9db-b4a3-470d-90cb-7f86123ca023	261	696
10607	DEBIT	\N	-20000	USD	2017-04-07 05:25:51.09-07	2017-04-07 05:25:51.09-07	696	3	\N	\N	\N	2393	0	0	0	USD	1	20000	-20000	\N	cfbc9b67-eb24-46d4-a21d-e0b28cb3253d	516	696
10612	DEBIT	monthly recurring subscription	-2040	USD	2017-04-01 11:31:19.231-07	2017-04-01 11:31:19.231-07	692	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	-2500	\N	91a4a6d4-8910-4332-bdec-36c132a56240	271	696
10617	DEBIT	Global Development - Thanks VMWare	-50000	USD	2016-11-30 13:34:00.324-08	2016-11-30 13:34:01.658-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	f401c210-c69c-4393-b3e4-7d24b09d9d73	263	696
10622	DEBIT	Donation via Meetup	-775	USD	2016-11-29 15:39:08.069-08	2016-11-29 15:39:08.263-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-775	\N	902a7237-716a-49d5-93fc-49d3bb70faef	300	696
10627	DEBIT	Network Development	-2500	USD	2016-11-29 14:29:22.958-08	2016-11-29 14:29:23.167-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2500	\N	c62a7d63-6c30-4835-830f-143e1332ebd1	282	696
10633	DEBIT	Global Development	-15600	USD	2016-11-29 14:08:18.065-08	2016-11-29 14:08:18.213-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-15600	\N	0f711332-96dd-436d-b82e-4adbaf493eba	241	696
10639	DEBIT	$1000 CDK Global event support - transaction and global development	-87000	USD	2016-11-17 10:18:40.107-08	2016-11-17 10:18:40.436-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-87000	\N	4e44f538-5eae-4bd3-9912-cc31ac67e6f8	59	696
10373	CREDIT	WwConnect Planning Meeting	2519	USD	2016-03-10 16:00:00-08	2016-06-14 11:14:21.794-07	767	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	2519	60	6f0bb91d-74a2-4705-ac09-8d62f6db506b	14	696
10377	CREDIT	Lunch w Saranya during leads meeting. I lost the paper copy of the receipt so including the credit card statement 	5458	USD	2017-02-22 07:27:45.429-08	2017-02-22 07:27:45.466-08	767	31	1893	\N	\N	\N	\N	\N	\N	\N	\N	\N	5458	775	0299846c-6ce1-436c-ae93-cafa0b7475fc	14	696
10382	CREDIT	Monthly core team lunch with Sandra Saranya Sara CiCi Tori (5 members) ; on boarding new core member Tori!	10294	USD	2016-08-02 06:38:05.215-07	2016-08-02 06:38:05.831-07	767	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	10294	255	23c64fb1-0d7c-4d9e-b404-7a8f1935a031	14	696
10383	CREDIT	Leadership team dinner - Sondry interview	11757	USD	2016-08-02 06:44:04.201-07	2016-08-02 06:44:04.214-07	767	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	11757	307	3bbb4bc0-813d-4a1e-9f8f-fb1957964be3	14	696
10388	CREDIT	Snacks and batteries for our robots	1554	USD	2017-05-16 15:00:04.449-07	2017-05-16 15:00:04.449-07	697	142	\N	\N	\N	\N	\N	\N	0	USD	1	-1554	1554	1084	cf350020-07cc-40b3-863b-2daf7a9cf63c	48	696
10393	DEBIT	monthly recurring subscription	-2040	USD	2017-03-01 10:37:53.591-08	2017-03-01 10:37:53.591-08	692	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	-2500	\N	4da9cc74-66f1-4d13-8c20-7cf33b5bd5ad	271	696
10399	DEBIT	Donation to WWCode Washington DC	-52	USD	2016-02-02 09:04:56.247-08	2016-04-16 13:40:58.698-07	691	30	43	\N	\N	69	5	10	33	USD	1	100	-100	\N	811ac035-ce29-49f1-a685-55fa4b2032e2	13	696
10404	DEBIT	Donation to WWCode Atlanta	-891	USD	2016-01-29 14:23:53.315-08	2016-04-16 13:40:58.701-07	691	30	39	\N	\N	13	0	50	59	USD	1	1000	-1000	\N	675a9dba-6589-4d82-a7f4-f3b10f0dcd11	12	696
10408	DEBIT	Donation to WWCode Mexico City	-380	USD	2016-01-18 15:54:06.439-08	2016-04-16 13:40:58.672-07	688	2	34	\N	\N	65	25	50	45	USD	1	500	-500	\N	6ae4391c-476d-4ed7-9c74-9b468874af39	10	696
10413	CREDIT	05-21-16 AI workshop	30000	USD	2016-05-22 17:26:36.061-07	2016-06-14 11:14:22.092-07	848	28	\N	2016-06-14 11:14:22.535-07	\N	\N	\N	\N	\N	\N	\N	\N	30000	186	b6a9d1e4-af7a-496e-9e5a-6d5acdd10fba	2	696
10418	DEBIT	\N	-20670	USD	2017-03-01 14:51:20.759-08	2017-03-01 14:51:20.759-08	793	1263	2048	\N	\N	1953	1250	2500	580	USD	1	25000	-25000	\N	407c85e0-6f62-448e-8d2d-83218ae57b22	59	696
10423	CREDIT	Cash for Prizes/Bartender	50000	USD	2016-11-03 12:12:34.941-07	2016-11-03 12:12:35.306-07	696	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	ebe40e6a-977b-4d30-9085-1311d568992d	2	696
10428	CREDIT	Meetup Fees	6000	USD	2016-12-23 09:32:55.31-08	2016-12-23 09:32:55.31-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	622	a4dc2000-cb0e-4817-8bd3-1136573b4c80	195	696
10433	CREDIT	Dinner for last night's HackNight	13526	USD	2016-08-19 13:58:34.342-07	2016-08-19 13:58:34.554-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	13526	319	8c1184cf-900f-4271-8443-e13f7b236ca9	48	696
10437	CREDIT	Global Development 	150	USD	2016-06-09 11:38:16.857-07	2016-06-14 11:14:22.175-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	150	222	ef32d59e-6f50-4762-96ca-bd00119ed4a8	4	696
10443	CREDIT	Meetup Fees	6000	USD	2016-12-27 08:41:27.235-08	2016-12-27 08:41:27.235-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	638	fcb91841-2fe5-4ec4-8d5b-e0081aac8a02	272	696
10447	CREDIT	Meetup Fees	4900	GBP	2016-12-23 09:05:41.927-08	2016-12-23 09:05:41.927-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4900	618	202f48fe-0dc6-4a02-a5af-bd5f7573ebb8	264	696
10453	CREDIT	Banner	2000	USD	2016-11-30 10:40:24.258-08	2016-11-30 10:40:24.443-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	270bba53-f86b-4f9d-adb7-220b6367ce2e	292	696
10459	CREDIT	Food at our Sept. monthly event	11478	USD	2016-10-04 15:07:11.046-07	2016-10-04 15:07:11.615-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	11478	\N	2201e207-7a32-4def-ae9c-77a506306e1e	15	696
10463	DEBIT	Donation to WWCode Austin	-124170	USD	2016-08-01 08:54:14.382-07	2016-08-01 08:54:14.468-07	840	883	561	\N	\N	488	7500	15000	3330	USD	1	150000	-150000	\N	7aebb22b-254b-4d8d-b752-3fb52f2a9d06	2	696
10468	DEBIT	Recurring subscription	-53	USD	2016-09-09 11:29:12.276-07	2016-09-09 11:29:12.276-07	820	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	4874b64e-1bf8-43c7-98b3-496a0e1e8727	3	696
10474	DEBIT	Recurring subscription	-798	USD	2016-11-01 16:32:30.439-07	2016-11-01 16:32:30.439-07	804	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	6401c059-5f15-482f-9c36-fbb95003eff2	2	696
10480	DEBIT	\N	-20670	USD	2016-09-22 18:07:09.492-07	2016-09-22 18:07:09.492-07	793	1263	790	\N	\N	700	1250	2500	580	USD	1	25000	-25000	\N	c367a4a5-a467-4f36-bf0d-2fa28d0fc73a	59	696
10485	DEBIT	Donation to WWCode Austin	-16530	USD	2016-08-01 08:55:27.083-07	2016-08-01 08:55:27.184-07	751	884	562	\N	\N	489	1000	2000	470	USD	1	20000	-20000	\N	e186101d-32a0-413d-a495-53cc1c5fb397	2	696
10491	DEBIT	\N	-41370	USD	2017-01-16 10:03:56.108-08	2017-01-16 10:03:56.108-08	701	2561	1622	\N	\N	1537	2500	5000	1130	USD	1	50000	-50000	\N	8d68636e-d855-4e2e-b268-237eaa2f5677	48	696
10495	DEBIT	From Deepa	0	USD	2016-04-12 14:19:00.212-07	2016-04-12 14:19:00.529-07	696	3	\N	2016-04-14 14:19:00.529-07	\N	\N	\N	\N	\N	\N	\N	\N	-1500	\N	dda02014-ae93-4db3-a654-6592a1dbf910	4	696
10501	DEBIT	Network development (stickers)	-58590	USD	2016-10-06 09:08:20.916-07	2016-10-06 09:08:21.09-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-58590	\N	6800403e-5b26-43c0-a1f1-e84cf4fe76ff	3	696
10505	DEBIT	\N	-2930	USD	2017-05-01 17:33:45.73-07	2017-05-01 17:33:45.73-07	696	3	\N	\N	\N	2662	0	0	0	USD	1	2930	-2930	\N	8f332b69-4267-4c62-8b1a-e7da280b0c11	3	696
10510	DEBIT	\N	-1480	USD	2017-04-19 11:18:19.043-07	2017-04-19 11:18:19.043-07	696	3	\N	\N	\N	2519	0	0	0	USD	1	1480	-1480	\N	76410cf4-121f-43e7-890b-9e8a79aa048d	2	696
10515	DEBIT	\N	-39800	GBP	2017-03-31 11:01:48.418-07	2017-03-31 11:01:48.418-07	696	3	\N	\N	\N	2209	0	0	0	GBP	1	39800	-39800	\N	702f0e70-9a34-472d-ba3e-d0db52903832	278	696
10521	DEBIT	\N	-1400	USD	2017-04-18 17:31:31.942-07	2017-04-18 17:31:31.942-07	696	3	\N	\N	\N	2507	0	0	0	USD	1	1400	-1400	\N	09845f0c-2b7c-4406-a761-e17b46051ffa	195	696
10525	DEBIT	\N	-2200	MXN	2017-04-17 15:35:55.014-07	2017-04-17 15:35:55.014-07	696	3	\N	\N	\N	2489	0	0	0	MXN	1	2200	-2200	\N	9ca7bfe2-8e77-461f-9a5e-e1500785839f	511	696
10530	DEBIT	\N	-100000	USD	2017-04-17 15:09:42.57-07	2017-04-17 15:09:42.57-07	696	3	\N	\N	\N	2477	0	0	0	USD	1	100000	-100000	\N	a13f418d-d6b4-4231-ab7d-e437d8966c99	270	696
10535	DEBIT	\N	-9000	USD	2017-04-17 12:41:07.659-07	2017-04-17 12:41:07.659-07	696	3	\N	\N	\N	2471	0	0	0	USD	1	9000	-9000	\N	ab43bf24-40c7-4021-bbcd-ab4daeb25e60	277	696
10540	DEBIT	Women Techmaker WWCode Partnership Grant	-70000	USD	2016-05-19 12:17:47.24-07	2016-05-19 12:17:48.401-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-70000	\N	2ce63dcd-c961-46d2-a377-9d0d659d2778	3	696
10543	DEBIT	\N	-100000	USD	2017-03-27 10:52:38.123-07	2017-03-27 10:52:38.123-07	696	3	\N	\N	\N	2153	0	0	0	USD	1	100000	-100000	\N	c213e189-fdee-45fd-a158-3af5df8e7146	277	696
10548	DEBIT	Leadership Development: Google I/O travel grant for Gen A. 	-85000	USD	2017-03-27 06:25:14.008-07	2017-03-27 06:25:14.169-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-85000	\N	19310000-439b-456b-81ce-1879d67447fc	278	696
10553	DEBIT	monthly recurring subscription	-53	USD	2017-04-09 11:28:49.104-07	2017-04-09 11:28:49.104-07	820	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	c59b1097-e389-4247-ba06-3de4372699b3	3	696
10558	DEBIT	Gitlab - transaction and global development	-414	USD	2017-02-06 14:12:42.534-08	2017-02-06 14:12:42.684-08	696	3	\N	2017-02-05 16:00:00-08	\N	\N	\N	\N	\N	\N	\N	\N	-41400	\N	e4ececc8-1a0d-4698-a6ac-2f6aa363126b	48	696
10561	DEBIT	Taipei Donation - fees and global development	-8	USD	2017-02-06 12:11:26.406-08	2017-02-06 12:11:26.522-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-800	\N	655fb76d-c7d6-4672-b2ed-3b8c4315bb0e	241	696
10566	DEBIT	WWCode t-shirt sales	-1389	USD	2017-01-17 19:32:30.654-08	2017-01-17 19:32:30.825-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1389	\N	7ebff6e6-e2b8-47cd-8c6c-74587ecc5dc0	15	696
10571	DEBIT	WWCode t-shirt sales	-1106	USD	2017-01-17 19:29:09.407-08	2017-01-17 19:29:09.561-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1106	\N	2d1b5451-f9c5-4792-b890-2e5b0021295f	14	696
10576	DEBIT	Global Development for Meetup Fee	-6000	AUD	2016-12-28 07:55:25.022-08	2016-12-28 07:55:21.475-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	c1bc7912-ac3f-4c69-b4fb-1290199b3c11	297	696
10581	DEBIT	Global Development for Meetup Fee	-5700	EUR	2016-12-27 10:10:14.864-08	2016-12-27 10:10:14.928-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5700	\N	3afaeab7-10a8-4853-a77f-e6dcd5d3831c	283	696
10583	DEBIT	Global Development for Meetup Fee	-6000	MXN	2016-12-27 09:56:03.911-08	2016-12-27 09:56:03.985-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	e9ad4266-1cba-40f9-a44b-af167a3160b3	282	696
10588	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 08:22:09.234-08	2016-12-27 08:22:09.351-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	d2412e0b-97e4-4055-b164-f539014ef861	13	696
10593	DEBIT	Global Development for Meetup Fee	-6000	CAD	2016-12-28 08:21:14.024-08	2016-12-28 08:21:10.449-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	315d135c-2d0b-4986-bfc6-849a4ea1f184	291	696
10599	DEBIT	Global Development for Meetup Fees	-6000	USD	2016-12-23 08:54:04.928-08	2016-12-23 08:54:05.055-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	0d5aec50-7e33-41cc-a3ef-25a023212868	262	696
10605	DEBIT	VMWare foundation Donation - global development (Ramya V., Swathi U. and Anonymous) 	0	USD	2017-04-07 09:43:42.261-07	2017-04-07 09:43:42.673-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-24750	\N	2cafe4ba-852b-4c23-ab2a-7ce17044fefa	262	696
10610	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 11:48:41.246-08	2016-12-27 11:48:41.318-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	da7bc3eb-6a37-4824-a2e4-7a034451deea	288	696
10616	DEBIT	WTM Google I/O Travel Stipend	-50000	USD	2017-03-17 07:09:18.868-07	2017-03-17 07:09:18.344-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	7ed40b5f-a3e3-44c1-851d-89c301b284b2	195	696
10620	DEBIT	Network Development	-20000	USD	2016-11-29 16:23:24.87-08	2016-11-29 16:23:24.511-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	8a435d2f-60d9-497b-be40-e8f3d9313cfe	285	696
10625	DEBIT	Regional Leadership Director Training 	-13031	USD	2016-11-29 14:35:05.252-08	2016-11-29 14:35:05.379-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-13031	\N	02327536-5d41-4acd-a4b1-5dd6c6cda348	47	696
10630	DEBIT	Erica S. donation - fees	-450	USD	2016-11-29 14:12:36.336-08	2016-11-29 14:12:36.503-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-450	\N	3e22ac5d-2869-4e63-b969-c44057e7f69c	287	696
10635	DEBIT	International Women's Day Atlanta	0	USD	2017-03-28 11:28:28.77-07	2017-03-28 11:28:28.938-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10350	\N	39da4ca6-64df-4786-9dda-168291870f58	51	696
10640	DEBIT	T-shirt payout	-1092	USD	2016-11-17 10:03:13.726-08	2016-11-17 10:03:13.862-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1092	\N	43ad11f3-767d-4016-b602-c3a4f05cd9a9	59	696
10645	DEBIT	Women Techmaker WWCode Partnership Grant	-15000	USD	2016-05-24 13:12:34.913-07	2016-05-24 13:12:35.226-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-15000	\N	dcdd4889-645c-468a-b4fd-7f0bfbbfe00d	13	696
10649	DEBIT	Portland t-shirt proceeds	-6915	USD	2016-11-17 10:01:32.1-08	2016-11-17 10:01:32.49-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6915	\N	d4132031-1a5c-4155-910b-550a7fd0b83d	59	696
10653	DEBIT	Recurring subscription	-52	USD	2016-05-02 15:49:03.545-07	2016-05-02 15:49:03.612-07	820	8	45	\N	\N	71	5	10	33	USD	1	100	-100	\N	113574c3-4fd8-4710-b3e7-c29bef0c42a7	14	696
10660	DEBIT	Conference stipend Heidi H.	-50000	USD	2016-10-11 08:59:30.363-07	2016-10-11 08:59:31.524-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	f935fbd9-5a2b-4bd6-81f2-e14695b77dd1	195	696
10665	DEBIT	\N	-150000	USD	2017-05-03 10:32:39.653-07	2017-05-03 10:32:39.653-07	696	3	\N	\N	\N	2693	0	0	0	USD	1	150000	-150000	\N	78cb8052-6b9b-496e-8a15-87b1d18079f6	12	696
10671	DEBIT	Network development	-6000	USD	2016-10-06 09:01:48.321-07	2016-10-06 09:01:48.667-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	18f04bb0-79e0-4355-a839-64ed44fc3f48	4	696
10675	DEBIT	Donation: Beth Laing	-5000	USD	2016-10-04 08:47:24.058-07	2016-10-04 08:47:24.175-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5000	\N	c62e9978-5fdb-4b59-8815-a8ff192698cd	12	696
10680	DEBIT	Proceeds from teespring	-10022	USD	2016-05-26 11:38:50.077-07	2016-05-26 11:38:48.41-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10022	\N	cd38e171-3171-407d-a36b-5dce25bc9dd8	48	696
10686	DEBIT	Network support - Regional Leadership (thanks VMWare)	-370000	USD	2016-10-11 12:51:45.723-07	2016-10-11 12:51:45.897-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-370000	\N	8e45e44d-cfc1-40a0-aed3-e16adc426a72	262	696
10692	DEBIT	Andrea S	-1500	USD	2016-04-27 13:05:44.711-07	2016-04-27 13:05:44.974-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1500	\N	ec632c06-f282-4265-84b5-29305caf9462	48	696
10698	DEBIT	From Deepa	-1500	USD	2016-04-12 14:18:56.547-07	2016-04-16 13:40:58.847-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1500	\N	c27e6c62-d209-4265-9503-1961ce506489	4	696
10703	DEBIT	WWCode t-shirt sales	-1599	USD	2017-01-17 19:21:50.791-08	2017-01-17 19:21:50.964-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1599	\N	ba0b4d2d-8a6c-45d2-86f6-91221e1a09df	271	696
10707	DEBIT	Donation to WWCode Austin	-26100	USD	2016-02-18 11:54:08.531-08	2016-04-16 13:40:58.717-07	814	108	71	\N	\N	15	0	3000	900	USD	1	30000	-30000	\N	4214247d-1d65-479b-8431-00c1170d7ee7	2	696
10714	DEBIT	Global Development for Meetup Fee	-4900	GBP	2016-12-27 09:32:02.798-08	2016-12-27 09:32:02.918-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4900	\N	9e4fb236-e42c-4636-be45-a182fb40a813	278	696
10719	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 08:38:50.944-08	2016-12-27 08:38:51.039-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	6fb56583-50d1-4b5a-b82e-7fb98b1c53f5	272	696
10723	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 09:20:13.429-08	2016-12-23 09:20:13.545-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	bfe21a88-1534-41ca-8a7d-68ca14c5cc17	259	696
10728	DEBIT	Regional Leadership Director Meeting 	-7500	USD	2016-11-30 13:20:06.733-08	2016-11-30 13:20:15.577-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7500	\N	eecd9204-ea46-447d-8a01-449d5a6ea19f	269	696
10733	DEBIT	Banner	-2000	USD	2016-11-30 10:40:32.021-08	2016-11-30 10:40:32.139-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	9ad7057a-6864-479e-ac07-66f5db2500bf	292	696
10738	DEBIT	Regional Leadership Director Training	-631	USD	2016-11-29 14:38:57.006-08	2016-11-29 14:38:57.13-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-631	\N	2e0f897d-298d-416d-afce-096bf3d72ef1	47	696
10744	DEBIT	Hackbright support for hackathon	-45000	USD	2016-10-07 13:04:15.299-07	2016-10-07 13:04:15.435-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-45000	\N	dd38bd8d-12c8-4617-8f72-57395d5a9f5f	300	696
10750	DEBIT	Diana A. Scholarship Google I/O	-25000	USD	2016-10-04 15:19:06.989-07	2016-10-04 15:19:07.108-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-25000	\N	1dd8e912-110f-4de9-a28a-12acdc460695	272	696
10755	DEBIT	Turner Matching Donation	-5000	USD	2016-10-04 08:46:59.013-07	2016-10-04 08:46:59.134-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5000	\N	39fd4a1c-8ed2-426f-9dee-2963686b9ff8	12	696
10762	DEBIT	Recurring subscription	0	MXN	2016-03-15 13:05:22.15-07	2016-04-01 07:32:17.381-07	822	7	64	2016-04-07 07:32:17.381-07	\N	83	5	\N	\N	\N	\N	\N	-100	\N	10500554-4835-4692-b29a-cef3339a5756	10	696
10767	DEBIT	Network Development	-10000	USD	2016-10-04 14:44:54.4-07	2016-10-04 14:44:54.58-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	\N	e96adf30-8b58-4016-8bbb-7e50e51c7311	2	696
10771	DEBIT	\N	-1200	USD	2017-05-04 11:58:24.9-07	2017-05-04 11:58:24.9-07	696	3	\N	\N	\N	2713	0	0	0	USD	1	1200	-1200	\N	c98937aa-cfe6-4da4-b54d-0662eaa40b9d	430	696
10779	DEBIT	WWCode DC t-shirts sales	-9524	USD	2016-11-17 10:37:58.038-08	2016-11-17 10:37:58.232-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9524	\N	49d7bec3-950b-4d38-b0ce-dc71667333fb	13	696
10783	DEBIT	WWCode Director t-shirt	-3649	USD	2016-10-17 13:50:42.245-07	2016-10-17 13:50:42.273-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3649	\N	20aaecf3-af0f-4ef6-8780-986511794acc	47	696
10789	DEBIT	Donations via Meetup	-3937	USD	2016-10-06 11:41:35.464-07	2016-10-06 11:41:35.487-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3937	\N	c08d0f54-509b-4f18-8102-5abf91da7fdc	13	696
10793	DEBIT	\N	-75000	USD	2017-05-03 10:44:10.84-07	2017-05-03 10:44:10.84-07	696	3	\N	\N	\N	2696	0	0	0	USD	1	75000	-75000	\N	1a7663b3-e966-447d-9ac4-b1b17518beb5	12	696
10798	DEBIT	Network budget balance pre Open Collective	-34240	USD	2016-10-04 14:49:31.268-07	2016-10-04 14:49:31.543-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-34240	\N	1099fdb7-e961-4f3d-a01b-41d4d1ad202b	15	696
10802	DEBIT	Conference Grant: Google/IO Alicia Carr	-10000	USD	2016-10-04 08:25:59.981-07	2016-10-04 08:26:00.186-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	\N	8e68ef22-6ae4-42ac-966d-e025f89b3049	12	696
10807	CREDIT	Deposit- We Rise Conference Hosting Location	500000	USD	2017-05-16 14:51:10.574-07	2017-05-16 14:51:10.574-07	690	3206	\N	\N	\N	\N	\N	\N	0	USD	1	-500000	500000	1123	017d44f6-0840-46a5-99d2-d14d5d3e29f4	12	696
10812	CREDIT	Travel Stipend for Google I/O, now that I have secured my I/O Ticket via Google - see enclosed I/O Ticket Receipt)	88760	GBP	2017-03-27 09:01:27.19-07	2017-03-27 09:01:27.295-07	831	1333	2265	\N	\N	\N	\N	\N	3760	GBP	1	-85000	85000	926	c256e1d7-4b03-4c2d-9002-9373312589bf	278	696
10816	CREDIT	Last minute (less than 7 day advance purchase) airline price purchase from SFO to JFK. Emailed Joey to alert of higher fare. 	59040	USD	2017-02-07 10:32:48.784-08	2017-02-07 10:32:49.072-08	767	31	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	59040	776	31c26c22-3854-4e5a-a764-43b66968348e	14	696
10821	CREDIT	500 gift cards, 19.62 printed awards	51962	USD	2016-10-31 14:09:11.281-07	2016-10-31 14:09:11.484-07	696	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	51962	416	a221c88d-b2af-49c4-ad5a-b88d13819b8d	300	696
10826	CREDIT	Travel stipend to attend the Google I/O 2017 Conference.	107430	USD	2017-03-31 15:33:59.707-07	2017-03-31 15:33:59.731-07	699	1344	2321	\N	\N	\N	\N	\N	7430	USD	1	-100000	100000	962	3a05350a-dc74-4dcf-8a42-cfb0a51c620f	286	696
10831	CREDIT	Travel Scholarship for WWCode Director	40970	GBP	2017-04-17 15:32:02.724-07	2017-04-17 15:32:02.724-07	696	3	\N	\N	\N	\N	\N	\N	0	GBP	1	-40970	40970	768	a2a21001-2edc-44ad-93b1-09e69fca39e3	278	696
10836	CREDIT	WePay Fee	400	USD	2016-04-10 17:00:00-07	2016-06-14 11:14:21.907-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	400	104	49132e79-88f9-49e2-bbf5-41439ce4f94f	48	696
10841	CREDIT	Meetup Fees	6000	USD	2016-12-28 07:49:16.255-08	2016-12-28 07:49:16.255-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	659	0089afa3-06c9-4d0d-8242-2100c05f9c55	300	696
10844	CREDIT	Meetup Fees	6000	MXN	2016-12-27 10:01:07.417-08	2016-12-27 10:01:07.417-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	651	e24aa772-b07c-46f0-8bea-c7785f315dae	10	696
10848	CREDIT	Meetup Fees	6000	USD	2016-12-27 09:49:39.83-08	2016-12-27 09:49:39.83-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	648	e8d05cd6-c08e-450d-8cd5-72443826f235	280	696
10853	CREDIT	Stickers	15084	USD	2017-04-07 05:58:45.517-07	2017-04-07 05:58:45.531-07	842	3419	2321	\N	\N	\N	\N	\N	454	USD	1	-14630	14630	889	c74be264-c431-4180-9025-22280d82e5d8	516	696
10858	CREDIT	Meetup Fees	6000	USD	2016-12-28 08:25:48.743-08	2016-12-28 08:25:48.743-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	664	db26635e-d75e-4047-844b-63636975c51c	48	696
10863	CREDIT	Meetup Fees	6000	USD	2016-12-23 11:41:48.315-08	2016-12-23 11:41:48.315-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	627	413e9a93-9143-4da6-9a26-673c80067767	269	696
10868	CREDIT	Meetup Fees	6000	USD	2016-12-23 08:37:59.322-08	2016-12-23 08:37:59.322-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	613	4ea7e5cc-4069-4c6f-af5a-6e74ac320a4f	260	696
10872	CREDIT	Meetup Fees	6000	USD	2016-12-27 11:53:07.2-08	2016-12-27 11:53:07.2-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	657	42985b71-3a98-4b70-8f11-4f17dc752021	14	696
10877	CREDIT	WWC T-shirt	2798	USD	2016-12-06 08:59:36.33-08	2016-12-06 08:59:36.741-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	2798	\N	24988fb2-8cf2-42d9-ba05-ce41c0956a16	59	696
10882	CREDIT	Marketing for IoT Hackathon	1082	USD	2016-12-06 08:50:56.549-08	2016-12-06 08:50:57.046-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	1082	502	d204f313-ee7c-4886-b0b8-bba1807cbac9	59	696
10886	CREDIT	Conference Travel Stipend - Google I/O Elese	75000	USD	2016-11-30 13:25:56.197-08	2016-11-30 13:25:56.423-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75000	\N	84871abe-5a02-4c13-818b-8dc30fec0b54	276	696
10891	CREDIT	Conference Grant	50000	USD	2016-05-04 14:14:39.136-07	2016-06-14 11:14:22.01-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	145	1d204ab8-b2d2-4c62-9517-6f2387d4a8e4	13	696
10631	DEBIT	Erica S. donation - fees	-450	USD	2016-11-29 14:11:37.922-08	2016-11-29 14:11:38.131-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-450	\N	9653d524-fa17-4cd7-976d-36440950cad0	287	696
10636	DEBIT	$3500 Course Hero Hackathon support - transaction & global development	-304500	USD	2016-11-17 10:27:12.528-08	2016-11-17 10:27:12.742-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-304500	\N	8cfc0575-bd75-45e9-8ec4-8d1784d26bdc	59	696
10641	DEBIT	Donation from Cameron - fees and global development	-4350	USD	2017-01-04 12:33:36.359-08	2017-01-04 12:33:37.475-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4350	\N	961b09f8-62e2-4103-afd0-08118cec2b1e	259	696
10646	DEBIT	Global Development for Meetup Fee	-5700	EUR	2016-12-27 08:34:45.59-08	2016-12-27 08:34:45.771-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5700	\N	11d26cb3-612e-4a51-8323-c62b10ed96be	298	696
10652	DEBIT	Network Development	-18200	USD	2016-10-11 10:02:51.621-07	2016-10-11 10:02:51.839-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-18200	\N	16b2775d-eec5-4ca7-ab1a-ab6ba2b5868b	291	696
10657	DEBIT	Recurring subscription	-798	USD	2016-10-01 16:35:17.911-07	2016-10-01 16:35:17.911-07	804	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	f3b87a32-f205-43c8-86a1-30af776f34da	2	696
10661	DEBIT	Network Development	-13286	USD	2016-10-04 15:57:17.136-07	2016-10-04 15:57:17.293-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-13286	\N	3f1a5e8b-bb47-4110-8a53-686e9a62157a	260	696
10666	DEBIT	Leadership Development	-50616	MXN	2017-03-07 05:01:15.044-08	2017-03-07 05:01:15.192-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50616	\N	06c1b68c-b902-475f-932d-1e5b0db537d4	282	696
10670	DEBIT	Network Development	-20000	USD	2016-10-11 09:02:18.108-07	2016-10-11 09:02:19.138-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	435f1a68-05d2-425d-a33a-60bf65f8a96c	195	696
10676	DEBIT	Donation: Syema Ailia	-2500	USD	2016-10-04 08:47:46.468-07	2016-10-04 08:47:46.624-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2500	\N	cae549ca-ef12-4d01-91ba-eb659b277472	12	696
10682	DEBIT	Generous donation from Target to support WWCode Twin Cities	-500000	USD	2016-05-26 11:37:24.922-07	2016-05-26 11:37:23.286-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-500000	\N	fe78ac6a-0a30-4f73-b021-1d9e9504456f	48	696
10688	DEBIT	Network Development	-15400	USD	2016-10-04 15:39:26.796-07	2016-10-04 15:39:26.9-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-15400	\N	d9a09558-7967-463e-8005-d9bcae16df64	273	696
10693	DEBIT	Donation from Biotti	-403	USD	2016-10-11 12:32:58.956-07	2016-10-11 12:32:59.265-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-403	\N	05785551-f125-46b9-8cde-534686d9cf7a	301	696
10697	DEBIT	Dalia donated to WWCode SF	-1500	USD	2016-06-09 11:40:21.124-07	2016-06-09 11:40:21.833-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1500	\N	6c357912-5add-4c20-8564-cf38b0b9ff8d	4	696
10702	DEBIT	Women Techmaker/WWCode partnership grant	-50000	USD	2016-05-04 14:17:27.653-07	2016-05-04 14:17:27.886-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	1f1346a4-7ade-4426-be48-7e6e38e315e4	13	696
10708	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-28 08:31:33.43-08	2016-12-28 08:31:29.837-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	ef909942-b865-458f-ace8-8ba14a237efa	294	696
10711	DEBIT	Donation via meetup - fees and global development	-775	USD	2016-12-13 12:20:15.375-08	2016-12-13 12:20:15.714-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-775	\N	e19bfadf-3927-4398-94e0-07ddd33e76b5	13	696
10716	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 09:02:32.71-08	2016-12-27 09:02:32.843-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	b1e8e494-a40e-4601-9f3f-401dafcca155	277	696
10721	DEBIT	Global Development for Meetup Fee	-6000	AUD	2016-12-23 09:41:14.029-08	2016-12-23 09:41:14.193-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	70b84bdf-77c3-4c68-90ba-38a57b41cbec	266	696
10726	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 08:59:24.039-08	2016-12-23 08:59:24.291-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	8e574f40-18d7-45b5-8fa0-f5006d62dabf	263	696
10731	DEBIT	Leadership development - conference stipend Google I/O	-130000	USD	2016-11-30 13:07:12.142-08	2016-11-30 13:07:12.419-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-130000	\N	1a792fda-4a3f-43a9-a7f1-9e362cc50abe	241	696
10736	DEBIT	CONNECT 2016	-4536939	USD	2016-11-29 13:44:20.041-08	2016-11-29 13:44:20.185-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4536939	\N	c5b8e821-759d-4cbd-aecd-6ae71fdd25f4	14	696
10742	DEBIT	Donation from Shugo	-450	USD	2016-10-11 21:30:15.825-07	2016-10-11 21:30:15.896-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-450	\N	d934d56c-bfc7-492b-aef4-ee0c60158a4a	295	696
10747	DEBIT	Hackathon Support Open Gov	-45000	USD	2016-10-07 07:41:08.315-07	2016-10-07 07:41:08.391-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-45000	\N	154d2b6b-e2a4-4fa8-b679-58e4225f285e	300	696
10752	DEBIT	Network Development	-17375	USD	2016-10-04 15:15:45.133-07	2016-10-04 15:15:45.269-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-17375	\N	a84715d6-e59e-4de8-ba5c-b550a871a572	272	696
10758	DEBIT	Mary Griffus	-1000	USD	2016-04-26 21:41:38.126-07	2016-04-26 21:41:38.474-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	d07ce937-e5a0-4d9a-9f8a-e0fb18f97240	13	696
10761	DEBIT	monthly recurring subscription	-798	USD	2017-04-01 16:32:24.254-07	2017-04-01 16:32:24.254-07	804	686	461	\N	\N	386	50	100	52	USD	1	1000	-1000	\N	f90d2589-ded0-4da7-9093-5d6c7de081f7	2	696
10765	DEBIT	Donation to WWCode Austin	-61125	USD	2016-06-22 13:09:46.403-07	2016-06-22 13:09:46.432-07	772	646	435	\N	\N	364	3750	7500	2625	USD	1	75000	-75000	\N	70c58341-caa7-4f41-a234-bb502601fe1d	2	696
10770	DEBIT	WOMEN TECHMAKER/WWCODE PARTNERSHIP GRANT	-110000	USD	2016-05-10 14:15:06.327-07	2016-05-10 14:15:06.677-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-110000	\N	21969bb4-b3c3-441f-8aad-e5c4fca0ad28	48	696
10775	DEBIT	Women Who Code Atlanta &amp; DevNexus Soirée global networks support	-1450	USD	2017-03-13 10:06:48.459-07	2017-03-13 10:06:51.099-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1450	\N	bdbff87f-20db-4b73-b56a-62e7a04126a6	51	696
10781	DEBIT	Director t-shirt	-3325	USD	2016-10-17 14:00:51.295-07	2016-10-17 14:00:51.425-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3325	\N	fb5e00d2-6e33-406f-b590-5ad4edc20402	298	696
10785	DEBIT	Network Development	-10000	USD	2016-10-11 09:52:38.277-07	2016-10-11 09:52:38.455-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	\N	296e5728-5c8c-4b0a-bbd4-35d3c2530de1	59	696
10791	DEBIT	Network Development (Stickers)	-62984	USD	2016-10-06 08:49:44.329-07	2016-10-06 08:49:44.472-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-62984	\N	df14ff23-dbff-43ff-8742-61b15146de5e	4	696
10796	DEBIT	Network Development	-10000	USD	2016-10-04 14:50:13.582-07	2016-10-04 14:50:13.787-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	\N	924ffed2-6fce-451e-9a05-a47d82f3b76b	15	696
10801	DEBIT	Donation via Meetup	-2036	USD	2016-10-04 09:42:35.996-07	2016-10-04 09:42:36.119-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2036	\N	4de92959-6f7c-462b-847e-f4941f46ebde	300	696
10806	CREDIT	To redeem travel stipend to Google I/O	104430	USD	2017-03-27 10:54:16.729-07	2017-03-27 10:54:16.758-07	695	1331	2266	\N	\N	\N	\N	\N	4430	USD	1	-100000	100000	935	229f39fa-1d6b-4aad-ba86-ff50edacae51	277	696
10811	CREDIT	Printing WWCODE pamphlets for Camas STEM Fair for middle-school girls (organized by OHSU).	4431	USD	2017-02-07 10:40:27.475-08	2017-02-07 10:40:27.96-08	828	171	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	4431	736	6c8dd2ef-996c-4a0b-8007-41c62b2eecb5	59	696
10818	CREDIT	Regional Leadership Event: Barcelona	19398	EUR	2017-05-16 14:49:07.885-07	2017-05-16 14:49:07.885-07	794	1378	\N	\N	\N	\N	\N	\N	0	EUR	1	-19398	19398	1122	b0ab9b94-cd01-4cf2-bc09-f793e70813ae	301	696
10825	CREDIT	Conference Grant	120000	USD	2016-05-19 12:07:13.723-07	2016-06-14 11:14:22.074-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	120000	175	3e49e3ef-c7d5-412a-b9f3-a3405a3a121e	12	696
10830	CREDIT	Minimum fee - May	1000	USD	2016-08-16 07:54:12.931-07	2016-08-16 07:54:12.95-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	cc9f830d-b393-43db-a65d-58e5cf9a678f	15	696
10835	CREDIT	CONFERENCE GRANT	34750	USD	2016-05-26 12:05:53.771-07	2016-06-14 11:14:22.123-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34750	197	bc56113c-cf20-4f9f-b0f4-e02d2bfeabb2	59	696
10839	CREDIT	Meetup Fees	6000	USD	2016-12-28 07:53:05.613-08	2016-12-28 07:53:05.613-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	660	b82d3402-f88c-4c5f-84a9-197b856d111a	289	696
10846	CREDIT	Meetup Fee	6000	USD	2016-12-27 10:35:08.624-08	2016-12-27 10:35:08.624-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	653	d7e279e3-a4fa-48c8-bb6b-b1c3d24ddfb9	284	696
10851	CREDIT	October Hack Night Drinks/Food.	1106	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	844	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1100	485	939aee4b-972d-4c76-9be2-6f7ee246336e	273	696
10855	CREDIT	Meetup Fees	6000	MXN	2016-12-27 08:12:26.224-08	2016-12-27 08:12:26.224-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	632	c3449c66-8f74-41bf-b52c-31ec050d66af	299	696
10859	CREDIT	Meetup Fees	6000	CAD	2016-12-28 08:21:52.469-08	2016-12-28 08:21:52.469-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	663	7de61b74-ab9b-4574-be2a-788fcbfee85b	291	696
10864	CREDIT	Meetup Fees	6000	USD	2016-12-23 11:38:46.818-08	2016-12-23 11:38:46.818-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	626	a6f70458-3d59-4887-acc2-3f3b636598d8	268	696
10869	CREDIT	Meetup Fees	6000	USD	2016-12-21 10:54:30.839-08	2016-12-21 10:54:30.839-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	608	4a69a25f-3f46-49c5-bd42-620202db2ece	3	696
10874	CREDIT	Event suplies	2198	USD	2016-12-13 10:43:16.329-08	2016-12-13 10:43:17.27-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	2198	\N	d23e17db-8cdf-41ec-92ae-bdc228438f39	59	696
10879	CREDIT	WWCode Seattle network retreat	6207	USD	2016-12-06 08:57:26.568-08	2016-12-06 08:57:26.935-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	6207	\N	a85110c9-d295-471a-b24e-e6f3b1056205	14	696
10884	CREDIT	Network Budget pre Open Collective	77659	GBP	2016-10-07 07:03:00.623-07	2016-10-07 07:03:00.89-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	77659	\N	1a01d670-56cd-44f6-9f79-07ca05b3f754	278	696
10890	CREDIT	Lodging and meals for our WWC Seattle 7 team members leadership development retreat. Under approved budget!	227646	USD	2016-11-29 13:46:42.259-08	2016-11-29 13:46:42.259-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	227646	474	eaca3a9c-73e5-487d-81be-a447486c3a09	14	696
10895	CREDIT	Food for JavaScript Study Night - Oct. 11th	1446	USD	2016-10-31 11:19:11.822-07	2016-10-31 11:19:12.067-07	696	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	1446	419	4d469d79-e68f-43cf-9372-f70fa58f2325	59	696
10899	CREDIT	April 4 Lightning Talks	13315	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.091-07	848	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	13315	183	2bcd1281-28bd-4e2c-adab-794ed39a3143	2	696
10904	CREDIT	Connect 2016 event setup day dinner	6800	USD	2016-03-17 17:00:00-07	2016-06-14 11:14:21.838-07	798	32	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	6800	72	0191d6fc-513e-4a12-84b1-d8bc2bc7c829	14	696
10642	DEBIT	donation - fees and global development	-798	USD	2017-01-05 06:48:24.355-08	2017-01-05 06:48:26.734-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-798	\N	d25f2eee-a643-4626-986b-e5789ea0b707	241	696
10647	DEBIT	Women Techmaker WWCode Partnership Grant	-20000	USD	2016-05-25 09:45:53.797-07	2016-05-25 09:45:54.045-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	ed408997-2403-4100-ac27-c8ae719e1699	48	696
10651	DEBIT	Director t-shirt	-2898	USD	2016-10-17 13:57:08.514-07	2016-10-17 13:57:08.533-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2898	\N	b854ca5e-1290-4299-b4ee-7fbf8fbf5cd1	3	696
10656	DEBIT	Donation to WWCode Austin	-26100	USD	2016-03-25 08:11:04.684-07	2016-04-16 13:40:58.812-07	806	192	152	\N	\N	64	0	3000	900	USD	1	30000	-30000	\N	f8a8c801-1d11-4c80-902b-aef3ef831fb9	2	696
10662	DEBIT	Donation from Adane	-450	USD	2016-10-04 15:56:11.881-07	2016-10-04 15:56:13.02-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-450	\N	a55d09de-93d3-4ac4-9ce2-545ff2bf1a54	260	696
10667	DEBIT	Recurring subscription	-52	USD	2016-04-02 18:49:19.352-07	2016-04-16 13:40:58.819-07	688	2	46	\N	\N	72	5	10	33	USD	1	100	-100	\N	1e2d860e-a459-4461-b850-d4a7c7da95c8	13	696
10672	DEBIT	Donations via Meetup	-2823	USD	2016-10-06 08:53:38.156-07	2016-10-06 08:53:38.231-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2823	\N	52c43494-81b3-47fa-b215-d0697d6138bc	4	696
10677	DEBIT	Donation from MondoRobot & Avery Brewing Company: Hackathon Proceeds	-320247	USD	2016-06-29 11:42:31.848-07	2016-06-29 11:42:32.517-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-320247	\N	a1e70aeb-9036-4889-b641-a954b5176a68	15	696
10681	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-21 10:49:47.667-08	2016-12-21 10:49:47.892-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	db65c7b8-d020-49a0-8290-ca5f43b9a94c	2	696
10687	DEBIT	Network support - thanks VMWare	-200000	USD	2016-10-11 12:50:00.045-07	2016-10-11 12:50:00.312-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-200000	\N	447567d7-e023-45aa-ae67-22d6648866c7	262	696
10691	DEBIT	Network Development	-17500	USD	2016-10-11 12:35:59.115-07	2016-10-11 12:35:59.305-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-17500	\N	3c8be0cd-e169-4141-8c9f-8637365a0f74	301	696
10695	DEBIT	From Lucas in honor of Rachel M. She learned Python and HTML/CSS	-2250	USD	2016-10-11 12:13:57.013-07	2016-10-11 12:13:57.265-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2250	\N	27d114e3-2d58-4430-8653-f39f62129eaa	279	696
10700	DEBIT	From:\tThao Le	-1500	USD	2016-04-12 11:49:06.645-07	2016-04-16 13:40:58.815-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1500	\N	8d2222c9-6189-4505-acbd-8d8cb4125395	4	696
10705	DEBIT	WWCode Boston t-shirt sales	-1964	USD	2017-01-17 19:19:47.816-08	2017-01-17 19:19:48.024-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1964	\N	cf7d6265-63eb-42fb-8909-386d70a6ee39	195	696
10710	DEBIT	Global Development for Meetup Fee	-4900	GBP	2016-12-23 09:55:42.091-08	2016-12-23 09:55:42.249-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4900	\N	142cf1ea-b128-410d-b6fe-807740f26864	267	696
10715	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 09:24:55.371-08	2016-12-27 09:24:55.632-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	930502ba-9c47-451d-8271-c79d58db3c17	279	696
10720	DEBIT	Google I/O stipend	-39585	GBP	2016-10-07 06:35:45.945-07	2016-10-07 06:35:46.151-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-39585	\N	e6d383d0-a92e-41ec-aa8b-a9a46b92d6c8	278	696
10724	DEBIT	Global Development for Meetup Fee	-5700	EUR	2016-12-23 09:13:39.369-08	2016-12-23 09:13:39.507-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5700	\N	f83141ca-5d47-47a9-96e4-f7b4acfa240f	301	696
10730	DEBIT	Global Development	-20000	USD	2016-11-30 13:11:00.067-08	2016-11-30 13:11:00.307-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	ccb2e911-15d4-4e00-b99c-c54fdd62244a	294	696
10735	DEBIT	Donation from PB - fees 	-1187	USD	2016-11-29 15:33:50.04-08	2016-11-29 15:33:50.206-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1187	\N	8b697df0-d7d2-4536-a032-a0ce19d337a5	4	696
10740	DEBIT	Network Development (Thanks Atlassian) 	-20000	USD	2016-10-11 22:06:05.058-07	2016-10-11 22:06:05.202-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	bb08ad89-c844-40c8-a07c-20d374ec7122	266	696
10743	DEBIT	Network Development (100%)	-10000	USD	2016-10-07 13:05:13.011-07	2016-10-07 13:05:13.112-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	\N	7952d103-0d0d-4899-814d-d19cd8504bb4	300	696
10748	DEBIT	Course Hero Hackathon Support	-315000	USD	2016-10-07 07:39:15.069-07	2016-10-07 07:39:15.23-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-315000	\N	9b599bc0-023b-4b66-a07f-1677ef0e2964	300	696
10753	DEBIT	Donation via meetup	-2363	USD	2016-10-04 15:14:59.695-07	2016-10-04 15:14:59.884-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2363	\N	96528fdc-758a-44ed-b356-4817bb157e8d	272	696
10757	DEBIT	\N	-136	USD	2017-04-30 18:40:30.232-07	2017-04-30 18:40:30.232-07	842	3419	2749	\N	\N	2636	10	20	34	USD	1	200	-200	\N	5fa18bce-22e2-42fa-8ae8-62574abb1023	516	696
10760	DEBIT	monthly recurring subscription	-53	USD	2017-03-09 10:29:18.778-08	2017-03-09 10:29:18.778-08	820	8	385	\N	\N	320	5	10	32	USD	1	100	-100	\N	bbdc84af-7da8-439c-a3d3-dc9bd6714daa	3	696
10766	DEBIT	\N	-4938	USD	2017-03-09 10:29:55.496-08	2017-03-09 10:29:55.496-08	755	3442	2104	\N	\N	2003	300	600	162	USD	1	6000	-6000	\N	eadb233a-ff06-411e-835f-c3b4b47121d1	259	696
10774	DEBIT	Travel Stipend for CONNECT	0	USD	2017-04-03 13:24:58.616-07	2017-04-03 13:24:58.879-07	696	3	\N	2017-04-02 17:00:00-07	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	ff28f536-5a70-413d-a08f-9cc91a401815	511	696
10778	DEBIT	from Code2040	-90000	USD	2016-10-17 08:43:12.71-07	2016-10-17 08:43:13.113-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-90000	\N	8ae9d538-2df4-46e7-bc1a-545506bb93a9	2	696
10784	DEBIT	Director t-shirt	-2860	USD	2016-10-17 13:55:47.647-07	2016-10-17 13:55:47.671-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2860	\N	ce22a003-a619-44a4-b70c-d1926c81af3f	12	696
10788	DEBIT	\N	-2175	USD	2017-05-03 17:12:19.814-07	2017-05-03 17:12:19.814-07	696	3	\N	\N	\N	2702	0	0	0	USD	1	2175	-2175	\N	34e034d7-7d0d-4281-8a06-a2cf12f73e6d	259	696
10794	DEBIT	\N	-30000	USD	2017-05-03 10:33:13.688-07	2017-05-03 10:33:13.688-07	696	3	\N	\N	\N	2694	0	0	0	USD	1	30000	-30000	\N	34216b27-9e47-4fa3-90f4-ad0d154d22ef	51	696
10799	DEBIT	Donation received via Meetup, less fees	-788	USD	2016-10-04 09:46:13.302-07	2016-10-04 09:46:13.487-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-788	\N	9cdfc87d-d188-4ea3-bb71-56528d9ae952	12	696
10804	DEBIT	\N	-300000	USD	2017-05-02 11:43:43.157-07	2017-05-02 11:43:43.157-07	696	3	\N	\N	\N	2676	0	0	0	USD	1	300000	-300000	\N	785d5762-3172-429f-83bf-94a2e1befd95	12	696
10809	CREDIT	Google I/O	51480	USD	2017-03-27 10:11:39.25-07	2017-03-27 10:11:39.275-07	835	69	2265	\N	\N	\N	\N	\N	1480	USD	1	-50000	50000	952	5e203000-9b8d-412a-86bd-462dbe98c51e	12	696
10814	CREDIT	Hackathon 2017 planning meeting	3005	USD	2017-04-11 12:15:09.813-07	2017-04-11 12:15:09.826-07	828	171	2321	\N	\N	\N	\N	\N	114	USD	1	-2891	2891	1001	8924e884-3c24-4a9f-8e89-20df2799901b	59	696
10819	DEBIT	Nike Donation	-50000	USD	2016-06-09 21:08:56.525-07	2016-06-09 21:08:56.991-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	9ca20a51-e62a-4239-b3f9-da470491024d	59	696
10824	CREDIT	Minimum Fee - May	1000	USD	2016-08-16 07:54:57.595-07	2016-08-16 07:54:57.609-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	c868e08f-e729-4eda-8124-20633c29059b	48	696
10828	CREDIT	Monthly Minimum Fee - May	1000	USD	2016-08-16 07:51:38.913-07	2016-08-16 07:51:38.924-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	158f7b08-c68e-4a3c-b6e0-57f93df6a17f	12	696
10834	CREDIT	Conference Grant	70000	USD	2016-05-19 12:07:13.723-07	2016-06-14 11:14:22.082-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	70000	178	09322e83-fa6c-42b0-aaa7-aeb075babeb4	3	696
10840	CREDIT	Meetup Fees	6000	AUD	2016-12-28 07:56:28.934-08	2016-12-28 07:56:28.934-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	661	9dabe6df-c619-4993-9f20-bce9e8197060	297	696
10845	CREDIT	Meetup Fees	6000	MXN	2016-12-27 09:57:54.314-08	2016-12-27 09:57:54.314-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	650	1c82322e-7c78-4ae5-95ea-ab7717a17d35	282	696
10850	CREDIT	Mar 7 Lightning Talks	15790	USD	2017-03-14 10:21:29.296-07	2017-03-14 10:21:29.332-07	848	28	1893	\N	\N	\N	\N	\N	474	USD	1	-15316	15316	57	7248acf2-9bac-4796-b61f-a34d31e4570a	2	696
10856	CREDIT	meetup with speaker, Heather VanCura, in conjunction with DevNexus conference	21588	USD	2017-03-14 10:22:10.666-07	2017-03-14 10:22:10.681-07	764	70	1893	\N	\N	\N	\N	\N	638	USD	1	-20950	20950	899	0a686951-ecfe-41ed-a918-559574d65727	12	696
10862	CREDIT	Meetup Fees	6000	USD	2016-12-23 11:50:08.539-08	2016-12-23 11:50:08.539-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	628	ad599e72-44fb-4482-b75c-b7824252bbda	270	696
10867	CREDIT	Meetup Fees	6000	USD	2016-12-23 08:49:17.444-08	2016-12-23 08:49:17.444-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	614	34c6b2a1-a04a-4a8f-bdc0-0da02cc40d10	261	696
10871	CREDIT	Leadership - Planning for 2017 - Dinner	9240	USD	2016-12-19 10:45:09.113-08	2016-12-19 10:45:09.64-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	9240	602	ef0fd8ee-bdf5-4868-aded-dd4c102f7c7c	48	696
10878	CREDIT	Hackathon - prizes for winners + goodies for thank you bags for sponsors/speakers/mentors/judges/volunteers	7750	USD	2016-12-06 08:57:59.164-08	2016-12-06 08:57:59.708-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	7750	\N	8b31f788-ccfa-44db-b85a-e6927b3e9a20	59	696
10883	CREDIT	Meetup Fees	6000	USD	2016-12-27 08:31:58.557-08	2016-12-27 08:31:58.557-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	636	30210f87-fd8d-492c-97d9-575a9f4cc37a	15	696
10887	CREDIT	Network budget pre open collective	55923	USD	2016-11-29 16:18:08.154-08	2016-11-29 16:18:07.832-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	55923	\N	6efe835d-7d81-457d-bfdf-fae64bc6fe9f	285	696
10893	CREDIT	September Ruby Tuesday	6497	USD	2016-10-31 14:11:36.488-07	2016-10-31 14:11:36.731-07	696	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	6497	450	0456b447-2529-4415-8c33-d46115b65762	2	696
10898	CREDIT	WWCode Seattle planning lunch with Sara	2700	USD	2016-10-31 10:52:44.962-07	2016-10-31 10:52:45.274-07	696	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	2700	420	ef8ef924-a45f-4606-8982-1fc32a5eb811	14	696
10902	CREDIT	Feb 1, Lightning Talks	22568	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.794-07	848	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	22568	56	72113cfc-72d1-4360-ba00-0928656af318	2	696
10907	CREDIT	Installfest	558	USD	2016-12-13 09:30:28.678-08	2016-12-13 09:30:30.347-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	558	\N	1ce78a50-c013-4c5a-b590-cf1e059d93de	59	696
10911	CREDIT	Supplies / Gift Bags	4147	USD	2016-12-07 08:50:40.889-08	2016-12-07 08:50:41.383-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	4147	\N	aaac8834-e66a-4f5d-86fe-8e49a2407190	59	696
10644	DEBIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	-80000	USD	2016-05-31 11:01:08.532-07	2016-05-31 11:01:07.064-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-80000	\N	f4e9eaa4-375a-43ac-aee2-140cd01b7537	13	696
10650	DEBIT	Stephen	-450	USD	2016-11-29 14:55:31.534-08	2016-11-29 14:55:31.727-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-450	\N	66a1a749-4aed-414d-aeee-37b1cee87ea1	273	696
10655	DEBIT	Donation to WWCode Washington DC	-41020	USD	2016-04-29 06:51:19.1-07	2016-04-29 06:51:19.15-07	809	303	216	\N	\N	183	2500	5000	1480	USD	1	50000	-50000	\N	09f365a2-1252-40bd-bde9-c5c805ad94af	13	696
10659	DEBIT	Network Development (100%)	-10000	USD	2016-10-06 11:42:47.682-07	2016-10-06 11:42:47.71-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	\N	fe23a079-15dd-4241-85a2-ce00148af1be	13	696
10664	DEBIT	WWCode t-shirt sales	-3563	USD	2017-01-17 19:28:29.874-08	2017-01-17 19:28:30.096-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3563	\N	b16ef4d6-fe45-47ff-a4ad-882a362f8312	290	696
10668	DEBIT	Leadership Development 	-14915	MXN	2017-03-07 04:55:53.128-08	2017-03-07 04:55:53.3-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-14915	\N	ba7eb336-a2f6-4a2f-af37-7425b3a654c8	511	696
10673	DEBIT	Donations made via Meetup as of Jan 2016, less transaction fees	-9212	USD	2016-10-04 08:46:17.845-07	2016-10-04 08:46:18.02-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9212	\N	a844b869-4b28-48d1-bdf3-c6004a262e9a	12	696
10678	DEBIT	\N	-60000	USD	2017-05-02 11:45:44.253-07	2017-05-02 11:45:44.253-07	696	3	\N	\N	\N	2677	0	0	0	USD	1	60000	-60000	\N	1bf2723a-1188-4d1d-b800-aaa5cc959dd9	51	696
10683	DEBIT	Donation Elizabeth B.	-9000	USD	2016-10-11 17:22:08.455-07	2016-10-11 17:22:08.557-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9000	\N	082fade7-66d7-4741-acd8-fd18d25c9695	288	696
10685	DEBIT	Network Development	-20000	USD	2016-10-11 13:03:19.884-07	2016-10-11 13:03:20.084-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	9d13695d-bf7e-4c01-b1fa-81a405e55b56	271	696
10690	DEBIT	Donation Ailia S.	-9000	USD	2016-10-11 12:44:42.807-07	2016-10-11 12:44:43.161-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9000	\N	17b6b107-fded-4ee7-a7b8-584c7e027d73	270	696
10696	DEBIT	Network Development	-17750	USD	2016-10-11 12:17:21.991-07	2016-10-11 12:17:22.199-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-17750	\N	a9e121ed-45d5-4958-a4fd-87a12abebcef	279	696
10701	DEBIT	Google I/O stipend	-75000	USD	2016-10-11 09:01:42.326-07	2016-10-11 09:01:43.286-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75000	\N	aa2423fd-ecb4-4623-a3d2-7af70acc985d	195	696
10706	DEBIT	Donation to WWCode Seattle	-52	USD	2016-02-02 13:46:44.866-08	2016-04-16 13:40:58.7-07	820	8	45	\N	\N	71	5	10	33	USD	1	100	-100	\N	22774249-6137-4c5d-a803-e6f9decbe380	14	696
10712	DEBIT	Donation via Meetup - fees + Global Development	-1187	USD	2016-12-13 12:17:57.936-08	2016-12-13 12:17:58.19-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1187	\N	4e90ec08-7d1c-447d-b1b9-6a2ba6d5a932	272	696
10717	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 08:58:32.613-08	2016-12-27 08:58:32.719-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	891ca464-268a-4e62-8417-ced45d950697	276	696
10722	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 09:31:16.26-08	2016-12-23 09:31:16.392-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	34d2add9-2ccd-438c-ad2c-bf559656e06c	195	696
10727	DEBIT	Regional Leadership Director Meeting 	-7500	USD	2016-11-30 13:20:12.669-08	2016-11-30 13:20:16.148-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7500	\N	7013f12f-de82-4230-bbcf-3952706e085a	269	696
10732	DEBIT	Network Development	-20000	USD	2016-11-30 12:59:29.087-08	2016-11-30 12:59:29.921-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	2933f14a-a8df-4191-a3ac-742319a00ca3	280	696
10737	DEBIT	Global Development - thanks VMWare	-50000	USD	2016-11-29 15:07:50.964-08	2016-11-29 15:07:51.154-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	e6510cfa-1fcc-4ff4-ae26-a18f8bba3e61	289	696
10741	DEBIT	Network Development	-19550	USD	2016-10-11 21:30:34.678-07	2016-10-11 21:30:34.772-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-19550	\N	c7891a85-9d6a-4b62-812c-2c9327b29860	295	696
10745	DEBIT	Google I/O conference stipend	-102409	GBP	2016-10-07 06:10:42.97-07	2016-10-07 06:10:43.753-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-102409	\N	b27f2d1a-a983-405b-92b8-5b3921b46927	278	696
10749	DEBIT	Donation from Marie W.	-900	USD	2016-10-11 17:26:47.2-07	2016-10-11 17:26:47.59-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-900	\N	1cf65dfc-9d35-4a08-ad5e-d81b8d8c6db4	284	696
10754	DEBIT	Sponsorship: AT&T Hackathon Prize	-1000000	USD	2016-10-04 08:40:37.72-07	2016-10-04 08:40:37.853-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000000	\N	59a302cf-6750-4da9-a4e6-59235de99082	12	696
10759	DEBIT	Donation to WWCode Mexico City	0	MXN	2016-02-15 10:46:05.92-08	2016-04-01 07:32:17.223-07	822	7	64	2016-04-07 07:32:17.381-07	\N	83	\N	\N	\N	\N	\N	\N	-100	\N	b3e48587-deec-4ea2-8ae1-006e66b1c82b	10	696
10764	DEBIT	Donation to WWCode San Francisco	-53	USD	2016-06-21 09:05:01.251-07	2016-06-21 09:05:01.296-07	776	642	431	\N	\N	360	5	10	32	USD	1	100	-100	\N	3a8bdd66-c39d-4a1e-8674-0e2c8c0c556f	4	696
10769	DEBIT	Women Techmaker/WWCode Partnership Grant	-50000	USD	2016-05-16 13:01:14.238-07	2016-05-16 13:01:14.49-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	dd75acc3-c63d-4320-b2c3-438a6d33af3c	10	696
10773	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 09:08:24.515-08	2016-12-23 09:08:24.709-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	5aaa3747-be17-48b1-8f97-ace5bd86481d	265	696
10776	DEBIT	Women Who Code Atlanta &amp; DevNexus Soirée - fees + global	-10875	USD	2017-03-13 10:05:28.744-07	2017-03-13 10:05:31.582-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10875	\N	80542abb-5b54-4319-8403-aadddeb29db7	12	696
10780	DEBIT	$500 OpenGov hackathon support - transaction and global development	-43500	USD	2016-11-17 10:36:48.896-08	2016-11-17 10:36:49.046-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-43500	\N	6246eeea-b62e-45c0-8770-ac0b0c79a3dc	59	696
10786	DEBIT	Network budget pre Open Collective 	-162598	USD	2016-10-11 22:01:43.648-07	2016-10-11 22:01:43.828-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-162598	\N	12930918-0bf4-4d90-9abb-666a1e14ec98	264	696
10790	DEBIT	Network budget pre Open Collective 	-406519	USD	2016-10-06 11:36:30.275-07	2016-10-06 11:36:30.298-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-406519	\N	40bed327-214b-4dc6-b35b-c158af46537f	13	696
10795	DEBIT	Network Development: Three Year Bonus:)	-50000	USD	2016-10-04 14:52:32.839-07	2016-10-04 14:52:32.962-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	85d75295-a507-4cab-aeb3-803bfba8d7f3	2	696
10800	DEBIT	Donation via Meetup	-1203	USD	2016-10-04 09:46:07.882-07	2016-10-04 09:46:07.993-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1203	\N	c70b3a28-0878-4fbe-beb9-d99f26b2af62	13	696
10805	CREDIT	Leadership meeting	2989	USD	2017-05-16 14:59:48.206-07	2017-05-16 14:59:48.206-07	697	142	\N	\N	\N	\N	\N	\N	0	USD	1	-2989	2989	1086	a2aea4b0-ea0c-4b1f-a395-bdc5406cc605	48	696
10810	CREDIT	WWCode CONNECT Conference Travel Stipend	88760	GBP	2017-04-17 14:18:35.523-07	2017-04-17 14:18:35.581-07	831	1333	2602	\N	\N	\N	\N	\N	3760	GBP	1	-85000	85000	1016	4bb21a14-9afb-43f5-9cbc-67bc8b62226b	278	696
10815	CREDIT	Event supplies	1601	USD	2017-04-11 12:13:28.544-07	2017-04-11 12:13:28.599-07	828	171	2321	\N	\N	\N	\N	\N	74	USD	1	-1527	1527	1002	c4c210b9-e2f2-4328-ae31-4e2c953972c0	59	696
10820	DEBIT	Women Techmaker WWCode Partnership Grant	-120000	USD	2016-05-19 12:10:52.797-07	2016-05-19 12:10:54.053-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-120000	\N	5786b598-a9a2-4731-befb-8ae06afefffb	12	696
10823	CREDIT	Reimburse Caterina for travel expenses to CONNECT 2016	6500	USD	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.839-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6500	75	b18aaa69-d5cf-4fe3-a2fe-24c2c9a360b3	59	696
10827	CREDIT	Regional Leadership Director Training	13031	USD	2016-11-29 14:35:21.354-08	2016-11-29 14:35:21.522-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13031	\N	19beeee5-3ab2-474c-986f-88a06e49f0fb	47	696
10832	CREDIT	Network Development: Attend CapOne WIT 2017 Kickoff to announce partnership for re-launch	100000	USD	2017-04-17 15:12:22.995-07	2017-04-17 15:12:22.995-07	696	3	\N	\N	\N	\N	\N	\N	0	USD	1	-100000	100000	1027	7607d461-1a02-4a20-b6ea-fde6e95a62a9	270	696
10837	CREDIT	Reimbursement to Kamila for coffee purchased for volunteers at CONNECT 2016	11815	USD	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.839-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11815	74	c99b3f54-442f-4b91-9208-e1b376ee8a72	14	696
10842	CREDIT	Meetup Fees	6000	USD	2016-12-28 07:44:44.222-08	2016-12-28 07:44:44.222-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	658	67d1c306-5b1c-4465-84d1-f1d71b3cb212	4	696
10847	CREDIT	Meetup Fees	6000	AUD	2016-12-27 09:54:00.843-08	2016-12-27 09:54:00.843-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	649	e56b2a5d-78e5-45cd-b7a3-8f474b811fbe	281	696
10852	CREDIT	Food for October Hack Night.	7773	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	844	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7700	484	14a3cc67-a826-425b-bd88-d958d7dfa4b8	273	696
10857	CREDIT	Meetup Fees	6000	USD	2016-12-28 08:28:15.901-08	2016-12-28 08:28:15.901-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	665	7d110d48-e22c-419a-b0dd-cc5135074a31	292	696
10861	CREDIT	Meetup Fees	5700	EUR	2016-12-27 10:11:51.873-08	2016-12-27 10:11:51.873-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5700	652	95a42899-8661-4576-b8b9-dca86803b174	283	696
10865	CREDIT	Meetup Fees	6000	USD	2016-12-23 08:52:20.827-08	2016-12-23 08:52:20.827-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	615	e4f9d7ae-f58c-4b6d-8753-4b1f9c5fde44	12	696
10873	CREDIT	Speaker and sponsor meetings (11/18 + 11/28) and event logistics (12/2)	2870	USD	2016-12-13 10:44:23.973-08	2016-12-13 10:44:24.945-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	2870	\N	8c4552ca-4f78-40cf-9e23-31770d240003	59	696
10876	CREDIT	Leadership Event in Sofia	6444	EUR	2016-12-07 13:38:07.287-08	2016-12-07 13:38:07.429-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	6444	471	835e5b89-5255-4e41-97ea-181cab475c62	301	696
10881	CREDIT	Supplies	3918	USD	2016-12-06 08:51:20.162-08	2016-12-06 08:51:20.661-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	3918	508	36dbc829-cc1c-48e3-b367-e9c68e5aa6a2	59	696
10888	CREDIT	Banner	2000	USD	2016-11-29 14:34:04.252-08	2016-11-29 14:34:04.435-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	21a304f9-9659-4744-903d-1b3ac8463148	47	696
10892	CREDIT	Drinks and snacks (ATXDivHack)	75932	USD	2016-10-31 14:13:05.943-07	2016-10-31 14:13:06.106-07	696	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	75932	449	bfd947c8-7e91-4767-a735-406edb1a02af	2	696
10897	CREDIT	Pizza for our monthly October event	9276	USD	2016-10-31 11:07:11.805-07	2016-10-31 11:07:12.736-07	696	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	9276	\N	9176ff61-cd19-4a6f-a434-6e2e946a1fbc	15	696
10896	CREDIT	Monthly core team meeting. Beverages with dinner for six members 	3080	USD	2016-10-31 10:59:53.602-07	2016-10-31 10:59:53.96-07	696	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	3080	401	0e36c1ba-d98e-45b2-8f3e-6fd0d05d016c	14	696
10901	CREDIT	May 2 Lightning Talks	8979	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.092-07	848	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	8979	184	adaaea03-b191-4a09-821c-8d4dcfc3fe65	2	696
10906	CREDIT	Meetup Fees	6000	USD	2016-12-27 08:23:35.936-08	2016-12-27 08:23:35.936-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	634	806f44ce-5c47-4194-a71d-d5d89579ad83	13	696
10909	CREDIT	Office Supplies for Hackathon.	10585	USD	2016-12-06 09:00:58.382-08	2016-12-06 09:00:58.806-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	10585	\N	b3c960f4-f7c5-40be-9b4e-d6b9c1e84825	59	696
10913	CREDIT	Network budget pre Open Collective	230712	USD	2016-10-07 13:01:03.429-07	2016-10-07 13:01:03.535-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	230712	\N	ce430088-846e-453c-895d-c00b69cca119	300	696
10918	CREDIT	WWCode Director t-shirt	3649	USD	2016-10-17 13:50:53.853-07	2016-10-17 13:50:53.855-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3649	\N	fd12b997-340d-438f-a3b9-0b33a5968600	47	696
10924	CREDIT	90/10 split: Hackathon donation	32000	USD	2016-10-04 15:05:22.85-07	2016-10-04 15:05:22.85-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32000	395	881793d4-b6fa-4bd4-a63e-f82541cb3192	15	696
10929	CREDIT	Minimum Fee - May	1000	MXN	2016-08-15 12:22:45.367-07	2016-08-15 12:22:45.38-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	b913a79b-1723-41f5-96f7-87278b0cdb94	10	696
10934	CREDIT	Gifts for Organizers	2399	USD	2016-10-31 14:14:19.644-07	2016-10-31 14:14:19.81-07	696	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	2399	\N	0eea9bce-e912-4bff-a04e-aa6d8e5c8c25	2	696
10938	CREDIT	Global Development	150	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	696	3	\N	2016-06-14 11:14:22.479-07	\N	\N	\N	\N	\N	\N	\N	\N	150	93	50fa295a-0853-4206-8f43-014a9dae7b67	4	696
10945	CREDIT	CONNECT 2016	2452	USD	2016-04-25 17:00:00-07	2016-06-14 11:14:21.896-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2452	99	5ac12ac1-83b5-49a1-879a-1e6f32305c62	14	696
10952	CREDIT	European Leadership Development Workshop -- Transportation, Flight	4728	EUR	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	794	1378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4700	494	99eaa33d-444a-4b9b-a106-dcc975e3ad2f	301	696
10955	CREDIT	Meetup Fees	6000	CAD	2016-12-28 08:30:16.279-08	2016-12-28 08:30:16.279-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	666	2a11904e-9c05-4997-a011-3dd58e7e7461	293	696
10962	CREDIT	Mugs for WWCode-SV	46419	USD	2016-12-20 10:57:28.399-08	2016-12-20 10:57:28.525-08	696	3	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	46419	605	260acc3d-62da-43ac-8d3c-ae445f4e3dfa	300	696
10967	CREDIT	Meetup Fees	6000	USD	2016-12-27 08:59:33.873-08	2016-12-27 08:59:33.873-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	642	a339e4e1-4607-4646-b4bb-334b0130fed4	276	696
10972	CREDIT	Frames for sponsor gifts	4054	USD	2016-11-30 08:11:18.637-08	2016-11-30 08:11:18.805-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	4054	\N	71fbec73-3dac-4e90-b97d-3e8f0a1d10ba	2	696
10976	CREDIT	DIANA A. SCHOLARSHIP GOOGLE I/O	25000	USD	2016-11-21 14:59:43.764-08	2016-11-21 14:59:43.764-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25000	396	ad23e21f-230d-43fd-b30c-9237235782eb	272	696
10980	CREDIT	dinner - downpament	70000	USD	2016-11-03 12:36:06.461-07	2016-11-03 12:36:06.793-07	696	3	1115	\N	\N	\N	\N	\N	\N	\N	\N	\N	70000	\N	593dc98c-bb9b-4f11-b666-abd0ead43312	300	696
10985	CREDIT	Banner	2000	USD	2016-11-29 15:07:29.03-08	2016-11-29 15:07:29.148-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	cec25dbf-0ce8-45f6-9b54-a3ca1ad6d13d	289	696
10990	CREDIT	Marketing Materials	2475	USD	2016-10-05 09:45:14.357-07	2016-10-05 09:45:14.485-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	2475	376	b985d498-4138-4544-9765-4c81759712a9	59	696
10996	CREDIT	90/10 split: AT&T Sponsorship (April 2015)	100000	USD	2016-10-04 08:44:28.558-07	2016-10-04 08:44:28.558-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	389	de1f533b-572b-43c1-861f-d88a4256dd5d	12	696
11001	CREDIT	Plaques for IWD awards ceremony​ 	56402	USD	2017-03-15 06:57:14.454-07	2017-03-15 06:57:14.471-07	835	69	2149	\N	\N	\N	\N	\N	1619	USD	1	-54783	54783	888	1f270218-921d-4f2d-a739-330c6d804a5b	12	696
11005	CREDIT	Two VR headsets for our AR/VR event at Best Buy.	4898	USD	2016-09-27 12:31:43.164-07	2016-09-27 12:31:43.42-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	4898	366	cb2b5422-e486-4922-9391-5c34fa7a0d05	48	696
11011	CREDIT	Minimum Fee - June	995	USD	2016-08-16 07:51:24.796-07	2016-08-16 07:51:24.811-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	995	\N	05c6fc8d-aaab-4600-a60d-764ad3fc7160	12	696
11015	CREDIT	Leadership Tools (director tees)	2698	USD	2015-12-14 16:00:00-08	2016-06-14 11:14:22.114-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2698	192	0b8863f0-4fd4-4c41-98ae-88f63c2ed46d	48	696
11020	CREDIT	June South Hack Night	20568	USD	2016-10-31 14:11:20.573-07	2016-10-31 14:11:20.753-07	696	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	20568	451	9ac5c9ea-887b-465c-87bd-7ff902c7d939	2	696
11025	CREDIT	Regional Leadership Director Training	631	USD	2016-11-29 14:38:46.551-08	2016-11-29 14:38:46.748-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	631	\N	f90cce22-2a56-4a50-ab14-11dbf05e4563	47	696
11029	CREDIT	Wine	1647	USD	2016-10-31 14:15:06.269-07	2016-10-31 14:15:06.517-07	696	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	1647	\N	62951000-0dba-4d8a-8588-35ef00d62106	2	696
11035	CREDIT	Marketing and communications materials for leadership team. 	4264	USD	2016-08-19 10:25:04.062-07	2016-08-19 10:25:04.374-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	4264	\N	0ec60b26-d178-44c9-899d-2ac3aeb2136e	59	696
11040	CREDIT	Minimum Fee - June	1000	USD	2016-08-16 07:55:45.164-07	2016-08-16 07:55:45.179-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	9155b421-92e0-4f55-9b78-a74156a29136	59	696
11044	CREDIT	Global Development	150	USD	2016-07-08 20:52:40.722-07	2016-07-08 20:52:40.722-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	150	93	2823418e-dae1-432d-ba8d-ee7d16392089	4	696
11048	CREDIT	Quarterly planning meeting	14000	USD	2016-05-05 17:18:43.265-07	2016-06-14 11:14:22.011-07	798	32	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	14000	147	4823d7a9-f79f-4742-a775-aee1a4a5e631	14	696
11054	CREDIT	Thank you bags (16) for hackathon speakers and judges, and for pre-hackathon events volunteers and sponsors.  Each bag contains a WWCode Portland coffee mug, a chocolate bar, ghirardellis squares, and a thank you card.	8181	USD	2016-11-22 13:54:33.366-08	2016-11-22 13:54:33.644-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	8181	499	269dd736-5d1b-4dad-8026-b5903a5793bc	59	696
11059	DEBIT	\N	-2040	USD	2016-10-07 09:49:19.978-07	2016-10-07 09:49:19.978-07	713	1446	884	\N	\N	812	125	250	85	USD	1	2500	-2500	\N	85cfc197-7e0a-4ded-9b6f-49ea44f3377a	241	696
11064	DEBIT	\N	-16530	USD	2017-01-03 12:59:37.749-08	2017-01-03 12:59:37.749-08	710	2416	1553	\N	\N	1466	1000	2000	470	USD	1	20000	-20000	\N	2188818a-b86e-4f7e-8d1a-e5c5ed3ef4e4	2	696
11069	DEBIT	Recurring subscription	-52	USD	2016-06-01 22:48:36.714-07	2016-06-01 22:48:36.745-07	705	126	93	\N	\N	95	5	10	33	USD	1	100	-100	\N	3e3ad417-1d55-471f-847c-b26d30917e1d	13	696
10903	CREDIT	IVA Libretas Hackathon	166080	MXN	2016-02-16 10:58:04.663-08	2016-06-14 11:14:21.738-07	822	7	\N	2016-06-14 11:14:22.436-07	\N	\N	\N	\N	\N	\N	\N	\N	166080	34	ff1287cd-019b-4aef-8fd2-674515d04d57	10	696
10908	CREDIT	DJ (ATXDivHack)	35000	USD	2016-10-27 14:08:48.506-07	2016-10-27 14:08:48.71-07	696	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	35000	453	9d50ba53-48bd-43be-a490-d0cfe2ed951f	2	696
10914	CREDIT	WWCode Director shirt	3649	USD	2016-10-17 13:49:16.114-07	2016-10-17 13:49:16.113-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3649	\N	359362ef-09dd-4b46-a6c1-7ec6d99db3d3	282	696
10919	CREDIT	Google I/O stipend	50000	USD	2016-10-11 09:00:21.246-07	2016-10-11 09:00:22.203-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	fd62fc20-9537-4199-b975-4a74ee40d34d	195	696
10923	CREDIT	Net budget balance pre-Open Collective	56266	USD	2016-10-04 14:57:44.218-07	2016-10-04 14:57:44.218-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	56266	394	63c45810-64ec-4a38-9698-bbef917da895	2	696
10930	CREDIT	Almond milk for coffee (ATXDivHack)	1192	USD	2016-10-31 14:13:53.591-07	2016-10-31 14:13:53.747-07	696	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	1192	446	314bcd7f-25c6-4733-b156-0779544706ca	2	696
10933	CREDIT	Markers, pens, sticky notes (ATXDivHack)	2108	USD	2016-10-31 14:13:19.592-07	2016-10-31 14:13:19.745-07	696	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	2108	448	34ed6c7b-d614-41a0-af46-e3dda92756d8	2	696
10940	CREDIT	 Network budget balance pre Open Collective	4356	USD	2016-10-04 15:37:57.159-07	2016-10-04 15:37:57.359-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4356	\N	c821970d-9332-4e36-9435-ee3d15874261	273	696
10943	CREDIT	Test	1000	USD	2016-10-11 09:18:39.252-07	2016-10-11 09:18:39.252-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	413	0d1e12eb-f55a-4e64-916f-b8dac8db6759	195	696
10949	CREDIT	Feb 4 hack night	10284	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.784-07	848	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	10284	53	aab8fb9c-d875-4bed-81d1-0eb7081cdea8	2	696
10954	CREDIT	WwConnect Conference	658	USD	2016-03-19 17:00:00-07	2016-06-14 11:14:21.806-07	767	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	658	63	6bb12840-92c0-46bb-86d8-19097f0adb5a	14	696
10958	CREDIT	45 webcam covers + shipping	9685	USD	2016-12-21 07:39:46.852-08	2016-12-21 07:39:47.49-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9685	\N	befba8c8-6341-4bcc-9929-4c033399b9cf	59	696
10963	CREDIT	Robotics: Coding with Your Kids HackNight Supplies	20397	USD	2016-12-19 08:20:39.625-08	2016-12-19 08:20:40.499-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	20397	604	b32efe56-22bc-410f-87f8-f55bcea908b6	48	696
10968	CREDIT	Leadership Event in Sofia	1019	EUR	2016-12-07 13:30:48.339-08	2016-12-07 13:30:48.523-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	1019	470	5f899775-6384-4f82-bd0d-764258eccdfc	301	696
10973	CREDIT	Postage to send hackathon gifts to sponsors	1628	USD	2016-11-30 08:09:00.364-08	2016-11-30 08:09:00.529-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	1628	\N	68fbd1df-07a3-4de6-8651-811072b71687	2	696
10977	CREDIT	Food (ATXDivHack)	119954	USD	2016-11-18 13:01:43.887-08	2016-11-18 13:01:44.336-08	696	3	1189	\N	\N	\N	\N	\N	\N	\N	\N	\N	119954	466	6397c391-24a3-4e15-8231-f6a54323752e	2	696
10984	CREDIT	lunch ordered at Costco	64978	USD	2016-10-28 14:30:59.537-07	2016-10-28 14:30:59.772-07	696	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	64978	418	42003028-1ea2-4bf2-9a8c-88fcfaae96b8	300	696
10989	CREDIT	Stickers	62984	USD	2016-10-06 08:49:20.942-07	2016-10-06 08:49:20.967-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	62984	\N	813ecb96-3eee-4df8-8cf1-6eb00d5d2663	4	696
10994	CREDIT	Google I/O: Alicia Carr	10000	USD	2016-10-04 08:44:35.988-07	2016-10-04 08:44:35.988-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	387	665f2281-f8c6-4bdb-bdaa-561031d4f084	12	696
11000	CREDIT	Food for monthly hack night from Antonino Bertolo's Pizza & Wine Bar.	4351	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	844	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4300	483	326a03e0-ee1b-46dc-8e75-e6d7e70a7d02	273	696
11006	CREDIT	Event food	3224	USD	2016-09-13 07:57:04.698-07	2016-09-13 07:57:05.111-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	3224	346	8caa7a9e-6a88-431b-9cc9-af6d00384983	59	696
11010	CREDIT	Pizza for July monthly event.	12555	USD	2016-08-16 07:52:47.781-07	2016-08-16 07:52:47.799-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	12555	\N	e5d7aa66-b9cf-4a7d-aeb9-2620e799f4be	15	696
11016	CREDIT	Conference Grant	50000	MXN	2016-05-16 07:49:37.27-07	2016-06-14 11:14:22.052-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	164	4523143e-0b09-4851-88ff-17ab7edc736f	10	696
11021	CREDIT	May AI Workshop	26800	USD	2016-10-31 14:10:54.112-07	2016-10-31 14:10:54.327-07	696	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	26800	452	a7a1fc46-60b7-4c32-a9d4-5ea32f612b47	2	696
11027	CREDIT	Director t-shirt	3186	USD	2016-10-17 13:58:31.776-07	2016-10-17 13:58:31.789-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3186	\N	58638052-2b22-43ad-8696-c51b0ae8031c	271	696
11032	CREDIT	Career development event w/ Mike Ross	65000	USD	2016-10-11 17:42:04.584-07	2016-10-11 17:42:04.834-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	65000	\N	0bad048c-5eea-41d2-990f-6da1a707b806	48	696
11036	CREDIT	STEM Toys for Coding with Kids Event	8496	USD	2016-08-16 07:58:01.764-07	2016-08-16 07:58:01.789-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	8496	294	2a435335-e5c7-4831-944a-aed81259dc5d	48	696
11041	CREDIT	Minimum fee - June	1000	USD	2016-08-16 07:53:58.922-07	2016-08-16 07:53:58.936-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	4f162da2-fa1a-4330-aecb-2385391472c6	15	696
11046	CREDIT	Conference stipend Elizabeth M.	75000	USD	2016-10-11 09:01:27.317-07	2016-10-11 09:01:28.351-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75000	\N	c5c43f2b-1ae9-46a0-9c4a-d5e05898cfed	195	696
11051	DEBIT	Donation to WWCode Washington DC	-82070	USD	2016-06-06 17:53:47.603-07	2016-06-06 17:53:47.649-07	743	555	381	\N	\N	316	5000	10000	2930	USD	1	100000	-100000	\N	a08914d5-8290-4fb0-a7ed-2c7418368b60	13	696
11055	CREDIT	Leadership Development Lodging	64600	USD	2016-11-21 13:26:46.916-08	2016-11-21 13:26:46.916-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	64600	\N	16a99b75-1c6b-4d8c-a43d-799147e44b3e	12	696
11061	DEBIT	\N	-798	USD	2017-05-08 22:59:15.573-07	2017-05-08 22:59:15.573-07	712	4711	2855	\N	\N	2750	50	100	52	USD	1	1000	-1000	\N	1eb2b734-e774-4019-9977-0f523f982eb4	517	696
11065	DEBIT	\N	-16530	USD	2016-11-30 08:11:42.049-08	2016-11-30 08:11:42.049-08	711	1957	1296	\N	\N	1215	1000	2000	470	USD	1	20000	-20000	\N	80e5558f-ca5a-422d-8894-ff7d3e06111d	2	696
11071	DEBIT	Banner	-2000	USD	2016-11-29 15:07:15.153-08	2016-11-29 15:07:15.39-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	5c32813d-3017-40c5-b151-a3586d3cb6d8	289	696
10912	CREDIT	Monthly team meeting w core six members. Food/pizza	3323	USD	2016-10-31 14:02:15.762-07	2016-10-31 14:02:16.402-07	696	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	3323	400	44623614-7ba3-4d6d-b896-85f62a0391cc	14	696
10917	CREDIT	Director t-shirt	2860	USD	2016-10-17 13:56:00.744-07	2016-10-17 13:56:00.777-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2860	\N	bbaef022-30f8-49a1-b5b1-70ae4970673b	12	696
10921	CREDIT	Drinks at Sept monthly event	2192	USD	2016-10-04 15:06:33.802-07	2016-10-04 15:06:34.357-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	2192	\N	a2a169d0-644e-4129-b089-c170ce586538	15	696
10927	CREDIT	Conference Grant - Sarah Olson	20000	USD	2016-05-25 09:39:09.882-07	2016-06-14 11:14:22.103-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	190	69044d98-40be-4d8a-8574-120a7dcb6f6a	48	696
10931	CREDIT	Drinks for Happy Hour (ATXDivHack)	5518	USD	2016-10-31 14:13:39.794-07	2016-10-31 14:13:40.146-07	696	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	5518	447	17d92f82-c25e-4d95-9c1d-8403606d2843	2	696
10936	CREDIT	Global Developement	150	USD	2016-04-12 11:46:49.263-07	2016-06-14 11:14:21.849-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	150	79	910fc47f-7e2f-4a32-bb1c-71dcde6de7a5	4	696
10941	CREDIT	Global Development	100	USD	2016-04-15 10:29:50.291-07	2016-06-14 11:14:21.861-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100	86	6f881f01-159a-4cef-b52b-eb851e5c6ae4	13	696
10947	CREDIT	Global Developement	100	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	696	3	\N	2016-06-14 11:14:22.48-07	\N	\N	\N	\N	\N	\N	\N	\N	100	97	7391d5f2-7b99-437a-9ea7-7925b1724758	13	696
10951	CREDIT	Food/Drinks for Leadership Team Meeting - Gen, Claire, Halima - Sept 2016	6000	GBP	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	831	1333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	506	ba09f427-bcbb-4109-a22e-aadb9d47416e	278	696
10957	CREDIT	Meetup Fees	6000	USD	2016-12-28 08:32:19.412-08	2016-12-28 08:32:19.412-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	667	5124dbc5-d3ee-49ee-b31c-4cbc1d9b8a4c	294	696
10961	CREDIT	Leadership - Planning for 2017 - Afternoon Coffee	1175	USD	2016-12-19 10:42:59.021-08	2016-12-19 10:42:59.545-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	1175	601	b14b120b-0b2d-46e7-9fa5-4034a3644d97	48	696
10965	CREDIT	Meetup Fees	6000	USD	2016-12-27 09:27:09.602-08	2016-12-27 09:27:09.602-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	644	85694d1c-bf38-4342-983b-c0e87b7a19de	279	696
10971	CREDIT	Goodie Bags	1058	USD	2016-12-07 12:49:55.814-08	2016-12-07 12:49:56.33-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	1058	573	fbab0b34-08e5-4df6-a8f2-412daa996f39	59	696
10975	CREDIT	Food (ATXDivHack)	339421	USD	2016-11-21 07:23:08.279-08	2016-11-21 07:23:08.279-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	339421	467	3c56ea2c-d928-4f62-b90d-459ead191b88	2	696
10981	CREDIT	Google DevFest event that WWC sponsored and attended. Two large banners. Table cloth. Plus my luggage since I went directly from airport. 	1305	USD	2016-10-31 10:52:11.82-07	2016-10-31 10:52:12.734-07	696	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	1305	427	99128334-1cb1-4fd5-976c-692d3074944e	14	696
10986	CREDIT	Snacks and dessert	38874	USD	2016-12-06 09:02:53.61-08	2016-12-06 09:02:54.44-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	38874	\N	e91ad2de-4b38-46e0-b25d-c1976a6df9da	59	696
10991	CREDIT	Event Food	7167	USD	2016-10-05 09:44:47.862-07	2016-10-05 09:44:48.013-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	7167	378	18376dda-5c1f-4d25-9133-d45f2ef88ffd	59	696
10995	CREDIT	Beverage for Denver June meetup	2279	USD	2016-10-04 15:09:25.159-07	2016-10-04 15:09:26.045-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	2279	\N	dbbfbf3c-9be3-4e38-90f7-5231d18fff67	15	696
10999	CREDIT	Mar 3 hack night	4951	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.784-07	848	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	4951	55	dae13349-242b-45cd-a75a-2f93f640ef97	2	696
11003	CREDIT	Libretas Hackathon	1038000	MXN	2016-02-16 10:56:17.216-08	2016-06-14 11:14:21.738-07	822	7	\N	2016-06-14 11:14:22.435-07	\N	\N	\N	\N	\N	\N	\N	\N	1038000	33	ec82f883-43cb-454f-858c-c10a100518c2	10	696
11007	CREDIT	Coding books for our study groups (Humble Bundle -- Joy of Coding)	1500	USD	2016-08-19 13:58:54.527-07	2016-08-19 13:58:54.67-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500	318	196a5a4e-bb57-4d51-90f1-2714fcedc765	48	696
11012	CREDIT	Food for Denver Meetup	9939	USD	2016-08-16 07:52:04.669-07	2016-08-16 07:52:04.682-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	9939	\N	26ee12cb-68e6-4af6-b6ba-1a076a5c90c6	15	696
11018	CREDIT	Meetup Donation Transaction Fee	163	USD	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.849-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	163	81	e6ef3a59-4305-4c24-b962-77ef17bf47be	4	696
11023	CREDIT	Conference stipend Olivia F.	39585	GBP	2016-10-07 06:35:08.613-07	2016-10-07 06:35:08.724-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	39585	\N	c6d82862-2911-47f4-be34-427ce393e55f	278	696
11026	CREDIT	05-21-16 AI workshop	30000	USD	2016-10-31 14:16:09.23-07	2016-10-31 14:16:09.38-07	696	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	30000	186	70f7b86e-ac1d-486b-8ef6-2a7a900207df	2	696
11031	CREDIT	90/10 split: Beth Laing	500	USD	2016-10-04 09:06:09.85-07	2016-10-04 09:06:09.85-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500	391	28311634-7f09-4126-89fa-fa4e470a1d7c	12	696
11037	CREDIT	STEM Toys for Coding with Kids Event	10212	USD	2016-08-16 07:58:32.03-07	2016-08-16 07:58:32.041-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	10212	293	69e77fe9-28ea-41d4-9325-41f81ccd8b65	48	696
11042	CREDIT	Thank you materials for several events.	6198	USD	2016-08-19 10:31:26.428-07	2016-08-19 10:31:26.891-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	6198	\N	f092c356-29d5-418f-be16-ef374da38152	59	696
11047	CREDIT	Cash for Prizes/Bartender (the extra money, $50, was not used for the hackathon)	70000	USD	2016-11-01 08:16:29.544-07	2016-11-01 08:16:30.012-07	696	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	70000	\N	811c51a1-b75e-4092-aa81-c4181c36d47f	2	696
11052	CREDIT	Meetup Fees	6000	USD	2016-12-27 11:50:16.992-08	2016-12-27 11:50:16.992-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	656	867dd311-f1d7-4af9-8c70-6b0c104533d6	288	696
11057	CREDIT	food/drink for organizers of NODE workshop (had to buy from on-site snack bar)	2838	USD	2016-11-03 14:13:31.956-07	2016-11-03 14:13:32.241-07	696	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	2838	409	d5f328f0-5c49-4828-8666-432016beed65	12	696
11062	DEBIT	Donation to WWCode Austin	-123120	USD	2016-06-06 12:04:37.186-07	2016-06-06 12:04:37.308-07	782	551	377	\N	\N	312	7500	15000	4380	USD	1	150000	-150000	\N	556fc5b9-84a4-4d17-8482-2554429f7bcd	2	696
11068	DEBIT	Donation to WWCode Washington DC	-52	USD	2016-03-01 20:41:59.916-08	2016-04-16 13:40:58.728-07	705	126	93	\N	\N	95	5	10	33	USD	1	100	-100	\N	6619db51-338c-4311-bcef-e5180f8bfea1	13	696
2307	CREDIT	Donation Pamela V.	4500	USD	2016-10-06 11:09:54.319-07	2016-10-06 11:09:54.357-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4500	\N	20459f3e-47a2-42c8-8f77-9bdc17072479	696	696
2243	CREDIT	Donation via Meetup	2036	USD	2016-10-04 09:42:35.996-07	2016-10-04 09:42:36.119-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2036	\N	ed01102f-16a4-4587-97a7-eb6ba81c5728	696	696
2244	CREDIT	Donation via Meetup	1203	USD	2016-10-04 09:46:07.882-07	2016-10-04 09:46:07.993-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1203	\N	bbbc1082-58db-4cc2-b14d-7cadc2caabe8	696	696
2245	CREDIT	Donation received via Meetup, less fees	788	USD	2016-10-04 09:46:13.302-07	2016-10-04 09:46:13.487-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	788	\N	c144fa0c-6234-4fa9-ad5e-e1e1137cdb08	696	696
2254	CREDIT	Network budget balance pre Open Collective	34240	USD	2016-10-04 14:49:31.268-07	2016-10-04 14:49:31.543-07	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34240	\N	ea63f818-0bf1-4576-acd3-559644fa6d35	696	696
2301	CREDIT	Blurb donation	54000	USD	2016-10-06 09:06:35.799-07	2016-10-06 09:06:36.235-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	54000	\N	634f797f-873a-43f3-9ce9-3df9e5244c4d	696	696
2255	CREDIT	Network Development	10000	USD	2016-10-04 14:50:13.582-07	2016-10-04 14:50:13.787-07	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	42761f67-0665-4e8b-bf08-83f8d2d853dc	696	696
2256	CREDIT	Network Development: Three Year Bonus:)	50000	USD	2016-10-04 14:52:32.839-07	2016-10-04 14:52:32.962-07	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	e2c9207b-a9aa-48e5-9d97-78fd589d86c9	696	696
9696	CREDIT	\N	30000	USD	2017-05-03 10:33:13.688-07	2017-05-03 10:33:13.688-07	51	3	\N	\N	\N	2694	0	0	0	USD	1	30000	30000	\N	bb0ff0a8-b5fd-44c9-ab0b-bf65a00eabbe	696	696
9698	CREDIT	\N	75000	USD	2017-05-03 10:44:10.84-07	2017-05-03 10:44:10.84-07	12	3	\N	\N	\N	2696	0	0	0	USD	1	75000	75000	\N	0d740b6b-249c-4c33-97ec-a5767b5a5799	696	696
9699	CREDIT	\N	15000	USD	2017-05-03 10:44:48.715-07	2017-05-03 10:44:48.715-07	51	3	\N	\N	\N	2697	0	0	0	USD	1	15000	15000	\N	0bbb8fb9-a8dc-4ee6-8a86-2bee0302b879	696	696
2298	CREDIT	Network Development (Stickers)	62984	USD	2016-10-06 08:49:44.329-07	2016-10-06 08:49:44.472-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	62984	\N	6f7df12e-1d15-40b9-8987-ae637eede1ee	696	696
2309	CREDIT	Network budget pre Open Collective 	406519	USD	2016-10-06 11:36:30.275-07	2016-10-06 11:36:30.298-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	406519	\N	6404bfb0-eb77-4649-a55a-6fbb57c82691	696	696
2311	CREDIT	Donations via Meetup	3937	USD	2016-10-06 11:41:35.464-07	2016-10-06 11:41:35.487-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3937	\N	5b67f243-796f-46e5-b77c-c13405674c39	696	696
9714	CREDIT	\N	2175	USD	2017-05-03 17:12:19.814-07	2017-05-03 17:12:19.814-07	259	3	\N	\N	\N	2702	0	0	0	USD	1	2175	2175	\N	e7f2e24e-6899-46c4-919d-dd1cb2d3838c	696	696
2342	CREDIT	Network Development +	50000	USD	2016-10-07 13:24:13.595-07	2016-10-07 13:24:13.706-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	b12c8806-5c99-46cf-8ae9-9f338888f266	696	696
2430	CREDIT	Network budget pre Open Collective 	162598	USD	2016-10-11 22:01:43.648-07	2016-10-11 22:01:43.828-07	264	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	162598	\N	4ec8f1b9-f12f-4ec8-962e-29aa026ead03	696	696
2404	CREDIT	Network Development	10000	USD	2016-10-11 09:52:38.277-07	2016-10-11 09:52:38.455-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	9c530187-e104-440b-ab25-54418876db12	696	696
2530	CREDIT	WWCode Director t-shirt	3649	USD	2016-10-17 13:50:42.245-07	2016-10-17 13:50:42.273-07	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3649	\N	b8eabdbe-fc85-4747-a409-0b5a0c49f817	696	696
2532	CREDIT	Director t-shirt	2860	USD	2016-10-17 13:55:47.647-07	2016-10-17 13:55:47.671-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2860	\N	e973ee0b-ec29-44b5-b658-5e1585b44f89	696	696
2536	CREDIT	Director t-shirt	3186	USD	2016-10-17 13:58:21.952-07	2016-10-17 13:58:22.083-07	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3186	\N	ab3a189e-8523-443a-bd54-f8824c3498dc	696	696
10916	CREDIT	Stickers for ATXDivHack 	15300	USD	2016-10-31 14:15:38.727-07	2016-10-31 14:15:38.89-07	696	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	15300	\N	adfd29f2-1354-4339-8b92-979f2f245990	2	696
10922	CREDIT	Conference stipend Udisha S.	75000	USD	2016-10-06 10:21:09.865-07	2016-10-06 10:21:09.933-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75000	\N	90492d84-4873-4921-88e5-6d6224783728	13	696
10926	CREDIT	Conference Grant	15000	USD	2016-05-24 12:42:50.307-07	2016-06-14 11:14:22.103-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15000	188	76a69fcc-b5c6-439e-9c2b-4a9484d72c0c	13	696
10932	CREDIT	Gift for organizer	3499	USD	2016-10-31 14:14:38.997-07	2016-10-31 14:14:39.22-07	696	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	3499	\N	fa47c723-95fc-4137-9423-4cbee5eabac5	2	696
10937	CREDIT	Network support - Regional Leadership (thanks VMWare)	370000	USD	2016-10-11 12:51:28.361-07	2016-10-11 12:51:28.677-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	370000	\N	3b710866-4d5b-4d25-987b-fd556770c01a	262	696
10942	CREDIT	Global Development	100	USD	2016-04-26 20:56:08.086-07	2016-06-14 11:14:21.897-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100	101	b7b8c51e-5920-4e78-8622-5a7cb02a02a9	13	696
10946	CREDIT	CONFERENCE GRANT	80000	USD	2016-05-31 10:47:01.276-07	2016-06-14 11:14:22.123-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	80000	198	d4af9dc4-7dbe-49e3-ac71-135f9560f23c	13	696
10950	CREDIT	Feb 1, Lightning Talks	0	USD	2016-03-20 11:06:09.887-07	2016-03-29 13:37:47.75-07	848	28	\N	2016-03-28 17:00:00-07	\N	\N	\N	\N	\N	\N	\N	\N	22568	\N	0f4ef12a-2087-4f88-8735-e5f27aa05e1b	2	696
10956	CREDIT	Meetup Fees	4900	GBP	2016-12-23 10:04:05.755-08	2016-12-23 10:04:05.755-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4900	624	c20f1368-443e-4d37-8c45-3ce21153bbbb	267	696
10960	CREDIT	Leadership - Planning for 2017 - Evening Coffee	875	USD	2016-12-19 10:43:53.809-08	2016-12-19 10:43:54.334-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	875	603	cbb9115a-da1e-414a-83df-af6282586021	48	696
10966	CREDIT	Meetup Fees	6000	USD	2016-12-27 09:03:23.101-08	2016-12-27 09:03:23.101-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	643	20fabe9a-04c8-41b9-9ffb-042e4ad40f46	277	696
10970	CREDIT	We Code Hackathon 2016	2374	USD	2016-12-06 08:50:34.842-08	2016-12-06 08:50:35.964-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	2374	500	a72e5428-4a83-40c2-abcb-7e071484701a	59	696
10978	CREDIT	Mathews Group 	60000	USD	2016-11-29 13:45:09.136-08	2016-11-29 13:45:09.136-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	60000	\N	0b10d228-ab9f-4220-ad1e-abdad6875b00	14	696
10982	CREDIT	Cash for Prizes/Bartender	50000	USD	2016-11-01 08:15:55.737-07	2016-11-01 08:15:55.892-07	696	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	62a70083-8a04-4ec5-9770-8a90f3f243dc	2	696
10988	CREDIT	Leadership Development - speaking event	25000	USD	2016-11-29 14:39:25.11-08	2016-11-29 14:39:25.31-08	696	3	\N	2016-11-28 16:00:00-08	\N	\N	\N	\N	\N	\N	\N	\N	25000	\N	3391879c-8bac-4979-adfd-a29b4e840756	47	696
10992	CREDIT	Event Food	2077	USD	2016-10-05 09:43:28.448-07	2016-10-05 09:43:28.644-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	2077	374	7599d5d4-5a9f-470a-91f7-9bd4cf933e91	59	696
10997	CREDIT	My coworker donated his evening to giving demos of his personal Oculus Rift for our AR/VR event, so I sent him a gift card to thank him for his help with the event.	2500	USD	2016-09-27 12:33:54.08-07	2016-09-27 12:33:54.272-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500	367	873d815c-87b6-4c17-9733-d213acb4a17b	48	696
11002	CREDIT	WWC Stickers	7000	USD	2016-03-17 17:00:00-07	2016-06-14 11:14:21.998-07	756	68	\N	2016-06-14 11:14:22.481-07	\N	\N	\N	\N	\N	\N	\N	\N	7000	138	5a6e410c-b2a7-4b9c-97c9-71730355106e	15	696
11008	CREDIT	Global Development	10000	USD	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.849-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	80	ac7f2860-4247-440e-9a88-b7813ad3df58	59	696
11013	CREDIT	Event food	2911	USD	2016-09-15 17:09:43.149-07	2016-09-15 17:09:43.531-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	2911	345	1d60e9a5-9c0a-494e-9d62-eb08ad6ff1dd	59	696
11017	CREDIT	Stacey Schipper Reimbursement	2322	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.873-07	696	3	\N	2016-06-14 11:14:22.471-07	\N	\N	\N	\N	\N	\N	\N	\N	2322	92	ab8c95b1-d75c-408d-9430-ef5ab89254cc	15	696
11022	CREDIT	Meetup Fee	6000	USD	2016-12-27 08:52:46.242-08	2016-12-27 08:52:46.242-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	640	4d1e7fa9-a543-4bdc-ba45-d366acb0272b	274	696
11028	CREDIT	Sodas for ATXDivHack 	3871	USD	2016-10-31 14:15:22.809-07	2016-10-31 14:15:22.98-07	696	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	3871	\N	9ef74944-37fb-4e91-9406-80b5ffabf41b	2	696
11033	CREDIT	90/10 split: Turner matching donation	500	USD	2016-10-04 09:06:02.036-07	2016-10-04 09:06:02.036-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500	393	df41ad64-385c-4642-8ec5-2bc9b3343ee9	12	696
11038	CREDIT	Minimum Fee - May	1000	USD	2016-08-16 07:55:31.274-07	2016-08-16 07:55:31.288-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	d58a2078-7620-4b63-befd-b11bd9b8c2d4	59	696
11045	CREDIT	Global Development	5000	USD	2016-02-21 16:00:00-08	2016-06-14 11:14:22.186-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000	227	9e4bf877-8d2f-40d4-9702-8565b247a5da	59	696
11050	DEBIT	\N	-786	CAD	2017-05-10 16:45:46.737-07	2017-05-10 16:45:46.737-07	748	4749	2888	\N	\N	2783	36	71	46	USD	1.39860139860140009	715	-1000	\N	ce0c1d7a-1255-4e22-bd1a-bd6d944199ad	522	696
11056	CREDIT	TShirts	145786	USD	2016-11-21 13:26:37.469-08	2016-11-21 13:26:37.469-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	145786	\N	a8ebf87b-5be1-42cd-b7a2-5cf9622e05e0	59	696
11060	DEBIT	\N	-10320	USD	2016-10-06 11:36:38.382-07	2016-10-06 11:36:38.382-07	714	1438	880	\N	\N	808	625	1250	305	USD	1	12500	-12500	\N	274620be-2403-4945-8dd8-251a7940ec75	2	696
11066	DEBIT	\N	-41370	USD	2016-11-17 09:43:29.797-08	2016-11-17 09:43:29.797-08	709	1808	1179	\N	\N	1098	2500	5000	1130	USD	1	50000	-50000	\N	344b009b-f9bd-43ec-a5db-0454a52b52a6	59	696
11070	DEBIT	Recurring subscription	-52	USD	2016-05-01 22:44:10.046-07	2016-05-01 22:44:10.072-07	705	126	93	\N	\N	95	5	10	33	USD	1	100	-100	\N	cf35fb5f-29a5-4a42-8d18-3ed964780f25	13	696
10925	CREDIT	Photographer: Mike Ross	65000	USD	2016-01-05 16:00:00-08	2016-06-14 11:14:22.114-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	65000	193	048f7939-ade7-409e-8b46-1e6fba7e2e8b	48	696
10928	CREDIT	Painters tape for signs  	1136	USD	2016-10-31 14:14:51.746-07	2016-10-31 14:14:51.945-07	696	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	1136	445	a099f323-3ece-4b83-afeb-054b03401590	2	696
10935	CREDIT	Global Development	0	USD	2016-04-12 11:52:16.188-07	2016-04-12 14:19:43.124-07	696	3	\N	2016-04-12 14:19:43.124-07	\N	\N	\N	\N	\N	\N	\N	\N	150	\N	5f498d88-6e6c-49c2-aeab-94613e8e2ac1	4	696
10939	CREDIT	Global Development	150	USD	2016-04-27 09:21:00.228-07	2016-06-14 11:14:21.907-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	150	103	a2107473-21cf-4b5d-b4c6-357bb52eede9	48	696
10944	CREDIT	test 	0	USD	2016-04-06 10:39:39.954-07	2016-04-06 10:46:25.532-07	696	3	\N	2016-04-06 10:46:25.531-07	\N	\N	\N	\N	\N	\N	\N	\N	100	\N	2a0a009d-45d9-422a-8c86-c736d4c5fc5a	14	696
10948	CREDIT	Mar 7 Lightning Talks	15316	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.794-07	848	28	\N	2016-06-14 11:14:22.455-07	\N	\N	\N	\N	\N	\N	\N	\N	15316	57	8f808733-6768-4286-a07f-f4aa6e72f125	2	696
10953	CREDIT	European Leadership Development Workshop -- Transportation, Taxi	4400	EUR	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	794	1378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4400	493	0a32be15-3fc8-421d-9ace-086514c1ad09	301	696
10959	CREDIT	Website - Domain Name	2200	USD	2016-12-22 14:19:51.088-08	2016-12-22 14:19:52.143-08	696	3	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	2200	372	213897ee-e89f-4bc4-9a42-7ebde803cdb8	48	696
10964	CREDIT	3D Printer & Supplies	30496	USD	2016-12-14 05:03:21.144-08	2016-12-14 05:03:21.949-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	30496	591	a8614c27-4f91-4a00-b957-ec7e07e133e3	48	696
10969	CREDIT	Meetup Fees	6000	USD	2016-12-27 08:55:07.385-08	2016-12-27 08:55:07.385-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	641	b123de3b-d24a-4b45-b9cc-ca92e13cef21	275	696
10974	CREDIT	Thank you cards, Christmas cards, stamps (for hackathon and all 2016 sponsors)	4874	USD	2016-11-22 13:55:10.575-08	2016-11-22 13:55:10.713-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	4874	498	79c5ef29-00ad-43e2-8f13-8258434b9246	59	696
10979	CREDIT	Conference Travel	53720	USD	2016-11-03 14:27:22.46-07	2016-11-03 14:27:22.847-07	696	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	53720	333	349b0c9e-bfe8-486f-ab40-2fde44876c21	48	696
10983	CREDIT	Gift Card for Volunteer	10000	USD	2016-10-27 14:03:46.196-07	2016-10-27 14:03:46.328-07	696	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	fd536b7e-f5ff-403e-a9bb-318d7019c709	300	696
10987	CREDIT	Conference stipend - Gen A.	102409	GBP	2016-10-07 06:10:14.088-07	2016-10-07 06:10:14.841-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	102409	\N	4e17acf4-4cb1-4985-a54f-a5d120898077	278	696
10993	CREDIT	Event supplies	2715	USD	2016-10-05 09:44:00.394-07	2016-10-05 09:44:00.521-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	2715	375	5f9c58cc-38e3-41f3-83c9-cf8fdcfbf3db	59	696
10998	CREDIT	May 5 South Hack Night	5325	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.083-07	848	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	5325	181	8c92983d-62bd-4123-a40a-c4ba7a4b3b93	2	696
11004	CREDIT	Meetup Fees	6000	USD	2016-12-27 08:16:27.082-08	2016-12-27 08:16:27.082-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	633	b158cb8b-270f-4345-be99-01f38ea1cfeb	271	696
11009	CREDIT	Minimum fee - May	990	USD	2016-08-16 07:53:06.001-07	2016-08-16 07:53:06.015-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	990	\N	fb317387-319e-4046-935b-2683514c8afd	13	696
11014	CREDIT	Reimburse Caterina Paun for supplies and mailing expenses	5504	USD	2015-12-14 16:00:00-08	2016-06-14 11:14:22.175-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5504	225	8ccfc548-6a10-4a62-bd64-f579e1750106	59	696
11019	CREDIT	Google i/o travel stipend for Yelyzaveta (plus $12 transfer fees)	101200	USD	2017-05-04 12:06:09.002-07	2017-05-04 12:06:09.002-07	696	3	\N	\N	\N	\N	\N	\N	0	USD	1	-101200	101200	1099	29eb42ae-97e5-4dce-bf5e-49546ec80f17	430	696
11024	CREDIT	Leadership Tshirt Order	2698	USD	2016-12-07 08:51:43.784-08	2016-12-07 08:51:44.214-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	2698	\N	52180af9-777f-4de8-b3da-ab633bbf2240	59	696
11030	CREDIT	Network Budget pre Open Collective	11797	USD	2016-10-11 09:52:07.045-07	2016-10-11 09:52:07.303-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11797	\N	c1778adf-bcc4-40ec-b2fa-ae8000aa0450	59	696
11034	CREDIT	Global Development	250	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	250	96	ccf62ef8-fecd-449c-98c1-b2830a7b7d2b	48	696
11039	CREDIT	Minimum Fee - June	995	USD	2016-08-16 07:55:14.822-07	2016-08-16 07:55:14.844-07	696	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	995	\N	0269911e-9027-4fe3-b135-f22aca487c52	48	696
11043	CREDIT	FedEx Office	3418	USD	2016-01-24 16:00:00-08	2016-06-14 11:14:22.114-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3418	195	bfa8015f-c834-4b0f-92d4-05d9f0077471	48	696
11049	CREDIT	Farewell lunch for Clarissa + Welcome lunch for Pranoti 	11500	USD	2017-05-16 14:55:26.725-07	2017-05-16 14:55:26.725-07	798	32	\N	\N	\N	\N	\N	\N	0	USD	1	-11500	11500	1119	b9e0c417-0ed0-43f6-8ab6-804f13bb6b3e	14	696
11053	CREDIT	Meetup Fees	6000	USD	2016-12-27 11:46:50.958-08	2016-12-27 11:46:50.958-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	655	d284b32b-c088-4f3c-b16e-d1aaef2e8a3b	287	696
11058	CREDIT	Order for stickers of our official WWC Boulder/Denver chapter logo	7800	USD	2016-11-03 12:45:23.582-07	2016-11-03 12:45:24.25-07	696	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	7800	48	84366d19-d431-4d9c-b4e1-22ba67c873b7	15	696
11063	DEBIT	\N	-165570	USD	2016-09-01 07:41:36.24-07	2016-09-01 07:41:36.24-07	739	1094	707	\N	\N	622	10000	20000	4430	USD	1	200000	-200000	\N	2afabe22-9840-455f-b76e-16dbfcb0ee33	2	696
11067	DEBIT	Recurring subscription	-52	USD	2016-04-02 08:43:33.706-07	2016-04-16 13:40:58.808-07	705	126	93	\N	\N	95	5	10	33	USD	1	100	-100	\N	b12570d0-0b7a-43f5-a872-605fa2c4a251	13	696
670	DEBIT	FedEx Office	-3418	USD	2016-01-24 16:00:00-08	2016-06-14 11:14:22.114-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3418	195	2b7ba22c-916e-45dc-842c-8f7137976c4f	696	696
867	DEBIT	Global Development	-5000	USD	2016-02-21 16:00:00-08	2016-06-14 11:14:22.186-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5000	227	6b865d7e-c324-4c7a-85cd-1ba0aefb8303	696	696
1629	DEBIT	Thank you materials for several events.	-6198	USD	2016-08-19 10:31:26.428-07	2016-08-19 10:31:26.891-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6198	\N	0b7f4317-3b95-47d5-89f9-245314e16769	696	696
1581	DEBIT	Minimum fee - June	-1000	USD	2016-08-16 07:53:58.922-07	2016-08-16 07:53:58.936-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	92e56306-3684-425f-b356-b67d306a0ae2	696	696
1586	DEBIT	Minimum Fee - June	-1000	USD	2016-08-16 07:55:45.164-07	2016-08-16 07:55:45.179-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	2ed495af-5080-42ac-b381-905d29be571e	696	696
1584	DEBIT	Minimum Fee - June	-995	USD	2016-08-16 07:55:14.822-07	2016-08-16 07:55:14.844-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-995	\N	e344373f-1e6d-416d-be2b-9ac1ce4866f4	696	696
1585	DEBIT	Minimum Fee - May	-1000	USD	2016-08-16 07:55:31.274-07	2016-08-16 07:55:31.288-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	17d4be5b-521f-499f-8753-2dbc163f2ec4	696	696
1587	DEBIT	STEM Toys for Coding with Kids Event	-8496	USD	2016-08-16 07:58:01.764-07	2016-08-16 07:58:01.789-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-8496	294	bd8d9663-a174-448f-94f5-5e6707eb538d	696	696
1588	DEBIT	STEM Toys for Coding with Kids Event	-10212	USD	2016-08-16 07:58:32.03-07	2016-08-16 07:58:32.041-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10212	293	40c6d6e9-1a20-4f97-b460-2a318d202796	696	696
1628	DEBIT	Marketing and communications materials for leadership team. 	-4264	USD	2016-08-19 10:25:04.062-07	2016-08-19 10:25:04.374-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4264	\N	fa3527b7-d566-447a-a671-3b80486e9c18	696	696
376	DEBIT	Global Development	-250	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-250	96	ee258704-7659-4305-bd34-807117acf1d4	696	696
2238	DEBIT	90/10 split: Turner matching donation	-500	USD	2016-10-04 09:06:02.036-07	2016-10-04 09:06:02.036-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-500	393	9fcd3132-9867-42dc-85ce-b7435cb35563	696	696
2239	DEBIT	90/10 split: Beth Laing	-500	USD	2016-10-04 09:06:09.85-07	2016-10-04 09:06:09.85-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-500	391	63e96179-a81b-4fba-880f-bc5d5a9f9e51	696	696
2424	DEBIT	Career development event w/ Mike Ross	-65000	USD	2016-10-11 17:42:04.584-07	2016-10-11 17:42:04.834-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-65000	\N	e4ad5f18-a923-47eb-a3e1-601e2ba3238f	696	696
2403	DEBIT	Network Budget pre Open Collective	-11797	USD	2016-10-11 09:52:07.045-07	2016-10-11 09:52:07.303-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-11797	\N	60fedebe-23fa-46fa-bf34-3b63869f1e51	696	696
2821	DEBIT	Wine	-1647	USD	2016-10-31 14:15:06.269-07	2016-10-31 14:15:06.517-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1647	\N	a1c67931-46a2-4a0a-9012-60f032d6d69e	696	696
2822	DEBIT	Sodas for ATXDivHack 	-3871	USD	2016-10-31 14:15:22.809-07	2016-10-31 14:15:22.98-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3871	\N	b31858ae-48a6-4dc9-a6e5-5c86bb6e6988	696	696
2824	DEBIT	05-21-16 AI workshop	-30000	USD	2016-10-31 14:16:09.23-07	2016-10-31 14:16:09.38-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-30000	186	1bcc20eb-8879-4cb4-834e-a2a7841a6419	696	696
2537	DEBIT	Director t-shirt	-3186	USD	2016-10-17 13:58:31.776-07	2016-10-17 13:58:31.789-07	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3186	\N	07e896c6-1747-42c3-ac92-ea9abc902e44	696	696
3530	DEBIT	Regional Leadership Director Training	-631	USD	2016-11-29 14:38:46.551-08	2016-11-29 14:38:46.748-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-631	\N	fb0cd838-a20f-4a38-ad81-e738867085b8	696	696
3829	DEBIT	Leadership Tshirt Order	-2698	USD	2016-12-07 08:51:43.784-08	2016-12-07 08:51:44.214-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2698	\N	1e99a559-2e7a-4e3d-be43-7fa857afba90	696	696
2328	DEBIT	Conference stipend Olivia F.	-39585	GBP	2016-10-07 06:35:08.613-07	2016-10-07 06:35:08.724-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-39585	\N	46f8b259-603b-459f-a2b6-c72ed0c247b7	696	696
4377	DEBIT	Meetup Fee	-6000	USD	2016-12-27 08:52:46.242-08	2016-12-27 08:52:46.242-08	274	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	640	edf1e7f7-4ad5-40bc-a2f2-e83febc89c03	696	696
2811	DEBIT	May AI Workshop	-26800	USD	2016-10-31 14:10:54.112-07	2016-10-31 14:10:54.327-07	2	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-26800	452	db3e939f-96e8-4790-bba4-e8a8a33ac1b2	696	696
2812	DEBIT	June South Hack Night	-20568	USD	2016-10-31 14:11:20.573-07	2016-10-31 14:11:20.753-07	2	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20568	451	540d3476-03f3-4c01-9191-0b4593c34fd4	696	696
2538	CREDIT	Director t-shirt	3325	USD	2016-10-17 14:00:51.295-07	2016-10-17 14:00:51.425-07	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3325	\N	7b58a48c-ec76-4fd4-b285-daf541fdd4c4	696	696
3207	CREDIT	$500 OpenGov hackathon support - transaction and global development	43500	USD	2016-11-17 10:36:48.896-08	2016-11-17 10:36:49.046-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	43500	\N	3726c26f-142a-4030-9306-3dbaad9081f0	696	696
3208	CREDIT	WWCode DC t-shirts sales	9524	USD	2016-11-17 10:37:58.038-08	2016-11-17 10:37:58.232-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9524	\N	36e90498-a765-4be3-b2d7-490d8776e07c	696	696
2522	CREDIT	from Code2040	90000	USD	2016-10-17 08:43:12.71-07	2016-10-17 08:43:13.113-07	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	90000	\N	d37c6e91-1aa2-45bd-b13d-a4d3a6e32102	696	696
2528	CREDIT	WWCode shirt Grisel	3649	USD	2016-10-17 13:48:59.282-07	2016-10-17 13:48:59.313-07	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3649	\N	cdb75283-fd2d-49da-81ca-b7887f3bb44b	696	696
7042	CREDIT	Women Who Code Atlanta &amp; DevNexus Soirée - fees + global	10875	USD	2017-03-13 10:05:28.744-07	2017-03-13 10:05:31.582-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10875	\N	c188572e-6d9c-4795-8540-7fd3bcea20bf	696	696
7043	CREDIT	Women Who Code Atlanta &amp; DevNexus Soirée global networks support	1450	USD	2017-03-13 10:06:48.459-07	2017-03-13 10:06:51.099-07	51	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1450	\N	e2b2b401-0472-40e8-8d1c-84e5ad37b555	696	696
4259	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 09:08:24.515-08	2016-12-23 09:08:24.709-08	265	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	8106fc14-9b21-49e9-bd3c-a25e7e6d64ea	696	696
9738	CREDIT	\N	2175	USD	2017-05-04 09:21:53.684-07	2017-05-04 09:21:53.684-07	276	3	\N	\N	\N	2710	0	0	0	USD	1	2175	2175	\N	5b429ca7-afd8-4d37-a3ad-51ca7ae6bd82	696	696
9746	CREDIT	\N	1200	USD	2017-05-04 11:58:24.9-07	2017-05-04 11:58:24.9-07	430	3	\N	\N	\N	2713	0	0	0	USD	1	1200	1200	\N	48c218d5-3e53-4a1f-88b4-485b930a9a99	696	696
8175	CREDIT	Travel Stipend for CONNECT	50000	USD	2017-04-03 13:24:58.616-07	2017-04-03 13:24:58.879-07	511	3	\N	2017-04-02 17:00:00-07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	d8baca94-1547-4dd9-ae1b-b3bdddeac823	696	696
537	CREDIT	WOMEN TECHMAKER/WWCODE PARTNERSHIP GRANT	110000	USD	2016-05-10 14:15:06.327-07	2016-05-10 14:15:06.677-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	110000	\N	84415409-2268-45c1-a28e-42bbe8a9dedf	696	696
568	CREDIT	Women Techmaker/WWCode Partnership Grant	50000	USD	2016-05-16 13:01:14.238-07	2016-05-16 13:01:14.49-07	10	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	fcdb2afd-4ee1-44a6-95fb-9e1619286c8d	696	696
2253	CREDIT	Network Development	10000	USD	2016-10-04 14:44:54.4-07	2016-10-04 14:44:54.58-07	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	c7d7a0f0-4ac1-4169-9368-4b6d19c4680b	696	696
6931	CREDIT	\N	6000	USD	2017-03-09 10:29:55.496-08	2017-03-09 10:29:55.496-08	259	3442	2104	\N	\N	2003	300	600	162	USD	1	6000	4938	\N	16affe26-a286-4782-8426-d75e1806aef8	755	696
1423	CREDIT	Recurring subscription	10000	USD	2016-08-03 10:47:25.319-07	2016-08-03 10:47:25.429-07	4	896	571	\N	\N	498	500	1000	250	USD	1	10000	8250	\N	8ce2b0bd-aefa-4369-9ce9-0e1e469b5d64	760	696
995	CREDIT	Donation to WWCode Austin	75000	USD	2016-06-22 13:09:46.403-07	2016-06-22 13:09:46.432-07	2	646	435	\N	\N	364	3750	7500	2625	USD	1	75000	61125	\N	1dd2bb42-e7c2-4e79-8fc7-8949fa3a1e33	772	696
985	CREDIT	Donation to WWCode San Francisco	100	USD	2016-06-21 09:05:01.251-07	2016-06-21 09:05:01.296-07	4	642	431	\N	\N	360	5	10	32	USD	1	100	53	\N	2db86e58-3d86-4dc5-80ff-58f5fc7984a7	776	696
1918	CREDIT	\N	50000	USD	2016-09-12 21:15:04.709-07	2016-09-12 21:15:04.709-07	2	1178	737	\N	\N	653	2500	5000	1130	USD	1	50000	41370	\N	578ab4ce-f187-4636-ad60-c3b5760ac10c	789	696
8038	CREDIT	monthly recurring subscription	1000	USD	2017-04-01 16:32:24.254-07	2017-04-01 16:32:24.254-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	b1060810-1e00-4118-b7b9-6cc529fca54a	804	696
6930	CREDIT	monthly recurring subscription	100	USD	2017-03-09 10:29:18.778-08	2017-03-09 10:29:18.778-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	97fbe8b4-4c66-46ec-bc2f-3432ad3db065	820	696
202	CREDIT	Recurring subscription	100	MXN	2016-03-15 13:05:22.15-07	2016-04-01 07:32:17.381-07	10	7	64	2016-04-07 07:32:17.381-07	\N	83	5	\N	\N	\N	\N	\N	\N	\N	d1d87139-4731-4474-a1a3-965cce286ed3	822	696
96	CREDIT	Donation to WWCode Mexico City	100	MXN	2016-02-15 10:46:05.92-08	2016-04-01 07:32:17.223-07	10	7	64	2016-04-07 07:32:17.381-07	\N	83	\N	\N	\N	\N	\N	\N	\N	\N	eb1ff5a0-1e75-4d49-8c64-69e64f1b9d6f	822	696
9042	CREDIT	\N	200	USD	2017-04-30 18:40:30.232-07	2017-04-30 18:40:30.232-07	516	3419	2749	\N	\N	2636	10	20	34	USD	1	200	136	\N	8c5b057c-7596-4791-a13a-fc2a64303098	842	696
2235	CREDIT	Turner Matching Donation	5000	USD	2016-10-04 08:46:59.013-07	2016-10-04 08:46:59.134-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000	\N	f900d59d-399a-4087-8a99-d5dc330e4483	696	696
2231	CREDIT	Sponsorship: AT&T Hackathon Prize	1000000	USD	2016-10-04 08:40:37.72-07	2016-10-04 08:40:37.853-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000000	\N	4b8d36db-e5cf-4fd1-8128-a699de20993f	696	696
2262	CREDIT	Donation via meetup	2363	USD	2016-10-04 15:14:59.695-07	2016-10-04 15:14:59.884-07	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2363	\N	dfb49d74-e609-4cc8-8c3e-46ff770309f3	696	696
2263	CREDIT	Network Development	17375	USD	2016-10-04 15:15:45.133-07	2016-10-04 15:15:45.269-07	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17375	\N	43365b78-5277-49da-b188-6a517a926473	696	696
2306	CREDIT	I am an active member and WWC has taken my career in tech to the next level. All the support and lessons from the WWC DC chapter are instrumental in me remaining in this field.	2250	USD	2016-10-06 10:23:39.409-07	2016-10-06 10:23:39.459-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2250	\N	efb89f26-5e2c-42bf-b173-27d7bf0406f9	696	696
2264	CREDIT	Diana A. Scholarship Google I/O	25000	USD	2016-10-04 15:19:06.989-07	2016-10-04 15:19:07.108-07	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25000	\N	8932d7a2-35b5-4d30-b78b-729a53066393	696	696
2422	CREDIT	Donation from Marie W.	900	USD	2016-10-11 17:26:47.2-07	2016-10-11 17:26:47.59-07	284	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	900	\N	39996606-f7e9-40ee-a5e1-aa68deae24b2	696	696
2332	CREDIT	Course Hero Hackathon Support	315000	USD	2016-10-07 07:39:15.069-07	2016-10-07 07:39:15.23-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	315000	\N	5c187624-870d-4c32-b10c-d952bc638fa5	696	696
2333	CREDIT	Hackathon Support Open Gov	45000	USD	2016-10-07 07:41:08.315-07	2016-10-07 07:41:08.391-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	45000	\N	08afa6d7-318d-47a2-8443-f19c6d9fe1a5	696	696
2423	CREDIT	Network Development	19100	USD	2016-10-11 17:28:02.718-07	2016-10-11 17:28:03.121-07	284	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19100	\N	74d06361-67e4-4923-840d-82fb946093ec	696	696
2327	CREDIT	Google I/O conference stipend	102409	GBP	2016-10-07 06:10:42.97-07	2016-10-07 06:10:43.753-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	102409	\N	7daeaf49-013c-42de-83da-86526afaea32	696	696
2341	CREDIT	Network Development (100%)	10000	USD	2016-10-07 13:05:13.011-07	2016-10-07 13:05:13.112-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	65d47c4a-b755-49c7-b2d6-dbddfdfd421e	696	696
2340	CREDIT	Hackbright support for hackathon	45000	USD	2016-10-07 13:04:15.299-07	2016-10-07 13:04:15.435-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	45000	\N	f861afb4-acee-4677-8343-79a42a833d0f	696	696
2428	CREDIT	Donation from Shugo	450	USD	2016-10-11 21:30:15.825-07	2016-10-11 21:30:15.896-07	295	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	0f702272-a446-4280-a96b-9bc994874280	696	696
2429	CREDIT	Network Development	19550	USD	2016-10-11 21:30:34.678-07	2016-10-11 21:30:34.772-07	295	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19550	\N	9ddbfb06-db7c-4fa2-a325-6e69943c17fe	696	696
2431	CREDIT	Network Development (Thanks Atlassian) 	20000	USD	2016-10-11 22:06:05.058-07	2016-10-11 22:06:05.202-07	266	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	9549e2a9-b907-4801-8b47-6407c300e439	696	696
3531	CREDIT	Regional Leadership Director Training	631	USD	2016-11-29 14:38:57.006-08	2016-11-29 14:38:57.13-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	631	\N	aeca0ae5-c39b-46b5-a46a-5a964ab43335	696	696
3533	CREDIT	Network Development	20000	USD	2016-11-29 14:43:53.719-08	2016-11-29 14:43:53.971-08	286	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	7a9cb9ef-afdd-4d85-b4b5-fa52e346eb92	696	696
3537	CREDIT	Global Development - thanks VMWare	50000	USD	2016-11-29 15:07:50.964-08	2016-11-29 15:07:51.154-08	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	17513123-d08c-4153-96a9-85c8bf346bb8	696	696
3514	CREDIT	CONNECT 2016	4536939	USD	2016-11-29 13:44:20.041-08	2016-11-29 13:44:20.185-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4536939	\N	184f4788-f08f-4b14-9226-aaca61c2ebb3	696	696
3540	CREDIT	Donation from PB - fees 	1187	USD	2016-11-29 15:33:50.04-08	2016-11-29 15:33:50.206-08	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1187	\N	b1569a2e-654e-4108-9c97-de12187ef171	696	696
3598	CREDIT	Network Development	20000	USD	2016-11-30 10:40:15.233-08	2016-11-30 10:40:15.446-08	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	1d3a6593-877b-4da0-a966-c2a286127140	696	696
3600	CREDIT	Banner	2000	USD	2016-11-30 10:40:32.021-08	2016-11-30 10:40:32.139-08	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	a1457d27-e61b-45de-aadd-378b29544550	696	696
3612	CREDIT	Network Development	20000	USD	2016-11-30 12:59:29.087-08	2016-11-30 12:59:29.921-08	280	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	c26e172a-b880-40ae-96e1-245f9122cd42	696	696
3614	CREDIT	Leadership development - conference stipend Google I/O	130000	USD	2016-11-30 13:07:12.142-08	2016-11-30 13:07:12.419-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	130000	\N	e8834ded-c290-4ab8-b367-c3356b2c9eb3	696	696
3617	CREDIT	Global Development	20000	USD	2016-11-30 13:11:00.067-08	2016-11-30 13:11:00.307-08	294	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	eb089b39-6f9d-41c8-9c70-ca094bacbc0a	696	696
3618	CREDIT	Banner	2000	USD	2016-11-30 13:19:37.017-08	2016-11-30 13:19:37.251-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	d33503e6-bb6e-4b24-b7ed-01842d266e8e	696	696
3620	CREDIT	Regional Leadership Director Meeting 	7500	USD	2016-11-30 13:20:06.733-08	2016-11-30 13:20:15.577-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7500	\N	5cd12a4a-4670-41f8-a215-222175234e3e	696	696
3621	CREDIT	Regional Leadership Director Meeting 	7500	USD	2016-11-30 13:20:12.669-08	2016-11-30 13:20:16.148-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7500	\N	33dd6edd-aafe-4257-a57c-a3dd886e6c9a	696	696
4255	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 08:59:24.039-08	2016-12-23 08:59:24.291-08	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	6157d8ed-903e-40f6-b5d8-087f4793a4c2	696	696
4257	CREDIT	Global Development for Meetup Fee	4900	GBP	2016-12-23 09:02:53.836-08	2016-12-23 09:02:53.991-08	264	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4900	\N	3f46c5c9-4147-486e-b8ab-7a7a89a88f9f	696	696
4261	CREDIT	Global Development for Meetup Fee	5700	EUR	2016-12-23 09:13:39.369-08	2016-12-23 09:13:39.507-08	301	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5700	\N	6f1c4879-9600-446e-b8b1-7c4ca6b64662	696	696
4263	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 09:20:13.429-08	2016-12-23 09:20:13.545-08	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	6d9dd70c-2b98-4094-8a7f-d8d14ebdfe64	696	696
4265	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 09:31:16.26-08	2016-12-23 09:31:16.392-08	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	be353290-3a79-4837-b322-8bcf820cf681	696	696
4267	CREDIT	Global Development for Meetup Fee	6000	AUD	2016-12-23 09:41:14.029-08	2016-12-23 09:41:14.193-08	266	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	034ce920-1702-43ca-b969-c609763c116b	696	696
2329	CREDIT	Google I/O stipend	39585	GBP	2016-10-07 06:35:45.945-07	2016-10-07 06:35:46.151-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	39585	\N	31edf1ab-fe0e-470a-b022-11a2727cd41f	696	696
4372	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:38:50.944-08	2016-12-27 08:38:51.039-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	61be0f13-1f0e-4430-a69b-de48f097255d	696	696
4374	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:48:52.922-08	2016-12-27 08:48:53-08	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	f81b72fd-ff9d-453c-85aa-83f26b75e23f	696	696
4380	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:58:32.613-08	2016-12-27 08:58:32.719-08	276	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	52c10ec3-fc17-4bb0-80dd-b97ef1359708	696	696
4382	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 09:02:32.71-08	2016-12-27 09:02:32.843-08	277	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	cb83b4cd-aedb-4485-a545-c318b78ca0fe	696	696
4384	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 09:24:55.371-08	2016-12-27 09:24:55.632-08	279	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	ad4cf65e-ffab-438f-9b08-a536185a5af3	696	696
4386	CREDIT	Global Development for Meetup Fee	4900	GBP	2016-12-27 09:32:02.798-08	2016-12-27 09:32:02.918-08	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4900	\N	f57723cd-0a3e-4bf8-b686-8a60ae3e7e78	696	696
3955	CREDIT	Priyanka - IOT Hackathon donation - fees and global development 	2175	USD	2016-12-13 12:08:29.218-08	2016-12-13 12:08:29.464-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2175	\N	3b4c5740-bddf-407f-a147-56b43886907c	696	696
3956	CREDIT	Donation via Meetup - fees + Global Development	1187	USD	2016-12-13 12:17:57.936-08	2016-12-13 12:17:58.19-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1187	\N	940cd510-b8a8-460d-b494-d2e4a216ad9e	696	696
3957	CREDIT	Donation via meetup - fees and global development	775	USD	2016-12-13 12:20:15.375-08	2016-12-13 12:20:15.714-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	775	\N	2c90bf2f-4941-48ed-828c-db67f8249cc1	696	696
4270	CREDIT	Global Development for Meetup Fee	4900	GBP	2016-12-23 09:55:42.091-08	2016-12-23 09:55:42.249-08	267	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4900	\N	2acba33f-e56b-49f2-886b-86388493777d	696	696
4441	CREDIT	Global Development for Meetup Fee	6000	CAD	2016-12-28 08:29:31.983-08	2016-12-28 08:29:28.409-08	293	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	3c2a09b0-ab81-4e66-8ec6-a6946e367763	696	696
4443	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 08:31:33.43-08	2016-12-28 08:31:29.837-08	294	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	c257c047-567a-47fb-b8b7-02b7f7a90b12	696	696
103	CREDIT	Donation to WWCode Austin	30000	USD	2016-02-18 11:54:08.531-08	2016-04-16 13:40:58.717-07	2	108	71	\N	\N	15	0	3000	900	USD	1	30000	26100	\N	a2af1057-4522-4c6a-b5ec-9f3e41da88e7	814	696
77	CREDIT	Donation to WWCode Seattle	100	USD	2016-02-02 13:46:44.866-08	2016-04-16 13:40:58.7-07	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	ac7d9c6f-0090-4ff5-bd71-01aaef4f5b99	820	696
5018	CREDIT	WWCode t-shirt sales	1599	USD	2017-01-17 19:21:50.791-08	2017-01-17 19:21:50.964-08	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1599	\N	d2873b77-1ea2-48e6-894b-a460b9462b1f	696	696
499	CREDIT	Women Techmaker/WWCode partnership grant	50000	USD	2016-05-04 14:17:27.653-07	2016-05-04 14:17:27.886-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	c81e5698-25db-421e-80ce-4c04a817e59c	696	696
2397	CREDIT	Google I/O stipend	75000	USD	2016-10-11 09:01:42.326-07	2016-10-11 09:01:43.286-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75000	\N	85005ce6-d4f3-4b07-98d0-ef524443de8a	696	696
325	CREDIT	From:\tThao Le	1500	USD	2016-04-12 11:49:06.645-07	2016-04-16 13:40:58.815-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500	\N	1a6b4663-7869-49ba-9691-9b3bec6843c4	696	696
306	CREDIT	Leslie Mollner: Thank you very much for all the help I've received from WWCode -TC so far. -Leslie	2250	USD	2016-04-06 11:17:07.204-07	2016-04-16 13:40:58.818-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2250	\N	d96508af-a33c-42bc-9446-bc438652e8a8	696	696
333	CREDIT	From Deepa	1500	USD	2016-04-12 14:18:56.547-07	2016-04-16 13:40:58.847-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500	\N	886f2733-7967-4b61-93c1-f8242037a5a4	696	696
858	CREDIT	Dalia donated to WWCode SF	1500	USD	2016-06-09 11:40:21.124-07	2016-06-09 11:40:21.833-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500	\N	ebf2964d-38ed-47f4-93dc-59fbb394dc73	696	696
2410	CREDIT	From Lucas in honor of Rachel M. She learned Python and HTML/CSS	2250	USD	2016-10-11 12:13:57.013-07	2016-10-11 12:13:57.265-07	279	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2250	\N	9a09da05-1e08-4b56-b452-1236e02b2a92	696	696
2411	CREDIT	Network Development	17750	USD	2016-10-11 12:17:21.991-07	2016-10-11 12:17:22.199-07	279	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17750	\N	f87d62ba-99de-42b8-9039-9165dfc2022b	696	696
2412	CREDIT	Network development - thanks Atlassian	50000	USD	2016-10-11 12:30:14.934-07	2016-10-11 12:30:15.155-07	297	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	b3fcd677-f2e2-4f24-b35b-b81ab513f215	696	696
2413	CREDIT	Donation from Biotti	403	USD	2016-10-11 12:32:58.956-07	2016-10-11 12:32:59.265-07	301	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	403	\N	b07d171f-6a06-4bf1-b5ab-44b28a4d2fe6	696	696
412	CREDIT	Andrea S	1500	USD	2016-04-27 13:05:44.711-07	2016-04-27 13:05:44.974-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500	\N	1f5994ab-e490-47ec-af2a-97af7960004f	696	696
2414	CREDIT	Network Development	17500	USD	2016-10-11 12:35:59.115-07	2016-10-11 12:35:59.305-07	301	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17500	\N	bd1df48d-4123-4817-b44a-698351ad76c5	696	696
2415	CREDIT	Donation Ailia S.	9000	USD	2016-10-11 12:44:42.807-07	2016-10-11 12:44:43.161-07	270	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9000	\N	37933bd0-775c-4ff6-914b-9be5c19aec41	696	696
2265	CREDIT	Donation Hannah B.	9000	USD	2016-10-04 15:35:46.967-07	2016-10-04 15:35:47.153-07	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9000	\N	41b245bb-086f-4199-81b9-d6900db24611	696	696
2267	CREDIT	Network Development	15400	USD	2016-10-04 15:39:26.796-07	2016-10-04 15:39:26.9-07	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15400	\N	d40d88e7-8e48-43d2-b629-62c123b275bf	696	696
2416	CREDIT	Network support - thanks VMWare	200000	USD	2016-10-11 12:50:00.045-07	2016-10-11 12:50:00.312-07	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	200000	\N	a4e80a28-1270-4c9e-870c-de3011dd78c7	696	696
2418	CREDIT	Network support - Regional Leadership (thanks VMWare)	370000	USD	2016-10-11 12:51:45.723-07	2016-10-11 12:51:45.897-07	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	370000	\N	90107c21-9ee4-41e1-b930-b991cd649629	696	696
2419	CREDIT	Network Development	20000	USD	2016-10-11 13:03:19.884-07	2016-10-11 13:03:20.084-07	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	b5dcca3b-559b-4c43-83ff-a31cd387d1f2	696	696
2420	CREDIT	Network Development (Thanks Zendesk)	16129	USD	2016-10-11 13:26:22.964-07	2016-10-11 13:26:23.172-07	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	16129	\N	2b973f59-80ae-4046-996e-35e967509adc	696	696
2421	CREDIT	Donation Elizabeth B.	9000	USD	2016-10-11 17:22:08.455-07	2016-10-11 17:22:08.557-07	288	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9000	\N	d6590406-0ffc-489f-ab6a-3436c8be0d3a	696	696
4188	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-21 10:49:47.667-08	2016-12-21 10:49:47.892-08	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	74434b16-1798-42d0-92da-547acdf24d48	696	696
666	CREDIT	Generous donation from Target to support WWCode Twin Cities	500000	USD	2016-05-26 11:37:24.922-07	2016-05-26 11:37:23.286-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500000	\N	345acef4-87b2-455f-beef-b23517d7a460	696	696
667	CREDIT	Proceeds from teespring	10022	USD	2016-05-26 11:38:50.077-07	2016-05-26 11:38:48.41-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10022	\N	dce42eaa-b86f-4baa-ac29-a12e270cd434	696	696
4360	CREDIT	Global Development for Meetup Fee	6000	MXN	2016-12-27 08:10:30.416-08	2016-12-27 08:10:30.529-08	299	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	271d48b8-2cba-40e7-bafa-e632e30dbbce	696	696
9659	CREDIT	\N	60000	USD	2017-05-02 11:45:44.253-07	2017-05-02 11:45:44.253-07	51	3	\N	\N	\N	2677	0	0	0	USD	1	60000	60000	\N	3c6bb7c3-caff-4599-b462-6a53ea05cb0b	696	696
1042	CREDIT	Donation from MondoRobot & Avery Brewing Company: Hackathon Proceeds	320247	USD	2016-06-29 11:42:31.848-07	2016-06-29 11:42:32.517-07	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	320247	\N	3f5141a2-01ec-4026-8ebd-f1d232237947	696	696
2236	CREDIT	Donation: Beth Laing	5000	USD	2016-10-04 08:47:24.058-07	2016-10-04 08:47:24.175-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000	\N	a4d7f6ff-8014-48b0-aef8-c0d0d62ef7af	696	696
2237	CREDIT	Donation: Syema Ailia	2500	USD	2016-10-04 08:47:46.468-07	2016-10-04 08:47:46.624-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500	\N	445859c1-2d38-4be2-8d47-7b91e62aad55	696	696
2242	CREDIT	Reverse duplicate transaction	500	USD	2016-10-04 09:12:26.671-07	2016-10-04 09:12:26.903-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500	\N	bfa51ebc-0ab7-4ed8-9f4e-e4862bf271ba	696	696
2234	CREDIT	Donations made via Meetup as of Jan 2016, less transaction fees	9212	USD	2016-10-04 08:46:17.845-07	2016-10-04 08:46:18.02-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9212	\N	5af62e78-2976-4c04-aaab-f3c34f1297e7	696	696
2299	CREDIT	Donations via Meetup	2823	USD	2016-10-06 08:53:38.156-07	2016-10-06 08:53:38.231-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2823	\N	35ce43d6-2009-48a3-bc10-e7c08155cd01	696	696
2300	CREDIT	Network development	6000	USD	2016-10-06 09:01:48.321-07	2016-10-06 09:01:48.667-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	34694258-edf0-4473-b471-555bdcfddea7	696	696
2398	CREDIT	Network Development	20000	USD	2016-10-11 09:02:18.108-07	2016-10-11 09:02:19.138-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	9ed15360-3e2f-4801-ac5a-2b41471bc68a	696	696
2305	CREDIT	Google I/O scholarship	75000	USD	2016-10-06 10:21:27.384-07	2016-10-06 10:21:27.396-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75000	\N	eb17e756-ee3f-434d-9493-8f6fbc94ea78	696	696
6882	CREDIT	Leadership Development 	14915	MXN	2017-03-07 04:55:53.128-08	2017-03-07 04:55:53.3-08	511	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14915	\N	58f1389a-1aa3-43b7-8283-5a0d75c4e827	696	696
289	CREDIT	Recurring subscription	100	USD	2016-04-02 18:49:19.352-07	2016-04-16 13:40:58.819-07	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	8ba471ba-ec4f-4181-a1d0-f1c2b029194d	688	696
6883	CREDIT	Leadership Development	50616	MXN	2017-03-07 05:01:15.044-08	2017-03-07 05:01:15.192-08	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50616	\N	aaecc386-1923-482a-835a-4662c8858bc3	696	696
9695	CREDIT	\N	150000	USD	2017-05-03 10:32:39.653-07	2017-05-03 10:32:39.653-07	12	3	\N	\N	\N	2693	0	0	0	USD	1	150000	150000	\N	839c847a-30e8-463a-912f-a6845435eca0	696	696
5021	CREDIT	WWCode t-shirt sales	3563	USD	2017-01-17 19:28:29.874-08	2017-01-17 19:28:30.096-08	290	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3563	\N	2dde7e29-f8fa-4b52-86c1-3cfeb0c374e3	696	696
2268	CREDIT	Network budget pre Open Collective	6264	USD	2016-10-04 15:51:25.324-07	2016-10-04 15:51:26.129-07	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6264	\N	2bd3e74c-84e0-43e2-a21d-b9443200eedc	696	696
2269	CREDIT	Donation from Adane	450	USD	2016-10-04 15:56:11.881-07	2016-10-04 15:56:13.02-07	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	ea31005b-cb3b-42d7-9b8c-1c812558ee14	696	696
2270	CREDIT	Network Development	13286	USD	2016-10-04 15:57:17.136-07	2016-10-04 15:57:17.293-07	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13286	\N	7382b702-3956-405b-b6af-b9d1b04e89ba	696	696
2312	CREDIT	Network Development (100%)	10000	USD	2016-10-06 11:42:47.682-07	2016-10-06 11:42:47.71-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	655af063-49c8-4b0b-9288-086d5e290e34	696	696
2394	CREDIT	Conference stipend Heidi H.	50000	USD	2016-10-11 08:59:30.363-07	2016-10-11 08:59:31.524-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	0db54f37-f224-4eaa-ae93-e4a02bc97eef	696	696
282	CREDIT	Recurring subscription	500	MXN	2016-04-02 13:10:38.206-07	2016-04-02 13:10:38.242-07	10	80	42	2016-04-07 13:10:38.206-07	\N	68	\N	\N	\N	\N	\N	\N	\N	\N	8cc3139c-729d-497c-9aa9-1c6aba7f53bb	769	696
2189	CREDIT	Recurring subscription	1000	USD	2016-10-01 16:35:17.911-07	2016-10-01 16:35:17.911-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	07c91ea8-acd4-4942-9cfd-c48cebb9daef	804	696
261	CREDIT	Donation to WWCode Austin	30000	USD	2016-03-25 08:11:04.684-07	2016-04-16 13:40:58.812-07	2	192	152	\N	\N	64	0	3000	900	USD	1	30000	26100	\N	112c59b0-b10d-43fc-9d6f-a33b38dfde31	806	696
451	CREDIT	Donation to WWCode Washington DC	50000	USD	2016-04-29 06:51:19.1-07	2016-04-29 06:51:19.15-07	13	303	216	\N	\N	183	2500	5000	1480	USD	1	50000	41020	\N	12d109fa-91c8-4a65-8547-f954d2767714	809	696
474	CREDIT	Recurring subscription	100	USD	2016-05-02 15:49:03.545-07	2016-05-02 15:49:03.612-07	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	625d1196-61d0-48d5-8a84-0cfd6a50c750	820	696
2406	CREDIT	Network Development	18200	USD	2016-10-11 10:02:51.621-07	2016-10-11 10:02:51.839-07	291	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18200	\N	8bc77fb9-7ed7-4099-91aa-18899658861b	696	696
2534	CREDIT	Director t-shirt	2898	USD	2016-10-17 13:57:08.514-07	2016-10-17 13:57:08.533-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2898	\N	bbf57164-512a-42db-baa3-b91df0b4080c	696	696
3534	CREDIT	Stephen	450	USD	2016-11-29 14:55:31.534-08	2016-11-29 14:55:31.727-08	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	bc8ea724-7089-4d7e-80dc-6ed375a7bc76	696	696
3200	CREDIT	Portland t-shirt proceeds	6915	USD	2016-11-17 10:01:32.1-08	2016-11-17 10:01:32.49-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6915	\N	c96721bd-c150-4300-b6b9-144a4019cefb	696	696
4378	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:53:55.856-08	2016-12-27 08:53:55.969-08	275	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	aa3d7224-7382-4f6f-a0f5-2949228f2339	696	696
659	CREDIT	Women Techmaker WWCode Partnership Grant	20000	USD	2016-05-25 09:45:53.797-07	2016-05-25 09:45:54.045-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	b0965077-da41-4ea3-9ff4-a25d7be1a3b6	696	696
4370	CREDIT	Global Development for Meetup Fee	5700	EUR	2016-12-27 08:34:45.59-08	2016-12-27 08:34:45.771-08	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5700	\N	7c5dc3dd-2211-4c62-bdf3-1d1bff4db06a	696	696
653	CREDIT	Women Techmaker WWCode Partnership Grant	15000	USD	2016-05-24 13:12:34.913-07	2016-05-24 13:12:35.226-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15000	\N	4ec3f9b1-a7c7-4887-b029-6a3f17ada0c4	696	696
702	CREDIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	80000	USD	2016-05-31 11:01:08.532-07	2016-05-31 11:01:07.064-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	80000	\N	8c1d5f60-5e9f-4262-966c-0b0006e7d309	696	696
4702	CREDIT	Donation - fees + global development	1187	USD	2017-01-05 06:58:39.771-08	2017-01-05 06:58:42.205-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1187	\N	9eb3b1c1-578e-4b80-be38-c28a2c634474	696	696
4701	CREDIT	donation - fees and global development	798	USD	2017-01-05 06:48:24.355-08	2017-01-05 06:48:26.734-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	798	\N	42c8ea1c-5292-4ee1-8768-97d910be5fe2	696	696
4677	CREDIT	Donation from Cameron - fees and global development	4350	USD	2017-01-04 12:33:36.359-08	2017-01-04 12:33:37.475-08	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4350	\N	79fb7110-6a80-49d9-9d52-eca9ba262867	696	696
3201	CREDIT	T-shirt payout	1092	USD	2016-11-17 10:03:13.726-08	2016-11-17 10:03:13.862-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1092	\N	c83bd839-4222-4e75-b71b-afe58b183300	696	696
3203	CREDIT	$1000 CDK Global event support - transaction and global development	87000	USD	2016-11-17 10:18:40.107-08	2016-11-17 10:18:40.436-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	87000	\N	cda2e9ae-7568-4ca0-a5a6-b6e8b99fdfb4	696	696
3204	CREDIT	$1000 Mozilla hackathon support - Global Development	90000	USD	2016-11-17 10:21:06.154-08	2016-11-17 10:21:07.268-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	90000	\N	646702d0-fba2-4ee2-8e90-8c8871732cac	696	696
3205	CREDIT	$5000 Intel Hackathon support - global development	450000	USD	2016-11-17 10:23:08.268-08	2016-11-17 10:23:08.461-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450000	\N	6b086a9f-6727-4f05-85cd-8f84aa7c79dd	696	696
3206	CREDIT	$3500 Course Hero Hackathon support - transaction & global development	304500	USD	2016-11-17 10:27:12.528-08	2016-11-17 10:27:12.742-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	304500	\N	05d80488-2759-4454-abe3-0a379836df31	696	696
7556	CREDIT	International Women's Day Atlanta	10350	USD	2017-03-28 11:28:28.77-07	2017-03-28 11:28:28.938-07	51	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6c8e7d6b-bcd8-44bc-a3c8-ab4f3fb6b3b5	696	696
3518	CREDIT	Global Development	20000	USD	2016-11-29 13:56:45.442-08	2016-11-29 13:56:45.713-08	290	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	6323fec2-eb32-4b9b-9134-9d658f2efe40	696	696
3519	CREDIT	Network Development - 10k member bonus	100000	USD	2016-11-29 13:58:23.625-08	2016-11-29 13:58:23.799-08	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	\N	2266fe36-fda5-4fbb-bca6-7cda7e67318b	696	696
3520	CREDIT	Global Development	15600	USD	2016-11-29 14:08:18.065-08	2016-11-29 14:08:18.213-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15600	\N	adf0f06c-e558-411f-8551-6c08eaf62de1	696	696
3521	CREDIT	Erica S. donation - fees	450	USD	2016-11-29 14:11:37.922-08	2016-11-29 14:11:38.131-08	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	21b0481e-bb75-445b-b121-6964171ec740	696	696
3522	CREDIT	Erica S. donation - fees	450	USD	2016-11-29 14:12:36.336-08	2016-11-29 14:12:36.503-08	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	e671d019-152e-4857-b2d0-2d1a5545e33d	696	696
3523	CREDIT	Global Development	19100	USD	2016-11-29 14:17:18.389-08	2016-11-29 14:17:18.558-08	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19100	\N	93342e23-5a6d-4557-8988-d48bda18046b	696	696
3524	CREDIT	Network Budget Balance Pre Open Collective	17475	USD	2016-11-29 14:28:03.065-08	2016-11-29 14:28:03.231-08	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17475	\N	3ca715da-37c9-48d6-8b41-15a1dd421d81	696	696
3525	CREDIT	Network Development	2500	USD	2016-11-29 14:29:22.958-08	2016-11-29 14:29:23.167-08	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500	\N	a973cade-bced-498a-aaf3-f6a4f60ca02e	696	696
3527	CREDIT	Banner	2000	USD	2016-11-29 14:34:22.96-08	2016-11-29 14:34:23.085-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	3097b9bd-e10a-4598-bd6d-b035d0f33f73	696	696
3528	CREDIT	Regional Leadership Director Training 	13031	USD	2016-11-29 14:35:05.252-08	2016-11-29 14:35:05.379-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13031	\N	ce5bf007-5b83-46b2-b82b-17ef62e16627	696	696
3541	CREDIT	Global Development	20000	USD	2016-11-29 15:34:32.59-08	2016-11-29 15:34:32.817-08	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	3930af5b-22e9-43a5-b3b5-4c28e21c4a3b	696	696
3542	CREDIT	Donation from Margaret - fees	2012	USD	2016-11-29 15:37:14.82-08	2016-11-29 15:37:15.082-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2012	\N	3e72e75f-912e-4507-8a12-e73a2a2baecb	696	696
3543	CREDIT	Donation via Meetup	775	USD	2016-11-29 15:39:08.069-08	2016-11-29 15:39:08.263-08	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	775	\N	d13f4546-ddb3-4403-8ffa-3e94709cd39e	696	696
3544	CREDIT	Donation via meetup	775	USD	2016-11-29 15:39:42.382-08	2016-11-29 15:39:42.512-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	775	\N	00e31b6f-e424-4f4b-b51e-73cc1c290081	696	696
3547	CREDIT	Network Development	20000	USD	2016-11-29 16:23:24.87-08	2016-11-29 16:23:24.511-08	285	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	c97c359c-7c4d-491a-9489-1423fc900fd1	696	696
3624	CREDIT	Conference Travel Stipend - Google I/O Elese	75000	USD	2016-11-30 13:25:31.161-08	2016-11-30 13:25:41.165-08	276	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75000	\N	09bd1cc4-9ecf-4dd9-a3a6-2bfe654015da	696	696
3627	CREDIT	Banner	2000	USD	2016-11-30 13:33:30.25-08	2016-11-30 13:33:30.386-08	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	d7f0bea9-9ed6-4ec6-aada-f8d3fe14c421	696	696
3629	CREDIT	Global Development - Thanks VMWare	50000	USD	2016-11-30 13:34:00.324-08	2016-11-30 13:34:01.658-08	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	a8125046-2c82-43f8-bf5a-3930226ad6d9	696	696
7198	CREDIT	WTM Google I/O Travel Stipend	50000	USD	2017-03-17 07:09:18.868-07	2017-03-17 07:09:18.344-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	9972b655-8830-4ac6-b9c7-2e373feebc03	696	696
2331	CREDIT	Network Development	15755	GBP	2016-10-07 07:03:54.031-07	2016-10-07 07:03:54.119-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15755	\N	61afdaf6-bfb9-4948-bca0-bd656fbc2d6f	696	696
3510	CREDIT	Global Development	80000	GBP	2016-11-29 13:14:00.118-08	2016-11-29 13:14:01.107-08	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	80000	\N	1a0ffc67-8650-41fd-b3ff-7af4d6f81cbc	696	696
4376	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:52:05.93-08	2016-12-27 08:52:06.061-08	274	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	59f7ddd7-ade8-4ebf-977e-cb823b5ab4cd	696	696
7913	CREDIT	monthly recurring subscription	2500	USD	2017-04-01 11:31:19.231-07	2017-04-01 11:31:19.231-07	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	50d19e33-e65e-4c4f-b3bc-851253fdfda5	692	696
4405	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:44:22.123-08	2016-12-27 11:44:22.207-08	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	3407cb90-d12e-4698-ae45-68a7626be287	696	696
4407	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:48:41.246-08	2016-12-27 11:48:41.318-08	288	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	0764379a-89bf-4a0b-b3cf-02ced834e7c3	696	696
4409	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:51:47.92-08	2016-12-27 11:51:48.117-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	9f8c45b8-537c-4f0f-bb8a-928b528feab2	696	696
4411	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:54:51.439-08	2016-12-27 11:54:51.679-08	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	0c8ffef8-b8d3-43b7-ad21-4d41571029cd	696	696
8305	CREDIT	\N	20000	USD	2017-04-07 05:25:51.09-07	2017-04-07 05:25:51.09-07	516	3	\N	\N	\N	2393	0	0	0	USD	1	20000	20000	\N	01371a79-bfe1-455d-9fae-8901be6f2dbe	696	696
4189	CREDIT	Global Development for Meetup fee	6000	USD	2016-12-21 10:49:53.054-08	2016-12-21 10:49:53.302-08	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	54daaaa7-92d1-4072-9e26-e3664a7eddda	696	696
8308	CREDIT	VMWare foundation Donation - global development (Ramya V., Swathi U. and Anonymous) 	24750	USD	2017-04-07 09:43:42.261-07	2017-04-07 09:43:42.673-07	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27a1347b-f50e-4eb5-af41-d06f4b4bc654	696	696
7294	CREDIT	Travel Stipend for Google I/O	100000	USD	2017-03-20 08:17:43.622-07	2017-03-20 08:17:42.994-07	277	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	\N	e9057982-2758-4b71-96a7-7e852f7d4a0e	696	696
4246	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 08:32:00.456-08	2016-12-23 08:32:00.622-08	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	713fdfe3-6cf7-4520-aee5-e18c6cf12071	696	696
4248	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 08:45:15.022-08	2016-12-23 08:45:15.147-08	261	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	34260b9e-5cfa-458e-9861-4b037755571a	696	696
8210	CREDIT	\N	20000	USD	2017-04-04 12:51:04.916-07	2017-04-04 12:51:04.916-07	2	3999	2438	\N	\N	2332	1000	2000	700	USD	1	20000	16300	\N	2d1d8ff1-e35e-417d-b676-75bc6130e73a	837	696
4250	CREDIT	Global Development for Meetup Fees	6000	USD	2016-12-23 08:50:35.869-08	2016-12-23 08:50:36.131-08	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	7adbc52c-6996-4d28-899c-835e1561a1b0	696	696
4252	CREDIT	Global Development for Meetup Fees	6000	USD	2016-12-23 08:54:04.928-08	2016-12-23 08:54:05.055-08	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	084b10da-1bc1-4f57-84d2-3f7089d7c993	696	696
7295	CREDIT	Paypal Fees for Travel Stipend	3000	USD	2017-03-20 08:38:54.453-07	2017-03-20 08:38:53.749-07	277	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000	\N	fea87b26-175e-46ed-b94c-5d7bcec1778f	696	696
4280	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 11:37:32.49-08	2016-12-23 11:37:32.668-08	268	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	4e27357d-7c4c-43e4-b29e-773872e443e8	696	696
4282	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 11:40:51.309-08	2016-12-23 11:40:51.479-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	bf5087f3-ca93-402e-8c80-5383c23112a4	696	696
4284	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 11:48:39.526-08	2016-12-23 11:48:39.685-08	270	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	cc5c76d9-46e6-4435-8ec6-f0328e93c66c	696	696
4434	CREDIT	Global Development for Meetup Fee	6000	JPY	2016-12-28 08:00:53.27-08	2016-12-28 08:00:49.939-08	295	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	0dfc10e6-6037-41d3-a5cd-6ba9f5471978	696	696
4435	CREDIT	Global Development for Meetup Fee	6000	CAD	2016-12-28 08:21:14.024-08	2016-12-28 08:21:10.449-08	291	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	06fa2587-6ff6-4229-ab30-031b2088aa97	696	696
4437	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 08:24:49.292-08	2016-12-28 08:24:45.838-08	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	1f4c7218-151d-4502-a979-3271e65d57da	696	696
4439	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 08:27:36.9-08	2016-12-28 08:27:33.309-08	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	23d6372f-2d2d-4cbb-afee-5a05e2ef89ce	696	696
4404	CREDIT	Global Development for Meetup Fees	6000	USD	2016-12-27 10:40:49.86-08	2016-12-27 10:40:49.921-08	286	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	84192755-dac6-4b18-996a-89fe17acc8d1	696	696
4363	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:14:47.836-08	2016-12-27 08:14:47.951-08	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	e496c717-ce4a-41a6-b861-8eae2c81db9c	696	696
4365	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:22:09.234-08	2016-12-27 08:22:09.351-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	88c4ac88-4f6e-40d9-8cdb-5eee6e9a9dee	696	696
4367	CREDIT	Global Development for Meetup Fee	6000	INR	2016-12-27 08:24:37.915-08	2016-12-27 08:24:38.038-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	c54c243c-29a5-4006-b821-adc4d3a389ee	696	696
4368	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 08:30:02.12-08	2016-12-27 08:30:02.272-08	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	69ec7f71-fdf4-4fc1-a013-bcdf6353b94c	696	696
4389	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 09:48:49.207-08	2016-12-27 09:48:49.297-08	280	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	076d787a-dbfb-4781-b854-e3cd9da444ec	696	696
4391	CREDIT	Global Development for Meetup Fee	6000	AUD	2016-12-27 09:52:16.09-08	2016-12-27 09:52:16.167-08	281	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	6f001acd-c75e-4d02-a339-faede0477c42	696	696
4393	CREDIT	Global Development for Meetup Fee	6000	MXN	2016-12-27 09:56:03.911-08	2016-12-27 09:56:03.985-08	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	910351cc-fb5f-43ea-bccb-fa3a211093a7	696	696
4395	CREDIT	Global Development for Meetup Fee	6000	MXN	2016-12-27 09:59:52.939-08	2016-12-27 09:59:53.047-08	10	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	52f1331f-b669-4782-b63a-984ccb097928	696	696
4397	CREDIT	Global Development for Meetup Fee	5700	EUR	2016-12-27 10:10:14.864-08	2016-12-27 10:10:14.928-08	283	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5700	\N	f09463dc-da20-4c6a-95fc-b96c106b3d00	696	696
4400	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 10:33:56.275-08	2016-12-27 10:33:56.372-08	284	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	2f11fdfd-c8b2-4a58-8669-76610d85ac20	696	696
4402	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 10:37:31.611-08	2016-12-27 10:37:31.721-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	4d7adb92-d878-4a73-9f39-2c1f66559ba7	696	696
4426	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 07:46:26.348-08	2016-12-28 07:46:22.824-08	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	549184b8-9951-44b3-804f-5306177e8ec1	696	696
4428	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 07:51:42.465-08	2016-12-28 07:51:38.84-08	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	6ed65fc3-0248-4071-bdbd-1a43018a5a2e	696	696
4430	CREDIT	Global Development for Meetup Fee	6000	AUD	2016-12-28 07:55:25.022-08	2016-12-28 07:55:21.475-08	297	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	1fa71cb1-e48d-4b0c-b102-30d66d120a1e	696	696
4432	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 07:57:55.359-08	2016-12-28 07:57:51.831-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	0deb855b-d632-43c8-a2e3-f90f0db86bb4	696	696
673	CREDIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	50000	USD	2016-05-26 13:48:43.015-07	2016-05-26 13:48:43.336-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	93c08587-c4fb-4077-9f65-00b8920ce72e	696	696
9848	CREDIT	\N	16563	EUR	2017-05-08 08:30:18.585-07	2017-05-08 08:30:18.585-07	301	3	\N	\N	\N	2741	0	0	0	EUR	1	16563	16563	\N	04ec7dd9-0032-4318-99fa-52e21ff493ee	696	696
7374	CREDIT	Leadership Development: Google I/O grant for Luisa M.	100000	USD	2017-03-22 10:56:10.528-07	2017-03-22 10:56:10.804-07	3	3	\N	\N	\N	\N	\N	\N	\N	USD	1	\N	100000	\N	3144121e-26df-4745-84f9-51b0af25530c	696	696
5022	CREDIT	WWCode t-shirt sales	1106	USD	2017-01-17 19:29:09.407-08	2017-01-17 19:29:09.561-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1106	\N	ee1df537-bb8d-44e0-ada4-42c56888c466	696	696
5023	CREDIT	WWCode t-shirt sales	1964	USD	2017-01-17 19:29:40.155-08	2017-01-17 19:29:40.284-08	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1964	\N	6dc8501e-0ceb-40ab-b920-9dc4d4de6ce3	696	696
5024	CREDIT	WWCode t-shirt sales	982	USD	2017-01-17 19:30:10.748-08	2017-01-17 19:30:10.906-08	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	982	\N	35f3b1a6-7368-418d-9a03-f1da4b5de91f	696	696
5025	CREDIT	WWCode t-shirt sales	2778	USD	2017-01-17 19:30:54.132-08	2017-01-17 19:30:54.465-08	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2778	\N	bf1209ff-a6ec-4161-8120-65342983d214	696	696
5026	CREDIT	WWCode t-shirt sales	4742	USD	2017-01-17 19:31:50.631-08	2017-01-17 19:31:50.774-08	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4742	\N	971f4ef3-3672-4497-8b8e-863c2c187206	696	696
5027	CREDIT	WWCode t-shirt sales	1389	USD	2017-01-17 19:32:30.654-08	2017-01-17 19:32:30.825-08	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1389	\N	166cbb4b-156f-4b77-84d3-a7b2bba53d7f	696	696
5028	CREDIT	WWCode t-shirt sales	2371	USD	2017-01-17 19:33:30.061-08	2017-01-17 19:33:30.587-08	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2371	\N	480c104e-d92f-4c75-8e48-a396ffb0172a	696	696
5029	CREDIT	WWCode t-shirt sales	7570	USD	2017-01-17 19:34:31.424-08	2017-01-17 19:34:31.75-08	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7570	\N	98fcd6a4-bf53-4bc0-8277-7935794a138b	696	696
5031	CREDIT	Donation via meetup	775	USD	2017-01-17 19:48:10.558-08	2017-01-17 19:48:10.699-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	775	\N	060c2bcb-850a-442e-96a3-907124fbb5e6	696	696
5750	CREDIT	Donations - Fees 	17328	USD	2017-02-06 12:06:15.502-08	2017-02-06 12:06:15.622-08	2	3	\N	2017-02-05 16:00:00-08	\N	\N	\N	\N	\N	\N	\N	\N	173	\N	3bda2f71-4a09-4f4d-9ba9-4d52bdcd10a5	696	696
5751	CREDIT	Taipei Donation - fees and global development	800	USD	2017-02-06 12:11:26.406-08	2017-02-06 12:11:26.522-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	7de04ec6-4f91-4e9f-a7e1-f3ccc020cacc	696	696
5277	CREDIT	Global Network Development	500000	USD	2017-01-25 10:27:46.907-08	2017-01-25 10:27:47.421-08	51	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500000	\N	54b79a9d-1205-4d4c-aa91-534fa732fefb	696	696
5754	CREDIT	Donation - fees	800	USD	2017-02-06 14:10:44.604-08	2017-02-06 14:10:44.763-08	270	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	2628a845-d10d-4426-8c12-14dba874aae2	696	696
5755	CREDIT	Gitlab - transaction and global development	41400	USD	2017-02-06 14:12:42.534-08	2017-02-06 14:12:42.684-08	48	3	\N	2017-02-05 16:00:00-08	\N	\N	\N	\N	\N	\N	\N	\N	414	\N	ef68d68b-3fdf-4a96-951d-ac953118ce75	696	696
5763	CREDIT	Donations via meetup - fees/global development	2000	USD	2017-02-06 14:56:24.306-08	2017-02-06 14:56:24.52-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	96e04578-a558-4d24-a5d5-14d1b469f341	696	696
5764	CREDIT	Donations via meetup - fees	1200	USD	2017-02-06 14:58:38.922-08	2017-02-06 14:58:39.29-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	2b8aeffe-03c4-493a-a5aa-a8733db5860d	696	696
4586	CREDIT	Recurring subscription	1000	USD	2017-01-01 15:32:21.416-08	2017-01-01 15:32:21.416-08	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	630da817-bfc6-4c3e-8ef4-45d11c81e37e	804	696
857	CREDIT	Recurring subscription	100	USD	2016-06-09 10:28:30.802-07	2016-06-09 10:28:30.841-07	3	8	385	\N	\N	320	5	10	33	USD	1	100	52	\N	78157dc7-3c5e-4ff2-a9ce-819906bd27fc	820	696
8350	CREDIT	monthly recurring subscription	100	USD	2017-04-09 11:28:49.104-07	2017-04-09 11:28:49.104-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	1ecffc14-65af-42e5-933f-1520f76d4685	820	696
8398	CREDIT	\N	25000	USD	2017-04-10 18:09:50.621-07	2017-04-10 18:09:50.621-07	13	4153	2535	\N	\N	2421	1250	2500	580	USD	1	25000	20670	\N	d4c8f44d-4c88-4533-87da-1bd5b6f1f16b	843	696
9879	CREDIT	\N	84000	USD	2017-05-09 11:14:23.283-07	2017-05-09 11:14:23.283-07	2	4720	2860	\N	\N	2755	4200	8400	1878	USD	1	84000	69522	\N	254136b6-233d-4361-9aa2-ceddc7305fe8	847	696
9385	CREDIT	\N	154800	USD	2017-05-01 11:02:20.511-07	2017-05-01 11:02:20.511-07	13	3	\N	\N	\N	2649	0	0	0	USD	1	154800	154800	\N	557379b2-4691-47ed-b4bc-30b67a70bcf1	696	696
7511	CREDIT	Leadership Development: Google I/O travel grant for Gen A. 	85000	USD	2017-03-27 06:25:14.008-07	2017-03-27 06:25:14.169-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	85000	\N	7092cdf1-407a-4c49-bddd-4729693bb136	696	696
9943	CREDIT	\N	90000	USD	2017-05-11 09:41:16.759-07	2017-05-11 09:41:16.759-07	59	3	\N	\N	\N	2794	0	0	0	USD	1	90000	90000	\N	97b3a399-75b9-4ed4-b244-db56f1e2cac0	696	696
7518	CREDIT	\N	50000	USD	2017-03-27 10:10:04.622-07	2017-03-27 10:10:04.622-07	12	3	\N	\N	\N	2151	0	0	0	USD	1	50000	50000	\N	9c3381f8-416c-44f2-8e0a-a9d37855a5fe	696	696
6733	CREDIT	Event sponsorship - transaction fees and global development 	856500	USD	2017-03-01 22:00:43.46-08	2017-03-01 22:00:44.182-08	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	856500	\N	7fef39d1-1059-4a44-94f9-5da063341c94	696	696
7523	CREDIT	\N	20000	USD	2017-03-27 10:45:17.58-07	2017-03-27 10:45:17.58-07	59	3	\N	\N	\N	2152	0	0	0	USD	1	20000	20000	\N	21139f0a-dcfa-4a47-90cd-bdf239e2cbcb	696	696
7525	CREDIT	\N	100000	USD	2017-03-27 10:52:38.123-07	2017-03-27 10:52:38.123-07	277	3	\N	\N	\N	2153	0	0	0	USD	1	100000	100000	\N	5fd1044d-b479-447e-bfb5-e6f578c69921	696	696
7526	CREDIT	\N	100000	USD	2017-03-27 10:53:48.539-07	2017-03-27 10:53:48.539-07	277	3	\N	\N	\N	2154	0	0	0	USD	1	100000	100000	\N	79f34f13-1a21-48bc-8119-ab5cf030a034	696	696
614	CREDIT	Women Techmaker WWCode Partnership Grant	70000	USD	2016-05-19 12:17:47.24-07	2016-05-19 12:17:48.401-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	70000	\N	ddd97a2d-71eb-4643-aae4-af9a7e7fad4e	696	696
675	CREDIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	34750	USD	2016-05-26 13:50:28.413-07	2016-05-26 13:50:28.721-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34750	\N	5dc5651e-3b65-4b03-aa66-30990d7efb15	696	696
655	CREDIT	Women Techmaker WWcode Partnership Grant	100000	USD	2016-05-24 13:23:16.28-07	2016-05-24 13:23:16.552-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	\N	1afc5e7f-3794-4830-8b96-08ce05be814a	696	696
7554	CREDIT	International Women's Day Celebrations - Global	51750	USD	2017-03-28 11:27:16.525-07	2017-03-28 11:27:16.748-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	51750	\N	f2ef8d98-6ac6-4954-bbbe-3cedd9ac7522	696	696
8605	CREDIT	\N	4000	GBP	2017-04-17 12:31:52.919-07	2017-04-17 12:31:52.919-07	267	3	\N	\N	\N	2470	0	0	0	GBP	1	4000	4000	\N	c32af448-af25-450f-9fe0-4b3c5f8345a5	696	696
8606	CREDIT	\N	9000	USD	2017-04-17 12:41:07.659-07	2017-04-17 12:41:07.659-07	277	3	\N	\N	\N	2471	0	0	0	USD	1	9000	9000	\N	58e25bdf-36bf-4707-bb32-eabd40e0558f	696	696
8608	CREDIT	\N	100000	USD	2017-04-17 13:41:37.627-07	2017-04-17 13:41:37.627-07	517	3	\N	\N	\N	2472	0	0	0	USD	1	100000	100000	\N	58ac0411-2d75-4b99-b49f-853c0659a78e	696	696
8609	CREDIT	\N	5000	USD	2017-04-17 13:41:53.602-07	2017-04-17 13:41:53.602-07	517	3	\N	\N	\N	2473	0	0	0	USD	1	5000	5000	\N	434d7fb0-0b13-4100-bcc9-38a711f799ad	696	696
8611	CREDIT	\N	85000	GBP	2017-04-17 14:05:15.067-07	2017-04-17 14:05:15.067-07	278	3	\N	\N	\N	2474	0	0	0	GBP	1	85000	85000	\N	afc6310f-79f8-4fa7-9010-33c13c3dfeec	696	696
8612	CREDIT	\N	4250	GBP	2017-04-17 14:06:54.803-07	2017-04-17 14:06:54.803-07	278	3	\N	\N	\N	2475	0	0	0	GBP	1	4250	4250	\N	cda5fd1c-4285-4631-aff6-7a4a1fb62bcb	696	696
8615	CREDIT	\N	100000	USD	2017-04-17 15:09:42.57-07	2017-04-17 15:09:42.57-07	270	3	\N	\N	\N	2477	0	0	0	USD	1	100000	100000	\N	d6795ff7-d1a1-4a77-a77b-a0731062a244	696	696
8617	CREDIT	\N	41000	GBP	2017-04-17 15:31:52.729-07	2017-04-17 15:31:52.729-07	278	3	\N	\N	\N	2486	0	0	0	GBP	1	41000	41000	\N	463ec0d3-ae29-42e5-97ee-277cca8ceca9	696	696
8619	CREDIT	\N	25000	MXN	2017-04-17 15:34:32.259-07	2017-04-17 15:34:32.259-07	511	3	\N	\N	\N	2487	0	0	0	MXN	1	25000	25000	\N	3b170ab8-edef-4461-983d-efd3689fda2c	696	696
8620	CREDIT	\N	18800	MXN	2017-04-17 15:35:06.093-07	2017-04-17 15:35:06.093-07	511	3	\N	\N	\N	2488	0	0	0	MXN	1	18800	18800	\N	72c1775e-82bb-418c-8112-0953e2c003a2	696	696
8621	CREDIT	\N	2200	MXN	2017-04-17 15:35:55.014-07	2017-04-17 15:35:55.014-07	511	3	\N	\N	\N	2489	0	0	0	MXN	1	2200	2200	\N	a30d7b67-9e28-40c1-a02c-9fd585600114	696	696
8624	CREDIT	\N	100000	USD	2017-04-17 15:40:40.357-07	2017-04-17 15:40:40.357-07	430	3	\N	\N	\N	2490	0	0	0	USD	1	100000	100000	\N	37a49008-00ca-489c-876a-6d26c25a46bb	696	696
2338	CREDIT	VMWare Network Support	195000	USD	2016-10-07 12:55:50.273-07	2016-10-07 12:55:50.509-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	195000	\N	e0aedba4-c471-4406-bc4c-480b6388a75d	696	696
8664	CREDIT	\N	3562	GBP	2017-04-18 12:41:30.286-07	2017-04-18 12:41:30.286-07	278	3	\N	\N	\N	2503	0	0	0	GBP	1	3562	3562	\N	0557cec2-bc9a-43c5-a702-38116a1ab389	696	696
8671	CREDIT	\N	1198	USD	2017-04-18 17:19:14.321-07	2017-04-18 17:19:14.321-07	12	3	\N	\N	\N	2505	0	0	0	USD	1	1198	1198	\N	ff39b4d0-ec21-448e-a987-b2cf172c5bdc	696	696
8672	CREDIT	\N	1480	USD	2017-04-18 17:20:11.527-07	2017-04-18 17:20:11.527-07	12	3	\N	\N	\N	2506	0	0	0	USD	1	1480	1480	\N	41154072-0424-4ec6-9f81-9ca8cce5420a	696	696
8673	CREDIT	\N	1400	USD	2017-04-18 17:31:31.942-07	2017-04-18 17:31:31.942-07	195	3	\N	\N	\N	2507	0	0	0	USD	1	1400	1400	\N	36ea5d6f-9e03-4116-8db7-201d91018475	696	696
7661	CREDIT	\N	50000	USD	2017-03-31 10:17:51.695-07	2017-03-31 10:17:51.695-07	2	3	\N	\N	\N	2204	0	0	0	USD	1	50000	50000	\N	fbf7dada-78ae-4886-9094-aed19838ed67	696	696
7662	CREDIT	\N	79600	GBP	2017-03-31 10:20:23.917-07	2017-03-31 10:20:23.917-07	267	3	\N	\N	\N	2206	0	0	0	GBP	1	79600	79600	\N	bd840d8c-6019-4588-bc03-94a0ae07b331	696	696
8675	CREDIT	\N	1480	USD	2017-04-18 17:39:23.15-07	2017-04-18 17:39:23.15-07	14	3	\N	\N	\N	2508	0	0	0	USD	1	1480	1480	\N	85822cfc-ab85-4318-b357-4cbff6b96682	696	696
7665	CREDIT	\N	80500	GBP	2017-03-31 10:54:33.461-07	2017-03-31 10:54:33.461-07	278	3	\N	\N	\N	2208	0	0	0	GBP	1	80500	80500	\N	d7f6d62d-4f73-400b-ac9e-57bcfac50780	696	696
7667	CREDIT	\N	39800	GBP	2017-03-31 11:01:48.418-07	2017-03-31 11:01:48.418-07	278	3	\N	\N	\N	2209	0	0	0	GBP	1	39800	39800	\N	f38d81a7-0640-43e1-adaa-eae03b43254a	696	696
7683	CREDIT	\N	100000	USD	2017-03-31 15:32:34.123-07	2017-03-31 15:32:34.123-07	286	3	\N	\N	\N	2212	0	0	0	USD	1	100000	100000	\N	ed1324c1-c55c-47b7-ac88-afc3f3ba3a7d	696	696
7686	CREDIT	\N	20000	USD	2017-03-31 15:50:23.915-07	2017-03-31 15:50:23.915-07	286	3	\N	\N	\N	2214	0	0	0	USD	1	20000	20000	\N	93ca4243-7895-4061-b20e-8d0aaaa2a3f9	696	696
7687	CREDIT	\N	7500	USD	2017-03-31 15:52:45.079-07	2017-03-31 15:52:45.079-07	286	3	\N	\N	\N	2215	0	0	0	USD	1	7500	7500	\N	a8c774d9-c22c-4df9-a8a2-7b7fb56da05c	696	696
7688	CREDIT	\N	50000	CAD	2017-03-31 16:37:30.819-07	2017-03-31 16:37:30.819-07	291	3	\N	\N	\N	2217	0	0	0	CAD	1	50000	50000	\N	5c191b8e-cc26-4f14-9ad4-bc6c7f3e1f05	696	696
8705	CREDIT	\N	1480	USD	2017-04-19 11:18:19.043-07	2017-04-19 11:18:19.043-07	2	3	\N	\N	\N	2519	0	0	0	USD	1	1480	1480	\N	48409b35-4280-4659-971c-3ec3178252f0	696	696
8706	CREDIT	\N	40000	USD	2017-04-19 11:26:01.228-07	2017-04-19 11:26:01.228-07	3	3	\N	\N	\N	2520	0	0	0	USD	1	40000	40000	\N	5272792e-d8c4-4354-8dff-c2e24a66999a	696	696
8707	CREDIT	\N	1190	USD	2017-04-19 11:26:58.997-07	2017-04-19 11:26:58.997-07	3	3	\N	\N	\N	2521	0	0	0	USD	1	1190	1190	\N	6189157f-8088-48c0-9964-a66fe4fcfee1	696	696
8708	CREDIT	\N	610	USD	2017-04-19 11:35:03.04-07	2017-04-19 11:35:03.04-07	59	3	\N	\N	\N	2522	0	0	0	USD	1	610	610	\N	477a5aef-b895-4774-8b86-b1f5156fd8b6	696	696
9621	CREDIT	\N	2930	USD	2017-05-01 17:33:45.73-07	2017-05-01 17:33:45.73-07	3	3	\N	\N	\N	2662	0	0	0	USD	1	2930	2930	\N	08015eaa-ad1d-4dd5-9704-3de345b88094	696	696
9357	CREDIT	\N	500	USD	2017-05-01 10:13:34.851-07	2017-05-01 10:13:34.851-07	516	4550	2757	\N	\N	2644	25	50	41	USD	1	500	384	\N	9470e412-b1bd-46f6-a497-907e6d8c9a4d	786	696
10051	CREDIT	\N	20000	USD	2017-05-15 05:07:59.63-07	2017-05-15 05:07:59.63-07	14	4834	2922	\N	\N	2817	1000	2000	470	USD	1	20000	16530	\N	2f09aa94-9b15-47bc-8e9c-b8ab6d67d426	800	696
5533	CREDIT	\N	22500	USD	2017-02-01 07:16:20.999-08	2017-02-01 07:16:20.999-08	48	2898	1801	\N	\N	1709	1125	2250	525	USD	1	22500	18600	\N	6d643f90-fadf-4d61-bdcf-784eba7d76d1	802	696
6421	CREDIT	\N	30000	CAD	2017-02-27 16:25:20.325-08	2017-02-27 16:25:20.325-08	522	3301	2030	\N	\N	1935	1121	1120	523	USD	1.33832976445396135	22416	26301	\N	e838bae8-af91-48a1-8619-e42c8aab84c7	838	696
8728	CREDIT	\N	10000	USD	2017-04-20 03:17:23.286-07	2017-04-20 03:17:23.286-07	59	4348	2643	\N	\N	2532	500	1000	350	USD	1	10000	8150	\N	04384e27-0f6b-407a-a8d1-e8353f9a4c98	841	696
5540	CREDIT	\N	2500	USD	2017-02-01 09:30:48.467-08	2017-02-01 09:30:48.467-08	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	a88cbaf9-3c16-494f-9fb9-1ff207e24d4a	692	696
4124	CREDIT	\N	2500	USD	2016-12-18 17:42:01.104-08	2016-12-18 17:42:01.104-08	259	2220	1472	2016-12-27 16:00:00-08	\N	1389	125	250	85	USD	1	2500	2040	\N	3290a890-4996-4581-a0b7-6db14e41f5a8	700	696
4957	CREDIT	\N	50000	USD	2017-01-16 10:03:56.108-08	2017-01-16 10:03:56.108-08	48	2561	1622	\N	\N	1537	2500	5000	1130	USD	1	50000	41370	\N	b7c440d2-8682-4b57-93b6-3d3dd3cfed88	701	696
5019	CREDIT	WWCode t-shirt sales	1229	USD	2017-01-17 19:23:59.112-08	2017-01-17 19:23:59.247-08	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1229	\N	a43c6a3d-406e-43de-98bb-0e151a1b8fea	696	696
5020	CREDIT	WWCode t-shirt sales	982	USD	2017-01-17 19:24:31.362-08	2017-01-17 19:24:31.504-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	982	\N	e22d04c4-f74f-4484-a0b3-9007b55c94a8	696	696
1884	CREDIT	Recurring subscription	1000	USD	2016-09-09 20:42:56.392-07	2016-09-09 20:42:56.392-07	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	a73ee6ae-c18d-406f-a24b-4c04f218c3e3	737	696
645	CREDIT	Donation to WWCode Austin	50000	USD	2016-05-23 13:27:28.524-07	2016-05-23 13:27:28.599-07	2	426	306	\N	\N	258	2500	5000	1480	USD	1	50000	41020	\N	f63c7344-8631-43e0-8d56-70bf3f01998c	742	696
1392	CREDIT	Donation to WWCode Austin	20000	USD	2016-08-01 08:55:27.083-07	2016-08-01 08:55:27.184-07	2	884	562	\N	\N	489	1000	2000	470	USD	1	20000	16530	\N	c0b172e7-1ce8-45a7-a51d-5c1098baeeb8	751	696
4899	CREDIT	Recurring subscription	1000	USD	2017-01-14 09:12:01.244-08	2017-01-14 09:12:01.244-08	270	2549	1616	\N	\N	1531	50	100	52	USD	1	1000	798	\N	63e320d2-5114-4fc3-8daa-8c636b663d98	763	696
5969	CREDIT	monthly recurring subscription	1000	USD	2017-02-14 10:13:04.109-08	2017-02-14 10:13:04.109-08	270	2549	1616	\N	\N	1531	50	100	52	USD	1	1000	798	\N	41a806dd-fae3-47ec-8291-293cc822ae9b	763	696
986	CREDIT	Donation to WWCode Twin Cities	100	USD	2016-06-21 09:06:05.517-07	2016-06-21 09:06:05.626-07	48	642	432	\N	\N	361	5	10	32	USD	1	100	53	\N	44e3ee1d-5777-4ea7-9dfb-e651db755946	776	696
984	CREDIT	Donation to WWCode Atlanta	100	USD	2016-06-21 09:02:56.072-07	2016-06-21 09:02:56.13-07	12	642	430	\N	\N	359	5	10	32	USD	1	100	53	\N	fdf511fc-d0e4-4322-aa0a-49ebacbb1e08	776	696
2055	CREDIT	\N	25000	USD	2016-09-22 18:07:09.492-07	2016-09-22 18:07:09.492-07	59	1263	790	\N	\N	700	1250	2500	580	USD	1	25000	20670	\N	c037d2a1-7fa4-4875-b084-2c8d7605d567	793	696
2143	CREDIT	\N	19000	USD	2016-09-28 14:47:18.302-07	2016-09-28 14:47:18.302-07	2	1299	842	\N	\N	768	950	1900	665	USD	1	19000	15485	\N	c4585b37-a213-4c1c-ba1f-8b9a0a9e3793	796	696
478	CREDIT	Donation to WWCode Austin	150000	USD	2016-05-03 06:07:28.39-07	2016-05-03 06:07:28.452-07	2	308	230	\N	\N	191	7500	15000	4380	USD	1	150000	123120	\N	31bd69fa-cc92-405a-a116-d31a2a40d4d1	799	696
1080	CREDIT	Recurring subscription	1000	USD	2016-07-01 15:38:37.594-07	2016-07-01 15:38:37.617-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	d414ca78-a0ca-4706-8533-c9f54acba200	804	696
1395	CREDIT	Recurring subscription	1000	USD	2016-08-01 16:35:39.219-07	2016-08-01 16:35:39.244-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	9056ebd9-568b-47c4-ba61-a4830e554a1c	804	696
1792	CREDIT	Recurring subscription	1000	USD	2016-09-01 16:32:42.475-07	2016-09-01 16:32:42.475-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	f8a6849c-0a33-4c9a-b04f-a5f96d063bfc	804	696
2887	CREDIT	Recurring subscription	1000	USD	2016-11-01 16:32:30.439-07	2016-11-01 16:32:30.439-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	103586f6-637d-4a72-87bc-a5f247e540e6	804	696
1461	CREDIT	Donation to WWCode Austin	150000	USD	2016-08-05 13:48:08.414-07	2016-08-05 13:48:08.458-07	2	192	589	\N	\N	513	7500	15000	5250	USD	1	150000	122250	\N	3cd012ba-7cbf-4008-b0db-7a4b51a0d7df	806	696
3471	CREDIT	\N	4000	USD	2016-11-28 07:33:14.428-08	2016-11-28 07:33:14.428-08	2	1890	1249	\N	\N	1167	200	400	118	USD	1	4000	3282	\N	52c746a4-eba7-4a0f-963c-e6e2e3f22f53	811	696
290	CREDIT	Recurring subscription	100	USD	2016-04-02 19:02:46.616-07	2016-04-16 13:40:58.82-07	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	3464d1b8-8be5-451a-bee5-fd4129ac6455	820	696
1174	CREDIT	Recurring subscription	100	USD	2016-07-09 11:31:14.547-07	2016-07-09 11:31:14.585-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	321662c1-bd0e-45c1-a83b-15734580a904	820	696
1498	CREDIT	Recurring subscription	100	USD	2016-08-09 11:30:50.866-07	2016-08-09 11:30:50.915-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	8a688e20-988b-4f55-b69d-bb6632da3ece	820	696
1876	CREDIT	Recurring subscription	100	USD	2016-09-09 11:29:12.276-07	2016-09-09 11:29:12.276-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	0883360f-716b-4be8-a920-9ab0f71e399b	820	696
2360	CREDIT	Recurring subscription	100	USD	2016-10-09 11:36:17.958-07	2016-10-09 11:36:17.958-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	53835d40-3ec2-48e7-8d85-8f9381ef368c	820	696
337	CREDIT	Donation to WWCode Austin	20000	USD	2016-04-13 09:46:10.463-07	2016-04-16 13:40:58.845-07	2	224	173	\N	\N	153	1000	2000	610	USD	1	20000	16390	\N	07e21011-0879-4523-b624-073fdfd704c3	821	696
449	CREDIT	Donation to WWCode Washington DC	50000	USD	2016-04-28 08:01:17.801-07	2016-04-28 08:01:17.846-07	13	283	213	\N	\N	181	2500	5000	1480	USD	1	50000	41020	\N	d7208bd6-4f00-4c5d-b85e-3792419450d5	825	696
5861	CREDIT	\N	84241	USD	2017-02-10 08:47:34.349-08	2017-02-10 08:47:34.349-08	15	3053	1890	\N	\N	1801	4212	8424	1883	USD	1	84241	69722	\N	fc5a47be-5fc1-4a9a-bc52-978334aa0481	839	696
1391	CREDIT	Donation to WWCode Austin	150000	USD	2016-08-01 08:54:14.382-07	2016-08-01 08:54:14.468-07	2	883	561	\N	\N	488	7500	15000	3330	USD	1	150000	124170	\N	0577aa52-6ea8-4268-9559-de120c9fd743	840	696
6709	CREDIT	monthly recurring subscription	1000	USD	2017-03-01 15:40:00.024-08	2017-03-01 15:40:00.024-08	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	71e7d3cd-cd4b-465b-a6d1-a0242bb22558	804	696
43	CREDIT	Donation to WWCode Mexico City	500	USD	2016-01-18 15:54:06.439-08	2016-04-16 13:40:58.672-07	10	2	34	\N	\N	65	25	50	45	USD	1	500	380	\N	c9a65b3a-a9bd-40b3-a806-ec5d4a273187	688	696
475	CREDIT	Recurring subscription	100	USD	2016-05-02 17:15:49.65-07	2016-05-02 17:15:49.711-07	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	5ed9ac7d-2cbb-49b4-8eb0-35a8a50396b5	688	696
469	CREDIT	Recurring subscription	100	USD	2016-05-02 10:46:41.832-07	2016-05-02 10:46:41.894-07	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	eb45eaa9-743d-437f-a0df-986c0842d91d	691	696
129	CREDIT	Recurring subscription	100	USD	2016-03-02 10:26:05.731-08	2016-04-16 13:40:58.833-07	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	73f453a9-ae3a-4ca9-82e9-cc61d3644969	691	696
74	CREDIT	Donation to WWCode Washington DC	100	USD	2016-02-02 09:09:22.069-08	2016-04-16 13:40:58.697-07	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	86ca72b0-3163-400d-83e1-e17d7f182d7e	691	696
66	CREDIT	Donation to WWCode Atlanta	1000	USD	2016-01-29 14:23:53.315-08	2016-04-16 13:40:58.701-07	12	30	39	\N	\N	13	0	50	59	USD	1	1000	891	\N	03ad4ae8-f8d6-4d38-88d8-d6ebf43650b9	691	696
128	CREDIT	Recurring subscription	100	USD	2016-03-02 10:19:33.362-08	2016-04-16 13:40:58.737-07	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	9b592cfc-6e21-487e-9471-b7491af84c89	691	696
281	CREDIT	Recurring subscription	100	USD	2016-04-02 12:27:54.641-07	2016-04-16 13:40:58.809-07	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	09102f53-5640-469e-8568-f546e4636908	691	696
278	CREDIT	Recurring subscription	100	USD	2016-04-02 11:13:51.122-07	2016-04-16 13:40:58.81-07	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	f2a2c11a-e7c9-4578-8401-fb4e1d15e22a	691	696
280	CREDIT	Recurring subscription	100	USD	2016-04-02 12:09:44.502-07	2016-04-16 13:40:58.811-07	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	de316074-f0f1-41f4-bd2d-502dbfeceeae	691	696
70	CREDIT	Donation to WWCode Washington DC	100	USD	2016-02-02 09:04:56.247-08	2016-04-16 13:40:58.698-07	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	bedf3c7c-2d98-43a2-b73b-761b68cd2b0c	691	696
126	CREDIT	Recurring subscription	100	USD	2016-03-02 09:53:54.346-08	2016-04-16 13:40:58.736-07	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	f7a13ef8-2a57-4e4b-99f1-3a016d405ebf	691	696
68	CREDIT	Donation to WWCode Seattle	100	USD	2016-02-02 08:36:38.327-08	2016-04-16 13:40:58.702-07	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	74fb2375-fab0-436c-8f56-5051ee3c26ad	691	696
470	CREDIT	Recurring subscription	100	USD	2016-05-02 11:10:42.774-07	2016-05-02 11:10:42.847-07	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	f99307f9-7e49-4414-a2cf-c69326ceb1c4	691	696
472	CREDIT	Recurring subscription	100	USD	2016-05-02 11:15:35.25-07	2016-05-02 11:15:35.307-07	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	89fe586a-cc2d-4bbe-9781-196390e19e37	691	696
9408	CREDIT	monthly recurring subscription	2500	USD	2017-05-01 11:32:00.085-07	2017-05-01 11:32:00.085-07	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	2fcb187e-35f4-4735-9101-698ea41ab1aa	692	696
6649	CREDIT	monthly recurring subscription	2500	USD	2017-03-01 10:37:53.591-08	2017-03-01 10:37:53.591-08	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	ec153d42-d2ae-4d56-a4aa-f223962a4ca2	692	696
8427	CREDIT	\N	2500	USD	2017-04-11 19:05:36.032-07	2017-04-11 19:05:36.032-07	13	4173	2546	\N	\N	2430	125	250	85	USD	1	2500	2040	\N	b9bf7bb6-c80e-4b7f-8729-f2e26f39f5e9	694	696
127	CREDIT	Recurring subscription	500	MXN	2016-03-02 10:06:23.743-08	2016-04-16 13:40:58.731-07	10	80	42	\N	\N	68	2	3	16	USD	17.8570999999999991	28	125	\N	2b05e30a-ef47-4a1e-b090-382b227c3b5b	769	696
69	CREDIT	Donation to WWCode Mexico City	500	MXN	2016-02-02 08:52:02.237-08	2016-04-16 13:40:58.703-07	10	80	42	\N	\N	68	1	2	16	USD	18.5100000000000016	27	148	\N	26a163a5-8959-4ab4-bef5-3d07360183e6	769	696
616	CREDIT	Donation to WWCode Austin	50000	USD	2016-05-19 12:24:43.134-07	2016-05-19 12:24:43.182-07	2	392	288	\N	\N	246	2500	5000	1480	USD	1	50000	41020	\N	4590ecf9-25b0-4935-9570-12af202cc187	719	696
6944	CREDIT	monthly recurring subscription	1000	USD	2017-03-09 20:43:47.943-08	2017-03-09 20:43:47.943-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	9b332c05-04c1-4be6-8df7-bd7246af38c4	737	696
8365	CREDIT	monthly recurring subscription	1000	USD	2017-04-09 21:43:06.965-07	2017-04-09 21:43:06.965-07	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	a25de37e-df40-4317-90a5-36e217a8ba46	737	696
4793	CREDIT	Recurring subscription	1000	USD	2017-01-09 20:43:19.956-08	2017-01-09 20:43:19.956-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	2c128b7c-932b-47b7-af1a-311fa87351de	737	696
9898	CREDIT	monthly recurring subscription	1000	USD	2017-05-09 21:43:13.462-07	2017-05-09 21:43:13.462-07	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	96fff2b3-0c71-4009-8d16-285415e17f66	737	696
2370	CREDIT	Recurring subscription	1000	USD	2016-10-09 21:49:33.558-07	2016-10-09 21:49:33.558-07	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	270aedde-c9b9-4d4d-b0b2-c79795f17316	737	696
3056	CREDIT	Recurring subscription	1000	USD	2016-11-09 20:43:57.271-08	2016-11-09 20:43:57.271-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	00ceec95-2161-4179-acba-658bcc889e16	737	696
3886	CREDIT	Recurring subscription	1000	USD	2016-12-09 20:43:00.244-08	2016-12-09 20:43:00.244-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	3a1a2d26-2613-4c61-bb5f-a9fc2f3beffb	737	696
5852	CREDIT	monthly recurring subscription	1000	USD	2017-02-09 20:43:49.515-08	2017-02-09 20:43:49.515-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	86ad6819-a20f-4543-a31c-0e1a121bb79f	737	696
9595	CREDIT	monthly recurring subscription	1000	USD	2017-05-01 16:34:11.708-07	2017-05-01 16:34:11.708-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	c70f2fd8-da04-4f99-97a1-72c05a99dfa1	804	696
3669	CREDIT	Recurring subscription	1000	USD	2016-12-01 15:32:26.764-08	2016-12-01 15:32:26.764-08	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	d7a57bda-4dda-46e1-badb-2dc573225d85	804	696
5578	CREDIT	monthly recurring subscription	1000	USD	2017-02-01 15:34:44.326-08	2017-02-01 15:34:44.326-08	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	5a54016f-f69c-49ef-8d2f-f03740ca539c	804	696
3047	CREDIT	Recurring subscription	100	USD	2016-11-09 10:29:23.967-08	2016-11-09 10:29:23.967-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	c416f18a-645f-4ba1-bc60-7f6ef6291cf5	820	696
131	CREDIT	Recurring subscription	100	USD	2016-03-02 15:01:26.771-08	2016-04-16 13:40:58.719-07	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	8abd55fb-f09a-4c77-862a-144f73ebdd0d	820	696
3876	CREDIT	Recurring subscription	100	USD	2016-12-09 10:29:17.341-08	2016-12-09 10:29:17.341-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	77717eed-fb45-4bf8-a43d-45391bee0f68	820	696
4779	CREDIT	Recurring subscription	100	USD	2017-01-09 10:28:29.701-08	2017-01-09 10:28:29.701-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	410d7ba2-bc7c-4acf-9ad8-182b43caacd4	820	696
5838	CREDIT	monthly recurring subscription	100	USD	2017-02-09 10:29:30.017-08	2017-02-09 10:29:30.017-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	5c8b0763-ddec-4adc-a069-ad809703c9dd	820	696
9747	DEBIT	Google i/o travel stipend for Yelyzaveta (plus $12 transfer fees)	-101200	USD	2017-05-04 12:06:09.002-07	2017-05-04 12:06:09.002-07	430	3	\N	\N	\N	\N	\N	\N	0	USD	1	-101200	-101200	1099	796b8ada-4bee-4687-a76e-d3f79e5030cb	696	696
329	DEBIT	Meetup Donation Transaction Fee	-163	USD	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.849-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-163	81	6fb44ff1-4646-411e-ac08-543d20851f57	696	696
369	DEBIT	Stacey Schipper Reimbursement	-2322	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.873-07	15	3	\N	2016-06-14 11:14:22.471-07	\N	\N	\N	\N	\N	\N	\N	\N	-2322	92	570c1e94-beca-4a11-b728-e574dfead3e1	696	696
569	DEBIT	Conference Grant	-50000	MXN	2016-05-16 07:49:37.27-07	2016-06-14 11:14:22.052-07	10	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	164	0076bcbc-8e3e-4830-87c4-d396f2cdf087	696	696
668	DEBIT	Leadership Tools (director tees)	-2698	USD	2015-12-14 16:00:00-08	2016-06-14 11:14:22.114-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2698	192	f90b7ceb-7395-4eb6-b70e-aa3b53a18421	696	696
865	DEBIT	Reimburse Caterina Paun for supplies and mailing expenses	-5504	USD	2015-12-14 16:00:00-08	2016-06-14 11:14:22.175-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5504	225	391f2946-af6d-4dad-9a31-43496d058bb4	696	696
1954	DEBIT	Event food	-2911	USD	2016-09-15 17:09:43.149-07	2016-09-15 17:09:43.531-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2911	345	86b66e81-a6ce-436d-9ea0-161fa976ce9d	696	696
1577	DEBIT	Food for Denver Meetup	-9939	USD	2016-08-16 07:52:04.669-07	2016-08-16 07:52:04.682-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9939	\N	eacc72ec-714e-4065-adde-f3d1cf5e4c95	696	696
1575	DEBIT	Minimum Fee - June	-995	USD	2016-08-16 07:51:24.796-07	2016-08-16 07:51:24.811-07	12	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-995	\N	fc97ec24-7b82-4bd3-9b1a-fa6467d7a0b3	696	696
1578	DEBIT	Pizza for July monthly event.	-12555	USD	2016-08-16 07:52:47.781-07	2016-08-16 07:52:47.799-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-12555	\N	826070d5-3387-42cf-a309-b25b59fd86b1	696	696
1579	DEBIT	Minimum fee - May	-990	USD	2016-08-16 07:53:06.001-07	2016-08-16 07:53:06.015-07	13	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-990	\N	934eda05-b122-4c9e-8b1a-097bfb4018d7	696	696
1631	DEBIT	Coding books for our study groups (Humble Bundle -- Joy of Coding)	-1500	USD	2016-08-19 13:58:54.527-07	2016-08-19 13:58:54.67-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1500	318	0b0b7cb8-20eb-4ed8-b5eb-d5db91b35e38	696	696
331	DEBIT	Global Development	-10000	USD	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.849-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	80	4bb6798b-e4d6-46aa-a5c3-2d0644c040c9	696	696
1921	DEBIT	Event food	-3224	USD	2016-09-13 07:57:04.698-07	2016-09-13 07:57:05.111-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3224	346	5c624478-95c6-4d37-94e1-3d7ffe3895bd	696	696
2110	DEBIT	Two VR headsets for our AR/VR event at Best Buy.	-4898	USD	2016-09-27 12:31:43.164-07	2016-09-27 12:31:43.42-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4898	366	20ddc19e-87b3-4e08-9648-4ae868f40fe9	696	696
4364	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:16:27.082-08	2016-12-27 08:16:27.082-08	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	633	f733707f-81b8-4b1a-8fb4-5d36f7398e4d	696	696
461	DEBIT	WWC Stickers	-7000	USD	2016-03-17 17:00:00-07	2016-06-14 11:14:21.998-07	15	68	\N	2016-06-14 11:14:22.481-07	\N	\N	\N	\N	\N	\N	\N	\N	-7000	138	61723292-7257-4ab6-94d3-d267da41382b	756	696
98	DEBIT	Libretas Hackathon	-1038000	MXN	2016-02-16 10:56:17.216-08	2016-06-14 11:14:21.738-07	10	7	\N	2016-06-14 11:14:22.435-07	\N	\N	\N	\N	\N	\N	\N	\N	-1038000	33	18ee4a98-66b6-47d6-85a0-0d4ead04f2d7	822	696
7114	DEBIT	Plaques for IWD awards ceremony​ 	-54783	USD	2017-03-15 06:57:14.454-07	2017-03-15 06:57:14.471-07	12	69	2149	\N	\N	\N	\N	\N	1619	USD	1	-54783	-56402	888	a2ba1105-8ddd-44fc-ba97-591d7dfc1356	835	696
3838	DEBIT	Food for monthly hack night from Antonino Bertolo's Pizza & Wine Bar.	-4300	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4351	483	01ad80e1-007c-45b3-8b32-1583b3417b16	844	696
229	DEBIT	Mar 3 hack night	-4951	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.784-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4951	55	3e4baefa-db35-450e-9660-bc4dca4d53fc	848	696
638	DEBIT	May 5 South Hack Night	-5325	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.083-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5325	181	f3cdf43c-6016-4d3f-812c-eedaec5a2fb3	848	696
2232	DEBIT	90/10 split: AT&T Sponsorship (April 2015)	-100000	USD	2016-10-04 08:44:28.558-07	2016-10-04 08:44:28.558-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100000	389	254566c7-f97b-43d5-9910-c414520ad3bf	696	696
2233	DEBIT	Google I/O: Alicia Carr	-10000	USD	2016-10-04 08:44:35.988-07	2016-10-04 08:44:35.988-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	387	7ae2b68c-c128-4dbd-a90e-a82fa24579bb	696	696
2285	DEBIT	Event Food	-2077	USD	2016-10-05 09:43:28.448-07	2016-10-05 09:43:28.644-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2077	374	cdf1fd80-a036-4c27-8a92-17a09ae5c91b	696	696
2286	DEBIT	Event supplies	-2715	USD	2016-10-05 09:44:00.394-07	2016-10-05 09:44:00.521-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2715	375	42291373-8c70-4ccc-b6c1-ec4c36403599	696	696
2287	DEBIT	Event Food	-7167	USD	2016-10-05 09:44:47.862-07	2016-10-05 09:44:48.013-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7167	378	0591fc4f-0d49-4e83-ac11-6f4b4e5475ea	696	696
2288	DEBIT	Marketing Materials	-2475	USD	2016-10-05 09:45:14.357-07	2016-10-05 09:45:14.485-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2475	376	a346ac76-b04b-4514-be71-84d9bf2c88ce	696	696
2297	DEBIT	Stickers	-62984	USD	2016-10-06 08:49:20.942-07	2016-10-06 08:49:20.967-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-62984	\N	fbae4c36-1eef-4816-94f6-f9589f62ef9e	696	696
2326	DEBIT	Conference stipend - Gen A.	-102409	GBP	2016-10-07 06:10:14.088-07	2016-10-07 06:10:14.841-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-102409	\N	55b95c98-c784-41c3-be4b-e0f81a9a75dc	696	696
3532	DEBIT	Leadership Development - speaking event	-25000	USD	2016-11-29 14:39:25.11-08	2016-11-29 14:39:25.31-08	47	3	\N	2016-11-28 16:00:00-08	\N	\N	\N	\N	\N	\N	\N	\N	-25000	\N	988e7f82-d35f-4c4e-a037-f45bf5115c05	696	696
3802	DEBIT	Snacks and dessert	-38874	USD	2016-12-06 09:02:53.61-08	2016-12-06 09:02:54.44-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-38874	\N	938601d7-a5d1-47a7-94b8-11b626ea9014	696	696
3536	DEBIT	Banner	-2000	USD	2016-11-29 15:07:29.03-08	2016-11-29 15:07:29.148-08	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	c09714f1-2fc3-4fb8-a367-95d18db0ab21	696	696
2738	DEBIT	Gift Card for Volunteer	-10000	USD	2016-10-27 14:03:46.196-07	2016-10-27 14:03:46.328-07	300	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	\N	9783d14c-2659-46ed-948a-7e672ce73c08	696	696
2763	DEBIT	lunch ordered at Costco	-64978	USD	2016-10-28 14:30:59.537-07	2016-10-28 14:30:59.772-07	300	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-64978	418	19a3cace-58b7-4661-b4a1-076155bb69aa	696	696
2839	DEBIT	Cash for Prizes/Bartender	-50000	USD	2016-11-01 08:15:55.737-07	2016-11-01 08:15:55.892-07	2	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	5f64b05e-f6fb-4b01-adfd-950c22e3a12e	696	696
2799	DEBIT	Google DevFest event that WWC sponsored and attended. Two large banners. Table cloth. Plus my luggage since I went directly from airport. 	-1305	USD	2016-10-31 10:52:11.82-07	2016-10-31 10:52:12.734-07	14	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1305	427	70dd8d78-1052-4a85-ac86-eeaed28d2c15	696	696
2938	DEBIT	dinner - downpament	-70000	USD	2016-11-03 12:36:06.461-07	2016-11-03 12:36:06.793-07	300	3	1115	\N	\N	\N	\N	\N	\N	\N	\N	\N	-70000	\N	12330ad4-6281-4e16-afad-353af55d6e65	696	696
2946	DEBIT	Conference Travel	-53720	USD	2016-11-03 14:27:22.46-07	2016-11-03 14:27:22.847-07	48	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	-53720	333	978ddad8-6f16-4c1c-9d03-58133cf4f3f3	696	696
3234	DEBIT	Food (ATXDivHack)	-119954	USD	2016-11-18 13:01:43.887-08	2016-11-18 13:01:44.336-08	2	3	1189	\N	\N	\N	\N	\N	\N	\N	\N	\N	-119954	466	6a6bfacf-cc60-4e92-a2dc-a0d97d985107	696	696
3515	DEBIT	Mathews Group 	-60000	USD	2016-11-29 13:45:09.136-08	2016-11-29 13:45:09.136-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-60000	\N	c5efa3b7-8be0-4c0b-bbf0-d03f78aefba8	696	696
3284	DEBIT	Food (ATXDivHack)	-339421	USD	2016-11-21 07:23:08.279-08	2016-11-21 07:23:08.279-08	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-339421	467	4a086d99-828a-4a85-8a6f-608d3bd7d765	696	696
3294	DEBIT	DIANA A. SCHOLARSHIP GOOGLE I/O	-25000	USD	2016-11-21 14:59:43.764-08	2016-11-21 14:59:43.764-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-25000	396	0753f9e4-051f-4578-a13f-72dce3b8075d	696	696
3332	DEBIT	Thank you cards, Christmas cards, stamps (for hackathon and all 2016 sponsors)	-4874	USD	2016-11-22 13:55:10.575-08	2016-11-22 13:55:10.713-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4874	498	f33703a8-5093-41fa-8cc7-0f246e735325	696	696
3587	DEBIT	Postage to send hackathon gifts to sponsors	-1628	USD	2016-11-30 08:09:00.364-08	2016-11-30 08:09:00.529-08	2	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1628	\N	f36b82ec-cc72-4b8e-939b-73ea09a61f92	696	696
3588	DEBIT	Frames for sponsor gifts	-4054	USD	2016-11-30 08:11:18.637-08	2016-11-30 08:11:18.805-08	2	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4054	\N	892315b3-81bc-4bd8-891b-3b167173d2bc	696	696
3793	DEBIT	We Code Hackathon 2016	-2374	USD	2016-12-06 08:50:34.842-08	2016-12-06 08:50:35.964-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2374	500	38b70e02-a7b4-40c6-952d-6af6478b8b15	696	696
3833	DEBIT	Goodie Bags	-1058	USD	2016-12-07 12:49:55.814-08	2016-12-07 12:49:56.33-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1058	573	6493e4b7-0f63-4534-bf0b-f0ab17750c9e	696	696
3835	DEBIT	Leadership Event in Sofia	-1019	EUR	2016-12-07 13:30:48.339-08	2016-12-07 13:30:48.523-08	301	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1019	470	84e835ea-fd72-47a5-8dd8-92a3cee7fe26	696	696
4379	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:55:07.385-08	2016-12-27 08:55:07.385-08	275	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	641	ec06bfa7-3251-4878-aa74-24f43641fa64	696	696
4381	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:59:33.873-08	2016-12-27 08:59:33.873-08	276	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	642	b5e62766-527a-4a1a-92e7-0600510d8e57	696	696
4383	DEBIT	Meetup Fees	-6000	USD	2016-12-27 09:03:23.101-08	2016-12-27 09:03:23.101-08	277	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	643	bf299265-3ef1-4480-b14a-3d20c988ef72	696	696
4385	DEBIT	Meetup Fees	-6000	USD	2016-12-27 09:27:09.602-08	2016-12-27 09:27:09.602-08	279	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	644	1113ed6f-035d-4558-a161-f41dbe01295f	696	696
3972	DEBIT	3D Printer & Supplies	-30496	USD	2016-12-14 05:03:21.144-08	2016-12-14 05:03:21.949-08	48	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-30496	591	9e429b4f-81f9-4ff9-bf62-9f292e3e9b1e	696	696
4137	DEBIT	Robotics: Coding with Your Kids HackNight Supplies	-20397	USD	2016-12-19 08:20:39.625-08	2016-12-19 08:20:40.499-08	48	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20397	604	b7646d69-4189-45a4-8672-7c783ff2f2b7	696	696
4139	DEBIT	Leadership - Planning for 2017 - Afternoon Coffee	-1175	USD	2016-12-19 10:42:59.021-08	2016-12-19 10:42:59.545-08	48	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1175	601	8d0fb08a-cd76-4efd-acb9-1f5b191f029c	696	696
4140	DEBIT	Leadership - Planning for 2017 - Evening Coffee	-875	USD	2016-12-19 10:43:53.809-08	2016-12-19 10:43:54.334-08	48	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-875	603	f95b80fd-f1aa-4343-894f-09450d3990a7	696	696
4161	DEBIT	Mugs for WWCode-SV	-46419	USD	2016-12-20 10:57:28.399-08	2016-12-20 10:57:28.525-08	300	3	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	-46419	605	cecf6f0f-5fc0-40c8-8907-674372e1c419	696	696
4183	DEBIT	45 webcam covers + shipping	-9685	USD	2016-12-21 07:39:46.852-08	2016-12-21 07:39:47.49-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9685	\N	d9cdec64-d87d-406a-bd84-c8a0b5a9bcb4	696	696
4230	DEBIT	Website - Domain Name	-2200	USD	2016-12-22 14:19:51.088-08	2016-12-22 14:19:52.143-08	48	3	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2200	372	09bf7a91-7939-4a04-80b5-721c536454af	696	696
4271	DEBIT	Meetup Fees	-4900	GBP	2016-12-23 10:04:05.755-08	2016-12-23 10:04:05.755-08	267	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4900	624	429a48b8-77bb-4b7b-9e74-d18e7878caf0	696	696
4442	DEBIT	Meetup Fees	-6000	CAD	2016-12-28 08:30:16.279-08	2016-12-28 08:30:16.279-08	293	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	666	00be055b-1e12-4bd4-8e40-99bfd7602141	696	696
4444	DEBIT	Meetup Fees	-6000	USD	2016-12-28 08:32:19.412-08	2016-12-28 08:32:19.412-08	294	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	667	f5ff4621-9e2e-40c3-9b96-849ab7c5f17b	696	696
253	DEBIT	WwConnect Conference	-658	USD	2016-03-19 17:00:00-07	2016-06-14 11:14:21.806-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-658	63	c4d44147-f630-42db-b84f-a28881d5dd21	767	696
3863	DEBIT	European Leadership Development Workshop -- Transportation, Taxi	-4400	EUR	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	301	1378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4400	493	cc2b4a36-bd6e-45d8-a05b-36a6c5db6cde	794	696
3864	DEBIT	European Leadership Development Workshop -- Transportation, Flight	-4700	EUR	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	301	1378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4728	494	e546ea27-19b6-4d72-8b95-6669cc95a981	794	696
3836	DEBIT	Food/Drinks for Leadership Team Meeting - Gen, Claire, Halima - Sept 2016	-6000	GBP	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	278	1333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	506	9b7434d9-7779-47eb-b087-5ffd3e765704	831	696
230	DEBIT	Feb 1, Lightning Talks	-22568	USD	2016-03-20 11:06:09.887-07	2016-03-29 13:37:47.75-07	2	28	\N	2016-03-28 17:00:00-07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1408a5bd-a893-4d39-8deb-eb1214cee9f5	848	696
228	DEBIT	Feb 4 hack night	-10284	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.784-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10284	53	2e9e7313-b914-49f1-b17c-14d67569cbf0	848	696
232	DEBIT	Mar 7 Lightning Talks	-15316	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.794-07	2	28	\N	2016-06-14 11:14:22.455-07	\N	\N	\N	\N	\N	\N	\N	\N	-15316	57	814475bd-7972-4cc2-a22e-fe3da33bf0bf	848	696
2266	DEBIT	 Network budget balance pre Open Collective	-4356	USD	2016-10-04 15:37:57.159-07	2016-10-04 15:37:57.359-07	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4356	\N	657fb992-7d1d-43b7-be03-5f9d23ccb189	696	696
413	DEBIT	Global Development	-150	USD	2016-04-27 09:21:00.228-07	2016-06-14 11:14:21.907-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-150	103	1a7a975b-c002-4d56-abfb-627346e0f303	696	696
370	DEBIT	Global Development	-150	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	4	3	\N	2016-06-14 11:14:22.479-07	\N	\N	\N	\N	\N	\N	\N	\N	-150	93	df345561-08a9-4963-8863-c675b0fb1006	696	696
2417	DEBIT	Network support - Regional Leadership (thanks VMWare)	-370000	USD	2016-10-11 12:51:28.361-07	2016-10-11 12:51:28.677-07	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-370000	\N	a8202103-9dc5-4f86-a2f1-1dbf770906a7	696	696
326	DEBIT	Global Developement	-150	USD	2016-04-12 11:46:49.263-07	2016-06-14 11:14:21.849-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-150	79	c284e464-38a5-4f87-9f50-a1c589f7dc1b	696	696
335	DEBIT	Global Development	-150	USD	2016-04-12 11:52:16.188-07	2016-04-12 14:19:43.124-07	4	3	\N	2016-04-12 14:19:43.124-07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f5dffc9c-009d-4d80-9983-23b2bc1c0815	696	696
2815	DEBIT	Markers, pens, sticky notes (ATXDivHack)	-2108	USD	2016-10-31 14:13:19.592-07	2016-10-31 14:13:19.745-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2108	448	812a47a9-0b51-4948-9963-c610c2bbea43	696	696
2818	DEBIT	Gifts for Organizers	-2399	USD	2016-10-31 14:14:19.644-07	2016-10-31 14:14:19.81-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2399	\N	f495583c-df24-4617-8cc5-d12616a0c36e	696	696
2819	DEBIT	Gift for organizer	-3499	USD	2016-10-31 14:14:38.997-07	2016-10-31 14:14:39.22-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3499	\N	865b1387-7552-4c8d-9d1c-34ebf653db44	696	696
2816	DEBIT	Drinks for Happy Hour (ATXDivHack)	-5518	USD	2016-10-31 14:13:39.794-07	2016-10-31 14:13:40.146-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5518	447	635f6580-ccbc-4232-bf25-eded2b10fdd7	696	696
2817	DEBIT	Almond milk for coffee (ATXDivHack)	-1192	USD	2016-10-31 14:13:53.591-07	2016-10-31 14:13:53.747-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1192	446	4d9e5244-f21b-43cd-a486-409f2b41487c	696	696
2820	DEBIT	Painters tape for signs  	-1136	USD	2016-10-31 14:14:51.746-07	2016-10-31 14:14:51.945-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1136	445	e40c1dfc-1af6-4b4d-9f6a-ec62ee2b7f8d	696	696
1564	DEBIT	Minimum Fee - May	-1000	MXN	2016-08-15 12:22:45.367-07	2016-08-15 12:22:45.38-07	10	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	31262fe9-ba55-442a-b76b-b2e456cad550	696	696
654	DEBIT	Conference Grant	-15000	USD	2016-05-24 12:42:50.307-07	2016-06-14 11:14:22.103-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-15000	188	712f3b65-3cfa-48ae-a939-483739ed9bd7	696	696
660	DEBIT	Conference Grant - Sarah Olson	-20000	USD	2016-05-25 09:39:09.882-07	2016-06-14 11:14:22.103-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	190	668072a8-b0b2-4538-8842-6ffb18f74196	696	696
669	DEBIT	Photographer: Mike Ross	-65000	USD	2016-01-05 16:00:00-08	2016-06-14 11:14:22.114-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-65000	193	7bd8653b-9f4c-4f09-8ec0-99a8a1cdd2c4	696	696
2257	DEBIT	Net budget balance pre-Open Collective	-56266	USD	2016-10-04 14:57:44.218-07	2016-10-04 14:57:44.218-07	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-56266	394	0d80aa7c-4679-499a-abbb-bf69232f55f0	696	696
2258	DEBIT	90/10 split: Hackathon donation	-32000	USD	2016-10-04 15:05:22.85-07	2016-10-04 15:05:22.85-07	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-32000	395	0425a551-a9c9-4428-813a-aa4b4a139a49	696	696
2259	DEBIT	Drinks at Sept monthly event	-2192	USD	2016-10-04 15:06:33.802-07	2016-10-04 15:06:34.357-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2192	\N	7bc0fd8c-3371-4ffc-ab48-dc1d1478f023	696	696
2304	DEBIT	Conference stipend Udisha S.	-75000	USD	2016-10-06 10:21:09.865-07	2016-10-06 10:21:09.933-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75000	\N	a07591fb-4e19-4cf3-8f08-da3c9ccff93b	696	696
2380	DEBIT	WWCode Portland Stickers	-31950	USD	2016-10-10 13:12:33.813-07	2016-10-10 13:12:33.813-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-31950	411	dab27bf8-4cd0-46ef-93fe-c99e9c4b74fe	696	696
2395	DEBIT	Google I/O stipend	-50000	USD	2016-10-11 09:00:21.246-07	2016-10-11 09:00:22.203-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	8916c363-dc64-40c0-9b37-596a418b9c45	696	696
2531	DEBIT	WWCode Director t-shirt	-3649	USD	2016-10-17 13:50:53.853-07	2016-10-17 13:50:53.855-07	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3649	\N	a66cf7d0-ac6e-42ce-ab24-b0f9f6f0c28e	696	696
2533	DEBIT	Director t-shirt	-2860	USD	2016-10-17 13:56:00.744-07	2016-10-17 13:56:00.777-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2860	\N	5356537c-b269-45d7-ac4c-e54da8c0c6c3	696	696
2823	DEBIT	Stickers for ATXDivHack 	-15300	USD	2016-10-31 14:15:38.727-07	2016-10-31 14:15:38.89-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-15300	\N	547db055-4599-4a8d-8828-96bb66aec39e	696	696
2535	DEBIT	Director t-shirt	-2898	USD	2016-10-17 13:57:20.051-07	2016-10-17 13:57:20.056-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2898	\N	451a4c15-b647-4eab-82e9-640a825c808b	696	696
2529	DEBIT	WWCode Director shirt	-3649	USD	2016-10-17 13:49:16.114-07	2016-10-17 13:49:16.113-07	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3649	\N	cf15a5bb-2cb3-41bd-8ece-7dbf2dbdda36	696	696
2339	DEBIT	Network budget pre Open Collective	-230712	USD	2016-10-07 13:01:03.429-07	2016-10-07 13:01:03.535-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-230712	\N	fc099f38-490d-45b7-b117-fadb4863aa22	696	696
3828	DEBIT	Supplies / Gift Bags	-4147	USD	2016-12-07 08:50:40.889-08	2016-12-07 08:50:41.383-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4147	\N	67b87648-5991-4d8b-9734-cd9b6a439a04	696	696
2808	DEBIT	Monthly team meeting w core six members. Food/pizza	-3323	USD	2016-10-31 14:02:15.762-07	2016-10-31 14:02:16.402-07	14	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3323	400	18e79267-4423-4db3-9fde-a81a0f812e43	696	696
4375	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:50:06.414-08	2016-12-27 08:50:06.414-08	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	639	e25e6f3b-8f97-491c-80a9-88bab6d96c78	696	696
3801	DEBIT	Office Supplies for Hackathon.	-10585	USD	2016-12-06 09:00:58.382-08	2016-12-06 09:00:58.806-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10585	\N	f298dc78-f218-4213-b29c-2c9a130cb0c8	696	696
2739	DEBIT	DJ (ATXDivHack)	-35000	USD	2016-10-27 14:08:48.506-07	2016-10-27 14:08:48.71-07	2	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-35000	453	4bfee0a6-77d3-4608-92bb-fb59f6d1f3f2	696	696
3946	DEBIT	Installfest	-558	USD	2016-12-13 09:30:28.678-08	2016-12-13 09:30:30.347-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-558	\N	b2fc8ba1-8436-493a-a163-96064999c897	696	696
4366	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:23:35.936-08	2016-12-27 08:23:35.936-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	634	19aac764-7f1c-4545-964c-aa419cddcadf	696	696
571	DEBIT	Connect Conference video footage review	-2948	USD	2016-05-16 17:31:54.682-07	2016-06-14 11:14:22.053-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2948	167	79e8eb4f-159b-4d98-8bae-afc1989a3e44	767	696
273	DEBIT	Connect 2016 event setup day dinner	-6800	USD	2016-03-17 17:00:00-07	2016-06-14 11:14:21.838-07	14	32	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6800	72	97597693-ae20-489a-bc22-54b2b468147f	798	696
99	DEBIT	IVA Libretas Hackathon	-166080	MXN	2016-02-16 10:58:04.663-08	2016-06-14 11:14:21.738-07	10	7	\N	2016-06-14 11:14:22.436-07	\N	\N	\N	\N	\N	\N	\N	\N	-166080	34	3c8bacb7-d7c6-4ce3-a801-55ecdd103839	822	696
231	DEBIT	Feb 1, Lightning Talks	-22568	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.794-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-22568	56	dd78e12f-6874-43c4-aa5e-5b54aff99c4f	848	696
640	DEBIT	May 2 Lightning Talks	-8979	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.092-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-8979	184	761dc700-eac2-44ef-8aa7-a3dc7268e489	848	696
639	DEBIT	April 4 Lightning Talks	-13315	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.091-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-13315	183	8cd8612d-8c56-45a4-af58-054b1251d213	848	696
637	DEBIT	April 7 South Hack Night	-5037	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.083-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5037	180	c136a783-1ea9-48e1-aa36-325bc67a6c44	848	696
2826	DEBIT	Fedex - certificate print expense	-1962	USD	2016-10-31 14:32:07.365-07	2016-10-31 14:32:07.497-07	300	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1962	\N	3d40ddc4-003a-4559-bb76-0dd988cbb2ac	696	696
2813	DEBIT	September Ruby Tuesday	-6497	USD	2016-10-31 14:11:36.488-07	2016-10-31 14:11:36.731-07	2	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6497	450	82a4bfeb-95ef-4a2a-9d9d-5ca157938b53	696	696
2814	DEBIT	Drinks and snacks (ATXDivHack)	-75932	USD	2016-10-31 14:13:05.943-07	2016-10-31 14:13:06.106-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75932	449	2e748309-ca69-4812-83e1-506c5649d783	696	696
498	DEBIT	Conference Grant	-50000	USD	2016-05-04 14:14:39.136-07	2016-06-14 11:14:22.01-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	145	61219d5b-692d-4cba-9583-f8a7b033b990	696	696
3516	DEBIT	Matthews Group - Leadership Development for Seattle team	-60000	USD	2016-11-29 13:46:31.384-08	2016-11-29 13:46:31.384-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-60000	464	fd0c2bc8-e692-4989-a626-db0df4d74291	696	696
3517	DEBIT	Lodging and meals for our WWC Seattle 7 team members leadership development retreat. Under approved budget!	-227646	USD	2016-11-29 13:46:42.259-08	2016-11-29 13:46:42.259-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-227646	474	41da1426-3c94-4dfc-9beb-712e3ecf65d5	696	696
3526	DEBIT	Banner	-2000	USD	2016-11-29 14:34:04.252-08	2016-11-29 14:34:04.435-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	f2092196-e65f-4d9c-9981-37518272c36e	696	696
3545	DEBIT	Network budget pre open collective	-55923	USD	2016-11-29 16:18:08.154-08	2016-11-29 16:18:07.832-08	285	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-55923	\N	69d0ee19-1d91-42fe-8afa-7f974771bd04	696	696
3625	DEBIT	Conference Travel Stipend - Google I/O Elese	-75000	USD	2016-11-30 13:25:56.197-08	2016-11-30 13:25:56.423-08	276	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75000	\N	8654d25a-1d31-4bb8-8a42-09794cf62430	696	696
3628	DEBIT	Banner	-2000	USD	2016-11-30 13:33:38.691-08	2016-11-30 13:33:38.827-08	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	026b493f-edc5-4529-b348-1cdb4dfddc9a	696	696
2330	DEBIT	Network Budget pre Open Collective	-77659	GBP	2016-10-07 07:03:00.623-07	2016-10-07 07:03:00.89-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-77659	\N	5f8dd4cc-75b1-4aa2-89a6-cb125c6597ef	696	696
4369	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:31:58.557-08	2016-12-27 08:31:58.557-08	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	636	7baa1f62-c9bc-4df0-9a12-18a4dda6c0ce	696	696
3794	DEBIT	Marketing for IoT Hackathon	-1082	USD	2016-12-06 08:50:56.549-08	2016-12-06 08:50:57.046-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1082	502	e923e566-7e1f-4e3d-aa4d-3b2926add382	696	696
3795	DEBIT	Supplies	-3918	USD	2016-12-06 08:51:20.162-08	2016-12-06 08:51:20.661-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3918	508	e74be4f9-1c06-4a7a-ae85-656ef5ecf2e9	696	696
3796	DEBIT	T-shirt order - Design Lead	-2698	USD	2016-12-06 08:51:54.984-08	2016-12-06 08:51:55.379-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2698	509	c884d630-10d6-4279-b84b-7383937f1478	696	696
3798	DEBIT	WWCode Seattle network retreat	-6207	USD	2016-12-06 08:57:26.568-08	2016-12-06 08:57:26.935-08	14	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6207	\N	116ff80c-993e-4c5a-83d3-d24df17d5253	696	696
3799	DEBIT	Hackathon - prizes for winners + goodies for thank you bags for sponsors/speakers/mentors/judges/volunteers	-7750	USD	2016-12-06 08:57:59.164-08	2016-12-06 08:57:59.708-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7750	\N	b09fb537-00cb-4928-9a19-5551090d370a	696	696
3800	DEBIT	WWC T-shirt	-2798	USD	2016-12-06 08:59:36.33-08	2016-12-06 08:59:36.741-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2798	\N	4a126373-6cb3-4e7a-9a94-178466bcefb3	696	696
3843	DEBIT	Leadership Event in Sofia	-6444	EUR	2016-12-07 13:38:07.287-08	2016-12-07 13:38:07.429-08	301	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6444	471	4ca35a75-88d7-4546-b608-ce07199942fb	696	696
3950	DEBIT	Decorations / Supplies	-1379	USD	2016-12-13 10:42:06.408-08	2016-12-13 10:42:07.17-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1379	\N	4a743da3-3e6f-482f-8ac3-dd26c8ed51ae	696	696
3951	DEBIT	Event suplies	-2198	USD	2016-12-13 10:43:16.329-08	2016-12-13 10:43:17.27-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2198	\N	5228b4f5-f0ed-4a43-b5f8-4f2e8cfd7185	696	696
3952	DEBIT	Speaker and sponsor meetings (11/18 + 11/28) and event logistics (12/2)	-2870	USD	2016-12-13 10:44:23.973-08	2016-12-13 10:44:24.945-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2870	\N	2a19b928-ba82-4a49-a329-5c79e51b48e3	696	696
4410	DEBIT	Meetup Fees	-6000	USD	2016-12-27 11:53:07.2-08	2016-12-27 11:53:07.2-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	657	74cde2f7-e7c6-4e97-8c13-0bbaefa37e71	696	696
4141	DEBIT	Leadership - Planning for 2017 - Dinner	-9240	USD	2016-12-19 10:45:09.113-08	2016-12-19 10:45:09.64-08	48	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9240	602	03814f58-ecac-4145-b6bc-f448075970e0	696	696
4190	DEBIT	Meetup Fees	-6000	USD	2016-12-21 10:53:46.984-08	2016-12-21 10:53:46.984-08	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	607	d6799057-59a0-4562-8b3e-c2e3e9adf29b	696	696
4191	DEBIT	Meetup Fees	-6000	USD	2016-12-21 10:54:30.839-08	2016-12-21 10:54:30.839-08	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	608	53d83a5f-166b-455f-b73f-827fcdcc3a5d	696	696
4247	DEBIT	Meetup Fees	-6000	USD	2016-12-23 08:37:59.322-08	2016-12-23 08:37:59.322-08	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	613	1f6591ab-8565-4278-a8ee-906fd65c5e69	696	696
4249	DEBIT	Meetup Fees	-6000	USD	2016-12-23 08:49:17.444-08	2016-12-23 08:49:17.444-08	261	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	614	6efb3ac7-7d2a-4724-8a1a-ef64d45fe970	696	696
4251	DEBIT	Meetup Fees	-6000	USD	2016-12-23 08:52:20.827-08	2016-12-23 08:52:20.827-08	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	615	85f323a7-d2f8-447c-8420-1ad74cdd8d67	696	696
4254	DEBIT	Meetup Fees	-6000	USD	2016-12-23 08:56:04.579-08	2016-12-23 08:56:04.579-08	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	616	f6ab951c-bed5-4749-b0e5-db1a3a7a8ad6	696	696
4281	DEBIT	Meetup Fees	-6000	USD	2016-12-23 11:38:46.818-08	2016-12-23 11:38:46.818-08	268	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	626	d4bdb19b-d165-4c0a-b84d-6bc03f6ed962	696	696
4283	DEBIT	Meetup Fees	-6000	USD	2016-12-23 11:41:48.315-08	2016-12-23 11:41:48.315-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	627	1008cc1e-b9d2-43f0-95c2-8ee9e464a929	696	696
4285	DEBIT	Meetup Fees	-6000	USD	2016-12-23 11:50:08.539-08	2016-12-23 11:50:08.539-08	270	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	628	51faf49d-6a19-43ae-857d-bd10ba1f66e4	696	696
4398	DEBIT	Meetup Fees	-5700	EUR	2016-12-27 10:11:51.873-08	2016-12-27 10:11:51.873-08	283	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5700	652	28af55a2-3111-4783-ba8d-35cf4d105776	696	696
4433	DEBIT	Meetup Fees	-6000	USD	2016-12-28 07:58:50.078-08	2016-12-28 07:58:50.078-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	662	74036058-01c1-4f98-a83f-fc82f6510521	696	696
4436	DEBIT	Meetup Fees	-6000	CAD	2016-12-28 08:21:52.469-08	2016-12-28 08:21:52.469-08	291	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	663	84be2b67-931d-405c-99a7-1724a5788a24	696	696
4438	DEBIT	Meetup Fees	-6000	USD	2016-12-28 08:25:48.743-08	2016-12-28 08:25:48.743-08	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	664	571bafd6-9a7d-417d-be32-be27d3f4bee4	696	696
4440	DEBIT	Meetup Fees	-6000	USD	2016-12-28 08:28:15.901-08	2016-12-28 08:28:15.901-08	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	665	6ad3295b-2aa8-4bfd-a39e-659ab99c98a1	696	696
4361	DEBIT	Meetup Fees	-6000	MXN	2016-12-27 08:12:26.224-08	2016-12-27 08:12:26.224-08	299	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	632	1475d9f0-a70a-479b-a7a5-0f944217dd0c	696	696
7072	DEBIT	meetup with speaker, Heather VanCura, in conjunction with DevNexus conference	-20950	USD	2017-03-14 10:22:10.666-07	2017-03-14 10:22:10.681-07	12	70	1893	\N	\N	\N	\N	\N	638	USD	1	-20950	-21588	899	bef0ae4e-365f-4158-a0e0-ee82ba3b21e6	764	696
7296	DEBIT	To redeem travel stipend to Google I/O	-100000	USD	2017-03-20 08:39:23.328-07	2017-03-20 08:39:23.364-07	277	1332	2180	\N	\N	\N	\N	\N	4430	USD	1	-100000	-104430	924	1fdc2835-4858-4cd0-bada-76c19f0f9f0b	832	696
8306	DEBIT	Stickers	-14630	USD	2017-04-07 05:58:45.517-07	2017-04-07 05:58:45.531-07	516	3419	2321	\N	\N	\N	\N	\N	454	USD	1	-14630	-15084	889	fcf1e41b-dd9f-4534-ade5-5f6fa906d10e	842	696
3839	DEBIT	Food for October Hack Night.	-7700	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7773	484	a55eb032-a0ab-4534-bd7b-86126196aa48	844	696
3840	DEBIT	October Hack Night Drinks/Food.	-1100	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1106	485	88d96482-a87c-418a-b53b-a3c895b3d4ae	844	696
7071	DEBIT	Mar 7 Lightning Talks	-15316	USD	2017-03-14 10:21:29.296-07	2017-03-14 10:21:29.332-07	2	28	1893	\N	\N	\N	\N	\N	474	USD	1	-15316	-15790	57	f0262195-2244-40eb-b442-02995b885caa	848	696
4427	DEBIT	Meetup Fees	-6000	USD	2016-12-28 07:49:16.255-08	2016-12-28 07:49:16.255-08	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	659	52806f02-8b52-4053-97ad-eb7b0f5c2c2a	696	696
4429	DEBIT	Meetup Fees	-6000	USD	2016-12-28 07:53:05.613-08	2016-12-28 07:53:05.613-08	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	660	90fccb78-97b2-4e6b-951d-b476f4a7148f	696	696
4431	DEBIT	Meetup Fees	-6000	AUD	2016-12-28 07:56:28.934-08	2016-12-28 07:56:28.934-08	297	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	661	6b303a9b-a30c-4cd3-99ca-80c33b0b9197	696	696
300	DEBIT	Reimburse Caterina for program materials	-3798	USD	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.838-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3798	76	42cf26b1-f1f3-4a07-8725-0090dd713617	696	696
298	DEBIT	Reimbursement to Kamila for coffee purchased for volunteers at CONNECT 2016	-11815	USD	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.839-07	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-11815	74	8b3bc1cf-1598-4af5-9511-2dea9fcb267a	696	696
414	DEBIT	WePay Fee	-400	USD	2016-04-10 17:00:00-07	2016-06-14 11:14:21.907-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-400	104	87c00eef-d1a6-4f09-8e9c-b288d4bb1d87	696	696
676	DEBIT	CONFERENCE GRANT	-34750	USD	2016-05-26 12:05:53.771-07	2016-06-14 11:14:22.123-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-34750	197	d88487be-3043-4198-810a-d989c2c30afb	696	696
615	DEBIT	Conference Grant	-70000	USD	2016-05-19 12:07:13.723-07	2016-06-14 11:14:22.082-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-70000	178	074c5df4-902c-4af8-b06e-9a222d4899dc	696	696
8601	DEBIT	Atlanta IWD Event	-235699	USD	2017-04-17 12:17:23.032-07	2017-04-17 12:17:23.032-07	12	3	\N	\N	\N	\N	\N	\N	0	USD	1	-235699	-235699	998	ed3b2ff8-e7bc-4ffd-a178-056c3ca7ec4c	696	696
8616	DEBIT	Network Development: Attend CapOne WIT 2017 Kickoff to announce partnership for re-launch	-100000	USD	2017-04-17 15:12:22.995-07	2017-04-17 15:12:22.995-07	270	3	\N	\N	\N	\N	\N	\N	0	USD	1	-100000	-100000	1027	4ec74672-5586-4acc-b9be-bddf2e0a464c	696	696
8618	DEBIT	Travel Scholarship for WWCode Director	-40970	GBP	2017-04-17 15:32:02.724-07	2017-04-17 15:32:02.724-07	278	3	\N	\N	\N	\N	\N	\N	0	GBP	1	-40970	-40970	768	ac366b27-1c91-4846-b9cb-9fb911edd792	696	696
1582	DEBIT	Minimum fee - May	-1000	USD	2016-08-16 07:54:12.931-07	2016-08-16 07:54:12.95-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	6dd5e28c-157e-4552-ba9e-f37e75ec0ec4	696	696
1576	DEBIT	Monthly Minimum Fee - May	-1000	USD	2016-08-16 07:51:38.913-07	2016-08-16 07:51:38.924-07	12	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	1e21e117-2659-49f0-b3c4-0f71be1dafea	696	696
2425	DEBIT	Fedex 	-3418	USD	2016-10-11 17:43:40.215-07	2016-10-11 17:43:40.344-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3418	\N	720b2952-d5b6-4f7f-81ba-a36f52576f1f	696	696
3529	DEBIT	Regional Leadership Director Training	-13031	USD	2016-11-29 14:35:21.354-08	2016-11-29 14:35:21.522-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-13031	\N	bc8e0feb-b038-484d-b77e-9671a32f65be	696	696
7684	DEBIT	Travel stipend to attend the Google I/O 2017 Conference.	-100000	USD	2017-03-31 15:33:59.707-07	2017-03-31 15:33:59.731-07	286	1344	2321	\N	\N	\N	\N	\N	7430	USD	1	-100000	-107430	962	a275cb86-6060-4e20-987b-c9d777f576df	699	696
613	DEBIT	Conference Grant	-120000	USD	2016-05-19 12:07:13.723-07	2016-06-14 11:14:22.074-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-120000	175	0ec09d11-719f-49c7-8785-cdf9a6660274	696	696
1583	DEBIT	Minimum Fee - May	-1000	USD	2016-08-16 07:54:57.595-07	2016-08-16 07:54:57.609-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	cbb3070b-f325-45ad-a323-1210bd2b0499	696	696
299	DEBIT	Reimburse Caterina for travel expenses to CONNECT 2016	-6500	USD	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.839-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6500	75	995b5cdf-7f5d-495b-8937-021414ea6d22	696	696
336	DEBIT	Meetup Transaction Fee	-163	USD	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.849-07	4	3	\N	2016-06-14 11:14:22.458-07	\N	\N	\N	\N	\N	\N	\N	\N	-163	82	d8012b7a-930b-4c21-a97d-60e676c4c08d	696	696
2810	DEBIT	500 gift cards, 19.62 printed awards	-51962	USD	2016-10-31 14:09:11.281-07	2016-10-31 14:09:11.484-07	300	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-51962	416	34e49664-e27e-4576-9895-33d5e0ddf2f8	696	696
7510	DEBIT	payment to artists (spoken word) for performance at IWD event	-20000	USD	2017-03-27 05:47:25.654-07	2017-03-27 05:47:25.894-07	12	70	2218	\N	\N	\N	\N	\N	610	USD	1	-20000	-20610	907	ac007c6a-85a6-404e-9ed8-8c1cb9e9e7e5	764	696
5781	DEBIT	Last minute (less than 7 day advance purchase) airline price purchase from SFO to JFK. Emailed Joey to alert of higher fare. 	-59040	USD	2017-02-07 10:32:48.784-08	2017-02-07 10:32:49.072-08	14	31	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-59040	776	52ec1ede-9280-4e75-b076-1d75225a9773	767	696
10118	DEBIT	Regional Leadership Event: Barcelona	-19398	EUR	2017-05-16 14:49:07.885-07	2017-05-16 14:49:07.885-07	301	1378	\N	\N	\N	\N	\N	\N	0	EUR	1	-19398	-19398	1122	3fca3a38-ed21-4b50-903c-7ad1304b11af	794	696
8421	DEBIT	Event supplies	-1527	USD	2017-04-11 12:13:28.544-07	2017-04-11 12:13:28.599-07	59	171	2321	\N	\N	\N	\N	\N	74	USD	1	-1527	-1601	1002	94f2347a-1fdc-472e-b084-606647265be1	828	696
8422	DEBIT	Hackathon 2017 planning meeting	-2891	USD	2017-04-11 12:15:09.813-07	2017-04-11 12:15:09.826-07	59	171	2321	\N	\N	\N	\N	\N	114	USD	1	-2891	-3005	1001	3ba366f9-e99f-4629-95c3-35280b503ba9	828	696
5785	DEBIT	Event supplies for Leads	-2439	USD	2017-02-07 10:38:14.3-08	2017-02-07 10:38:15.58-08	59	171	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2439	737	f07b1e2f-1ddb-43ba-8873-49e911fa25d3	828	696
5786	DEBIT	Printing WWCODE pamphlets for Camas STEM Fair for middle-school girls (organized by OHSU).	-4431	USD	2017-02-07 10:40:27.475-08	2017-02-07 10:40:27.96-08	59	171	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4431	736	2bbc0783-4b84-4636-a6aa-9b9336c1550e	828	696
7517	DEBIT	Travel Stipend for Google I/O, now that I have secured my I/O Ticket via Google - see enclosed I/O Ticket Receipt)	-85000	GBP	2017-03-27 09:01:27.19-07	2017-03-27 09:01:27.295-07	278	1333	2265	\N	\N	\N	\N	\N	3760	GBP	1	-85000	-88760	926	a26b7d78-3ba3-487c-99ab-fea20d22a67e	831	696
8614	DEBIT	WWCode CONNECT Conference Travel Stipend	-85000	GBP	2017-04-17 14:18:35.523-07	2017-04-17 14:18:35.581-07	278	1333	2602	\N	\N	\N	\N	\N	3760	GBP	1	-85000	-88760	1016	90b0bf3c-bd5e-4224-902c-8989cebcdf81	831	696
7519	DEBIT	Google I/O	-50000	USD	2017-03-27 10:11:39.25-07	2017-03-27 10:11:39.275-07	12	69	2265	\N	\N	\N	\N	\N	1480	USD	1	-50000	-51480	952	d319eebc-1e7a-4500-a519-705bdc9facf2	835	696
7520	DEBIT	Google I/O ticket	-37500	USD	2017-03-27 10:12:00.118-07	2017-03-27 10:12:00.138-07	12	69	2265	\N	\N	\N	\N	\N	1118	USD	1	-37500	-38618	949	98f9ec9a-496c-44d1-b27d-35dc1359a639	835	696
656	DEBIT	Conference Grant	-100000	USD	2016-05-24 12:42:50.307-07	2016-06-14 11:14:22.103-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100000	189	e8d5c717-1fca-4334-96d2-b8fa8d899ca1	696	696
2426	DEBIT	Engineering (Web) - A Small Orange	-12700	USD	2016-10-11 17:44:30.933-07	2016-10-11 17:44:31.081-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-12700	\N	0f9b2d4b-60a1-4cd9-b233-5569b822348d	696	696
3589	DEBIT	Photos for sponsor gifts	-2104	USD	2016-11-30 08:11:36.238-08	2016-11-30 08:11:36.377-08	2	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2104	\N	5c8b4fc6-fa71-4ca6-ac8b-984c0d5fa454	696	696
3591	DEBIT	Envelopes for hackathon sponsor prizes	-907	USD	2016-11-30 08:12:35.291-08	2016-11-30 08:12:35.54-08	2	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-907	\N	eeee1a04-ad18-42e4-8252-db32a174e369	696	696
3599	DEBIT	Banner	-2000	USD	2016-11-30 10:40:24.258-08	2016-11-30 10:40:24.443-08	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	dddd092c-b5a8-475a-a35e-d4f12bc724d6	696	696
3613	DEBIT	Leadership Development - Conference Travel Stipend Google I/O	-130000	USD	2016-11-30 13:06:48.939-08	2016-11-30 13:06:49.116-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-130000	\N	6a1fa977-065a-47a6-bf3e-ae8934921597	696	696
3619	DEBIT	Banner	-2000	USD	2016-11-30 13:19:46.014-08	2016-11-30 13:19:46.128-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	549a4d38-14e9-451f-af59-00b70014bc58	696	696
3622	DEBIT	Regional Leadership Director Meeting 	-7500	USD	2016-11-30 13:20:31.263-08	2016-11-30 13:20:31.464-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7500	\N	7e10ae09-c940-4b3e-a151-459585138199	696	696
4256	DEBIT	Meetup Fees	-6000	USD	2016-12-23 09:00:25.987-08	2016-12-23 09:00:25.987-08	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	617	57853d10-9d39-4960-9921-b48c4b182e12	696	696
4258	DEBIT	Meetup Fees	-4900	GBP	2016-12-23 09:05:41.927-08	2016-12-23 09:05:41.927-08	264	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4900	618	9a33a7df-c65b-40f9-9207-191220694bc5	696	696
4260	DEBIT	Meetup Fees	-6000	USD	2016-12-23 09:10:34.733-08	2016-12-23 09:10:34.733-08	265	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	619	eb811f1b-7c0b-4d61-9105-9366e6aa84d8	696	696
4262	DEBIT	Meetup Fees	-5700	EUR	2016-12-23 09:15:16.054-08	2016-12-23 09:15:16.054-08	301	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5700	620	274351b9-2cc0-438e-8c7d-4a8e7771bb0c	696	696
4264	DEBIT	Meetup Fees	-6000	USD	2016-12-23 09:21:53.018-08	2016-12-23 09:21:53.018-08	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	621	0446afb9-0ce6-4148-a588-e6ac299a3997	696	696
4268	DEBIT	Meetup Fees	-6000	AUD	2016-12-23 09:42:18.688-08	2016-12-23 09:42:18.688-08	266	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	623	f36420c0-4283-44cb-a9c5-d91eb735988f	696	696
4371	DEBIT	Meetup Fees	-5700	EUR	2016-12-27 08:36:05.296-08	2016-12-27 08:36:05.296-08	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5700	637	33760db0-25e7-4b85-89df-040f38e22adb	696	696
4373	DEBIT	Meetup Fees	-6000	USD	2016-12-27 08:41:27.235-08	2016-12-27 08:41:27.235-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	638	c036838f-9cbc-45c5-935f-9d9b57ea2836	696	696
8237	DEBIT	Meetup Fees	-6000	USD	2017-04-05 07:19:21.293-07	2017-04-05 07:19:21.293-07	295	3	\N	\N	\N	\N	\N	\N	0	USD	1	-6000	-6000	988	87b9bea2-2195-4ea2-b065-d18bc0c3368c	696	696
539	DEBIT	Conference Expense	-8320	USD	2016-05-10 12:19:21.785-07	2016-06-14 11:14:22.042-07	48	3	\N	2016-06-14 11:14:22.515-07	\N	\N	\N	\N	\N	\N	\N	\N	-8320	158	158dcb8d-7226-4bd0-a0c6-601340d5ab84	696	696
377	DEBIT	WePay fee	-125	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-125	95	535a716d-edbd-4914-9b57-78bd671fd49a	696	696
859	DEBIT	Global Development 	-150	USD	2016-06-09 11:38:16.857-07	2016-06-14 11:14:22.175-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-150	222	33ddf644-201a-470f-b745-de2dece2159b	696	696
674	DEBIT	CONFERENCE GRANT	-50000	USD	2016-05-10 17:00:00-07	2016-06-14 11:14:22.114-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	196	7916b5ad-1d71-481f-b774-1a9d79d2c8e0	696	696
864	DEBIT	Reimburse Caterina Paun for Program Expenses	-9995	USD	2016-02-24 16:00:00-08	2016-06-14 11:14:22.175-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9995	224	9f16d9b5-e350-4ca4-8b8f-59334d6ef9f3	696	696
1580	DEBIT	Drinks for July monthly event	-3316	USD	2016-08-16 07:53:42.013-07	2016-08-16 07:53:42.04-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3316	\N	bc1e4ea6-63a9-41a3-bd5a-a25ff1b41c37	696	696
1627	DEBIT	Event supplies	-1797	USD	2016-08-19 10:24:23.638-07	2016-08-19 10:24:24.362-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1797	\N	aaa90df5-783d-4af5-aadb-848d7da27db0	696	696
1630	DEBIT	Dinner for last night's HackNight	-13526	USD	2016-08-19 13:58:34.342-07	2016-08-19 13:58:34.554-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-13526	319	e4f6cb02-9565-4e90-8156-b4b6f7190889	696	696
538	DEBIT	Conference Grant - Sarah Olson	-110000	USD	2016-05-10 12:19:21.785-07	2016-06-14 11:14:22.032-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-110000	156	5b6a81e3-f2e8-4385-b39e-135cb7b5bb85	696	696
2809	DEBIT	Costco breakfast, lunch, drinks, plates, cups, utensils, snacks, deserts ...	-48435	USD	2016-10-31 14:08:49.332-07	2016-10-31 14:08:49.517-07	300	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-48435	417	7bfc67b7-3dd7-4f2c-a42e-1fd52bf01230	696	696
3313	DEBIT	Thank you gift to an amazing sponsor!	-1700	USD	2016-11-22 04:31:00.49-08	2016-11-22 04:31:00.691-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1700	501	125a7d4b-8e1c-43c0-af9a-e948de08c5a3	696	696
3949	DEBIT	Post-hackathon shipping supplies + supplies for Women + Tech Holiday Party	-3776	USD	2016-12-13 10:41:20.962-08	2016-12-13 10:41:21.652-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3776	\N	962a1612-7780-4b02-809c-bba5e34b9bf9	696	696
4266	DEBIT	Meetup Fees	-6000	USD	2016-12-23 09:32:55.31-08	2016-12-23 09:32:55.31-08	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	622	f3c80fd2-e51b-4124-a687-69f0abae37d6	696	696
2842	DEBIT	Transportation to get to GeekWire Summit social event 	-729	USD	2016-11-01 09:16:02.625-07	2016-11-01 09:16:02.953-07	14	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-729	402	f0415f03-23e6-4e11-8083-aac5401f4c17	696	696
7083	DEBIT	Leadership Development	-50616	MXN	2017-03-14 11:17:51.969-07	2017-03-14 11:17:51.969-07	282	3	\N	\N	\N	\N	\N	\N	0	MXN	1	-50616	-50616	887	f70817df-a428-4020-8076-87771fd39b1d	696	696
7087	DEBIT	Leadership Development	-14915	MXN	2017-03-14 11:18:46.358-07	2017-03-14 11:18:46.358-07	511	3	\N	\N	\N	\N	\N	\N	0	MXN	1	-14915	-14915	886	1f55f0d6-8cb7-4e26-bbce-64660bfdf8ad	696	696
2934	DEBIT	Cash for Prizes/Bartender	-50000	USD	2016-11-03 12:12:34.941-07	2016-11-03 12:12:35.306-07	2	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	fb9d785b-41ef-4c26-965c-98709813dd5f	696	696
2935	DEBIT	More stickers to give away at events	-18800	USD	2016-11-03 12:14:58.094-07	2016-11-03 12:14:58.245-07	13	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-18800	\N	31e6e55f-79bc-4a6a-800e-81bc4f5aa825	696	696
2940	DEBIT	Stacey Schipper	-2322	USD	2016-11-03 12:45:04.691-07	2016-11-03 12:45:04.691-07	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2322	\N	29073502-ed37-49ed-a06e-428e9b043bf8	696	696
2939	DEBIT	Event Food	-6471	USD	2016-11-03 12:43:50.827-07	2016-11-03 12:43:51.096-07	59	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6471	377	cf42497b-d717-4d8e-99cc-d12ab8b99170	696	696
7082	DEBIT	Supplies for Agile workshop (2/26)	-5798	USD	2017-03-14 11:16:43.183-07	2017-03-14 11:16:43.22-07	59	171	2149	\N	\N	\N	\N	\N	198	USD	1	-5798	-5996	858	0f6dbfcd-8b66-44e1-8bfa-82b47855e172	828	696
3837	DEBIT	Food/Drinks for Leadership Team Meeting - Gen, Claire - Oct 2016	-4000	GBP	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	278	1333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4000	507	57ffa5d8-ca36-46bc-8a78-8bf44617167e	831	696
641	DEBIT	05-21-16 AI workshop	-30000	USD	2016-05-22 17:26:36.061-07	2016-06-14 11:14:22.092-07	2	28	\N	2016-06-14 11:14:22.535-07	\N	\N	\N	\N	\N	\N	\N	\N	-30000	186	b1caa950-29a7-4b01-b194-5ad97dade460	848	696
822	DEBIT	3/30/16 Python Gameathon prize - Udemy course	-2400	USD	2016-06-04 14:37:03.991-07	2016-06-14 11:14:22.155-07	2	28	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2400	213	0870d634-022a-48de-ac16-c6f668cbea2f	848	696
10643	DEBIT	Donation - fees + global development	-1187	USD	2017-01-05 06:58:39.771-08	2017-01-05 06:58:42.205-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1187	\N	4d7e8f52-bc16-4bd4-b21a-66abc8ccc9b3	13	696
10648	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 08:53:55.856-08	2016-12-27 08:53:55.969-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	33de7cb4-aff8-4b96-b018-301d7220b4c4	275	696
10654	DEBIT	Donation Scott Z. in honor of his sister	-1800	USD	2016-10-11 10:01:23.313-07	2016-10-11 10:01:23.731-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1800	\N	407a6d5d-a1f0-4970-ad8f-8d0f7837b24f	291	696
10658	DEBIT	Recurring subscription	0	MXN	2016-04-02 13:10:38.206-07	2016-04-02 13:10:38.242-07	769	80	42	2016-04-07 13:10:38.206-07	\N	68	\N	\N	\N	\N	\N	\N	-500	\N	22201e21-9991-4f2f-9bb0-5589b57f73dc	10	696
10663	DEBIT	Network budget pre Open Collective	-6264	USD	2016-10-04 15:51:25.324-07	2016-10-04 15:51:26.129-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6264	\N	3daabc1a-f16c-4a67-ad6b-05d6ea780b19	260	696
10669	DEBIT	Google I/O scholarship	-75000	USD	2016-10-06 10:21:27.384-07	2016-10-06 10:21:27.396-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75000	\N	1ae910a4-4ada-4e0c-a856-27383da5f89f	13	696
10674	DEBIT	Reverse duplicate transaction	-500	USD	2016-10-04 09:12:26.671-07	2016-10-04 09:12:26.903-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-500	\N	4f201913-7a16-441e-9efb-7a19f59fe3a9	12	696
10679	DEBIT	Global Development for Meetup Fee	-6000	MXN	2016-12-27 08:10:30.416-08	2016-12-27 08:10:30.529-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	bb8aba12-0872-45ea-94e8-59be45acbefc	299	696
10684	DEBIT	Network Development (Thanks Zendesk)	-16129	USD	2016-10-11 13:26:22.964-07	2016-10-11 13:26:23.172-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-16129	\N	544cba47-c9a7-47e1-84e2-1bac302a0d24	298	696
10689	DEBIT	Donation Hannah B.	-9000	USD	2016-10-04 15:35:46.967-07	2016-10-04 15:35:47.153-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9000	\N	bc4b7b49-b053-4867-aca8-724ec23365cd	273	696
10694	DEBIT	Network development - thanks Atlassian	-50000	USD	2016-10-11 12:30:14.934-07	2016-10-11 12:30:15.155-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	27f367cc-b55b-467e-a8d9-8a4760172e6e	297	696
10699	DEBIT	Leslie Mollner: Thank you very much for all the help I've received from WWCode -TC so far. -Leslie	-2250	USD	2016-04-06 11:17:07.204-07	2016-04-16 13:40:58.818-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2250	\N	5c0abfc8-b954-4721-bb80-5f2a5b9343ae	48	696
10704	DEBIT	WWCode t-shirt sales	-4397	USD	2017-01-17 19:20:52.226-08	2017-01-17 19:20:52.436-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4397	\N	8f12d721-51b6-428f-864f-e44b31775a13	273	696
10709	DEBIT	Global Development for Meetup Fee	-6000	CAD	2016-12-28 08:29:31.983-08	2016-12-28 08:29:28.409-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	edfb48c0-047b-4cde-ab48-4fd59ff18887	293	696
10713	DEBIT	Priyanka - IOT Hackathon donation - fees and global development 	-2175	USD	2016-12-13 12:08:29.218-08	2016-12-13 12:08:29.464-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2175	\N	105163fb-25cc-4b5d-9e8a-5f53cdd0e3b9	59	696
10718	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 08:48:52.922-08	2016-12-27 08:48:53-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	\N	72aeb374-4a80-4686-8547-96d6c7ddb069	273	696
10725	DEBIT	Global Development for Meetup Fee	-4900	GBP	2016-12-23 09:02:53.836-08	2016-12-23 09:02:53.991-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4900	\N	1d826306-53c7-4e33-bcd1-087cba870b98	264	696
10729	DEBIT	Banner	-2000	USD	2016-11-30 13:19:37.017-08	2016-11-30 13:19:37.251-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	d5b630b0-dcb5-4c3f-9fed-d06ea4ba7e39	269	696
10734	DEBIT	Network Development	-20000	USD	2016-11-30 10:40:15.233-08	2016-11-30 10:40:15.446-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	09eb4f20-ff32-4ad2-bdca-e1b077fcf070	292	696
10739	DEBIT	Network Development	-20000	USD	2016-11-29 14:43:53.719-08	2016-11-29 14:43:53.971-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	\N	e1f1dcae-e5ea-4e7b-9802-b4b1fb4a94f0	286	696
10746	DEBIT	Network Development	-19100	USD	2016-10-11 17:28:02.718-07	2016-10-11 17:28:03.121-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-19100	\N	2a9457a8-2d70-44e0-a172-9c1ee09cfb73	284	696
10751	DEBIT	I am an active member and WWC has taken my career in tech to the next level. All the support and lessons from the WWC DC chapter are instrumental in me remaining in this field.	-2250	USD	2016-10-06 10:23:39.409-07	2016-10-06 10:23:39.459-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2250	\N	00f54774-92fa-4765-a251-2987c8053720	13	696
10756	DEBIT	Jasna Rodulfa	-1000	USD	2016-04-15 07:17:21.126-07	2016-04-16 13:40:58.829-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	a396eef7-7b2e-4aaa-ac23-dae6d339a287	13	696
10763	DEBIT	\N	-41370	USD	2016-09-12 21:15:04.709-07	2016-09-12 21:15:04.709-07	789	1178	737	\N	\N	653	2500	5000	1130	USD	1	50000	-50000	\N	8e0675ea-5765-42de-8df6-9e48f3c1f797	2	696
10768	DEBIT	Recurring subscription	-8250	USD	2016-08-03 10:47:25.319-07	2016-08-03 10:47:25.429-07	760	896	571	\N	\N	498	500	1000	250	USD	1	10000	-10000	\N	6e3199d6-9683-4655-9a85-ce1c42c18d48	4	696
10772	DEBIT	\N	-2175	USD	2017-05-04 09:21:53.684-07	2017-05-04 09:21:53.684-07	696	3	\N	\N	\N	2710	0	0	0	USD	1	2175	-2175	\N	771705cd-7acf-4cec-a9a2-b661a9ababc4	276	696
10777	DEBIT	WWCode shirt Grisel	-3649	USD	2016-10-17 13:48:59.282-07	2016-10-17 13:48:59.313-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3649	\N	eb3309ba-189b-4761-bc44-b052eda4ba1b	282	696
10782	DEBIT	Director t-shirt	-3186	USD	2016-10-17 13:58:21.952-07	2016-10-17 13:58:22.083-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3186	\N	2e557983-bce3-4c01-bd29-cbf8c4799579	271	696
10787	DEBIT	Network Development +	-50000	USD	2016-10-07 13:24:13.595-07	2016-10-07 13:24:13.706-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	0447dce8-d758-4d97-bca0-d55460f24b7d	300	696
10792	DEBIT	\N	-15000	USD	2017-05-03 10:44:48.715-07	2017-05-03 10:44:48.715-07	696	3	\N	\N	\N	2697	0	0	0	USD	1	15000	-15000	\N	15d6263d-d0dd-4811-87c0-027b4c64e81c	51	696
10797	DEBIT	Blurb donation	-54000	USD	2016-10-06 09:06:35.799-07	2016-10-06 09:06:36.235-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-54000	\N	f586da28-d54b-47ea-aa66-8cd531fefa50	3	696
10803	DEBIT	Donation Pamela V.	-4500	USD	2016-10-06 11:09:54.319-07	2016-10-06 11:09:54.357-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4500	\N	53b82b7e-2cf9-4895-9eda-0cb2716b1cf7	13	696
10808	CREDIT	Google I/O ticket	38618	USD	2017-03-27 10:12:00.118-07	2017-03-27 10:12:00.138-07	835	69	2265	\N	\N	\N	\N	\N	1118	USD	1	-37500	37500	949	3a070e20-cd43-4174-a8d8-3d77eadf12c1	12	696
10813	CREDIT	Event supplies for Leads	2439	USD	2017-02-07 10:38:14.3-08	2017-02-07 10:38:15.58-08	828	171	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	2439	737	f2500120-0b2a-42c5-8be7-07c2992460c1	59	696
10817	CREDIT	payment to artists (spoken word) for performance at IWD event	20610	USD	2017-03-27 05:47:25.654-07	2017-03-27 05:47:25.894-07	764	70	2218	\N	\N	\N	\N	\N	610	USD	1	-20000	20000	907	e4f91af2-c84d-4d36-9d92-d62ebb5cdfe5	12	696
10822	CREDIT	Meetup Transaction Fee	163	USD	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.849-07	696	3	\N	2016-06-14 11:14:22.458-07	\N	\N	\N	\N	\N	\N	\N	\N	163	82	e34979a1-44da-4275-a6b9-f5a63d391968	4	696
10829	CREDIT	Fedex 	3418	USD	2016-10-11 17:43:40.215-07	2016-10-11 17:43:40.344-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3418	\N	e5bbbbab-70da-42a8-a979-b89095ad4335	48	696
10833	CREDIT	Atlanta IWD Event	235699	USD	2017-04-17 12:17:23.032-07	2017-04-17 12:17:23.032-07	696	3	\N	\N	\N	\N	\N	\N	0	USD	1	-235699	235699	998	4d8e8afc-54c3-4e23-8519-79dd90b04854	12	696
10838	CREDIT	Reimburse Caterina for program materials	3798	USD	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.838-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3798	76	59b8b5bd-fcf3-404c-b898-1a6edf5dfced	59	696
10843	CREDIT	Meetup Fees	6000	USD	2016-12-27 10:38:46.887-08	2016-12-27 10:38:46.887-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	654	4cc48afc-ee5b-4eb3-a4f1-b9732a9a9d82	59	696
10849	CREDIT	Meetup Fees	4900	GBP	2016-12-27 09:34:46.469-08	2016-12-27 09:34:46.469-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4900	647	cd40b186-5cd8-4a92-b7c9-eaddab54f12d	278	696
10854	CREDIT	To redeem travel stipend to Google I/O	104430	USD	2017-03-20 08:39:23.328-07	2017-03-20 08:39:23.364-07	832	1332	2180	\N	\N	\N	\N	\N	4430	USD	1	-100000	100000	924	d3a77abb-2b9c-4ae1-9e38-d931cf42afc4	277	696
10860	CREDIT	Meetup Fees	6000	USD	2016-12-28 07:58:50.078-08	2016-12-28 07:58:50.078-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	662	4ad67f31-880f-4f32-a961-cec47ae1395c	241	696
10866	CREDIT	Meetup Fees	6000	USD	2016-12-23 08:56:04.579-08	2016-12-23 08:56:04.579-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	616	7bb39761-c415-4976-a9c5-6bdb24c27d05	262	696
10870	CREDIT	Meetup Fees	6000	USD	2016-12-21 10:53:46.984-08	2016-12-21 10:53:46.984-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	607	66d99b6f-8cc3-4ceb-8779-f033f73031b1	2	696
10875	CREDIT	Decorations / Supplies	1379	USD	2016-12-13 10:42:06.408-08	2016-12-13 10:42:07.17-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	1379	\N	7320c845-46c4-495f-984b-0d274c4272d9	59	696
10880	CREDIT	T-shirt order - Design Lead	2698	USD	2016-12-06 08:51:54.984-08	2016-12-06 08:51:55.379-08	696	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	2698	509	94cc7e17-4d7b-4435-b4ad-d8be401b4c94	59	696
10885	CREDIT	Banner	2000	USD	2016-11-30 13:33:38.691-08	2016-11-30 13:33:38.827-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	b350cd38-ef09-42b1-a6f1-7ba6b5e7fef7	263	696
10889	CREDIT	Matthews Group - Leadership Development for Seattle team	60000	USD	2016-11-29 13:46:31.384-08	2016-11-29 13:46:31.384-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	60000	464	81a8637d-d6d7-4cbb-af0d-04d5efabdc94	14	696
10894	CREDIT	Fedex - certificate print expense	1962	USD	2016-10-31 14:32:07.365-07	2016-10-31 14:32:07.497-07	696	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	1962	\N	06398bae-7803-42f1-b641-c8a2b0af9c63	300	696
10900	CREDIT	April 7 South Hack Night	5037	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.083-07	848	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	5037	180	157e85ce-a69b-4b9a-a7d7-0ffaed03c814	2	696
10905	CREDIT	Connect Conference video footage review	2948	USD	2016-05-16 17:31:54.682-07	2016-06-14 11:14:22.053-07	767	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	2948	167	05a4f79c-e4d1-4e31-864d-cbf029d4a8a0	14	696
10910	CREDIT	Meetup Fees	6000	USD	2016-12-27 08:50:06.414-08	2016-12-27 08:50:06.414-08	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	639	3ae021b7-efd5-46e6-9ce7-af708bf7aefe	273	696
10915	CREDIT	Director t-shirt	2898	USD	2016-10-17 13:57:20.051-07	2016-10-17 13:57:20.056-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2898	\N	74380d16-e446-4f32-98d1-9afc64fac275	3	696
10920	CREDIT	WWCode Portland Stickers	31950	USD	2016-10-10 13:12:33.813-07	2016-10-10 13:12:33.813-07	696	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	31950	411	805a4b7a-81cf-436c-a230-f99336bbdd2c	59	696
\.


                                                                                                                                                                    4039.dat                                                                                            0000600 0004000 0002000 00000063721 13156021737 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1329	fedfabd0763d3993683de654cc8e68b7@gmail.com	*****	*****	*****	2016-09-29 11:09:42.785-07	2016-09-29 11:09:42.785-07	\N	\N	*****	*****	\N	Dana	Dalling	\N	f	687
30	df61fcd898d629d05fe8ae08fd66ec4d@gmail.com	*****	*****	*****	2016-01-09 13:31:01.954-08	2017-04-03 05:58:04.717-07	\N	\N	*****	*****	\N	Pia	Mancini	\N	f	691
2906	3b3d000425befc5172a5208310218fc2@gmail.com	*****	*****	*****	2017-02-01 09:30:43.176-08	2017-02-01 10:35:36.827-08	\N	\N	*****	*****	\N	\N	\N	\N	f	692
3206	9c1a8a4fc15ce332c7c5624952bceeff@gmail.com	*****	*****	*****	2017-02-21 08:55:29.631-08	2017-05-16 09:49:19.822-07	\N	\N	*****	*****	\N	WWCode		\N	f	690
577	8c4471bffc28c261aa4ef2a5d7004de4@gmail.com	*****	*****	*****	\N	2016-12-28 14:36:35.346-08	\N	\N	*****	*****	\N	Georgia	Andrews	\N	f	693
4173	3be24eacaf70dddd5f990afac0574189@gmail.com	*****	*****	*****	2017-04-11 19:05:32.736-07	2017-04-11 19:06:03.772-07	\N	\N	*****	*****	\N	Anne	Brown	\N	f	694
1331	60767513ea7e3d82d4a50d8241faea30@gmail.com	*****	*****	*****	2016-09-29 11:10:43.391-07	2017-03-27 22:13:36.913-07	\N	\N	*****	*****	\N	Chee	Yim Goh	\N	f	695
171	475c85fcbd1984c9e5e19cea267c4f33@gmail.com	*****	*****	*****	2016-03-19 15:11:53.101-07	2017-05-18 10:47:24.123-07	\N	\N	*****	*****	\N	Caterina	Paun	\N	f	828
1359	d6b1ce23201e994cee24a7971a79d810@gmail.com	*****	*****	*****	2016-09-29 11:33:37.087-07	2016-09-29 11:33:37.087-07	\N	\N	*****	*****	\N	Himi	Sato	\N	f	829
1375	2e951f7b3ce79f4faad5da347e302b27@gmail.com	*****	*****	*****	2016-09-29 11:43:49.04-07	2016-09-29 11:43:49.04-07	\N	\N	*****	*****	\N	Anouk	Ruhaak	\N	f	830
1333	c39681f94c378e9adbbbca79b24dd9ff@gmail.com	*****	*****	*****	2016-09-29 11:11:53.842-07	2017-04-12 07:42:51.09-07	\N	\N	*****	*****	\N	Gen	Ashley	\N	f	831
1332	4d4dfee45f10b2b8affd87ee5a82b7a1@gmail.com	*****	*****	*****	2016-09-29 11:10:43.392-07	2017-03-20 09:33:13.852-07	\N	\N	*****	*****	\N	Jecelyn		\N	f	832
1361	9220296eae97265c78dd6ae0722eb573@gmail.com	*****	*****	*****	2016-09-29 11:33:37.095-07	2016-09-29 11:33:37.095-07	\N	\N	*****	*****	\N	Mami	Enomoto	\N	f	833
1358	b78218b19cc91ab0dfb943c6c253ca85@gmail.com	*****	*****	*****	2016-09-29 11:32:00.983-07	2016-09-29 11:32:00.983-07	\N	\N	*****	*****	\N	Laura	Scholl	\N	f	834
69	75e923f20ab3d84a3ac4b36a4109d13c@gmail.com	*****	*****	*****	2016-01-29 15:18:47.287-08	2017-05-21 06:24:37.706-07	\N	\N	*****	*****	\N	Alicia		\N	f	835
1327	ebd16aa661c34f4cfdca849165c47ecb@gmail.com	*****	*****	*****	2016-09-29 11:08:19.487-07	2016-09-29 11:08:19.487-07	\N	\N	*****	*****	\N	Karen	Farzam	\N	f	836
3999	15daf29f3c0fcdf9a94e700ce94f90f6@gmail.com	*****	*****	*****	2017-04-04 12:51:02.718-07	2017-04-04 12:51:03.29-07	\N	\N	*****	*****	\N	Allie	Winkelman	\N	f	837
3301	e6aa8986385415192e05127010441ae4@gmail.com	*****	*****	*****	2017-02-27 16:25:15.503-08	2017-02-27 16:25:19.402-08	\N	\N	*****	*****	\N	Sue	Sinclair	\N	f	838
3053	2bbfedaf9e616d5c252c38e6019481ec@gmail.com	*****	*****	*****	2017-02-09 12:42:02.01-08	2017-02-10 08:48:15.699-08	\N	\N	*****	*****	\N	Flock:	Accelerating Women In Tech	\N	f	839
883	8cdf243bb6d94e727c22e74f7f73780b@gmail.com	*****	*****	*****	2016-08-01 08:54:10.844-07	2016-08-01 08:57:32.536-07	\N	\N	*****	*****	\N	Rackspace		\N	f	840
4348	4e25fd969973d6fd55614b86c0c74dc5@gmail.com	*****	*****	*****	2017-04-20 02:34:08.219-07	2017-05-04 15:58:47.619-07	\N	\N	*****	*****	\N	Craft	CMS	\N	f	841
3419	c4d4a0ed522a5106c5aa8b3e4c077071@gmail.com	*****	*****	*****	2017-03-07 11:01:52.704-08	2017-03-07 11:02:04.53-08	\N	\N	*****	*****	\N	Erin	Spiceland	\N	f	842
4153	adb8ed8f9a018d919a1dca1d502d6b3b@gmail.com	*****	*****	*****	2017-04-10 18:09:47.41-07	2017-04-10 18:09:51.31-07	\N	\N	*****	*****	\N	Nikko	Patten	\N	f	843
1325	5c0594710825406596a99025a319d635@gmail.com	*****	*****	*****	2016-09-29 11:06:00.962-07	2017-02-03 15:06:45.932-08	\N	\N	*****	*****	\N	Pamela	Wood Browne	\N	f	844
4720	2248e9f4451791491178e6ad6e8b395f@gmail.com	*****	*****	*****	2017-05-09 11:14:19.572-07	2017-05-09 11:14:20.294-07	\N	\N	*****	*****	\N	Nicole	Giannone	\N	f	847
141	688f744a10db3334b59d756689fa8250@gmail.com	*****	*****	*****	2016-03-07 01:50:58.721-08	2017-05-20 04:50:46.742-07	\N	\N	*****	*****	\N	Jigyasa	Grover	\N	f	845
74	26888a78bd38eaf94af924a9675ae705@gmail.com	*****	*****	*****	2016-01-29 15:19:36.407-08	2016-09-28 03:15:16.735-07	\N	\N	*****	*****	\N	Chantal		\N	f	846
28	332cb39ce5e614d5fcad01ae28c6e9d5@gmail.com	*****	*****	*****	2015-12-21 08:34:26.053-08	2017-02-01 11:55:11.641-08	\N	\N	*****	*****	\N	Holly		\N	f	848
1378	303f22fe5fcfb3542479af3c0d7ffb51@gmail.com	*****	*****	*****	2016-09-29 11:43:49.205-07	2017-05-10 14:26:04.82-07	\N	\N	*****	*****	\N	Glenna	Buford	\N	f	794
1372	6a3a6e3cc3f4bb5cb7ef241e3ed3167a@gmail.com	*****	*****	*****	2016-09-29 11:41:11.058-07	2016-09-29 11:41:11.058-07	\N	\N	*****	*****	\N	Radhika	Rayadu	\N	f	795
1299	ca840ad4fb9f966b78a7608f23916ce3@gmail.com	*****	*****	*****	2016-09-28 14:47:14.881-07	2016-09-28 14:49:30.346-07	\N	\N	*****	*****	\N	data.world	Swider	\N	f	796
1371	20ef75e5bb432fb540423c3b6fd60a1a@gmail.com	*****	*****	*****	2016-09-29 11:41:11.052-07	2016-09-29 11:41:11.052-07	\N	\N	*****	*****	\N	Guiti	Nabavi	\N	f	797
32	e0d3d2a0a00a30ae6368aa47ab545566@gmail.com	*****	*****	*****	2016-01-11 10:54:33.296-08	2017-05-10 10:19:29.673-07	\N	\N	*****	*****	\N	Saranya	Karuppusamy	\N	f	798
308	6bdf7bcd29fbb8a428b7a2ccf20c38d2@gmail.com	*****	*****	*****	2016-04-29 11:46:16.143-07	2016-05-03 06:10:49.728-07	\N	\N	*****	*****	\N	Cisco		\N	f	799
4834	0174cfb68bc98317384ae65d2bb4b6a5@gmail.com	*****	*****	*****	2017-05-15 05:07:56.682-07	2017-05-15 05:09:17.931-07	\N	\N	*****	*****	\N	Brian	Vinci	\N	f	800
1379	26ac149a5ae8d0a09a8eadac9b2153d8@gmail.com	*****	*****	*****	2016-09-29 11:43:49.211-07	2016-09-29 11:43:49.211-07	\N	\N	*****	*****	\N	Aleksandra	Gavriloska	\N	f	801
2898	e3073fd059876de0de39852d83a06783@gmail.com	*****	*****	*****	2017-02-01 07:16:17.461-08	2017-02-01 07:16:17.461-08	\N	\N	*****	*****	\N	\N	\N	\N	f	802
1369	a67e0bdc09dd2ba28385c89f334828f5@gmail.com	*****	*****	*****	2016-09-29 11:38:54.935-07	2016-09-29 11:38:54.935-07	\N	\N	*****	*****	\N	Erika	Aguayo	\N	f	803
686	411be685dd05fee05f62ca6e48aef8a3@gmail.com	*****	*****	*****	2016-07-01 15:31:42.541-07	2016-09-28 03:15:17.556-07	\N	\N	*****	*****	\N	\N	\N	\N	f	804
1368	bc2d687d77a9548c85d4d5cd2f9be8a4@gmail.com	*****	*****	*****	2016-09-29 11:38:54.934-07	2016-09-29 11:38:54.934-07	\N	\N	*****	*****	\N	Ana	Castro	\N	f	805
192	5effb40d83347a559b155bf5762a3985@gmail.com	*****	*****	*****	2016-03-25 08:11:02.011-07	2016-03-25 08:11:20.398-07	\N	\N	*****	*****	\N	RigUp		\N	f	806
35	26547a83f9ce5ae0839349325b1e7343@gmail.com	*****	*****	*****	2016-01-11 10:59:41.948-08	2017-05-11 21:19:54.192-07	\N	\N	*****	*****	\N	Erica		\N	f	807
1366	548f55e7c60e649394294a500b7435f5@gmail.com	*****	*****	*****	2016-09-29 11:37:07.344-07	2016-09-29 11:37:07.344-07	\N	\N	*****	*****	\N	Vicky	Twomey-Lee	\N	f	808
303	357489ee6e6984e56d512c2bbf4f5b18@gmail.com	*****	*****	*****	2016-04-29 06:51:16.619-07	2016-04-29 06:51:42.705-07	\N	\N	*****	*****	\N	The	Human Geo Group	\N	f	809
170	bd2fd32d181880d2fc0c95d7ba8ce17d@gmail.com	*****	*****	*****	2016-03-19 15:11:44.881-07	2016-03-19 15:11:44.881-07	\N	\N	*****	*****	\N	Paige	Hubbell	\N	f	810
1364	20e1ef7ed0e42f913b1b0fb8bc15b50d@gmail.com	*****	*****	*****	2016-09-29 11:34:59.505-07	2016-09-29 11:34:59.505-07	\N	\N	*****	*****	\N	Peggy	Kuo	\N	f	813
1890	29831b25c00785980ab934f70d4813b1@gmail.com	*****	*****	*****	2016-11-28 07:33:11.726-08	2016-11-28 07:33:31.466-08	\N	\N	*****	*****	\N	Jamie	Lu	\N	f	811
1365	8e6ff81f47ed88c6f6588511e5a3202e@gmail.com	*****	*****	*****	2016-09-29 11:37:07.337-07	2016-09-29 11:37:07.337-07	\N	\N	*****	*****	\N	Laura	Uzcátegui	\N	f	812
108	13ce3747cb13689865309d537ea4842f@gmail.com	*****	*****	*****	2016-02-18 11:54:08.5-08	2016-09-28 03:15:16.811-07	\N	\N	*****	*****	\N	Emily	Heist Moss	\N	f	814
1363	97e510a21c89bac3e0111d73f5737b05@gmail.com	*****	*****	*****	2016-09-29 11:34:59.504-07	2016-09-29 11:34:59.504-07	\N	\N	*****	*****	\N	Lucy	Bain	\N	f	815
1362	12a217393125c49fba8faf93dadafcd8@gmail.com	*****	*****	*****	2016-09-29 11:34:59.499-07	2016-09-29 11:34:59.499-07	\N	\N	*****	*****	\N	Daphne	Chong	\N	f	816
71	f74d1d9b9d4e727c9f1634da2669cd85@gmail.com	*****	*****	*****	2016-01-29 15:19:12.899-08	2016-09-28 03:15:16.707-07	\N	\N	*****	*****	\N	Brenda		\N	f	817
33	c31f8fee92777f265a2c4215007f35a2@gmail.com	*****	*****	*****	2016-01-11 10:57:18.467-08	2016-01-11 10:57:18.467-08	\N	\N	*****	*****	\N	Kaylyn		\N	f	818
1360	58564fc814b9e582dc1dcfb9242ca2ac@gmail.com	*****	*****	*****	2016-09-29 11:33:37.088-07	2016-09-29 11:33:37.088-07	\N	\N	*****	*****	\N	Aya	Nakagawa	\N	f	819
224	a32663428ce0d29c94f0f78666e7c06e@gmail.com	*****	*****	*****	2016-04-13 09:46:07.217-07	2016-04-13 11:44:12.626-07	\N	\N	*****	*****	\N	Bonsai.io		\N	f	821
7	163233711ccd4a6968191c8fbd549d8a@gmail.com	*****	*****	*****	2015-11-19 02:09:51.192-08	2017-04-12 13:22:46.946-07	\N	\N	*****	*****	\N	Marcela	Lango	\N	f	822
37	4c06d3aa9533a2d242b1fa57930c6603@gmail.com	*****	*****	*****	2016-01-11 11:02:41.058-08	2016-02-15 14:33:29.118-08	\N	\N	*****	*****	\N	Fernanda		\N	f	823
34	6f62bd61a70f4848e632242e885cc9ed@gmail.com	*****	*****	*****	2016-01-11 10:58:47.796-08	2016-01-11 10:58:47.796-08	\N	\N	*****	*****	\N	Kelly		\N	f	824
283	c07b3781151a9c9fb2991128a4675d06@gmail.com	*****	*****	*****	2016-04-28 08:01:14.69-07	2016-04-28 08:02:00.631-07	\N	\N	*****	*****	\N	Dev	Bootcamp 	\N	f	825
1370	7efecdcdea73d6875db52b91f68c0603@gmail.com	*****	*****	*****	2016-09-29 11:38:54.951-07	2016-09-29 11:38:54.951-07	\N	\N	*****	*****	\N	Viv	Del Rio	\N	f	826
36	a3f15edbecbe7da5265fba790e9feeb9@gmail.com	*****	*****	*****	2016-01-11 11:01:43.411-08	2016-02-15 14:33:12.306-08	\N	\N	*****	*****	\N	Dayra		\N	f	827
1321	309a70eda3c7ffe404a6ca6569c939bf@gmail.com	*****	*****	*****	2016-09-29 11:02:54.555-07	2016-09-29 11:02:54.555-07	\N	\N	*****	*****	\N	Candice	Haddad	\N	f	752
1320	843f89b3975c3b7fc84068f95fc796cc@gmail.com	*****	*****	*****	2016-09-29 11:02:54.546-07	2016-09-29 11:02:54.546-07	\N	\N	*****	*****	\N	Amber	Houle	\N	f	753
1319	6bfab1190102baca886112ebc885f691@gmail.com	*****	*****	*****	2016-09-29 11:01:49.703-07	2016-09-29 11:01:49.703-07	\N	\N	*****	*****	\N	Neha	Kaura	\N	f	754
3442	b6e18803305e056856ccb858af7e6d86@gmail.com	*****	*****	*****	2017-03-09 10:29:51.939-08	2017-03-09 10:30:24.238-08	\N	\N	*****	*****	\N	Polson	& Polson, P.C.	\N	f	755
68	7ddc7e8e6d4fdfa9d934e55a2b005d87@gmail.com	*****	*****	*****	2016-01-29 15:18:13.688-08	2016-09-28 03:15:17.148-07	\N	\N	*****	*****	\N	Rylee		\N	f	756
1347	8f78c6c692cd973103ba9c647a361577@gmail.com	*****	*****	*****	2016-09-29 11:25:21.95-07	2016-09-29 11:25:21.95-07	\N	\N	*****	*****	\N	Marisol	Acuna	\N	f	757
1318	96950200d2eca5a63244a97b75f536b7@gmail.com	*****	*****	*****	2016-09-29 11:01:04.636-07	2016-09-29 11:01:04.636-07	\N	\N	*****	*****	\N	Sally	Kingston	\N	f	758
1317	7c54f08b683464eac663bd982037283a@gmail.com	*****	*****	*****	2016-09-29 11:01:04.636-07	2016-09-29 11:01:04.636-07	\N	\N	*****	*****	\N	Amber	Joyner	\N	f	759
896	898029d0f8816a246e0c7a7c65341485@gmail.com	*****	*****	*****	2016-08-03 10:47:13.173-07	2016-09-28 03:15:17.897-07	\N	\N	*****	*****	\N	Geoff	Domoracki	\N	f	760
1316	2d3396ed13ba45c0c471b3af1aabdf2a@gmail.com	*****	*****	*****	2016-09-29 10:59:15.428-07	2016-09-29 10:59:15.428-07	\N	\N	*****	*****	\N	Mia	Zhu	\N	f	761
1315	f23b8ce26e6121a5e9dc38462e2776fa@gmail.com	*****	*****	*****	2016-09-29 10:58:16.63-07	2016-09-29 10:58:16.63-07	\N	\N	*****	*****	\N	Isabella	Oliveira	\N	f	762
2549	80afcb383424a739a793e105bdb617f9@gmail.com	*****	*****	*****	2017-01-14 09:11:39.224-08	2017-02-22 16:10:36.94-08	\N	\N	*****	*****	\N	Eileen	C	\N	f	763
70	5c7fa359b4ee800bae4b5e919a433171@gmail.com	*****	*****	*****	2016-01-29 15:18:53.83-08	2017-03-12 11:10:38.549-07	\N	\N	*****	*****	\N	beth	laing	\N	f	764
1314	d8775d54111aaf3d47957c5c4f539049@gmail.com	*****	*****	*****	2016-09-29 10:54:53.462-07	2016-09-29 10:54:53.462-07	\N	\N	*****	*****	\N	Sheree	Atcheson	\N	f	765
1313	cf9301117f3684b125ddc70a811c9ff9@gmail.com	*****	*****	*****	2016-09-29 10:54:53.45-07	2016-09-29 10:54:53.45-07	\N	\N	*****	*****	\N	Gillian	Colan-O'Leary	\N	f	766
31	27e19add9323d39d0b3f60dde40fee33@gmail.com	*****	*****	*****	2016-01-11 10:53:43.73-08	2016-07-04 13:12:12.413-07	\N	\N	*****	*****	\N	Sandra		\N	f	767
1312	71eb923685350087d1aa38bed7843ac3@gmail.com	*****	*****	*****	2016-09-29 10:53:00.503-07	2016-09-29 10:53:00.503-07	\N	\N	*****	*****	\N	Xinhui	Li	\N	f	768
80	447bd08d1ff86983e66a70858775669d@gmail.com	*****	*****	*****	2016-02-02 08:52:02.222-08	2016-09-28 03:15:16.766-07	\N	\N	*****	*****	\N	Maru	Lango	\N	f	769
1355	4365a1d13eca1c78bd460ec7d17b2544@gmail.com	*****	*****	*****	2016-09-29 11:30:08.978-07	2016-09-29 11:30:08.978-07	\N	\N	*****	*****	\N	Oksana	Denesiuk	\N	f	770
1310	31d3a19861b19e3c5d1eb2b483370ee1@gmail.com	*****	*****	*****	2016-09-29 10:51:29.334-07	2016-09-29 10:51:29.334-07	\N	\N	*****	*****	\N	Smitha	Radhakrishnan	\N	f	771
77	7ac57722768c7d3749d19e06e8ba389d@gmail.com	*****	*****	*****	2016-01-29 15:19:53.922-08	2016-09-28 03:15:16.734-07	\N	\N	*****	*****	\N	Zoe	Madden-Wood	\N	f	774
1309	24b7f50b91ac3f9b0fbf879e9039aa0a@gmail.com	*****	*****	*****	2016-09-29 10:51:29.333-07	2016-09-29 10:51:29.333-07	\N	\N	*****	*****	\N	Shwetha	Lakshman Rao	\N	f	773
72	9d5e8daeff013b0f404f87206eed86f9@gmail.com	*****	*****	*****	2016-01-29 15:19:22.243-08	2016-09-28 03:15:16.708-07	\N	\N	*****	*****	\N	Elizabeth	Ferrao	\N	f	775
642	c798ff50a86d1b17424f940a93fe10d8@gmail.com	*****	*****	*****	2016-06-21 09:02:52.874-07	2016-09-28 03:15:17.476-07	\N	\N	*****	*****	\N	Joey	Rosenberg	\N	f	776
1367	a95d13b713d4ac6181570e7e9b909b05@gmail.com	*****	*****	*****	2016-09-29 11:37:07.344-07	2016-09-29 11:37:07.344-07	\N	\N	*****	*****	\N	Christina	Lynch	\N	f	777
1308	ae5eeb5acc070587de95739c5f58d0a1@gmail.com	*****	*****	*****	2016-09-29 10:49:43.061-07	2016-09-29 10:49:43.061-07	\N	\N	*****	*****	\N	Racha	Bella	\N	f	778
78	4983e60f20be60f3cd44948b1c1c0087@gmail.com	*****	*****	*****	2016-01-29 15:20:00.061-08	2016-09-28 03:15:16.735-07	\N	\N	*****	*****	\N	Fanya		\N	f	779
75	ef131790a7c920cf2e1603358efc1449@gmail.com	*****	*****	*****	2016-01-29 15:19:43.713-08	2016-09-28 03:15:16.708-07	\N	\N	*****	*****	\N	Gabriela	Adamova	\N	f	780
1307	35523780be14ccacd1194641ba0bde57@gmail.com	*****	*****	*****	2016-09-29 10:49:43.051-07	2016-09-29 10:49:43.051-07	\N	\N	*****	*****	\N	Fatma	Djoudjou	\N	f	781
551	a4f59257d033d8eb46bbb19bcf290430@gmail.com	*****	*****	*****	2016-06-06 12:04:33.418-07	2016-09-28 03:15:17.39-07	\N	\N	*****	*****	\N	Allison	Canestaro	\N	f	782
1305	aba7551e89f249da0fae69d2be8f5128@gmail.com	*****	*****	*****	2016-09-29 10:44:40.429-07	2016-09-29 10:44:40.429-07	\N	\N	*****	*****	\N	Judith	Agbotse	\N	f	783
1377	e59b939ecc4c77c350f966165188ad7e@gmail.com	*****	*****	*****	2016-09-29 11:43:49.189-07	2016-09-29 11:43:49.189-07	\N	\N	*****	*****	\N	Silvia	Pina	\N	f	784
76	d13f331afaae109d7c30e231be465401@gmail.com	*****	*****	*****	2016-01-29 15:19:47.116-08	2016-09-28 03:15:16.734-07	\N	\N	*****	*****	\N	Rose	THERESA	\N	f	785
4550	35cf86710c6d930ee7610bf1bb5dbe11@gmail.com	*****	*****	*****	2017-05-01 10:13:32.139-07	2017-05-01 10:13:35.793-07	\N	\N	*****	*****	\N	Lacey	Reinoehl	\N	f	786
1376	c11e740d05e136e14f4588e08a01f460@gmail.com	*****	*****	*****	2016-09-29 11:43:49.157-07	2016-09-29 11:43:49.157-07	\N	\N	*****	*****	\N	Carola	Nitz	\N	f	787
67	61b08842f8750a6bc18d274dc954fa02@gmail.com	*****	*****	*****	2016-01-29 15:16:09.038-08	2016-09-28 03:15:16.707-07	\N	\N	*****	*****	\N	Nupur	Kapoor	\N	f	788
1178	d49f580dd3b9b503a43175705afc72ff@gmail.com	*****	*****	*****	2016-09-12 21:15:01.959-07	2016-09-28 03:15:18.213-07	\N	\N	*****	*****	\N	Google	Fiber	\N	f	789
1311	4bdb3020da3f8070227aa9cd1662f481@gmail.com	*****	*****	*****	2016-09-29 10:53:00.502-07	2016-09-29 10:53:00.502-07	\N	\N	*****	*****	\N	Lucy	Shang	\N	f	790
1335	11dfac5cbe9c44dd072f6d704c64f19b@gmail.com	*****	*****	*****	2016-09-29 11:12:58.838-07	2016-09-29 11:12:58.838-07	\N	\N	*****	*****	\N	Irina	Muchnik	\N	f	791
1348	feb1e25523fe209c41071badd848f502@gmail.com	*****	*****	*****	2016-09-29 11:25:21.969-07	2016-09-29 11:25:21.969-07	\N	\N	*****	*****	\N	Roxane	Castelein	\N	f	725
73	9cc8932f53ca5322fab8553db692e6a7@gmail.com	*****	*****	*****	2016-01-29 15:19:28.648-08	2016-09-28 03:15:18.347-07	\N	\N	*****	*****	\N	Barbara		\N	f	726
1346	c9606a2459e0fef1e21cdc86c3eb2683@gmail.com	*****	*****	*****	2016-09-29 11:24:17.81-07	2016-09-29 11:24:17.81-07	\N	\N	*****	*****	\N	Shruti	Sethi	\N	f	727
1345	32d477008ca7ce468c8b6894d3527377@gmail.com	*****	*****	*****	2016-09-29 11:24:17.802-07	2016-09-29 11:24:17.802-07	\N	\N	*****	*****	\N	Ashma	Sethi	\N	f	728
1343	8832824eb21ff845244a89b2aeb53972@gmail.com	*****	*****	*****	2016-09-29 11:19:11.446-07	2016-09-29 11:19:11.446-07	\N	\N	*****	*****	\N	Andreza	Leite	\N	f	729
1341	0cd39d443715253ede1c195f212fa858@gmail.com	*****	*****	*****	2016-09-29 11:16:52.099-07	2016-09-29 11:16:52.099-07	\N	\N	*****	*****	\N	Jennifer	Hoover	\N	f	730
1342	530e82f7e0744b9b860f9811257e0b13@gmail.com	*****	*****	*****	2016-09-29 11:17:47.289-07	2016-09-29 11:17:47.289-07	\N	\N	*****	*****	\N	Veronica	Cannon	\N	f	731
1340	8abf71093dbd2bfc653a5bc12a5a7b89@gmail.com	*****	*****	*****	2016-09-29 11:16:17.115-07	2016-09-29 11:16:17.115-07	\N	\N	*****	*****	\N	Emily	Reese	\N	f	732
1338	27196e10ddabe6055a003b98d791a15b@gmail.com	*****	*****	*****	2016-09-29 11:14:46.606-07	2016-09-29 11:14:46.606-07	\N	\N	*****	*****	\N	Princy	James	\N	f	733
1339	99b642de95827a0d4bba0315ddd40723@gmail.com	*****	*****	*****	2016-09-29 11:15:23.931-07	2016-09-29 11:15:23.931-07	\N	\N	*****	*****	\N	Grisel	Ancona	\N	f	734
1337	d32d64b3fc1390780651de634d212e50@gmail.com	*****	*****	*****	2016-09-29 11:13:48.772-07	2016-09-29 11:13:48.772-07	\N	\N	*****	*****	\N	Isabel	Yepes	\N	f	735
1336	0830431cc80ea3b8d7b9dc5eed3fde68@gmail.com	*****	*****	*****	2016-09-29 11:12:58.852-07	2016-09-29 11:12:58.852-07	\N	\N	*****	*****	\N	Tiffany	Andrews	\N	f	736
1334	416e8cd289733c0bb5ed83f3ede37276@gmail.com	*****	*****	*****	2016-09-29 11:11:53.843-07	2016-09-29 11:11:53.843-07	\N	\N	*****	*****	\N	Vinita	Khandelwal Rathi	\N	f	738
1158	3a0a65e6b6e105f4835f188459a7b979@gmail.com	*****	*****	*****	2016-09-09 20:42:48.933-07	2016-09-28 03:15:18.225-07	\N	\N	*****	*****	\N	Pieceofr		\N	f	737
1094	acb49a7f9ec2454380130c56c32ebbec@gmail.com	*****	*****	*****	2016-09-01 07:41:33.243-07	2016-09-01 07:43:52.954-07	\N	\N	*****	*****	\N	thirteen23		\N	f	739
1145	0d11c83dcf3d75bc133ab5010187b7b6@gmail.com	*****	*****	*****	2016-09-07 15:13:23.624-07	2016-09-28 03:15:18.184-07	\N	\N	*****	*****	\N	Jane	Shih	\N	f	740
1330	51d33c46424eb3f4647ded569bda1da3@gmail.com	*****	*****	*****	2016-09-29 11:09:42.794-07	2016-09-29 11:09:42.794-07	\N	\N	*****	*****	\N	FJ	Genus	\N	f	741
426	c989f4c11bd20a6754a75c38303a4767@gmail.com	*****	*****	*****	2016-05-23 13:27:26.092-07	2016-09-28 03:15:17.365-07	\N	\N	*****	*****	\N	Ellevest		\N	f	742
555	3379a40c501c7f24d233be62ce9a94c5@gmail.com	*****	*****	*****	2016-06-06 17:53:44.829-07	2016-09-28 03:15:17.29-07	\N	\N	*****	*****	\N	Shahnaz	Kamberi	\N	f	743
1326	64b6e8606a0a0dcdd531b7f51f0dfe24@gmail.com	*****	*****	*****	2016-09-29 11:06:44.745-07	2016-09-29 11:06:44.745-07	\N	\N	*****	*****	\N	KeSha	Shah	\N	f	744
1323	d4caf7062fecc15e4fa181bf8632bbdf@gmail.com	*****	*****	*****	2016-09-29 11:05:19.073-07	2016-09-29 11:05:19.073-07	\N	\N	*****	*****	\N	Maira	Bejamin	\N	f	746
1324	8fd43f5cd0be03abdf7f57c45559f394@gmail.com	*****	*****	*****	2016-09-29 11:05:19.079-07	2016-09-29 11:05:19.079-07	\N	\N	*****	*****	\N	Candace	Lazarou	\N	f	745
898	ad38fa1d5fec65ace946d4b5a1da5e78@gmail.com	*****	*****	*****	2016-08-02 17:00:00-07	2016-08-02 17:00:00-07	\N	\N	*****	*****	\N	Casey	Gruppioni	\N	f	747
4749	42cdf9a221d1dbffc6da14cd53207b4c@gmail.com	*****	*****	*****	2017-05-10 16:45:43.307-07	2017-05-10 16:45:44.074-07	\N	\N	*****	*****	\N	Elijah	Van Der Giessen	\N	f	748
897	a48b149e339d16ec672b8abea68be0e3@gmail.com	*****	*****	*****	2016-08-02 17:00:00-07	2017-04-17 09:41:26.051-07	\N	\N	*****	*****	\N	Radhika	Malik	\N	f	749
1322	bc72c4b9fd99b99cfd7cc6decbd58008@gmail.com	*****	*****	*****	2016-09-29 11:03:46.798-07	2017-02-15 10:12:58.843-08	\N	\N	*****	*****	\N	Carole	Bennett	\N	f	750
1328	8808873dd5e6a229bca3641b8890d754@gmail.com	*****	*****	*****	2016-09-29 11:08:19.492-07	2016-09-29 11:08:19.492-07	\N	\N	*****	*****	\N	Michelle	Sun	\N	f	686
129	f93705c9774686499d4f9efbcaa81e07@gmail.com	*****	*****	*****	2016-03-02 13:31:50.497-08	2016-03-02 13:32:53.053-08	\N	\N	*****	*****	\N	MakerSquare		\N	f	689
2	b0021cf62c2ef3dc137cf0a87e2af92b@gmail.com	*****	*****	*****	2015-11-05 05:44:30.93-08	2017-05-25 11:22:59.819-07	\N	\N	*****	*****	2016-03-03 16:07:14.176-08	Xavier	Damman	\N	f	688
142	3723537c491f597e9c203bad685dd9d7@gmail.com	*****	*****	*****	2016-03-07 01:51:08.328-08	2017-02-10 16:24:03.134-08	\N	\N	*****	*****	\N	Sarah	Olson	\N	f	697
2594	ad47316cbe8c10d21978ee1dc5746792@gmail.com	*****	*****	*****	2017-01-18 05:49:53.082-08	2017-01-18 05:55:44.616-08	\N	\N	*****	*****	\N	Tamouse	Temple	\N	f	698
3	a1c73eb4917522c4cdcebe8736395eb3@gmail.com	*****	*****	*****	2015-11-19 02:07:53.479-08	2017-05-22 09:22:41.796-07	\N	\N	*****	*****	2017-03-01 21:58:23.993-08	Women	Who Code	\N	t	696
2561	0dbc97aceea70683f46b266f2c0e559a@gmail.com	*****	*****	*****	2017-01-16 10:03:53.479-08	2017-01-16 10:03:53.479-08	\N	\N	*****	*****	\N	Amanda	Folson	\N	f	701
1344	d6dd386d45dd48d56872b57c7502ba72@gmail.com	*****	*****	*****	2016-09-29 11:19:11.45-07	2017-04-30 15:09:37.177-07	\N	\N	*****	*****	\N	Karina		\N	f	699
2220	73e73afea6c744a00d6963fbf8a4ef16@gmail.com	*****	*****	*****	2016-12-18 17:41:26.473-08	2017-01-06 23:47:05.144-08	\N	\N	*****	*****	\N	Cameron	🐳✨	\N	f	700
1303	da23087dbcb3966f332eb0d22ebbdde1@gmail.com	*****	*****	*****	2016-09-29 10:43:14.052-07	2016-11-22 23:21:46.01-08	\N	\N	*****	*****	\N	Shirley	Hicks	\N	f	703
1846	f57e8a5f4bb72290e312a6c29b1407a3@gmail.com	*****	*****	*****	2016-11-22 07:22:35.912-08	2016-11-22 07:23:28.441-08	\N	\N	*****	*****	\N	Portland	Modern Manufacturing Collective	\N	f	702
2431	f4da08d72d1a2dfe1f47db5f46a62a5b@gmail.com	*****	*****	*****	2017-01-03 16:00:00-08	2017-04-28 13:39:58.316-07	\N	\N	*****	*****	\N	Nataliia	Ilchenko	\N	f	704
126	89144a979199c98e09581ea3cdcd89f5@gmail.com	*****	*****	*****	2016-03-01 20:41:59.905-08	2016-12-01 12:04:48.511-08	\N	\N	*****	*****	\N	Alaina	Percival	\N	f	705
1304	e1b16aaaf8961ee0acdbd9d306561b03@gmail.com	*****	*****	*****	2016-09-29 10:44:40.419-07	2016-12-29 10:39:36.018-08	\N	\N	*****	*****	\N	Afia	Owusu-Forfie	\N	f	706
1374	4d9f4287fe4e2a93b73c1cb08be76148@gmail.com	*****	*****	*****	2016-09-29 11:41:11.059-07	2016-12-19 14:20:00.592-08	\N	\N	*****	*****	\N	Snehal	Patil	\N	f	707
1908	8a3f905ee55db87a19779a214587e529@gmail.com	*****	*****	*****	2016-11-29 02:03:21.301-08	2016-11-29 02:04:01.298-08	\N	\N	*****	*****	\N	Wooga		\N	f	708
1808	ca0ddd5acb195ee0e3884842e8656755@gmail.com	*****	*****	*****	2016-11-17 09:43:26.15-08	2016-11-17 09:44:20.864-08	\N	\N	*****	*****	\N	Rigado		\N	f	709
1446	17ab59318e1a638274d84ee4f4617cd4@gmail.com	*****	*****	*****	2016-10-07 09:49:14.297-07	2016-10-07 09:49:50.24-07	\N	\N	*****	*****	\N	Wei-Juin	Lin	\N	f	713
1438	ca459f986fe2770c3231788ec004352a@gmail.com	*****	*****	*****	2016-10-06 11:36:34.986-07	2016-10-06 11:37:42.185-07	\N	\N	*****	*****	\N	Hector	Torres	\N	f	714
1356	d182a2ddbeeb69d5629028cfaeda4356@gmail.com	*****	*****	*****	2016-09-29 11:30:54.244-07	2016-09-29 11:30:54.244-07	\N	\N	*****	*****	\N	Dinah	Shi	\N	f	720
1349	784d1666f6262338f095884b8b2ab1d8@gmail.com	*****	*****	*****	2016-09-29 11:26:35.133-07	2016-09-29 11:26:35.133-07	\N	\N	*****	*****	\N	Qianyi	Zheng	\N	f	724
2416	c909e10b24422a34ea20a79b9a906cf5@gmail.com	*****	*****	*****	2017-01-03 12:59:33.995-08	2017-01-03 12:59:33.995-08	\N	\N	*****	*****	\N	Kelly	Erickson	\N	f	710
1352	6b0788c1db2895a00b16e51bbda21ee5@gmail.com	*****	*****	*****	2016-09-29 11:28:08.475-07	2016-12-20 11:09:35.349-08	\N	\N	*****	*****	\N	Sarrah	Vesselov	\N	f	717
1244	e953c9a4e2c5bb69552f3c92acb936ed@gmail.com	*****	*****	*****	2016-09-20 13:58:49.633-07	2016-09-28 03:15:18.662-07	\N	\N	*****	*****	\N	Grain		\N	f	718
392	914df0c8ab1f8b15a8ab1a7e77a3bcc0@gmail.com	*****	*****	*****	2016-05-19 12:24:40.738-07	2016-09-28 03:15:18.36-07	\N	\N	*****	*****	\N	Travis	Swicegood	\N	f	719
1351	2112fabeedef785fff13999b12f6e057@gmail.com	*****	*****	*****	2016-09-29 11:28:08.47-07	2016-09-29 11:28:08.47-07	\N	\N	*****	*****	\N	Kathy	Trammell	\N	f	722
8	9f23b14304ccc62b927759bbf7ca73c8@gmail.com	*****	*****	*****	2015-11-30 12:20:11.257-08	2017-05-09 13:20:42.144-07	\N	\N	*****	*****	\N	Aseem	Sood	\N	f	820
1957	d9ca31bcfecac96ff71cf6036d192503@gmail.com	*****	*****	*****	2016-11-30 08:11:38.749-08	2016-11-30 08:12:01.534-08	\N	\N	*****	*****	\N	Maddy	Lau	\N	f	711
4711	32714f8fbf59186a1fe4eb47e2d1d40e@gmail.com	*****	*****	*****	2017-05-08 22:59:11.628-07	2017-05-08 22:59:13.896-07	\N	\N	*****	*****	\N	Kristine	Paas	\N	f	712
1357	923bd4c7e11e7c7afc4c51e31374a7f5@gmail.com	*****	*****	*****	2016-09-29 11:32:00.979-07	2016-09-29 11:32:00.979-07	\N	\N	*****	*****	\N	Britten	Kuckelman	\N	f	715
1354	a77dcae86c4a98f96f10de27166b1212@gmail.com	*****	*****	*****	2016-09-29 11:30:08.971-07	2016-09-29 11:30:08.971-07	\N	\N	*****	*****	\N	Ksenia	Barshchyk	\N	f	716
1353	672ed3d7420c37155d2978ef9bb4bddd@gmail.com	*****	*****	*****	2016-09-29 11:28:54.276-07	2016-09-29 11:28:54.276-07	\N	\N	*****	*****	\N	Ria	Riaz	\N	f	721
1350	275a7843d04d598eb4949a8f3b98f170@gmail.com	*****	*****	*****	2016-09-29 11:26:35.139-07	2016-09-29 11:26:35.139-07	\N	\N	*****	*****	\N	Yoka	Liu	\N	f	723
884	ee80bff7c018dc2ecb0468b05451d03c@gmail.com	*****	*****	*****	2016-08-01 08:55:23.132-07	2016-08-01 08:56:25.628-07	\N	\N	*****	*****	\N	New	York Code + Design Academy (Austin)	\N	f	751
646	e717495c9186295c79d02397add07124@gmail.com	*****	*****	*****	2016-06-22 13:09:43.896-07	2016-09-28 03:15:17.513-07	\N	\N	*****	*****	\N	Lindsey	Barrett	\N	f	772
1263	6dc155c0ad37d1bea19426f9c9f5c882@gmail.com	*****	*****	*****	2016-09-22 18:07:06.058-07	2016-09-28 03:15:17.268-07	\N	\N	*****	*****	\N	Isaac	Potoczny-Jones	\N	f	793
1373	4b43d6eaedbb506b76bf9f73351958f4@gmail.com	*****	*****	*****	2016-09-29 11:41:11.058-07	2016-09-29 11:41:11.058-07	\N	\N	*****	*****	\N	Sonia	Prabhu	\N	f	792
\.


                                               3759.dat                                                                                            0000600 0004000 0002000 00000000005 13156021737 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000157357 13156021737 0015413 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_CollectiveId_fkey";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_UserId_fkey";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_GroupId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_UserId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_HostCollectiveId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_GroupId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_FromCollectiveId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_ExpenseId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_DonationId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_CardId_fkey";
ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_GroupId_fkey";
ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_UserId_fkey";
ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_GroupId_fkey";
ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "PaymentMethods_CollectiveId_fkey";
ALTER TABLE ONLY public."Paykeys" DROP CONSTRAINT "Paykeys_TransactionId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_TierId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_FromCollectiveId_fkey";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "Members_TierId_fkey";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "Members_MemberCollectiveId_fkey";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Groups_lastEditedByUserId_fkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_lastEditedById_fkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_UserId_fkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_GroupId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_UserId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_SubscriptionId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_PaymentMethodId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_GroupId_fkey";
ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_UserId_fkey";
ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_GroupId_fkey";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_ParentCollectiveId_fkey";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_HostCollectiveId_fkey";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_CreatedByUserId_fkey";
ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_ParentCollectiveId_fkey";
ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_HostCollectiveId_fkey";
ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_CreatedByUserId_fkey";
ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_UserId_fkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_UserId_fkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_TransactionId_fkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_GroupId_fkey";
DROP INDEX public.transactions_uuid;
DROP INDEX public.subscriptions_type__group_id__user_id;
DROP INDEX public."UniqueSlugIndex";
DROP INDEX public."Transactions_GroupId";
DROP INDEX public."ToCollectiveId-FromCollectiveId-type";
DROP INDEX public."MemberCollectiveId-CollectiveId-role";
DROP INDEX public."DonationId";
DROP INDEX public."CollectiveId-deletedAt";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT email_unique_idx;
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_pkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_pkey";
ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_pkey";
ALTER TABLE ONLY public."Subscriptions" DROP CONSTRAINT "Subscriptions_pkey1";
ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_pkey";
ALTER TABLE ONLY public."Sessions" DROP CONSTRAINT "Sessions_pkey";
ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
ALTER TABLE ONLY public."Paykeys" DROP CONSTRAINT "Paykeys_pkey";
ALTER TABLE ONLY public."Paykeys" DROP CONSTRAINT "Paykeys_paykey_key";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Groups_pkey";
ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "GroupHistories_pkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_pkey";
ALTER TABLE ONLY public."ExpenseHistories" DROP CONSTRAINT "ExpenseHistories_pkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_pkey";
ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_pkey";
ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_pkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_pkey";
ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Transactions" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Tiers" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Subscriptions" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."PaymentMethods" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Paykeys" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Orders" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Notifications" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Members" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Expenses" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."ExpenseHistories" ALTER COLUMN hid DROP DEFAULT;
ALTER TABLE public."ConnectedAccounts" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Collectives" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."CollectiveHistories" ALTER COLUMN hid DROP DEFAULT;
ALTER TABLE public."Activities" ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public."Users_id_seq";
DROP TABLE public."Users";
DROP SEQUENCE public."UserGroups_id_seq";
DROP SEQUENCE public."Transactions_id_seq";
DROP TABLE public."Transactions";
DROP SEQUENCE public."Tiers_id_seq";
DROP TABLE public."Tiers";
DROP SEQUENCE public."Subscriptions_id_seq1";
DROP SEQUENCE public."Subscriptions_id_seq";
DROP TABLE public."Subscriptions";
DROP TABLE public."Sessions";
DROP TABLE public."SequelizeMeta";
DROP SEQUENCE public."Paykeys_id_seq";
DROP TABLE public."Paykeys";
DROP TABLE public."Notifications";
DROP TABLE public."Members";
DROP SEQUENCE public."Groups_id_seq";
DROP SEQUENCE public."GroupHistories_hid_seq";
DROP SEQUENCE public."Expenses_id_seq";
DROP TABLE public."Expenses";
DROP SEQUENCE public."ExpenseHistories_hid_seq";
DROP TABLE public."ExpenseHistories";
DROP SEQUENCE public."Donations_id_seq";
DROP TABLE public."Orders";
DROP SEQUENCE public."ConnectedAccounts_id_seq";
DROP TABLE public."ConnectedAccounts";
DROP TABLE public."Collectives";
DROP TABLE public."CollectiveHistories";
DROP SEQUENCE public."Cards_id_seq";
DROP TABLE public."PaymentMethods";
DROP SEQUENCE public."Activities_id_seq";
DROP TABLE public."Activities";
DROP TYPE public."enum_UserGroups_role";
DROP TYPE public."enum_Groups_membership_type";
DROP EXTENSION postgis;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

--
-- Name: enum_Groups_membership_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Groups_membership_type" AS ENUM (
    'donation',
    'monthlyfee',
    'yearlyfee'
);


--
-- Name: enum_UserGroups_role; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_UserGroups_role" AS ENUM (
    'admin',
    'writer',
    'viewer'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Activities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Activities" (
    id integer NOT NULL,
    type character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "CollectiveId" integer,
    "UserId" integer,
    "TransactionId" integer
);


--
-- Name: Activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Activities_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Activities_id_seq" OWNED BY "Activities".id;


--
-- Name: PaymentMethods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "PaymentMethods" (
    id integer NOT NULL,
    name character varying(255),
    token character varying(255),
    "customerId" character varying(255),
    service character varying(255) DEFAULT 'stripe'::character varying,
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "confirmedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer,
    "expiryDate" timestamp with time zone,
    uuid uuid,
    "CollectiveId" integer,
    "archivedAt" timestamp with time zone,
    "monthlyLimitPerMember" integer,
    "primary" boolean DEFAULT false,
    currency character varying(3)
);


--
-- Name: Cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Cards_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Cards_id_seq" OWNED BY "PaymentMethods".id;


--
-- Name: CollectiveHistories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "CollectiveHistories" (
    id integer,
    name character varying(255),
    description character varying(255),
    currency character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean,
    "longDescription" text,
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    mission character varying(255),
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean,
    "LastEditedByUserId" integer,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL,
    "CreatedByUserId" integer,
    "HostCollectiveId" integer,
    "ParentCollectiveId" integer,
    type character varying(255) DEFAULT 'COLLECTIVE'::character varying,
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "locationName" character varying(255),
    address character varying(255),
    timezone character varying(255),
    "maxAmount" integer,
    "maxQuantity" integer,
    "geoLocationLatLong" geometry(Point)
);


--
-- Name: Collectives; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Collectives" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean DEFAULT false,
    "longDescription" text,
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    mission character varying(128),
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean DEFAULT false,
    "LastEditedByUserId" integer,
    "CreatedByUserId" integer,
    "HostCollectiveId" integer,
    "ParentCollectiveId" integer,
    type character varying(255) DEFAULT 'COLLECTIVE'::character varying,
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "locationName" character varying(255),
    address character varying(255),
    timezone character varying(255),
    "maxAmount" integer,
    "maxQuantity" integer,
    "geoLocationLatLong" geometry(Point)
);


--
-- Name: ConnectedAccounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ConnectedAccounts" (
    id integer NOT NULL,
    service character varying(255),
    username character varying(255),
    "clientId" character varying(255),
    token character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer,
    "CollectiveId" integer,
    "refreshToken" character varying(255)
);


--
-- Name: ConnectedAccounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "ConnectedAccounts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ConnectedAccounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "ConnectedAccounts_id_seq" OWNED BY "ConnectedAccounts".id;


--
-- Name: Orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Orders" (
    id integer NOT NULL,
    "CreatedByUserId" integer,
    "CollectiveId" integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "totalAmount" integer,
    description character varying(255),
    "SubscriptionId" integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "PaymentMethodId" integer,
    "processedAt" timestamp with time zone,
    "privateMessage" text,
    "TierId" integer,
    "FromCollectiveId" integer,
    "publicMessage" character varying(255),
    quantity integer
);


--
-- Name: Donations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Donations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Donations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Donations_id_seq" OWNED BY "Orders".id;


--
-- Name: ExpenseHistories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ExpenseHistories" (
    id integer,
    "UserId" integer,
    "CollectiveId" integer,
    currency character varying(255),
    amount integer,
    description character varying(255),
    "payoutMethod" character varying(255),
    "privateMessage" text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer,
    status character varying(255),
    "incurredAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL
);


--
-- Name: ExpenseHistories_hid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "ExpenseHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ExpenseHistories_hid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "ExpenseHistories_hid_seq" OWNED BY "ExpenseHistories".hid;


--
-- Name: Expenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Expenses" (
    id integer NOT NULL,
    "UserId" integer NOT NULL,
    "CollectiveId" integer NOT NULL,
    currency character varying(255) NOT NULL,
    amount integer NOT NULL,
    description character varying(255) NOT NULL,
    "privateMessage" text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer NOT NULL,
    status character varying(255) DEFAULT 'PENDING'::character varying NOT NULL,
    "incurredAt" timestamp with time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone,
    "payoutMethod" character varying(255) NOT NULL
);


--
-- Name: Expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Expenses_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Expenses_id_seq" OWNED BY "Expenses".id;


--
-- Name: GroupHistories_hid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "GroupHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: GroupHistories_hid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "GroupHistories_hid_seq" OWNED BY "CollectiveHistories".hid;


--
-- Name: Groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Groups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Groups_id_seq" OWNED BY "Collectives".id;


--
-- Name: Members; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Members" (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer NOT NULL,
    "CollectiveId" integer NOT NULL,
    role character varying(255) DEFAULT 'MEMBER'::character varying NOT NULL,
    id integer NOT NULL,
    description character varying(255),
    "MemberCollectiveId" integer,
    "TierId" integer
);


--
-- Name: Notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Notifications" (
    id integer NOT NULL,
    channel character varying(255) DEFAULT 'email'::character varying,
    type character varying(255),
    active boolean DEFAULT true,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "UserId" integer,
    "CollectiveId" integer,
    "webhookUrl" character varying(255)
);


--
-- Name: Paykeys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Paykeys" (
    id integer NOT NULL,
    "trackingId" character varying(255),
    paykey character varying(255),
    status character varying(255),
    payload json,
    data json,
    error json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "TransactionId" integer
);


--
-- Name: Paykeys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Paykeys_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Paykeys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Paykeys_id_seq" OWNED BY "Paykeys".id;


--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "SequelizeMeta" (
    name character varying(255) NOT NULL
);


--
-- Name: Sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Sessions" (
    sid character varying(32) NOT NULL,
    expires timestamp with time zone,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Subscriptions" (
    id integer NOT NULL,
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "interval" character varying(8) DEFAULT NULL::character varying,
    "isActive" boolean DEFAULT false,
    data json,
    "stripeSubscriptionId" character varying(255),
    "activatedAt" timestamp with time zone,
    "deactivatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone
);


--
-- Name: Subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Subscriptions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Subscriptions_id_seq" OWNED BY "Notifications".id;


--
-- Name: Subscriptions_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Subscriptions_id_seq1"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Subscriptions_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Subscriptions_id_seq1" OWNED BY "Subscriptions".id;


--
-- Name: Tiers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Tiers" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "maxQuantity" integer,
    password character varying(255),
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    slug character varying(255),
    "maxQuantityPerUser" integer,
    goal integer,
    type character varying(255) DEFAULT 'TICKET'::character varying,
    "CollectiveId" integer,
    "interval" character varying(8) DEFAULT NULL::character varying,
    button character varying(255),
    presets json
);


--
-- Name: Tiers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Tiers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Tiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Tiers_id_seq" OWNED BY "Tiers".id;


--
-- Name: Transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Transactions" (
    id integer NOT NULL,
    type character varying(255),
    description character varying(255),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone NOT NULL,
    "CollectiveId" integer,
    "CreatedByUserId" integer,
    "PaymentMethodId" integer,
    "deletedAt" timestamp with time zone,
    data json,
    "OrderId" integer,
    "platformFeeInHostCurrency" integer,
    "hostFeeInHostCurrency" integer,
    "paymentProcessorFeeInHostCurrency" integer,
    "hostCurrency" character varying(255),
    "hostCurrencyFxRate" double precision,
    "amountInHostCurrency" integer,
    "netAmountInCollectiveCurrency" integer,
    "ExpenseId" integer,
    uuid uuid,
    "FromCollectiveId" integer,
    "HostCollectiveId" integer
);


--
-- Name: Transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Transactions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Transactions_id_seq" OWNED BY "Transactions".id;


--
-- Name: UserGroups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "UserGroups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: UserGroups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "UserGroups_id_seq" OWNED BY "Members".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Users" (
    id integer NOT NULL,
    email character varying(255),
    _salt character varying(255) DEFAULT '$2a$10$JqAcT6sBbBs5pO9FkwqLEu'::character varying,
    refresh_token character varying(255) DEFAULT '$2a$10$IHs8e8FdK1.bqjvZxr4Zvu'::character varying,
    password_hash character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "seenAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "paypalEmail" character varying(255),
    "resetPasswordTokenHash" character varying(255),
    "resetPasswordSentAt" timestamp with time zone,
    "firstName" character varying(128),
    "lastName" character varying(128),
    "billingAddress" character varying(255),
    "isHost" boolean DEFAULT false,
    "CollectiveId" integer
);


--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Users_id_seq" OWNED BY "Users".id;


--
-- Name: Activities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities" ALTER COLUMN id SET DEFAULT nextval('"Activities_id_seq"'::regclass);


--
-- Name: CollectiveHistories hid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories" ALTER COLUMN hid SET DEFAULT nextval('"GroupHistories_hid_seq"'::regclass);


--
-- Name: Collectives id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives" ALTER COLUMN id SET DEFAULT nextval('"Groups_id_seq"'::regclass);


--
-- Name: ConnectedAccounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts" ALTER COLUMN id SET DEFAULT nextval('"ConnectedAccounts_id_seq"'::regclass);


--
-- Name: ExpenseHistories hid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ExpenseHistories" ALTER COLUMN hid SET DEFAULT nextval('"ExpenseHistories_hid_seq"'::regclass);


--
-- Name: Expenses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses" ALTER COLUMN id SET DEFAULT nextval('"Expenses_id_seq"'::regclass);


--
-- Name: Members id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members" ALTER COLUMN id SET DEFAULT nextval('"UserGroups_id_seq"'::regclass);


--
-- Name: Notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq"'::regclass);


--
-- Name: Orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders" ALTER COLUMN id SET DEFAULT nextval('"Donations_id_seq"'::regclass);


--
-- Name: Paykeys id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Paykeys" ALTER COLUMN id SET DEFAULT nextval('"Paykeys_id_seq"'::regclass);


--
-- Name: PaymentMethods id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PaymentMethods" ALTER COLUMN id SET DEFAULT nextval('"Cards_id_seq"'::regclass);


--
-- Name: Subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Subscriptions" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq1"'::regclass);


--
-- Name: Tiers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Tiers" ALTER COLUMN id SET DEFAULT nextval('"Tiers_id_seq"'::regclass);


--
-- Name: Transactions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions" ALTER COLUMN id SET DEFAULT nextval('"Transactions_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users" ALTER COLUMN id SET DEFAULT nextval('"Users_id_seq"'::regclass);


--
-- Data for Name: Activities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Activities" (id, type, data, "createdAt", "CollectiveId", "UserId", "TransactionId") FROM stdin;
\.
COPY "Activities" (id, type, data, "createdAt", "CollectiveId", "UserId", "TransactionId") FROM '$$PATH$$/4009.dat';

--
-- Name: Activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Activities_id_seq"', 27901, true);


--
-- Name: Cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Cards_id_seq"', 3023, true);


--
-- Data for Name: CollectiveHistories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "CollectiveHistories" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", hid, "archivedAt", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong") FROM stdin;
\.
COPY "CollectiveHistories" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", hid, "archivedAt", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong") FROM '$$PATH$$/4021.dat';

--
-- Data for Name: Collectives; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Collectives" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong") FROM stdin;
\.
COPY "Collectives" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong") FROM '$$PATH$$/4023.dat';

--
-- Data for Name: ConnectedAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "ConnectedAccounts" (id, service, username, "clientId", token, data, "createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", "refreshToken") FROM stdin;
\.
COPY "ConnectedAccounts" (id, service, username, "clientId", token, data, "createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", "refreshToken") FROM '$$PATH$$/4013.dat';

--
-- Name: ConnectedAccounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"ConnectedAccounts_id_seq"', 1023, true);


--
-- Name: Donations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Donations_id_seq"', 2912, true);


--
-- Data for Name: ExpenseHistories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "ExpenseHistories" (id, "UserId", "CollectiveId", currency, amount, description, "payoutMethod", "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", hid, "archivedAt") FROM stdin;
\.
COPY "ExpenseHistories" (id, "UserId", "CollectiveId", currency, amount, description, "payoutMethod", "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", hid, "archivedAt") FROM '$$PATH$$/4017.dat';

--
-- Name: ExpenseHistories_hid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"ExpenseHistories_hid_seq"', 1607, true);


--
-- Data for Name: Expenses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Expenses" (id, "UserId", "CollectiveId", currency, amount, description, "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", "payoutMethod") FROM stdin;
\.
COPY "Expenses" (id, "UserId", "CollectiveId", currency, amount, description, "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", "payoutMethod") FROM '$$PATH$$/4019.dat';

--
-- Name: Expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Expenses_id_seq"', 1159, true);


--
-- Name: GroupHistories_hid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"GroupHistories_hid_seq"', 31393, true);


--
-- Name: Groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Groups_id_seq"', 848, true);


--
-- Data for Name: Members; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Members" ("createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", role, id, description, "MemberCollectiveId", "TierId") FROM stdin;
\.
COPY "Members" ("createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", role, id, description, "MemberCollectiveId", "TierId") FROM '$$PATH$$/4037.dat';

--
-- Data for Name: Notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Notifications" (id, channel, type, active, "createdAt", "updatedAt", "UserId", "CollectiveId", "webhookUrl") FROM stdin;
\.
COPY "Notifications" (id, channel, type, active, "createdAt", "updatedAt", "UserId", "CollectiveId", "webhookUrl") FROM '$$PATH$$/4025.dat';

--
-- Data for Name: Orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Orders" (id, "CreatedByUserId", "CollectiveId", currency, "totalAmount", description, "SubscriptionId", "createdAt", "updatedAt", "deletedAt", "PaymentMethodId", "processedAt", "privateMessage", "TierId", "FromCollectiveId", "publicMessage", quantity) FROM stdin;
\.
COPY "Orders" (id, "CreatedByUserId", "CollectiveId", currency, "totalAmount", description, "SubscriptionId", "createdAt", "updatedAt", "deletedAt", "PaymentMethodId", "processedAt", "privateMessage", "TierId", "FromCollectiveId", "publicMessage", quantity) FROM '$$PATH$$/4015.dat';

--
-- Data for Name: Paykeys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Paykeys" (id, "trackingId", paykey, status, payload, data, error, "createdAt", "updatedAt", "deletedAt", "TransactionId") FROM stdin;
\.
COPY "Paykeys" (id, "trackingId", paykey, status, payload, data, error, "createdAt", "updatedAt", "deletedAt", "TransactionId") FROM '$$PATH$$/4026.dat';

--
-- Name: Paykeys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Paykeys_id_seq"', 1, false);


--
-- Data for Name: PaymentMethods; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "PaymentMethods" (id, name, token, "customerId", service, data, "createdAt", "updatedAt", "confirmedAt", "deletedAt", "CreatedByUserId", "expiryDate", uuid, "CollectiveId", "archivedAt", "monthlyLimitPerMember", "primary", currency) FROM stdin;
\.
COPY "PaymentMethods" (id, name, token, "customerId", service, data, "createdAt", "updatedAt", "confirmedAt", "deletedAt", "CreatedByUserId", "expiryDate", uuid, "CollectiveId", "archivedAt", "monthlyLimitPerMember", "primary", currency) FROM '$$PATH$$/4011.dat';

--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "SequelizeMeta" (name) FROM stdin;
\.
COPY "SequelizeMeta" (name) FROM '$$PATH$$/4028.dat';

--
-- Data for Name: Sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Sessions" (sid, expires, data, "createdAt", "updatedAt") FROM stdin;
\.
COPY "Sessions" (sid, expires, data, "createdAt", "updatedAt") FROM '$$PATH$$/4029.dat';

--
-- Data for Name: Subscriptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Subscriptions" (id, amount, currency, "interval", "isActive", data, "stripeSubscriptionId", "activatedAt", "deactivatedAt", "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.
COPY "Subscriptions" (id, amount, currency, "interval", "isActive", data, "stripeSubscriptionId", "activatedAt", "deactivatedAt", "createdAt", "updatedAt", "deletedAt") FROM '$$PATH$$/4030.dat';

--
-- Name: Subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Subscriptions_id_seq"', 17102, true);


--
-- Name: Subscriptions_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Subscriptions_id_seq1"', 2214, true);


--
-- Data for Name: Tiers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Tiers" (id, name, description, amount, currency, "maxQuantity", password, "startsAt", "endsAt", "createdAt", "updatedAt", "deletedAt", slug, "maxQuantityPerUser", goal, type, "CollectiveId", "interval", button, presets) FROM stdin;
\.
COPY "Tiers" (id, name, description, amount, currency, "maxQuantity", password, "startsAt", "endsAt", "createdAt", "updatedAt", "deletedAt", slug, "maxQuantityPerUser", goal, type, "CollectiveId", "interval", button, presets) FROM '$$PATH$$/4033.dat';

--
-- Name: Tiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Tiers_id_seq"', 200, true);


--
-- Data for Name: Transactions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Transactions" (id, type, description, amount, currency, "createdAt", "updatedAt", "CollectiveId", "CreatedByUserId", "PaymentMethodId", "deletedAt", data, "OrderId", "platformFeeInHostCurrency", "hostFeeInHostCurrency", "paymentProcessorFeeInHostCurrency", "hostCurrency", "hostCurrencyFxRate", "amountInHostCurrency", "netAmountInCollectiveCurrency", "ExpenseId", uuid, "FromCollectiveId", "HostCollectiveId") FROM stdin;
\.
COPY "Transactions" (id, type, description, amount, currency, "createdAt", "updatedAt", "CollectiveId", "CreatedByUserId", "PaymentMethodId", "deletedAt", data, "OrderId", "platformFeeInHostCurrency", "hostFeeInHostCurrency", "paymentProcessorFeeInHostCurrency", "hostCurrency", "hostCurrencyFxRate", "amountInHostCurrency", "netAmountInCollectiveCurrency", "ExpenseId", uuid, "FromCollectiveId", "HostCollectiveId") FROM '$$PATH$$/4035.dat';

--
-- Name: Transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Transactions_id_seq"', 11071, true);


--
-- Name: UserGroups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"UserGroups_id_seq"', 4719, true);


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Users" (id, email, _salt, refresh_token, password_hash, "createdAt", "updatedAt", "seenAt", "deletedAt", "paypalEmail", "resetPasswordTokenHash", "resetPasswordSentAt", "firstName", "lastName", "billingAddress", "isHost", "CollectiveId") FROM stdin;
\.
COPY "Users" (id, email, _salt, refresh_token, password_hash, "createdAt", "updatedAt", "seenAt", "deletedAt", "paypalEmail", "resetPasswordTokenHash", "resetPasswordSentAt", "firstName", "lastName", "billingAddress", "isHost", "CollectiveId") FROM '$$PATH$$/4039.dat';

--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Users_id_seq"', 4973, true);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.
COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM '$$PATH$$/3759.dat';

--
-- Name: Activities Activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_pkey" PRIMARY KEY (id);


--
-- Name: PaymentMethods Cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_pkey" PRIMARY KEY (id);


--
-- Name: ConnectedAccounts ConnectedAccounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_pkey" PRIMARY KEY (id);


--
-- Name: Orders Donations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_pkey" PRIMARY KEY (id);


--
-- Name: ExpenseHistories ExpenseHistories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ExpenseHistories"
    ADD CONSTRAINT "ExpenseHistories_pkey" PRIMARY KEY (hid);


--
-- Name: Expenses Expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_pkey" PRIMARY KEY (id);


--
-- Name: CollectiveHistories GroupHistories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "GroupHistories_pkey" PRIMARY KEY (hid);


--
-- Name: Collectives Groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Groups_pkey" PRIMARY KEY (id);


--
-- Name: Paykeys Paykeys_paykey_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Paykeys"
    ADD CONSTRAINT "Paykeys_paykey_key" UNIQUE (paykey);


--
-- Name: Paykeys Paykeys_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Paykeys"
    ADD CONSTRAINT "Paykeys_pkey" PRIMARY KEY (id);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: Sessions Sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Sessions"
    ADD CONSTRAINT "Sessions_pkey" PRIMARY KEY (sid);


--
-- Name: Notifications Subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_pkey" PRIMARY KEY (id);


--
-- Name: Subscriptions Subscriptions_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Subscriptions"
    ADD CONSTRAINT "Subscriptions_pkey1" PRIMARY KEY (id);


--
-- Name: Tiers Tiers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_pkey" PRIMARY KEY (id);


--
-- Name: Transactions Transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY (id);


--
-- Name: Members UserGroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: Users email_unique_idx; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT email_unique_idx UNIQUE (email);


--
-- Name: CollectiveId-deletedAt; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "CollectiveId-deletedAt" ON "Tiers" USING btree ("CollectiveId", "deletedAt");


--
-- Name: DonationId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "DonationId" ON "Transactions" USING btree ("OrderId");


--
-- Name: MemberCollectiveId-CollectiveId-role; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "MemberCollectiveId-CollectiveId-role" ON "Members" USING btree ("MemberCollectiveId", "CollectiveId", role);


--
-- Name: ToCollectiveId-FromCollectiveId-type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ToCollectiveId-FromCollectiveId-type" ON "Transactions" USING btree ("CollectiveId", "FromCollectiveId", "deletedAt");


--
-- Name: Transactions_GroupId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Transactions_GroupId" ON "Transactions" USING btree ("CollectiveId", "deletedAt");


--
-- Name: UniqueSlugIndex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UniqueSlugIndex" ON "Collectives" USING btree (slug);


--
-- Name: subscriptions_type__group_id__user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX subscriptions_type__group_id__user_id ON "Notifications" USING btree (type, "CollectiveId", "UserId");


--
-- Name: transactions_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX transactions_uuid ON "Transactions" USING btree (uuid);


--
-- Name: Activities Activities_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Activities Activities_TransactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_TransactionId_fkey" FOREIGN KEY ("TransactionId") REFERENCES "Transactions"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Activities Activities_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: PaymentMethods Cards_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CollectiveHistories CollectiveHistories_CreatedByUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_CreatedByUserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CollectiveHistories CollectiveHistories_HostCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CollectiveHistories CollectiveHistories_ParentCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_ParentCollectiveId_fkey" FOREIGN KEY ("ParentCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Collectives Collectives_CreatedByUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_CreatedByUserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Collectives Collectives_HostCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Collectives Collectives_ParentCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_ParentCollectiveId_fkey" FOREIGN KEY ("ParentCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ConnectedAccounts ConnectedAccounts_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ConnectedAccounts ConnectedAccounts_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Donations_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Donations_PaymentMethodId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_PaymentMethodId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Donations_SubscriptionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_SubscriptionId_fkey" FOREIGN KEY ("SubscriptionId") REFERENCES "Subscriptions"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Donations_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Expenses Expenses_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Expenses Expenses_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Expenses Expenses_lastEditedById_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_lastEditedById_fkey" FOREIGN KEY ("lastEditedById") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Collectives Groups_lastEditedByUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Groups_lastEditedByUserId_fkey" FOREIGN KEY ("LastEditedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Members Members_MemberCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "Members_MemberCollectiveId_fkey" FOREIGN KEY ("MemberCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Members Members_TierId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "Members_TierId_fkey" FOREIGN KEY ("TierId") REFERENCES "Tiers"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Orders_FromCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Orders_FromCollectiveId_fkey" FOREIGN KEY ("FromCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Orders_TierId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Orders_TierId_fkey" FOREIGN KEY ("TierId") REFERENCES "Tiers"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Paykeys Paykeys_TransactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Paykeys"
    ADD CONSTRAINT "Paykeys_TransactionId_fkey" FOREIGN KEY ("TransactionId") REFERENCES "Transactions"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: PaymentMethods PaymentMethods_CollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "PaymentMethods_CollectiveId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Notifications Subscriptions_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Notifications Subscriptions_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Tiers Tiers_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_CardId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_CardId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_DonationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_DonationId_fkey" FOREIGN KEY ("OrderId") REFERENCES "Orders"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_ExpenseId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_ExpenseId_fkey" FOREIGN KEY ("ExpenseId") REFERENCES "Expenses"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_FromCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_FromCollectiveId_fkey" FOREIGN KEY ("FromCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_HostCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Members UserGroups_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id);


--
-- Name: Members UserGroups_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Users Users_CollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_CollectiveId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: geography_columns; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE geography_columns TO opencollective;


--
-- Name: geometry_columns; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE geometry_columns TO opencollective;


--
-- Name: raster_columns; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE raster_columns TO opencollective;


--
-- Name: raster_overviews; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE raster_overviews TO opencollective;


--
-- Name: spatial_ref_sys; Type: ACL; Schema: public; Owner: -
--

REVOKE SELECT ON TABLE spatial_ref_sys FROM PUBLIC;
REVOKE ALL ON TABLE spatial_ref_sys FROM xdamman;
GRANT SELECT ON TABLE spatial_ref_sys TO PUBLIC;
GRANT ALL ON TABLE spatial_ref_sys TO opencollective;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 