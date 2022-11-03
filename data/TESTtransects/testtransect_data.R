# 2022-02-01


## 1. Set up ----

    # point to data locale
    data_locale <- "TESTtransects/datafiles/"
    
    # point to data files
    adelup_data_file <- "ADELUP_trainingannotations.csv"
    asan_data_file <- "ASAN_trainingannotations.csv"
    
    # call to data
    adelup_data =
      paste0(data_locale, adelup_data_file) %>%
      read_csv() %>%
      as.data.frame()
    
    asan_data =
      paste0(data_locale, asan_data_file) %>%
      read_csv() %>%
      as.data.frame()
    
## 2. Beautify data ----
    
    # merge sites together
    coral_transect_data = rbind(adelup_data, asan_data)
    
    # remove unnecessary rows
    coral_transect_data %<>%
      dplyr::select(Name, Date, Site, Cluster, Transect, Margin, Label)
    
    # create column to identify unique replicates within each cluster
    coral_transect_data %<>%
      unite("replicate_ID", Transect:Margin, sep = "", remove = F)
    
    
## 3. Explore Data ----
    
    # double check that there are 148 photos in the test set
    length(unique(coral_transect_data$Name))
    
    # what dates were photos collected?
    unique(coral_transect_data$Date)
        #Asan was all in May, Adelup was all in November

    
## 4. Summarize community data ----
    
    all_data_summary = coral_transect_data %>%
      group_by(Name, Date, Site, Cluster, replicate_ID, Transect, Margin, Label) %>%
      summarize(Count_Points = n(), 
                Proportion_Points = Count_Points/50)
    
    transect_averages = all_data_summary %>%
      group_by(Date, Site, Cluster, replicate_ID, Transect, Margin, Label) %>%
      summarize(mean_count = mean(Count_Points), 
                mean_proportion = mean(Proportion_Points))


## 5. Visualize community composition ----
  
# with all data 
    
    # only for adelup
    all_data_summary %>%
      filter(Site == "ADELUP") %>%
      ggplot(aes(Name, Count_Points, fill = Label)) +
        geom_col(position = "fill")
        # facet_wrap(~Cluster)
        
    # for all sites
    all_data_summary %>%
      ggplot(aes(Name, Count_Points, fill = Label)) +
      geom_col(position = "fill") +
      facet_wrap(~Site) 
    
     
# with data averaged by transect

    # transect_averages %>%
    #   # filter(Site == "ASAN") %>%
    #   ggplot(aes(Margin, mean_count, fill = Label)) +
    #     geom_col(position = "fill") +
    #     facet_grid(Transect~Site)
    #         # ^ this does not take into account which cluster 
    #         # the data belongs to
    
    transect_averages %>%
      # filter(Site == "ASAN") %>%
      ggplot(aes(replicate_ID, mean_count, fill = Label)) +
      geom_col(position = "fill") +
      facet_grid(Cluster~Site)
    
    # transect_averages %>%
    #   filter(Site == "ASAN") %>%
    #   ggplot(aes(Margin, mean_count, fill = Label)) +
    #   geom_col(position = "fill") +
    #   facet_grid(Transect~Cluster)
    
    transect_averages %>%
      filter(Site == "ASAN") %>%
      ggplot(aes(replicate_ID, mean_count, fill = Label)) +
        geom_col(position = "fill") +
        facet_wrap(~Cluster) +
        ggtitle("ASAN") +
        theme_light()
    
    # transect_averages %>%
    #   filter(Site == "ADELUP") %>%
    #   ggplot(aes(Margin, mean_count, fill = Label)) +
    #   geom_col(position = "fill") +
    #   facet_grid(Transect~Cluster)
    
    transect_averages %>%
      filter(Site == "ADELUP") %>%
      ggplot(aes(replicate_ID, mean_count, fill = Label)) +
        geom_col(position = "fill") +
        facet_wrap(~Cluster) +
        ggtitle("ADELUP") +
        theme_light()
    
    
## 6. Summarize & Visualize Dead Corals ----
    
    # find the proportion of community (% cover) that is 
    # dead for each cluster, transect, & margin
    
    # used both DEAD and DEST codes
    
  dead_summary =   
    coral_transect_data %>%
      filter(Label %in% c("DEST", "DEAD")) %>%
      group_by(Name, Date, Site, Cluster, replicate_ID, Transect, Margin) %>%
      summarize(count_dead = n(), 
                percentcover_dead = count_dead/50)
      
  # visualize percent cover dead by cluster for sites
    dead_summary %>% 
     filter(Site == "ADELUP") %>%
      ggplot(aes(Cluster, percentcover_dead)) +
        geom_boxplot(aes(fill = Cluster)) +
        geom_point(alpha = 0.3) +
        ggtitle("ADELUP") +
        theme_light()
    
    dead_summary %>% 
      filter(Site == "ASAN") %>%
      ggplot(aes(Cluster, percentcover_dead)) +
      geom_boxplot(aes(fill = Cluster)) +
      geom_point(alpha = 0.3) +
      ggtitle("ADELUP") +
      theme_light()
    
  # visualize percent cover dead by replicate_ID
    dead_summary %>%
      ggplot(aes(replicate_ID, percentcover_dead)) +
        geom_boxplot(aes(fill = replicate_ID)) +
        geom_point(alpha = 0.2) +
        facet_wrap(Site~Cluster) +
        theme_light()
    
    
    
    
    
      
    