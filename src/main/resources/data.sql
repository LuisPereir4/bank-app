DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS authority;

CREATE TABLE client (
	client_id       INT               AUTO_INCREMENT      PRIMARY KEY,
	name            VARCHAR(45)                           NOT NULL,
	email           VARCHAR(45)                           NOT NULL,
	password        VARCHAR(45)                           NOT NULL,
	role            VARCHAR(45)                           NOT NULL,
	enabled         INT                                   NOT NULL
);

CREATE TABLE authority (
    authority_id    INT              AUTO_INCREMENT       NOT NULL,
    username        VARCHAR(45)                           NOT NULL,
    authority       VARCHAR(45)                           NOT NULL
);

INSERT INTO client (name, email, password, role, enabled) VALUES
    ('Heisenberg',           'walter_white@email.com',      's2ch3mistry',          'admin',        1),
    ('Jesse Pinkman',        'jesse_pinkman@email.com',     '12meth12',             'guest',        1),
    ('Gustavo Fring',        'gus_fring@email.com',         'Los pollos321',        'admin',        1),
    ('SaulGoodman',          'call_saul@email.com',         'better-call-saul',     'admin',        1),
    ('HankSchrader',         'hank@dea.com',                'whrIsHeisenberg',      'admin',        1),
    ('TucoSalamanca',        'tucotuco@email.com',          'crystal$$$',           'guest',        0);

INSERT INTO authority (username, authority) VALUES
    ('Heisenberg',       'write'),
    ('JessePinkman',     'read'),
    ('GustavoFring',     'write'),
    ('SaulGoodman',      'write'),
    ('HankSchrader',     'read'),
    ('TucoSalamanca',    'read');
