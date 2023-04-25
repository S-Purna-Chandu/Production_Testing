
with data as (

    select 1 as ID, 'kiran' as NAME, 1*5 as AGE union all
    select 2 as ID, 'ravi' as NAME, 2*5 as AGE union all
    select 3 as ID, 'suman' as NAME, 3*5 as AGE union all
    select 4 as ID, 'shankar' as NAME, 4*5 as AGE union all
    select 5 as ID, 'mithun' as NAME, 5*5 as AGE

)

select * from data where name = '{{ var("my_name") }}'

