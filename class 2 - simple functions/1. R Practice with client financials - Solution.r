# Solution 
# Point R to the right working directory
# Hint: ".../place where the file is/..."
wd <- "c:/box sync/jlittel/R intro/class 3" 
setwd(wd)
getwd()
# Load the data
filename <- 'rc_client_financials.csv'
data <- read.csv(filename, header = TRUE)

# Take a look at the data
# What is a summary of the data? What is the structure? 
# How many rows and columns are there?
summary(data)
str(data)
head(data)
levels(data$sector)

# What's the maximum values for sales? 
max(data$sales)

# What's the average value of totalAssets? The median?
mean(data$totalAssets, na.rm=TRUE)
median(data$totalAssets, na.rm=TRUE)

# Try using the function plot()
# look at the help file by typing ?plot
# plot totalAssets on the x axis, and sales on the y axis
plot(x=data$totalAssets, y=data$sales)

# Create a new variable 'sales_to_assets'
data$sales_to_assets <- data$sales / data$totalAssets

# Use summary to look at the contents of the new variable
summary(data$sales_to_assets)

# Looks like there are some strange values
# dividing by zero gives the special value Inf
10 / 0 # for example
# See if you can change them to zero
# hint: you can use the function is.infinite() to figure out the location
index <- is.infinite(data$sales_to_assets)
head(index)  # take a look at the context of 'index'
data$sales_to_assets[index] <- 0  

# Create a new object that only has rows where sector is 'Cocoa'
index <- data$sector=='Cocoa'
table(index)
table(data$sector)
data_cocoa <- data[index,]
head(data_cocoa)

# Write the data frame to a new csv file
# hint: use write.csv()
write.csv(data, 'rc_client_financials_with_ratios.csv')

# Selecting data based on index
# show the first row
data[1,] 
# show the first column
data[,1] 
# show the first row/column combo
data[1,1] 

# show the first two rows
data[1:2,]
# or 
data[c(1,2),]
# or better
index <- 1:2
data[index,]

# you can also specify by the name of the column
head(data[,"sales"])

#########################
# examples other stuff  #
#########################

# Graphing
# first, just once you will need to install the library with:
# install.packages('ggplot2')
library(ggplot2)

# Remove rows with sales above $5m, for scale in plots
data_sm <- data[data$sales<5000000,]
# Remove NOR and ASI
data_sm <- filter(data_sm, region!='NOR', region!='ASI')
q <- ggplot(data_sm, aes(x=sales, fill = as.factor(region)))
q + geom_histogram()
q + geom_density(alpha=0.5)
q + geom_density(alpha=0.5) + facet_wrap( ~ region)

# line plot of Sales of Other Low Perishable Ag, by year, colored by region
s <- ggplot(filter(data_sm, sector=='Other Low Perishable Ag'), aes(as.factor(Year), sales, colour = region))
s + geom_line(aes(group = clientID), alpha=0.25) + geom_point(alpha=0.25, size=1)

# Violin plot of sales by region
t <- ggplot(data_sm, aes(x=region, y=sales))
t + geom_violin(aes(colour=region))

# Use dplyr to make summary stats
library(dplyr)

# See average sales by Client
data %>%
  group_by(clientID) %>%
  summarise(sales_avg = mean(sales))


# Create new column with average sales by Year
data <- data %>%
  group_by(Year) %>%
  mutate(sales_avg = mean(sales))

# Create new object with average sales by sector, by year
sales_year_avg <- data %>%
  group_by(sector, Year) %>%
  summarise(sales_avg = mean(sales))

# View the new object
sales_year_avg

# Graph with the new object
r <- ggplot(filter(sales_year_avg, Year<2014), aes(x=Year, y=sales_avg))
r + geom_line(aes(colour = sector))


# Fit a linear model
lm.sales <- lm(sales ~ totalAssets, data=data, na.action=na.omit)
summary(lm.sales)

# Reshaping
# Useful for converting information contained within a column to a row

library(tidyr)
library(dplyr)

# load messy data
messy <- data.frame(
  name = c("Cecocafen", "Agromontaro", "Virmax"),
  Q1 = c(67, 80, 64),
  Q2 = c(56, 90, 50)
)
messy	

# Reshape messy data from wide to long
clean <- messy %>%
  gather(quarter, sales, Q1:Q2)

clean

# Reshape data from long to wide
messy_again <- clean %>%
  spread()