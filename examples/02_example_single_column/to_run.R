#-------------------------------
# example 2: simple use of the function, when the number of columns to be matched is 1 instead of 2

rm(list=ls(all.names=TRUE))

#set the directory where the file is saved as the working directory
if (!require("rstudioapi")) install.packages("rstudioapi")
thisdir <- setwd(dirname(rstudioapi::getSourceEditorContext()$path))
thisdir <- setwd(dirname(rstudioapi::getSourceEditorContext()$path))

#load function
source(paste0(thisdir,"/../../CreateItemsetDatasets.R"))

# load data.table
if (!require("data.table")) install.packages("data.table")
library(data.table)

thisdirinput <- paste0(thisdir,"/input/")
thisdiroutput <- paste0(thisdir,"/output/")

suppressWarnings(if (!file.exists(thisdiroutput)) dir.create(file.path( thisdiroutput)))

# the variables of interest are gestational age from last menstrual period and gestational age from ultrasound
variables_of_our_study <- c("GESTAGE_FROM_LMP_WEEKS","GESTAGE_FROM_USOUNDS_WEEKS")

itemsets_of_our_study <- vector(mode = "list")

### specification GESTAGE_FROM_LMP_WEEK
itemsets_of_our_study[["GESTAGE_FROM_LMP_WEEKS"]][["SURVEY_OBSERVATIONS"]] <- list(list("SETTAMEN_ARSNEW")) 
itemsets_of_our_study[["GESTAGE_FROM_LMP_WEEKS"]][["SURVEY_OBSERVATIONS_2"]] <- list(list("SETTAMEN_ARSNEW")) 


### specification GESTAGE_FROM_USOUNDS_WEEKS
itemsets_of_our_study[["GESTAGE_FROM_USOUNDS_WEEKS"]][["SURVEY_OBSERVATIONS"]] <- list(list("GEST_ECO"))
itemsets_of_our_study[["GESTAGE_FROM_USOUNDS_WEEKS"]][["SURVEY_OBSERVATIONS_2"]] <- list(list("GEST_ECO"))


### specification of input tables

input_EAVtables <- vector(mode = "list")

#new specifications
input_EAVtables[["SURVEY_OBSERVATIONS"]] <- list( "so_source_column")
input_EAVtables[["SURVEY_OBSERVATIONS_2"]] <- list( "so_source_column")


CreateItemsetDatasets(EAVtables =  input_EAVtables,
                        study_variable_names = variables_of_our_study,
                        itemset = itemsets_of_our_study, 
                        dirinput = thisdirinput,
                        diroutput = thisdiroutput,
                        discard_from_environment = FALSE,
                        extension = c("csv")
  )



# View(Output_file)