USE SCHEMA {crc_schema};

INSERT INTO QT_BREAKDOWN_PATH(NAME,VALUE,CREATE_DATE)
VALUES ('PATIENT_GPCSITE_COUNT_XML','\\\\ACT_DEMO\\ACT\\Demographics\\GPC Sites\\', CURRENT_TIMESTAMP)
;

insert into QT_QUERY_RESULT_TYPE(RESULT_TYPE_ID,NAME,DESCRIPTION,DISPLAY_TYPE_ID,VISUAL_ATTRIBUTE_TYPE_ID,CLASSNAME) 
values(21, 'PATIENT_GPCSITE_COUNT_XML','GPC Site breakdown','CATNUM','LA','edu.harvard.i2b2.crc.dao.setfinder.QueryResultGenerator')
;