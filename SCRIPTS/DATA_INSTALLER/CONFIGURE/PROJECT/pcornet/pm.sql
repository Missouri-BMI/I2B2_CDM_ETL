USE SCHEMA {project_pm};

INSERT INTO PM_PROJECT_DATA (PROJECT_ID, PROJECT_NAME, PROJECT_WIKI, PROJECT_PATH, STATUS_CD)
VALUES('ACT-PCORNET', 'PCORNet Deid datalake', 'http://www.i2b2.org', '/ACT-PCORNET', 'A');
--
UPDATE pm_hive_data SET DOMAIN_NAME = 'nextgenbmi.umsystem.edu' WHERE DOMAIN_NAME = 'i2b2demo';


--
DELETE FROM pm_project_user_roles where project_id = 'ACT-PCORNET';
--SERVICE ACCOUNT
INSERT INTO PM_PROJECT_USER_ROLES (PROJECT_ID, USER_ID, USER_ROLE_CD, STATUS_CD)
VALUES('ACT-PCORNET', 'AGG_SERVICE_ACCOUNT', 'USER', 'A');
INSERT INTO PM_PROJECT_USER_ROLES (PROJECT_ID, USER_ID, USER_ROLE_CD, STATUS_CD)
VALUES('ACT-PCORNET', 'AGG_SERVICE_ACCOUNT', 'MANAGER', 'A');
INSERT INTO PM_PROJECT_USER_ROLES (PROJECT_ID, USER_ID, USER_ROLE_CD, STATUS_CD)
VALUES('ACT-PCORNET', 'AGG_SERVICE_ACCOUNT', 'DATA_OBFSC', 'A');
INSERT INTO PM_PROJECT_USER_ROLES (PROJECT_ID, USER_ID, USER_ROLE_CD, STATUS_CD)
VALUES('ACT-PCORNET', 'AGG_SERVICE_ACCOUNT', 'DATA_AGG', 'A');

-- admin account
INSERT INTO PM_PROJECT_USER_ROLES (PROJECT_ID, USER_ID, USER_ROLE_CD, STATUS_CD)
VALUES('ACT-PCORNET', 'mhmcb@umsystem.edu', 'USER', 'A');

INSERT INTO PM_PROJECT_USER_ROLES (PROJECT_ID, USER_ID, USER_ROLE_CD, STATUS_CD)
VALUES('ACT-PCORNET', 'mhmcb@umsystem.edu', 'MANAGER', 'A');
INSERT INTO PM_PROJECT_USER_ROLES (PROJECT_ID, USER_ID, USER_ROLE_CD, STATUS_CD)
VALUES('ACT-PCORNET', 'mhmcb@umsystem.edu', 'EDITOR', 'A');

INSERT INTO PM_PROJECT_USER_ROLES (PROJECT_ID, USER_ID, USER_ROLE_CD, STATUS_CD)
VALUES('ACT-PCORNET', 'mhmcb@umsystem.edu', 'DATA_DEID', 'A');
INSERT INTO PM_PROJECT_USER_ROLES (PROJECT_ID, USER_ID, USER_ROLE_CD, STATUS_CD)
VALUES('ACT-PCORNET', 'mhmcb@umsystem.edu', 'DATA_OBFSC', 'A');
INSERT INTO PM_PROJECT_USER_ROLES (PROJECT_ID, USER_ID, USER_ROLE_CD, STATUS_CD)
VALUES('ACT-PCORNET', 'mhmcb@umsystem.edu', 'DATA_AGG', 'A');
INSERT INTO PM_PROJECT_USER_ROLES (PROJECT_ID, USER_ID, USER_ROLE_CD, STATUS_CD)
VALUES('ACT-PCORNET', 'mhmcb@umsystem.edu', 'DATA_LDS', 'A');
INSERT INTO PM_PROJECT_USER_ROLES (PROJECT_ID, USER_ID, USER_ROLE_CD, STATUS_CD)
VALUES('ACT-PCORNET', 'mhmcb@umsystem.edu', 'DATA_PROT', 'A');