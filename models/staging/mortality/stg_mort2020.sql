{{ config(materialized='external', format =  target.schema) }}
SELECT
  age_5yr_group,
  male,
  hispanic,
  race,
  res_fips,
  res_cbsa,
  icd10_t1_red,
  icd10_t2_red,
  icd10_t3_red,
FROM {{ source('Mortality', 'mort2020') }}

{{ limit_data_in_dev() }}