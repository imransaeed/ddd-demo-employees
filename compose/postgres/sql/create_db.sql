DROP TABLE IF EXISTS "Address";
CREATE TABLE "public"."Address" (
    "EmployeeId" integer NOT NULL,
    "AddressLines" character varying(200) NOT NULL,
    "AddressTypeId" integer NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "AddressType";
DROP SEQUENCE IF EXISTS "AddressType_Id_seq";
CREATE SEQUENCE "AddressType_Id_seq" START 1 INCREMENT 1;

CREATE TABLE "public"."AddressType" (
    "Id" integer DEFAULT nextval('"AddressType_Id_seq"') NOT NULL,
    "Name" character varying(25) NOT NULL,
    "Description" character varying(200),
    CONSTRAINT "AddressType_pkey" PRIMARY KEY ("Id")
) WITH (oids = false);


DROP TABLE IF EXISTS "Employee";
DROP SEQUENCE IF EXISTS "Employee_Id_seq";
CREATE SEQUENCE "Employee_Id_seq" START 1 INCREMENT 1;

CREATE TABLE "public"."Employee" (
    "Id" integer DEFAULT nextval('"Employee_Id_seq"') NOT NULL,
    "Name" integer NOT NULL,
    "Active" boolean NOT NULL,
    CONSTRAINT "Employee_pkey" PRIMARY KEY ("Id")
) WITH (oids = false);


ALTER TABLE ONLY "public"."Address" ADD CONSTRAINT "Address_AddressTypeId_fkey" FOREIGN KEY ("AddressTypeId") REFERENCES "AddressType"("Id") NOT DEFERRABLE;
ALTER TABLE ONLY "public"."Address" ADD CONSTRAINT "Address_EmployeeId_fkey" FOREIGN KEY ("EmployeeId") REFERENCES "Employee"("Id") NOT DEFERRABLE;