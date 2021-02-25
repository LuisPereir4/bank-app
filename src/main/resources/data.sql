DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS authorities;

CREATE TABLE users (
	user_id     INT          AUTO_INCREMENT     PRIMARY KEY,
	username    VARCHAR(45)                     NOT NULL,
	password    VARCHAR(45)                     NOT NULL,
	enabled     INT                             NOT NULL
);

CREATE TABLE authorities (
    authority_id    INT           AUTO_INCREMENT    NOT NULL,
    username        VARCHAR(45)                     NOT NULL,
    authority       VARCHAR(45)                     NOT NULL
);

INSERT INTO users (username, password, enabled) VALUES
    ('Heisenberg',     's2ch3mistry',          1),
    ('JessePinkman',   '12meth12',             1),
    ('GustavoFring',   'Los pollos321',        1),
    ('SaulGoodman',    'better-call-saul',     1),
    ('HankSchrader',   'whrIsHeisenberg',      1),
    ('TucoSalamanca',  'crystal$$$',           0);

INSERT INTO authorities (username, authority) VALUES
    ('Heisenberg',       'write'),
    ('JessePinkman',     'read'),
    ('GustavoFring',     'write'),
    ('SaulGoodman',      'write'),
    ('HankSchrader',     'read'),
    ('TucoSalamanca',    'read');
