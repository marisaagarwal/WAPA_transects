# 2022-05-26


## 1. Set up

    # point to data locale
    data_locale = "analysis_code/asan_outplants/"
    
    # load in the data
    source(paste0(data_locale, "analyze_outplant_data.R"))
    
    
## 2. Preliminary plotting
    
    # outplants_data %>%
    #     dplyr::select(c(block, tag, species, 6:9)) %>%
    #     pivot_longer(cols = starts_with("n_"),
    #                  names_to = "designation",
    #                  values_to = "number") %>%
    #         ggplot(aes(designation, number)) +
    #             geom_col()
        
    
    proportion_data %>%
        ggplot(aes(tag, proportion, fill = designation)) +
            geom_col(position = "stack", stat = "identity") +
            scale_fill_discrete(name = "Status", labels = c("Alive", "Dead", "Missing", "Partial Mortality")) +
            labs(x = "Tag Number", y = "Proportion") +
            theme_light()
    

    
    
    
    
    
    
    
            