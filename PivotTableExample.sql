
 
 -- table to store user telephone number
 declare @t table (
	personId int,
	phoneType varchar(50), 
	phoneNumber varchar(15)
)

-- populating data to table
insert into @t (personId, phoneType, phoneNumber)
	select 1, 'Home', '555 321 1234'
	Union
	select 1, 'Mobile', '555 421 1234'
		Union
	select 2, 'Home', '555 555 1234'
		Union
	select 2, 'Office', '666 321 1234'
		Union
	select 3, 'Home', '555 666 7777'
		Union
	select 4, 'Home', '555 321 1234'


-- select * from @t


 
select PersonId,
	isnull([Home], '') as					[Home],				
	isnull([mobile] , '')AS		[mobile],
	isnull([Office], '') as				[Office]

from
 (
     -- getting the data from table.
    select personId, phoneType, phoneNumber from @t t	 
)t

PIVOT
(
	min(phoneNumber)
	FOR phoneType in ([Home], [mobile],[Office])
) as p

 


