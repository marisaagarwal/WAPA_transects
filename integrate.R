##  Project Name:  WAPA Internship Coral Transect Analyses
##
##  Objective:     Assess how coral & benthic community composition changes
##                 over space and time.
##
##  Approach:      1. Analyze coral transect photographs from Adelup,
##                    Asan, & Agat using CoralNet
##                 2. Analyze data to fulfill research objective
##
##  Authors:       Marisa Agarwal
##
##  Start Date:    2022-02-01
##

##  Notes:         RUN THIS FILE BEFORE EVERY SESSION 


##  1. point to working directory

setwd("research/WAPA_transects")



##  2. Set up core functionality

    # clean up
    rm(list=ls())
      
    # call to core packages for data manipulation
    library(dplyr)
    library(tidyr)
    library(magrittr)      
    library(purrr)
    library(lubridate)
    library(stringr)
    library(forcats)      
    library(tidyverse)
    library(see)
    library(broom)

    # for importing different formats
    library(readr)
    library(readxl)
    
    # for easier tidy stats 
    library(rstatix)
    library(easystats)
    library(multcomp)
    library(vegan)
    
    # call to visualisation & output generation
    library(ggplot2)
    library(GGally)
    library(Cairo)
    library(extrafont)
    library(RColorBrewer)
    library(viridis)
    library(ggdist)
    library(ggsci)
    library(plotrix)
    library(multcompView)
    library(ggpubr)


## 2. Generate core data objects
## if things need to be loaded in before every session, include them here
    
    
    
    

