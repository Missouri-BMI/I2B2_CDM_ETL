create or replace view  {target_schema}.OBSCLIN_FACT as
select
    ec.ENCOUNTER_NUM                                                                                as ENCOUNTER_NUM, 
    pc.PATIENT_NUM                                                                                  as PATIENT_NUM, 
    CASE 
        when obsclin_type = 'LC' then concat('LOINC:', obsclin_code)
        when obsclin_type = 'SM' then concat('SNOMED:', obsclin_code)
        else concat('OT:', obsclin_code)
    END                                                                                         as CONCEPT_CD,
    '@'                                                                                         as PROVIDER_ID, 
    -- TO_TIMESTAMP(obsclin_start_date   :: DATE || ' ' || obsclin_start_time, 'YYYY-MM-DD HH24:MI:SS')                                                                as START_DATE,  
    obsclin_start_date :: TIMESTAMP                                                             as START_DATE,  
    '@'                                                                                         as MODIFIER_CD,
    1                                                                                           as INSTANCE_NUM, 
    cast('N' as VARCHAR(50))                                                                    as VALTYPE_CD,
    CASE
        when obsclin_result_modifier = 'LT' then 'L'
        when obsclin_result_modifier = 'EQ' then 'E'
        when obsclin_result_modifier = 'GT' then 'G'
        else 'E'
    END                                                                                         as TVAL_CHAR, 
    cast(obsclin_RESULT_NUM as DECIMAL(18, 5))                                                  as NVAL_NUM, 
    ''                                                                                          as VALUEFLAG_CD,
    cast(null as  integer)                                                                      as QUANTITY_NUM, 
    cast(obsclin_RESULT_UNIT as VARCHAR(50))                                                    as UNITS_CD, 
    -- TO_TIMESTAMP(COALESCE(fact.obsclin_stop_date, fact.obsclin_start_date) :: DATE || ' ' || COALESCE(fact.obsclin_stop_time, '00:00:00'), 'YYYY-MM-DD HH24:MI:SS')                                                                     as END_DATE, 
    obsclin_stop_date :: TIMESTAMP                                                              as END_DATE, 
    '@'                                                                                         as LOCATION_CD, 
    cast(null as  text)                                                                         as OBSERVATION_BLOB, 
    cast(null as  integer)                                                                      as CONFIDENCE_NUM, 
    CURRENT_TIMESTAMP                                                                           as UPDATE_DATE,
    CURRENT_TIMESTAMP                                                                           as DOWNLOAD_DATE,
    CURRENT_TIMESTAMP                                                                           as IMPORT_DATE,
    cast(null as VARCHAR(50))                                                           as SOURCESYSTEM_CD,                                                                    
    cast(null as  integer)                                                                      as UPLOAD_ID
from {source_schema}.V_DEID_OBS_CLIN fact 
inner join  {target_schema}.patient_crosswalk as pc
using (patid)
inner join  {target_schema}.encounter_crosswalk as ec
using (ENCOUNTERID)  
where obsclin_result_modifier <> 'TX' and ENCOUNTERID is not null
UNION all
select
    ec.ENCOUNTER_NUM                                                                                as ENCOUNTER_NUM, 
    pc.PATIENT_NUM                                                                                  as PATIENT_NUM, 
    CASE 
        when obsclin_type = 'LC' then concat('LOINC:', obsclin_code)
        when obsclin_type = 'SM' then concat('SNOMED:', obsclin_code)
        else concat('OT:', obsclin_code)
    END                                                                                         as CONCEPT_CD,
    '@'                                                                                         as PROVIDER_ID, 
    -- TO_TIMESTAMP(obsclin_start_date   :: DATE || ' ' || obsclin_start_time, 'YYYY-MM-DD HH24:MI:SS')                                                                as START_DATE,  
    obsclin_start_date :: TIMESTAMP                                                             as START_DATE,  
    '@'                                                                                         as MODIFIER_CD,
    1                                                                                           as INSTANCE_NUM, 
    cast('T' as VARCHAR(50))                                                                    as VALTYPE_CD,
    cast(OBSCLIN_RESULT_QUAL as VARCHAR(255))                                                   as TVAL_CHAR, 
    cast(null as DECIMAL(18, 5))                                                                as NVAL_NUM, 
    ''                                                                                          as VALUEFLAG_CD,
    cast(null as  integer)                                                                      as QUANTITY_NUM, 
    cast(OBSCLIN_RESULT_UNIT as VARCHAR(50))                                                    as UNITS_CD, 
    -- TO_TIMESTAMP(COALESCE(fact.obsclin_stop_date, fact.obsclin_start_date) :: DATE || ' ' || COALESCE(fact.obsclin_stop_time, '00:00:00'), 'YYYY-MM-DD HH24:MI:SS')                                                                     as END_DATE, 
    obsclin_stop_date :: TIMESTAMP                                                              as END_DATE,
    '@'                                                                                         as LOCATION_CD, 
    cast(null as  text)                                                                         as OBSERVATION_BLOB, 
    cast(null as  integer)                                                                      as CONFIDENCE_NUM, 
    CURRENT_TIMESTAMP                                                                           as UPDATE_DATE,
    CURRENT_TIMESTAMP                                                                           as DOWNLOAD_DATE,
    CURRENT_TIMESTAMP                                                                           as IMPORT_DATE,
    cast(null as VARCHAR(50))                                                                  as SOURCESYSTEM_CD,                                                                    
    cast(null as  integer)                                                                      as UPLOAD_ID
from {source_schema}.V_DEID_OBS_CLIN fact 
inner join  {target_schema}.patient_crosswalk as pc
using (patid)
inner join  {target_schema}.encounter_crosswalk as ec
using (ENCOUNTERID)  
where obsclin_result_modifier = 'TX' and ENCOUNTERID is not null;