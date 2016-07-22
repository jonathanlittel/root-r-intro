# -------------------------------------------
# Intro to data manipulation with dplyr
# -------------------------------------------

# you can use function written by other people
# functions come in 'packages'
# the first time you use a package, you will need to install it:
# install.packages('dplyr')  # <- run this command 
# you will need to load the package each time you start rstudio
library(dplyr) 

# read the client data 
  data <- read.csv('https://rootcapital.box.com/shared/static/gwto9e4mnyl7mpz2ytmvwiap35fywwib.csv')
  str(data)

# -------------------------------------------
# Part 1: demonstration of dplyr functions
# -------------------------------------------

# The two most basic functions are select() and filter() which selects columns and filters rows, respectively.
  a_few_columns <- select(data, client_name, impact_score)
  head(a_few_columns)

  data_2014    <- filter(data, year == 2014)
  data_big_eaf <- filter(data, region == 'EAF', sales > 500000)
  dim(data)
  dim(data_2014)
  dim(data_big_eaf)

# you can use the below construction to chain functions into a single command:
  data %>%
	group_by(region) %>%
	summarise(sales_average = mean(sales))

# create a summary table that should average impact score, highest impact score, 
# and the sum of sales, by region, by sector
  region_summary <- data %>%
		  group_by(region, sector) %>%
		  summarise(
		  	impact_average   = mean(impact_score),
		  	highest_impact  = max(impact_score),
		  	total_sales     = sum(sales)
		  	)

  # print the new data frame:	  
  region_summary

# -------------------------------------------
# Part 2: exercises 
# -------------------------------------------

# create a new data frame called client_assets with the columns client_name, total_assets, year, region, and sector
  client_assets <- select(data, client_name, total_assets, year, region, sector)

# filter to remove clients with assets less than 0, or above $100m
  client_assets <- filter(client_assets, total_assets>0, total_assets<1000000)

# create a summary table that shows the average assets by year
  assets_by_year <- client_assets %>%
  					  group_by(year) %>%
  					  summarize(average_assets = mean(total_assets))

# trying plotting it
  plot(assets_by_year)

# create a summary table that shows the average assets by region, by year
  assets_by_year_by_region <- client_assets %>%
  					  group_by(region, year) %>%
  					  summarize(average_assets = mean(total_assets))
    
# show both summary tables
  assets_by_year
  assets_by_year_by_region

# create a new column with the most recent year by client, called year_max
# hint: use mutate instead of summarise to make a new column
  client_assets <- client_assets %>%
  					  group_by(client_name) %>%
  					  mutate(year_max = max(year))

# filter so that there is only one one per client, for the most recent year
  client_assets_one_row <- client_assets %>%
  					 	 filter(year == year_max)

# write the second table to a csv file
  write.csv(assets_by_year_by_region, 'assets_by_year_by_region.csv')
  file.show('assets_by_year_by_region.csv')


# There is a dplyr 'cheatsheet' in two pages here:
# http://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf

# Important dplyr verbs to remember
# dplyr verbs	Description
# select()	    select columns
# filter()   	filter rows
# arrange() 	re-order or arrange rows
# mutate()  	create new columns
# summarise()	summarise values
# group_by()	allows for group operations in the “split-apply-combine” concept

