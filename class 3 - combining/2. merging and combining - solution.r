#------------------------------------------------
#      combining and merging data              
#------------------------------------------------

# Load the same client financial data as in the previous exercise
# Hint: You can copy/paste the code from the previous exercise
	wd <- "c:/box sync/jlittel/R intro/class 3" 
	setwd(wd)
	getwd()
	filename <- 'rc_client_financials.csv'
	data <- read.csv(filename, header = TRUE)


# You can combine data by combining columns using cbind
	sales_to_loan_amount <- data$sales / data$loanAmount
	head(sales_to_loan_amount)
	head(data) # before
	data <- cbind(data, sales_to_loan_amount)
	head(data) # after

# Load another dataset, with the new impact scores
	filename <- 'https://rootcapital.box.com/shared/static/h2hr82k6oj86oh966zac2yxyguzx1lay.csv'
	impact_data <- read.csv(filename)
	head(impact_data) # looks like that's the same RC Account Number as in the original data
	# you can assign the columns names like so:
	names(impact_data) <- c('clientID', 'impact_score')

# Combine them using merge, similar to doing a lookup in excel
# call the new object client_data
	client_data <- merge(data, impact_data, by = 'clientID')
	head(client_data)

# Check to see if there are any duplicates on the field you are merging on
	# duplicated returns a vector of TRUE/FALSE for rows where something is duplicated
	# you can sum them to see how many rows are duplicates
	sum(duplicated(data$clientID)) 

# save the output
	write.csv(client_data, 'client_data.csv')
	file.show('client_data.csv')