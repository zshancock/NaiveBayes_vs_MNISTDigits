## Using a public census CSV file, retrieve data, clean and rename into a dataframe
## and create a function to find the amount of population (in percent) less than a 
## input value. Could have definitely read in the data without a function, but I 
## was learning function syntax. 

install.packages("stringr")
library("stringr")

# Create the function to read the states .csv file from a specified URL #

readStates <- function(target_url)
{
  dataset <- read.csv(url(target_url))
  dataset <- dataset[c(9:59),(1:5)]
  names(dataset)[1] <- "stateName"
  names(dataset)[2] <- "Jul2010"
  names(dataset)[3] <- "Jul2011"
  names(dataset)[4] <- "base2010"
  names(dataset)[5] <- "base2011"
  return(dataset)
}


# add states URL as a variable #

target_url = "http://www2.census.gov/programs-surveys/popest/tables/2010-2011/state/totals/nst-est2011-01.csv"

# use above function to read from the specified URL #

dfStates <- readStates(target_url)


# Create a function to make cells into numbers only by first cleaning cells, then return integers #

numbersonly <- function(dataset)
{
  dataset <- str_replace_all(dataset, ",",  "")
  dataset <- str_replace_all(dataset, " ",  "")
  
  return(as.integer(dataset))  
}

# Convert columns 2,3,4,5 to numbers only using new function #

dfStates$Jul2010 <- numbersonly(dfStates$Jul2010)
dfStates$Jul2011 <- numbersonly(dfStates$Jul2011)
dfStates$base2010 <- numbersonly(dfStates$base2010)
dfStates$base2011 <- numbersonly(dfStates$base2011)


# Create a function that takes a vector and a value and returns how many #
# components are below (in percent) the value provided                   #

Percent_Below <- function(vector,value)
  {
  below <- sum(vector < value)  
  perc_below <- (below/51)*100
  return(round(perc_below, digits=3))
}
