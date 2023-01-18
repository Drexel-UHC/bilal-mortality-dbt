# 0. setup ----------------------------------------------------------------
{
  library(tidyverse)
  library(arrow)
  
}


# 1. Test Extract-load  -------------------------------------------------------------------------
{
  file = "\\\\files.drexel.edu\\colleges\\SOPH\\Shared\\UHC\\Projects\\Bilal_DP5\\dbt\\mortality\\source\\mort2020.parquet"
  db = open_dataset(file)
  ## source 
  
  
  ## stage
  df1 = db %>% 
    select(
      ## demographics
      age_5yr_group,
      male,
      hispanic,
      race,
      res_fips,
      res_cbsa,
      ## death info
      death_month,
      death_year,
      icd10_t1_red,
      icd10_t2_red,
      icd10_t3_red) %>% 
    collect()
  
  ## int
  df1
  
}



