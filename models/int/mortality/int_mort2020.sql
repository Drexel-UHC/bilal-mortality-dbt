{{ config(materialized='external', format =  target.schema) }}
with 

stg_income as (
  SELECT fips AS res_fips, medincome, "year" AS death_year
  FROM {{ source('Exposure', 'census_example_income') }}
),
final as (
  SELECT * FROM {{ref('stg_mort2020')}}
  LEFT JOIN stg_income
    ON (
      stg_mort2020.res_fips = stg_income.res_fips AND
      stg_mort2020.death_year = stg_income.death_year
    )
)

select * from final
