#### CreateItemsetDatasets
 The function CreateItemsetDatasets inspects a set of input tables af data and creates a group of datasets, each corresponding to a item set. Each dataset contains the records of the input tables that match the corresponding item set and is named out of it. 
 
 The main parameters of the function are:
 - **EAVtables** a 2-level list specifying, tables in a Entity-Attribute-Value structure; each table is listed with the name of two columns: the one contaning attributes and the one containing values
 - **datevar** (optional): a 2-level list containing, for each input table of data, the name(s) of the column(s) containing dates (only if extension="csv"), to be saved as dates in the output
-	**dateformat** (optional): a string containing the format of the dates in the input tables of data (only if -datevar- is indicated); the string must be in one of the following:	YYYYDDMM
- **rename_col** (optional) a list containing the 2-level lists to rename (for istance, id and date)
-	**numericvar** (optional): a 2-level list containing, for each input table of data, the name(s) of the column(s) containing numbers (only if extension="csv"), to be saved as a number in the output
- **study_variable_names** (list of strings): list of the study variables of interest
-	**itemset** (3-level list of lists): this is a list specifying which itemsets are to be retrieved for a study variable: the list has 3 levels:study variable (string): must be one of the strings in the list -study_variable_names-,	table to be queried (string): specified the name of the input table of data where the attributes must be searched for,	attribute to be selected (list of strings): attributes to be matched in the table; it can be a single column, or multiple columns
- **addtabcol**: a logical parameter, by default set to TRUE: if so, the columns "Table_cdm" and "Col" are added to the output, indicating respectively from which original table and column the code is taken.
- **verbose**: a logical parameter, by default set to FALSE. If it is TRUE additional intermediate output datasets will be shown in the R environment
-  **discard_from_environment**: a logical parameter, by default set to FALSE: if so the item set datasets are saved in the R environment
- **dirinput**: (optional) the directory where the input tables of data are stored. If not provided the working directory is considered
- **diroutput**: (optional) the directory where the output item set datasets will be saved. If not provided the working directory is considered
- **extension**: the extension of the input tables of data (csv and dta are supported)
