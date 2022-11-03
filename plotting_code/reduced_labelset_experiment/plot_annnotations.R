# 2022-05-24

## 1. Set up 

  # point to data locale
  data_locale = "analysis_code/reduced_labelset_experiment/"
  
  # load data
  source(paste0(data_locale, "analyze_annotations.R"))
  

## 2. when the AI gets the ID wrong, how confident was it (like a false positive)?
  
  # for complete labelset
  matches_complete_labelset %>%
    ggplot(aes(as.factor(match), `Machine confidence 1`, group = match)) +
      geom_jitter(alpha = 0.07) +
    scale_x_discrete(labels=c("0" = "NO", "1" = "YES")) +
      geom_boxplot(color = "blue") +
      labs(x = "Match", 
           y = "Confidence of Primary AI Prediction") +
      theme_light() 
  
  # for reduced labelset
  matches_reduced_labelset %>%
    ggplot(aes(as.factor(match), `Machine confidence 1`, group = match)) +
    geom_jitter(alpha = 0.1) +
    scale_x_discrete(labels=c("0" = "NO", "1" = "YES")) +
    geom_boxplot(color = "red") +
    labs(x = "Match", 
         y = "Confidence of Primary AI Prediction") +
    theme_light() 
  
  
  
  