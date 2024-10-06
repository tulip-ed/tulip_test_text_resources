
DROP TABLE IF EXISTS tenants CASCADE;
DROP TABLE IF EXISTS user_tenants CASCADE;

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users(
    user_id serial,
    username text UNIQUE,
    password text,
    role text,
    start_with_last_tenant boolean DEFAULT true,
    last_tenant int,
    secondname text,
    lastname text,
    email text,
    PRIMARY KEY (user_id,username)
);
INSERT into users (username,password,role,last_tenant)
 values('teacher', 'pass','te',1),('teacher2', 'pass2','te',2),
 ('student', 'pass','st',1),('system', 'pass','sy',1);

DROP TABLE IF EXISTS tenants CASCADE;
CREATE TABLE tenants(
    tenant_id serial,
    description text UNIQUE,
    code text UNIQUE,
    locale_id int DEFAULT 0,   
    brand_id int DEFAULT 0,
    teacher_theme_id int Default 0,
    student_theme_id int Default 0,
    deleted boolean DEFAULT false,
    on_palette boolean DEFAULT true,
    PRIMARY KEY (tenant_id)
);
INSERT into tenants (code,description) values
('tt1', 'test tenant1'),
('tt2', 'test tenant2');




INSERT into tenants (code,description) values
('tt1', 'test tenant1'),
('tt2', 'test tenant2');

DROP TABLE IF EXISTS user_tenants CASCADE;
CREATE TABLE user_tenants(
    tenant_id integer,
    user_id integer,
    PRIMARY KEY (user_id,tenant_id)
);
INSERT into user_tenants (tenant_id,user_id) values
(1, 1),
(2, 1),
(2, 2);

DROP TABLE IF EXISTS liveries CASCADE;
CREATE TABLE liveries(
    brand_id int,
    theme_id int,
    css_sheet_id int,
    css_sheet_filename text,
    PRIMARY KEY (brand_id,theme_id,css_sheet_id)
);
INSERT into liveries (brand_id,theme_id,css_sheet_id) values
(0, 0,1),(0, 0,2),(0, 0,3);

DROP TABLE IF EXISTS livery_properties CASCADE;
CREATE TABLE livery_properties(
    livery_property_id int,
    brand_id int,
    theme_id int, 
    value text,
    PRIMARY KEY (livery_property_id,brand_id,theme_id)
);



DROP TABLE IF EXISTS css_declarations CASCADE;
CREATE TABLE css_declarations (
    css_sheet_id int,
    enum_set_id int,
    enum_id int,
    pseudo_class_id int,
    css_property_id int,
    value text,
    livery_property_id int DEFAULT 0
);
INSERT into css_declarations (css_sheet_id, enum_set_id,enum_id,pseudo_class_id,css_property_id,value,livery_property_id) values
(3, 1,1,0,354,'-',10000),
(3, 1,1,0,51,'-',2);


DROP TABLE IF EXISTS css_html_class_ids CASCADE;
CREATE TABLE css_html_class_ids (
    css_sheet_id int,
    enum_set_id int,
    enum_id int,
    html_class_id_string text,
	PRIMARY KEY (css_sheet_id,enum_set_id,enum_id)
);

DROP TABLE IF EXISTS locale_text CASCADE;
CREATE TABLE locale_text (
    locale_id int,
    enum_set_id int,
    enum_id int,
    value text,
    status smallint DEFAULT 0,
    PRIMARY KEY (locale_id,enum_set_id,enum_id)
);
