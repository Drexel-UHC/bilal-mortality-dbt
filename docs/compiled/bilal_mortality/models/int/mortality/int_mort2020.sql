
with 

stg_income as (
  SELECT fips AS res_fips, medincome, "year" AS death_year
  FROM '\\files.drexel.edu\colleges\SOPH\Shared\UHC\Projects\Bilal_DP5\dbt\mortality\source\census_example_income.parquet'
),
final as (
  SELECT * FROM "main"."csv"."stg_mort2020"
  LEFT JOIN stg_income
    ON (
      stg_mort2020.res_fips = stg_income.res_fips AND
      stg_mort2020.death_year = stg_income.death_year
    )
)

select * from final