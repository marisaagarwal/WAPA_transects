# 2022-05-26


## 1. Set up

    # point to data locale
    data_locale = "creation_code/asan_outplants/"
    
    # load in the data
    source(paste0(data_locale, "create_outplant_data.R"))



## 2. Formatting data 

    # add in proportion data
    outplants_data %<>%
        mutate(prop_dead = n_dead/n_outplants, 
               prop_alive = n_alive/n_outplants,
               prop_partialmortality = n_partialmortality/n_outplants, 
               prop_missing = n_missing/n_outplants)
    
    # pivot longer
    proportion_data = 
        outplants_data %>%
            dplyr::select(c(block, tag, species, 12:15)) %>%
            pivot_longer(cols = starts_with("prop"),
                         names_to = "designation",
                         values_to = "proportion")

## 3. Summary stats
    
    # how many corals in each category
    total_outplants = sum(outplants_data$n_outplants, na.rm = T)
    
    total_dead = sum(outplants_data$n_dead, na.rm = T)
    total_alive = sum(outplants_data$n_alive, na.rm = T)
    total_partialmortality = sum(outplants_data$n_partialmortality, na.rm = T)
    total_missing = sum(outplants_data$n_missing, na.rm = T)
    
    prop_dead_overall = total_dead/total_outplants
    prop_alive_overall = total_alive/total_outplants
    prop_partialmortality_overall = total_partialmortality/total_outplants
    prop_missing = total_missing/total_outplants
    
    
    
    
    
    
    
    
    
    
    
    
    