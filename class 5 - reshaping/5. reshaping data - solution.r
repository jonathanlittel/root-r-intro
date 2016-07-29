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
  rev <- rev[-nrow(rev)] # remove the last row 'grand total'

# select only the columns Account.Name, and from rev_1996 to rev_2014
  rev <-  select(rev, Account.Name, rev_1996:rev_2014) 

# reshape long to wide using 'gather'
  rev_long <- gather(rev, Year, revenue, rev_1996:rev_2014)
  
# remove the stub 'rev_' from 'rev_YYYY'  
  rev_long$Year <- as.numeric(gsub('rev_', '', rev_long$Year))

# extra credit:
# try doing both steps at once, using %>%
# select and reshape long to wide  
  rev_long <- rev %>%
    select(Account.Name, rev_1996:rev_2014) %>%
    gather(Year, revenue, rev_1996:rev_2014)
 
# write output
  out <- rev_long
  write.csv(out, 'revenue_long.csv')
  file.show('revenue_long.csv')

# optional: write output to xlsx  
  # sheetname <- 'revenue'
  # write.xlsx(out, 'revenue_long.xlsx', sheetName = sheetname) # showNA = FALSE to leave NA values as empty cells
  # file.show('revenue_long.xlsx')