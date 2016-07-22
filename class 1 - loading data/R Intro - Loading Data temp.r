# Intro to RStudio
# http://www.sitepoint.com/introduction-r-rstudio/


# Panels
# Editor
# Console
# History / Environment
#

# Creating an .r file
# Find the filepath that R is currently in
getwd() # returns the current working directory

# This is the 'working directory'
# When you load a file, this is the folder that R is going to look for

# You can put the file into the current working directory....
# Or!
# Change the filepath:

setwd("C://Box Sync/jlittel")
getwd()

# This works fine, however it's good practice to use a variable with the path:	

filepath <- "C://Box Sync/jlittel/R Intro"

setwd(filepath)
getwd()

# Note that you can copy/paste the path from the windows location bar
# But!
# R wants the slash to be in the opposite direction   \  --->  /

# Now we're ready to load the file

filename <-  "True Return dataset.csv"  

# Let's look at the command we're going to use
??read.csv

# There's a whole bunch of options for the command, aka 'arguments'
read.csv(filename, header=TRUE, sep=",")

# Ok. Is that what we wanted? 

df.impact <- read.csv(filename, header=TRUE, sep=",")


df.impact_subset <- subset(df.impact[ c(5,70:73) ])


