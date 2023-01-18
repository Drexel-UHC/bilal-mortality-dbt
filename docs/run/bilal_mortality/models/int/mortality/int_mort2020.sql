create or replace view "csv"."int_mort2020__dbt_int" as (
        select * from 'D:\git\bilal-mortality-dbt\external\dev/int_mort2020.csv'
    );