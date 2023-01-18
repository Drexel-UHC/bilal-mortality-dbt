# 0. setup ----------------------------------------------------------------
{
  library(tidyverse)
  library(arrow)
}


# 1. Test Extract-load  -------------------------------------------------------------------------
{
  load("raw-data/mort2020.rdata")
  mort_dta %>% write_parquet(sink = "raw-data/mort2020.parquet")
}



