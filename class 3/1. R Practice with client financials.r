#################################################
###  Loading and manipulating data in R       ###
#################################################


# First, download in the client financials data file from:
# https://rootcapital.box.com/s/r73v72o0ngt3mvbq9enjkxsq5zecinsq
# 
# Point R to the right working directory where the file is located
# (or put the file in the right working directory)
# Hint: "c:/.../place where the file is/..."
	wd <- "???" 
	setwd(??)
	getwd()

# Load the data
	filename <- ??
	data <- read.csv(??)
	
# Take a look at the data
# What is a summary of the data? What is the structure? 
# How many rows and columns are there?




# What's the maximum values for sales?


# What's the average value of totalAssets?

# Selecting data based on index
	# show the first row

	# show the first column

	# show the first row/column combo


	# show the first two rows


# Create a new variable 'sales_to_assets'


# Use summary to look at the contents of the new variable


# Looks like there are some strange values of 'sales_to_assets'
# See if you can change them to zero
# hint: you can use the function is.infinite() to figure out the index




# Create a new object that only has rows where sector is 'Cocoa'




# Write the data frame to a new csv file
# hint: use write.csv()

# Try using the function plot()
# look at the help file by typing ?plot
# plot totalAssets on the x axis, and sales on the y axis



# Bonus activity: 
	
# What were the total sales of clients in 2010?

# What were the sales of cocoa clients in 2010?


# This file with the completed answers can be found here:
# https://rootcapital.box.com/s/nu8l3hl1qcm64rr699jo01tkyqmq6jva