create or replace view "csv"."stg_mort2020__dbt_int" as (
        select * from 'D:\git\bilal-mortality-dbt\external\dev/stg_mort2020.csv'
    );