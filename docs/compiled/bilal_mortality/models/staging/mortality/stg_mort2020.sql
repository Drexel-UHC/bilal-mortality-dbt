
SELECT
  age_5yr_group,
  male,
  hispanic,
  race,
  res_fips,
  res_cbsa,
  death_month,
  death_year,
  icd10_t1_red,
  icd10_t2_red,
  icd10_t3_red,
FROM '\\files.drexel.edu\colleges\SOPH\Shared\UHC\Projects\Bilal_DP5\dbt\mortality\source\mort2020.parquet'


  
  order by RANDOM()
  limit 25
  
