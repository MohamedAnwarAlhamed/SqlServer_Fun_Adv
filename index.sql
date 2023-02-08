create clustered index myindex
on coures(crs_naame)

create nonclustered index myindex
on coures(crs_naame)

select * from courses
where crs_name = 'java'

