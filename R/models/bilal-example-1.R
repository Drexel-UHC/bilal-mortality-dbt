# 0. setup ----------------------------------------------------------------
{
  
  ## dependencies
  library(tidyverse)
  library(arrow)
  library(duckdb)
  library(DBI)
  

  ## open connection
  source_base = '\\\\files.drexel.edu\\colleges\\SOPH\\Shared\\UHC\\Projects\\Bilal_DP5\\dbt\\mortality\\source\\'
  con = DBI::dbConnect(duckdb::duckdb(), dbdir=":memory:")
  df_mort <- copy_to(con, read_csv("../../external/dev/stg_mort2020.csv"))
  df_income <- copy_to(con, read_parquet(paste0(source_base,"census_example_income.parquet")))
}


# 2.  Query ----------------------------------------------------------
{
  ## intermediate
  df_mort %>% 
    left_join(df_income, by = c("res_fips"="fips", 
                                "death_year"="year")) %>% 
    show_query()
}