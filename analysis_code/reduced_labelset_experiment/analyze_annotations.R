# 2022-05-24


## 1. Set up

  # point to data locale
  data_locale = "creation_code/reduced_labelset_experiment/"
  
  # load in the data
  source(paste0(data_locale, "create_annotations.R"))

  
## 2. How many annotations did the machine get right?
  
  # for the complete labelset? 
  matches_complete_labelset = 
    merge(complete_labelset_data, annotations_key) %>%
      mutate(match = if_else(true_complete_Label == `Machine suggestion 1`, 1, 0)) 
  
  matches_complete_labelset %>%
      group_by(match) %>%
      summarise(number_annotations = n()) %>%
      mutate(total_annotations = nrow(merge(complete_labelset_data, annotations_key))) %>%
      filter(match == 1) %>%
      mutate(proportion_correct = number_annotations/total_annotations)
  
  # for the reduced labelset
  matches_reduced_labelset = 
    merge(reduced_labelset_data, annotations_key) %>%
      mutate(match = if_else(true_reduced_Label == `Machine suggestion 1`, 1, 0)) 
  
  matches_reduced_labelset %>%
      group_by(match) %>%
      summarise(number_annotations = n()) %>%
      mutate(total_annotations = nrow(merge(reduced_labelset_data, annotations_key))) %>%
      filter(match == 1) %>%
      mutate(proportion_correct = number_annotations/total_annotations)


## 3. Which IDs is the machine messing up on?
  
  # for the complete labelset
  wrong_IDs_complete_labelset = 
  matches_complete_labelset %>%
    filter(match == 0) %>%
    group_by(true_complete_Label, `Machine suggestion 1`) %>%
    summarise(count = n()) %>%
    mutate(total_annotations = nrow(matches_complete_labelset %>%
                                      filter(match == 0)), 
           proportion_of_wrong_annotations = count/total_annotations)


  # for the reduced labelset
  wrong_IDs_reduced_labelset = 
    matches_reduced_labelset %>%
    filter(match == 0) %>%
    group_by(true_reduced_Label, `Machine suggestion 1`) %>%
    summarise(count = n()) %>%
    mutate(total_annotations = nrow(matches_reduced_labelset %>%
                                      filter(match == 0)), 
           proportion_of_wrong_annotations = count/total_annotations)
  
  
  
  

    
