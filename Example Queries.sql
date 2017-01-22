\-- Written by: Gina Hall
-- default column statements here for pretty output

column NAME format a20;
column SUBURB format a10;
column TYPE format a12;


-- List all the buyers who are included in the deal tables. (7 marks).
-- -------------------------------------------------------
-- #1 ----------------------------------------------------
-- -------------------------------------------------------
create or replace view q1(PERSON#, NAME) as
select peid, (firstname||' '||lastname) from person where peid in 
(select peid from deal)
;




-- List all of the properties that have been listed both for 
-- sale and for rent (7 pt)
-- -------------------------------------------------------
-- #2 ----------------------------------------------------
-- -------------------------------------------------------
create or replace view q2 (PNO, SUBURB, TYPE) as
select pno, suburb, type from property where pno in (select property_for_private_sale.pno from (property_for_private_sale join property_for_rent on property_for_private_sale.pno = property_for_rent.pno) union select property_for_auction.pno from (property_for_auction join property_for_rent on property_for_auction.pno = property_for_rent.pno));
;





-- List owners who have commercial properties in Randwick (7 pt) 
-- -------------------------------------------------------
-- #3 ----------------------------------------------------
-- -------------------------------------------------------
create or replace view q3 (PERSON#, NAME) as
select peid, (firstname||' '||lastname) from person where peid in 
(select peid from property where lower(suburb) = 'randwick' and type = 'Commercial');
;





-- Count the number of persons in this database who 
-- 	haven't rented or bought a property yet (7 pts)
-- 		§ If a person is renting a property, their details should 
-- 			appear in the contract table
-- 		§ If a person bought a property, their details will be in 
--			the deal table
--		§ If a buyer already owned a property, their details will be 
--			recorded in the property table
--		§ We are only interested in the buyer and renter categories
-- -------------------------------------------------------
-- #4 ----------------------------------------------------
-- -------------------------------------------------------
create or replace view q4 (NUMBER#) as
select count(*) from (select peid from person where peid not in (select peid 
	from contract union select peid from deal union select peid from property));
;



   
-- For each suburb: count number of properties which have been sold and 
--	whose total average price is less than $500,000. (7 pts)
-- -------------------------------------------------------
-- #5 ----------------------------------------------------
-- -------------------------------------------------------
create or replace view q5 (NUMBER#, SUBURB) as
select count(*), lower(property.suburb) from 
(property join deal on property.pno = deal.pno) group by property.suburb 
having avg(deal.price) < 500000 order by lower(property.suburb);
;




-- For each suburb: list maximum price of properties sold by a company 
--	branch in the suburb (7 pts)
-- -------------------------------------------------------
-- #6 ----------------------------------------------------
-- -------------------------------------------------------
create or replace view q6 (NUMBER#, PRICE) as
select suburb, max(price) from (deal join property on property.pno = deal.pno) 
where suburb in (select suburb from branch) group by suburb;
;





-- For each suburb: count number of properties for rent (7 pts) 
-- -------------------------------------------------------
-- #7 ----------------------------------------------------
-- -------------------------------------------------------
create or replace view q7 (NUMBER#, SUBURB) as
select suburb, count(*) from (property join property_for_rent 
on property_for_rent.pno = property.pno) group by suburb;
;




-- List properties that have been advertised in at least 2 different
--	newspapers (7 pts)
-- -------------------------------------------------------
-- #8 ----------------------------------------------------
-- -------------------------------------------------------
create or replace view q8 (PNO#, SUBURB, TYPE) as
select pno, suburb, type from property where pno in 
(select property.pno from 
	(property join advertisement on property.pno = advertisement.pno) 
	group by property.pno having 
	(count(distinct advertisement.newspaper) > 1)
);
;





--  (9 pts)
-- For a particular buyer peid = 57, in the database, list all the 
-- private properties for sale that meet his requirements (features and price). 
--    Note: 
--       You need to think about division for getting all the properties 
--          that statisfy the buyer requirement. 
--       You also need to figure out how to obtain the features 
--          required by that particular buyer
-- -------------------------------------------------------
-- #9 ----------------------------------------------------
-- -------------------------------------------------------
create or replace view q9 (PNO#, SUBURB, TYPE) as
select property.pno, property.suburb, property.type from property where pno in (select pno from property_for_private_sale where asking_price <= (select max_price from buyer where buyer.peid = 57) intersect select pno from featured where fid in (select fid from required where peid = 57) group by pno having count(fid) >= (select count(fid) from features where fid in (select fid from required where peid = 57)));
;



-- =======================================================================================
-- =======================================================================================
-- =======================================================================================

select buyer.peid, property.suburb,property.type, property.pno, features.fid from buyer join required on buyer.peid = required.peid join features on features.fid = required.fid join featured on featured.fid = features.fid join property on property.pno =  featured.pno join property_for_private_sale on property.pno = property_for_private_sale.pno where buyer.peid = 57;

properties that have desired features:
select pno from featured where fid in (select fid from required where peid = 57)

properties that are <= desired price:
select pno from property_for_private_sale where asking_price <= (select max_price from buyer where peid = 57)

property_for_private_sale and featured combined:
select * from (featured join property_for_private_sale on featured.pno = property_for_private_sale.pno)

pno, fid, and price of combined table that match desired price:
select * from (featured join property_for_private_sale on featured.pno = property_for_private_sale.pno) where fid in (select fid from required where peid = 57)



pno, fid, price of combined tables with desired prices and desired features:
select * from (
	featured join property_for_private_sale on featured.pno = property_for_private_sale.pno
) 
where fid in (
	select fid from required where peid = 57
) 
and asking_price <= (select max_price from buyer where peid = 57)

-- =======================================================================================
-- =======================================================================================
-- =======================================================================================

select pno, suburb, type from property where pno in (select pno from property_for_private_sale where asking_price <= (select max_price from buyer where buyer.peid = 57) intersect select pno from featured where fid in (select fid from features where fid in (select fid from required where peid = 57)) group by pno having count(fid) >= (select count(fid) from features where fid in (select fid from required where peid = 57)));

select pno, suburb, type from property where pno in (
	select pno from property_for_private_sale where asking_price <= (select max_price from buyer where buyer.peid = 57) 
	intersect 
	select pno from featured where fid in (select fid from required where peid = 57)
) 
group by pno having count(fid) >= 
	(select count(fid) from features where fid in 
		(select fid from required where peid = 57)
	)
);


select pno, suburb, type from property where pno in 
	(
		select pno from property_for_private_sale where asking_price <= 
			(select max_price from buyer where buyer.peid = 57) 
			intersect 
			select pno from featured where fid in 
				(select fid from features where fid in 
					(select fid from required where peid = 57)
				) 
				group by pno having count(fid) >= 
					(select count(fid) from features where fid in 
						(select fid from required where peid = 57)
					)
	)



select pno, suburb, type from property where pno in (select pno from property_for_private_sale where asking_price <= (select max_price from buyer where buyer.peid = 57) intersect select pno from featured where fid in (select fid from required where peid = 57) group by pno having count(fid) >= (select count(fid) from features where fid in (select fid from required where peid = 57)))

	select pno from featured where fid in (select fid from required where peid = 57)
-- =======================================================================================
-- =======================================================================================
-- =======================================================================================


---Create an audit_log table to record changes in the reserve_price of 
-- the property for auction (20 pts)
--		§ Write a trigger that will log the old price and the new price 
--	       in the log table whenever there is a change in the reserve_price
--		§ Create SQL DML statement to decrease the reserve_price by
--		10% for all the properties for auction that are still on the
--		market. 
--		-- create the trigger such that whenever there is an update
--		-- to reserve price,
--		---log that information
--			create or replace trigger update_AuctionProperty
--		--- insert your trigger solution
--		/
--		-- insert SQL DML statement to decrease the reserve price

--			select * from audit_log; 

--			drop table audit_log;

-- -------------------------------------------------------
-- #10 ---------------------------------------------------
-- -------------------------------------------------------
create or replace view q10 (PNO, USER_NAM, DATE_CHAN, OLD_PRICE, NEW_PRICE) as
create table audit_log (PNO number(38), user_name varchar2(8), date_changed date, old_price float(63), new_price float(63));
create or replace trigger update_AuctionProperty
after update of reserve_price on property_for_auction
for each row
	begin
		insert into audit_log values (:old.PNO, user, sysdate, :old.reserve_price, :new.reserve_price);
	end;

/

Update property_for_auction set reserve_price = (reserve_price * .9) where pno not in (select pno from deal);

select * from audit_log;
drop table audit_log;

;



-- Oracle PL/SQL Queries (15 pt)
--
-- • Use a PL/SQL procedure to code your solution for this question
-- • For a given price X and two features ID FID1 and FID2 from a 
-- 	potential buyer, write a PL/SQL procedure that can output all 
-- 	suburbs that the user is likely to get a property at this price 
-- 	and having these features
-- 
-- o Mores pecifically, the procedure takes X and FID1, FID2 as input 
-- 	and outputs:
-- 		§ All the suburbs where at least one property has been sold 
-- 			with the price not greater than X and features include 
-- 			FID1,FID2
-- 		§ The list of properties in each of these suburbs that met 
-- 			the buyer criteria
-- 
-- • Features of the sold properties in this suburb with a price not 
-- 	greater than X and features include FID1,FID2
-- 
-- • The procedure should take three parameters (the price X , the two 
-- 	features id FID1 and FID2 )
-- 
-- • If there are no suitable suburbs, the procedure simply prints 
-- 	nothing
-- -------------------------------------------------------
-- #12 ---------------------------------------------------
-- -------------------------------------------------------
create or replace view q12 (PNO#, SUBURB, TYPE) as

;

creating a cursor that contains the result of a query involving the criteria specified by the parameters passed
and then using a for loop to iterate and print results from that cursor


IF statement THEN

< statements>
 
end if;



procedure name(variables) IS

declarations

BEGIN

content

END;



create or replace procedure blah(variable1, variable2) IS

declarations

BEGIN

content

END;




To set a dollar amount: to_char(<insert variable name here>, '$9,999,999.99')

That will format all dollar amounts in the table you use it in to display with a dollar sign, 2 decimal places, and 7 before the decimal point





