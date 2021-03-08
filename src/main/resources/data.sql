DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS authority;

CREATE TABLE client (
	client_id       INT              AUTO_INCREMENT      PRIMARY KEY,
	name            VARCHAR(45)                          NOT NULL,
	email           VARCHAR(45)                          NOT NULL,
	password        VARCHAR(200)                         NOT NULL,
	role            VARCHAR(45)                          NOT NULL,
	enabled         INT                                  NOT NULL
);

CREATE TABLE authority (
    authority_id    INT              AUTO_INCREMENT       NOT NULL,
    email           VARCHAR(45)                           NOT NULL,
    authority       VARCHAR(45)                           NOT NULL
);

-- Saving client with password encrypted by a external tool
INSERT INTO client (name, email, password, role, enabled) VALUES
    ('Heisenberg',           'walter_white@email.com',      '$2y$12$L4y9FNvD9BiodnhapnqZfeNzAhjUl36nkE/YZ9izsfyoXY0gACyLa',      'admin',        1),
    ('Jesse Pinkman',        'jesse_pinkman@email.com',     '$2y$12$f9z3KHiQ3XOUtRcCtpbum.XUEpOOmTaforrmulzNlAdsbaDNVl0mS',      'guest',        1),
    ('Gustavo Fring',        'gus_fring@email.com',         '$2y$12$XprjFtvpFJU1i9sndWHRaex2L1eStDY6/WfNIseQRSzI7WRb.7NaS',      'admin',        1),
    ('SaulGoodman',          'call_saul@email.com',         '$2y$12$lmXEb48iL13JEn30SahKzeuqr93OK8BgN6M8NaKNVg9pMdflQtsxC',      'admin',        1),
    ('HankSchrader',         'hank@dea.com',                '$2y$12$tBaMwFUSr9QoY7hcRGgIte5DlGa39Uhhwtm2eZ3lEoxiGjEshiSC6',      'admin',        1),
    ('TucoSalamanca',        'salamancatuco@email.com',     '$2y$12$LdJNq.wMAjVSM3/845GlKeKhe95e0DP2nUIUq3jM/doGhkVNRgfBe',      'guest',        0);

-- Old client values (password not encrypted)
-- INSERT INTO client (name, email, password, role, enabled) VALUES
--     ('Heisenberg',           'walter_white@email.com',      's2ch3mistry',          'admin',        1),
--     ('Jesse Pinkman',        'jesse_pinkman@email.com',     '12meth12',             'guest',        1),
--     ('Gustavo Fring',        'gus_fring@email.com',         'Los pollos321',        'admin',        1),
--     ('SaulGoodman',          'call_saul@email.com',         'better-call-saul',     'admin',        1),
--     ('HankSchrader',         'hank@dea.com',                'whrIsHeisenberg',      'admin',        1),
--     ('TucoSalamanca',        'salamancatuco@email.com',     'crystal$$$',           'guest',        0);

INSERT INTO authority (email, authority) VALUES
    ('walter_white@email.com',          'write'),
    ('jesse_pinkman@email.com',         'read'),
    ('gus_fring@email.com',             'write'),
    ('call_saul@email.com',             'write'),
    ('hank@dea.com',                    'read'),
    ('salamancatuco@email.com',         'read');
