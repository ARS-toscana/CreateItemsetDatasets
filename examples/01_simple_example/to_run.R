#-------------------------------
# example 1: simple use of the function 

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

suppressWarnings(if (!file.exists(thosdiroutput)) dir.create(file.path( thisdiroutput)))

# the variables of interest are gestational age from last menstrual period and gestational age from ultrasound
variables_of_our_study <- c("GESTAGE_FROM_LMP_WEEKS","GESTAGE_FROM_USOUNDS_WEEKS")

itemsets_of_our_study <- vector(mode = "list")

### specification GESTAGE_FROM_LMP_WEEK
itemsets_of_our_study[["GESTAGE_FROM_LMP_WEEKS"]][["SURVEY_OBSERVATIONS"]] <- list(list("CAP1","SETTAMEN_ARSNEW")) 
itemsets_of_our_study[["GESTAGE_FROM_LMP_WEEKS"]][["SURVEY_OBSERVATIONS_2"]] <- list(list("CAP1","SETTAMEN_ARSNEW")) 


### specification GESTAGE_FROM_USOUNDS_WEEKS
itemsets_of_our_study[["GESTAGE_FROM_USOUNDS_WEEKS"]][["SURVEY_OBSERVATIONS"]] <- list(list("CAP1","GEST_ECO"))
itemsets_of_our_study[["GESTAGE_FROM_USOUNDS_WEEKS"]][["SURVEY_OBSERVATIONS_2"]] <- list(list("CAP1","GEST_ECO"))


### specification of input tables

input_EAVtables <- vector(mode = "list")

input_EAVtables[["SURVEY_OBSERVATIONS"]] <- list(
  list("SURVEY_OBSERVATIONS", "so_source_table", "so_source_column")
)

input_EAVtables[["SURVEY_OBSERVATIONS_2"]] <- list(
  list("SURVEY_OBSERVATIONS_2", "so_source_table", "so_source_column")
  )


CreateItemsetDatasets(EAVtables =  input_EAVtables,
                        study_variable_names = variables_of_our_study,
                        itemset = itemsets_of_our_study, 
                        dirinput = thisdirinput,
                        diroutput = thisdiroutput,
                        discard_from_environment = FALSE,
                        extension = c("csv")
  )



# View(Output_file)