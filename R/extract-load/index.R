# 0. setup ----------------------------------------------------------------
{
  library(tidyverse)
  library(arrow)
}


# 1. Test Extract-load  -------------------------------------------------------------------------
{
  load("raw-data/mort2020.rdata")
  mort_dta %>% 
    write_parquet(sink = "\\\\files.drexel.edu\\colleges\\SOPH\\Shared\\UHC\\Projects\\Bilal_DP5\\dbt\\mortality\\source\\mort2020.parquet")
}



