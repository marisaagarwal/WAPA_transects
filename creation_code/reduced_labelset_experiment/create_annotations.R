# 2022-05-24


## 1. Set up

  # point to data locale
  data_locale = "data/reduced labelset experiment/"
  
  # point to data files
  complete_labelset_data_file = "2112.csv"
  reduced_labelset_data_file = "CoralNet Machine Labels Download (Reduced Labelset).xlsx"
  
  # call to data
  complete_labelset_data =
    paste0(data_locale, complete_labelset_data_file) %>%
    read_csv() %>%
    as.data.frame()
  
  reduced_labelset_data = 
    paste0(data_locale, reduced_labelset_data_file) %>%
    read_excel()

  
## 2. Groom data
  
  complete_labelset_data %<>%
    drop_na(`Machine suggestion 1`) %>%      # remove rows without machine suggestions
    dplyr::select(c(Name, Date, Site, Cluster, Transect, Margin, Row, Column, Label,     # keep only relevant columns
                    `Machine suggestion 1`, `Machine confidence 1`,
                    `Machine suggestion 2`, `Machine confidence 2`,
                    `Machine suggestion 3`, `Machine confidence 3`,
                    `Machine suggestion 4`, `Machine confidence 4`,
                    `Machine suggestion 5`, `Machine confidence 5`)) %>%
    mutate(labelset = "complete")         # add in column for labelset type
    
    
    
  reduced_labelset_data %<>%
    drop_na(`Machine suggestion 1`) %>%       # remove rows without machine suggestions
    dplyr::select(c(Name, Date, Site, Cluster, Transect, Margin, Row, Column, Label,      # keep only relevant columns
                    `Machine suggestion 1`, `Machine confidence 1`,
                    `Machine suggestion 2`, `Machine confidence 2`,
                    `Machine suggestion 3`, `Machine confidence 3`,
                    `Machine suggestion 4`, `Machine confidence 4`,
                    `Machine suggestion 5`, `Machine confidence 5`)) %>%
    mutate(labelset = "reduced")        # add in column for labelset type

  
## 3. create 'true' annotations dataframe from complete annotations
  
  annotations_key = 
    complete_labelset_data %>%
      dplyr::select(c(Name, Row, Column, Label)) %>%
      rename(true_complete_Label = Label) %>%
      mutate(true_reduced_Label = recode(true_complete_Label,
                                         AMPH = "R2", BOOD = "MALG", BRCA = "MALG", CARA = "CAUL",
                                         CASE = "CAUL", CAST = "CAUL", CATA = "CAUL", CHFR = "MALG",
                                         CRCA = "MALG", DICT = "MALG", HAMA = "HALI", NESP = "MALG",
                                         SARG = "MALG", TURB = "MALG", TYDE = "MALG", VALO = "MALG",
                                         APLA = "ANIM", ASTE = "ANIM", CNOV = "ANIM", HOLO = "ANIM",
                                         LILA = "ANIM", LMUL = "ANIM", PALY = "ANIM", SABE = "ANIM",
                                         TRID = "ANIM", URCH = "ANIM", VERM = "ANIM", ECHN = "ANIM", 
                                         INVE = "ANIM", DEST = "DEAD", GARB = "OTHR", MARS = "SARU",
                                         REST = "REKI", RUBB = "SARU", SAND = "SARU", TUNI = "OTHR", 
                                         DYSI = "SPOG", TERP = "SPOG"))
  
  

    
  
  
  