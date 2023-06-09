with final as (
select
 raw_employee.value:_name:VARCHAR(60) as name,
 raw_employee.value:_id:NUMBER as id
 from {{ source('json','raw_employee') }},
 LATERAL FLATTEN(INPUT => raw_employee) rawemployee_flattened,
 LATERAL FLATTEN(INPUT => rawemployee_flattened.value:raw_employee)
 )
 select * from final
