# 2022-05-26


## 1. Set up

    # point to data locale
    data_locale = "data/asan outplants/"
    
    # point to data files
    outplants_data_file = "Asan Outplant Monitoring.xlsx"
    
    # call to data
    outplants_data =
        paste0(data_locale, outplants_data_file) %>%
        read_excel()
   
## 2. Groom data
    
    str(outplants_data)
    
    outplants_data %<>%
        mutate(tag = as.character(tag))
    

        
        
        
        
        
        
        
        
        
        
    
    
    