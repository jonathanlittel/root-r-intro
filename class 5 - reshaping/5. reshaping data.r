# load libraries
  library(dplyr) # for general manipulation
  library(tidyr) # for reshaping with 'gather'
  library(xlsx)  # for reading/writing excel files

# first, take a look at this article on reshaping:
  # https://blog.rstudio.org/2014/07/22/introducing-tidyr/

# load rev data from social scorecards/alex db (from 1999 - 2015)
  # pick one of the two methods for reading the data
  filename1 <- 'client_revenue_alex.csv'  # from a folder
  filename2 <- 'https://rootcapital.box.com/shared/static/4xi2sgwswfl26nllticutooawq5ho5el.csv' # direct from box
  rev <- read.csv(filename2, skip=1)   # skip the first row, since we don't need it

# format data
  rev <- __________ # remove the last row 'grand total'

# select only the columns Account.Name, and from rev_1996 to rev_2014
  rev <-  __________

# reshape long to wide using 'gather'
  rev_long <- gather(__________)

# check that the new dimensions are 11,000 rows x 3 columns
  _______
  
# remove the stub 'rev_' from 'rev_YYYY'  
  rev_long$Year <- as.numeric(gsub('rev_', '', rev_long$Year))

# extra credit:
# try doing both steps at once, using %>% (ie do rows 19 and 22 in one swoop)
# select and reshape long to wide  
  rev_long <- rev %>%
    ______________________ %>%
    ______________________
 
# write output
  new_filename <- ______
  write.csv(__________________)
  file.show('revenue_long.csv')

# optional: write output to xlsx  
  write.xlsx(_______, _______, sheetName = ______)
  file.show('revenue_long.xlsx')

# solution:
# https://rootcapital.box.com/s/uhrc1np59rj9e2ynugcvsbu8ai43x146