CREATE OR REPLACE VIEW DEID_COVID_FACT as 
SELECT * FROM DEID_DIAGNOSIS_FACT 
UNION ALL
SELECT * FROM DEID_PROCEDURE_FACT
UNION ALL
SELECT * FROM DEID_LAB_FACT
UNION ALL 
SELECT * FROM DEID_PRESCRIBING_FACT;