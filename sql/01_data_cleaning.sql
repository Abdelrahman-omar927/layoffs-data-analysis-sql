-- data cleaning
-- 1. remove duplicates
-- 2. standarize the date 
-- 3. null vaules or blank vlaues 
-- 4. remove any columns

select * from layoffs;
-- 1. remove duplicates
-- << delete duplicates >>
-- 	# create layoffs_staging table like layoffs
create table layoffs_staging
like layoffs;
select * 
from layoffs_staging;
-- 	# insert into layoffs_staging
insert layoffs_staging
select * 
from layoffs;


select * 
from layoffs_staging;
-- 	# create a row_num at layoffs_staging to identify 
select * ,
row_number() over( partition by 
company ,
location ,
industry , 
total_laid_off , 
percentage_laid_off , 
'date' , 
stage , 
country , 
funds_raised_millions) as row_num
from layoffs_staging ;
-- 	# insert the row_num selection at cte wherer row_num > 1
with cte_row_num as
(
select * ,
row_number() over( partition by 
company ,
location ,
industry , 
total_laid_off , 
percentage_laid_off , 
'data' , 
stage , 
country , 
funds_raised_millions) as row_num
from layoffs_staging 
)
select * 
from cte_row_num
where row_num > 1;


-- 	# create layoffs_staging2 (copy to clipboard , create a statements) and add a row_num columns 
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * 
from layoffs_staging2;

-- 	# insert the data from the cte statements into layoffs_staging2
insert layoffs_staging2
select * ,
row_number() over( partition by 
company ,
location ,
industry , 
total_laid_off , 
percentage_laid_off , 
'data' , 
stage , 
country , 
funds_raised_millions) as row_num
from layoffs_staging ;

select * 
from layoffs_staging2
where row_num > 1;



-- 	# delete rows where row_num > 1 

delete 
from layoffs_staging2
where row_num > 1;

select * 
from layoffs_staging2
where row_num>1;


-- 2. <<---------standarize the date--------->>
-- Trim the data 
select company,trim(company)
from layoffs_staging2 ;

update layoffs_staging2
set company = trim(company);

select  distinct industry
from layoffs_staging2
order by 1;

select *
from layoffs_staging2
where industry like 'Crypto%';

update layoffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%';

select * 
from layoffs_staging2
where industry like 'Crypto%';

select distinct industry 
from layoffs_staging2;

select * 
from layoffs_staging2
where country like 'United States.'
order by 1;

select distinct country
from layoffs_staging2
order by 1;

update layoffs_staging2
set country = 'United States'
where country like 'United States%';

select `date` , str_to_date(`date` ,'%m/%d/%Y')
from layoffs_staging2;

update layoffs_staging2
set `date` = str_to_date(`date` ,'%m/%d/%Y');

select *
from layoffs_staging2;

alter table layoffs_staging2
modify column `date` date ;

select * 
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null ;

select * 
from layoffs_staging2
where industry is null 
or industry ='';

select * 
from layoffs_staging2 
where company = 'Airbnb';

update layoffs_staging2 
set industry = null
where industry = '';

select t1.industry , t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
    and t1.location = t2.location
where (t1 .industry is null or t1.industry = '')
and t2.industry is not null ;

update layoffs_staging2 t1
join layoffs_staging2 t2 
	on t1.company = t2.company 
set t1.industry = t2.industry
where t1.industry is null 
and t2.industry is not null;


select industry
from layoffs_staging2;

select * 
from layoffs_staging2 
where industry is null
or industry = '';

select * 
from layoffs_staging2 
where total_laid_off is null and percentage_laid_off is null ; 

delete 
from layoffs_staging2 
where total_laid_off is null and percentage_laid_off is null ; 

select * 
from layoffs_staging2;

alter table layoffs_staging2
drop column row_num;


create table layoffs_stg
like layoffs_staging2;

insert layoffs_stg
select * 
from layoffs_staging2;

select * 
from layoffs_stg;

select * ,
row_number() over( partition by 
company ,
location ,
industry , 
total_laid_off , 
percentage_laid_off , 
`date` , 
stage , 
country , 
funds_raised_millions) as row_num
from layoffs_stg ;

with cte_stg as
(
select * ,
row_number() over( partition by 
company ,
location ,
industry , 
total_laid_off , 
percentage_laid_off , 
`date` , 
stage , 
country , 
funds_raised_millions) as row_num
from layoffs_stg 
)
select * 
from cte_stg
where row_num > 1;


-- 	# create layoffs_stg2 (copy to clipboard , create a statements) and add a row_num columns 
CREATE TABLE `layoffs_stg2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * 
from layoffs_stg2;


-- 	# insert the data from the cte statements into layoffs_staging2
insert layoffs_stg2
select * ,
row_number() over( partition by 
company ,
location ,
industry , 
total_laid_off , 
percentage_laid_off , 
`date` , 
stage , 
country , 
funds_raised_millions) as row_num
from layoffs_stg ;

select * 
from layoffs_stg2
where row_num > 1;


-- 	# delete rows where row_num > 1 

delete 
from layoffs_stg2
where row_num > 1;

select * 
from layoffs_stg2
where row_num > 1;

select * from layoffs_stg2;

alter table layoffs_stg2
drop column row_num;

