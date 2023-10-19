library(tidyverse)
library(readxl)
library(here)

career <- read_excel(here("data", "Table_1_Authors_career_2022_pubs_since_1788_wopp_extracted_202310.xlsx"), sheet=2)
career_lka <- career |> filter(cntry=="lka")
singleyr <- read_excel(here("data", "Table_1_Authors_singleyr_2022_pubs_since_1788_wopp_extracted_202310.xlsx"), sheet=2)
singleyr_lka <- singleyr |> filter(cntry=="lka")

# authors
career_lka$authfull |> length() #24
singleyr_lka$authfull |> length() # 42
c(career_lka$authfull, singleyr_lka$authfull)|>
  unique() |>
  length() #50
c(career_lka$inst_name, singleyr_lka$inst_name)|>
  unique() |>
  length() #50

##
sum(career_lka$authfull %in% singleyr_lka$authfull) #16
sum(singleyr_lka$authfull %in% career_lka$authfull)

sum(!(career_lka$authfull %in% singleyr_lka$authfull)) #8

sum(!(singleyr_lka$authfull %in% career_lka$authfull)) #8
