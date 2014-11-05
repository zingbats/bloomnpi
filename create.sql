DROP TABLE IF EXISTS npi_files;

CREATE TABLE npi_files
(
  file character varying(255)
)

DROP TABLE IF EXISTS npi_licenses;

CREATE TABLE npi_licenses
(
  id uuid NOT NULL,
  npi_id uuid,
  healthcare_taxonomy_code character varying(10),
  license_number character varying(20),
  license_number_state character varying(9),
  taxonomy_switch character varying(12),
  CONSTRAINT npi_licenses_pkey PRIMARY KEY (id)
);

DROP TABLE IF EXISTS npi_locations;

CREATE TABLE npi_locations
(
  id uuid NOT NULL,
  address_line character varying(55),
  address_details_line character varying(55),
  city character varying(40),
  state character varying(40),
  zip character varying(20),
  country_code character varying(2),
  phone character varying(20),
  fax character varying(20),
  CONSTRAINT npi_locations_pkey PRIMARY KEY (id)
);

DROP TABLE IF EXISTS npi_organization_officials;

CREATE TABLE npi_organization_officials
(
  id uuid NOT NULL,
  last_name character varying(35),
  first_name character varying(20),
  middle_name character varying(20),
  title character varying(35),
  telephone_number character varying(20),
  name_prefix character varying(5),
  name_suffix character varying(5),
  credential character varying(20),
  CONSTRAINT npi_organization_officials_pkey PRIMARY KEY (id)
);

DROP TABLE IF EXISTS npi_other_identifiers;

CREATE TABLE npi_other_identifiers
(
  id uuid NOT NULL,
  npi_id uuid,
  identifier character varying(20),
  type character varying(28),
  state character varying(2),
  issuer character varying(80),
  CONSTRAINT npi_other_identifiers_pkey PRIMARY KEY (id)
);

DROP TABLE IF EXISTS npi_parent_orgs;

CREATE TABLE npi_parent_orgs
(
  id uuid NOT NULL,
  business_name character varying(70),
  tax_identification_number character varying(9),
  CONSTRAINT npi_parent_orgs_pkey PRIMARY KEY (id)
);

DROP TABLE IF EXISTS npi_taxonomy_groups;

CREATE TABLE npi_taxonomy_groups
(
  id uuid NOT NULL,
  npi_id uuid,
  taxonomy character varying(70),
  CONSTRAINT npi_taxonomy_groups_pkey PRIMARY KEY (id)
);

DROP TABLE IF EXISTS npis;

CREATE TABLE npis
(
  id uuid NOT NULL,
  npi bigint NOT NULL,
  created_at timestamp without time zone,
  type character varying(12),
  replacement_npi bigint,
  employer_identification_number character varying(9),
  business_name character varying(70),
  last_name character varying(35),
  first_name character varying(20),
  middle_name character varying(20),
  name_prefix character varying(5),
  name_suffix character varying(5),
  credential character varying(20),
  other_name character varying(70),
  other_name_type character varying(23),
  other_last_name character varying(35),
  other_first_name character varying(20),
  other_middle_name character varying(20),
  other_name_prefix character varying(5),
  other_name_suffix character varying(5),
  other_credential character varying(20),
  other_last_name_type character varying(26),
  enumeration_date date,
  last_update_date date,
  deactivation_reason character varying(11),
  deactivation_date date,
  reactivation_date date,
  gender character varying(6),
  sole_proprietor character varying(11),
  organization_subpart character varying(11),
  parent_orgs_id uuid,
  organization_official_id uuid,
  business_location_id uuid,
  practice_location_id uuid,
  CONSTRAINT npis_pkey PRIMARY KEY (id)
);