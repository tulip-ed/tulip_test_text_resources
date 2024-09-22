
DROP TABLE IF EXISTS tenants CASCADE;
DROP TABLE IF EXISTS user_tenants CASCADE;

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users(
    user_id serial,
    username text UNIQUE,
    password text,
    role text,
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
    deleted boolean DEFAULT false,
    on_palette boolean DEFAULT true,
    PRIMARY KEY (tenant_id)
);
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