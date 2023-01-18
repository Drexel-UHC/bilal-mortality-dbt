{% docs census_example_income_description %}

This is just the tidy census data of the variable `B19013_001`. you can see the tidy census code below.

```r
  df_income = 2016:2020 %>% 
    map_df(~ get_acs(geography = "county", 
                  variables = c(medincome = "B19013_001"), 
                  year = c(2020)) %>% 
          select(fips = GEOID, 
                 medincome = estimate) %>% 
          mutate(year = .x))
```
 
 
{% enddocs %}