#------------------------------------------------
#      combining and merging data              
#------------------------------------------------

# fill in the areas indicated with question marks

# Load the same client financial data as in the previous exercise
# Hint: You can copy/paste the code from the previous exercise
	wd <- ???? enter filepath
	setwd(wd)
	getwd()
	filename <- ??? enter name of file, including .csv
	data <- read.csv(   ?? enter arguments to read file       )


# You can combine data by combining columns using cbind
	sales_to_loan_amount <- data$sales / data$loanAmount
	head(sales_to_loan_amount)
	head(data) # before
	# combine sales_to_loan_amount with data
	data <- cbind(        ??? enter arguments to combine two objects           )
	head(data) # after

# Load another dataset, with the new impact scores
	filename <- 'https://rootcapital.box.com/shared/static/h2hr82k6oj86oh966zac2yxyguzx1lay.csv'
	impact_data <- ?? read impact data from filename above
	head(impact_data) # looks like that's the same RC Account Number as in the original data
	# you can assign the columns names like so:
	names(impact_data) <- c('clientID', 'impact_score')
	names(impact_data)

# Combine them using merge, similar to doing a lookup in excel
# call the new object client_data
	client_data <- merge(         ?? merge data and impact data           )
	head(client_data)

# Check to see if there are any duplicates on the field you are merging on
	# duplicated returns a vector of TRUE/FALSE for rows where something is duplicated
	# you can sum them to see how many rows are duplicates
	# check both client_data, and data
	sum(duplicated(      ?? enter arguments to sum the number of duplicates of clientID      )) 

# save the output
	write.csv(  ?? enter arguements to save the client_data object)
	file.show( ?? enter the filename above to show the file you just saved )

# extra credit: merge another salesforce report to client_data


# solution file: 
# https://rootcapital.box.com/s/3svnyqyyc8cd4vrgebjkrr93mh9pryqi

# for more detail on different types of merges, see two tutorials below:
# https://rpubs.com/NateByers/merging
# https://cran.r-project.org/web/packages/dplyr/vignettes/two-table.html	