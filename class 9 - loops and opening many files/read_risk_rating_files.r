# ------------ load libraries and setup --------------
  library(readxl)
  wd <- 'C:/Box Sync/jlittel/R Intro/class 9 - loops and opening many files'
  setwd(wd)

  wd_data <- 'C:/Box Sync/jlittel/R Intro/class 9 - loops and opening many files/data'
  setwd(wd_data)

# -----------------  read data -----------------------
  # get list of files in data directory
  filenames_list <- dir()
  file_count <- length(filenames_list)    # count the number of files


# test read one file
  filename_to_open <- filenames_list[1]   # get the name of the first file
  df_name <- paste0('df.', 1)
  df.test <- read_excel(filename_to_open, sheet = 'source_data')



# ---  read all files and assign to separate data frames ------
  for (i in seq_along(filenames_list)) {
  	new_filename <- paste(filenames_list[i])
  	df <- read_excel(filenames_list[i], sheet = 'source_data')
  	assign(name, df)
  }

# doing the same as above, but with a list and apply function
  data_list <- lapply(filenames_list,
  	function(x) read_excel(x, sheet = 'source_data')
  	)


# ------  add identifier --------------------
# ------  clean data     --------------------