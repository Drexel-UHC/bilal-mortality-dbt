# 0. setup ----------------------------------------------------------------
{
  library(tidyverse)
  library(arrow)
  library(tidycensus)
  
  source_base = '\\\\files.drexel.edu\\colleges\\SOPH\\Shared\\UHC\\Projects\\Bilal_DP5\\dbt\\mortality\\source\\'
}


# 1. Extract-load Mortality  -------------------------------------------------------------------------
{
  load("raw-data/mort2020.rdata")
  mort_dta %>% 
    write_parquet(sink = paste0(source_base,"mort2020.parquet"))
}


# 2. Extract-load ACS ------------------------
{


  df_income = 2016:2020 %>% 
    map_df(~ get_acs(geography = "county", 
                  variables = c(medincome = "B19013_001"), 
                  year = c(2020)) %>% 
          select(fips = GEOID, 
                 medincome = estimate) %>% 
          mutate(year = .x))
    
   
  ## census_example_income.parquet
  df_income %>% 
    write_parquet(sink = paste0(source_base,"census_example_income.parquet"))
  
}

