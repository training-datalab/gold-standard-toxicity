## Draft Gold Standard Toxicity Convention
## Bastián González-Bustamante
## September 2024

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Packages and Data ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Clean Environment
rm(list = ls())

## Packages
library(jsonlite)
library(tidyverse)

## Data Convention
conv_01 <- read.csv("data/raw/csv/CON_Q1_sample.csv", header = T, sep = ",")
conv_02 <- read.csv("data/raw/csv/CON_Q2_sample.csv", header = T, sep = ",")
conv_03 <- read.csv("data/raw/csv/CON_Q3_sample.csv", header = T, sep = ",")
conv_04 <- read.csv("data/raw/csv/CON_Q4_sample.csv", header = T, sep = ",")
conv_05 <- read.csv("data/raw/csv/CON_Q5_sample.csv", header = T, sep = ",")
over_conv_01 <- read.csv("data/raw/csv/CON_Q1_oversample.csv", header = T, sep = ",")
over_conv_02 <- read.csv("data/raw/csv/CON_Q2_oversample.csv", header = T, sep = ",")
over_conv_03 <- read.csv("data/raw/csv/CON_Q3_oversample.csv", header = T, sep = ",")
over_conv_04 <- read.csv("data/raw/csv/CON_Q4_oversample.csv", header = T, sep = ",")
over_conv_05 <- read.csv("data/raw/csv/CON_Q5_oversample.csv", header = T, sep = ",")

## Data Protests
prot_01 <- read.csv("data/raw/csv/ARG_Q1_sample.csv", header = T, sep = ",")
prot_02 <- read.csv("data/raw/csv/ARG_Q2_sample.csv", header = T, sep = ",")
prot_03 <- read.csv("data/raw/csv/ARG_Q3_sample.csv", header = T, sep = ",")
prot_04 <- read.csv("data/raw/csv/ARG_Q4_sample.csv", header = T, sep = ",")
prot_05 <- read.csv("data/raw/csv/ARG_Q5_sample.csv", header = T, sep = ",")
prot_06 <- read.csv("data/raw/csv/CHL_Q1_sample.csv", header = T, sep = ",")
prot_07 <- read.csv("data/raw/csv/CHL_Q2_sample.csv", header = T, sep = ",")
prot_08 <- read.csv("data/raw/csv/CHL_Q3_sample.csv", header = T, sep = ",")
prot_09 <- read.csv("data/raw/csv/CHL_Q4_sample.csv", header = T, sep = ",")
prot_10 <- read.csv("data/raw/csv/CHL_Q5_sample.csv", header = T, sep = ",")
over_prot_01 <- read.csv("data/raw/csv/ARG_Q1_oversample.csv", header = T, sep = ",")
over_prot_02 <- read.csv("data/raw/csv/ARG_Q2_oversample.csv", header = T, sep = ",")
over_prot_03 <- read.csv("data/raw/csv/ARG_Q3_oversample.csv", header = T, sep = ",")
over_prot_04 <- read.csv("data/raw/csv/ARG_Q4_oversample.csv", header = T, sep = ",")
over_prot_05 <- read.csv("data/raw/csv/ARG_Q5_oversample.csv", header = T, sep = ",")
over_prot_06 <- read.csv("data/raw/csv/CHL_Q1_oversample.csv", header = T, sep = ",")
over_prot_07 <- read.csv("data/raw/csv/CHL_Q2_oversample.csv", header = T, sep = ",")
over_prot_08 <- read.csv("data/raw/csv/CHL_Q3_oversample.csv", header = T, sep = ",")
over_prot_09 <- read.csv("data/raw/csv/CHL_Q4_oversample.csv", header = T, sep = ",")
over_prot_10 <- read.csv("data/raw/csv/CHL_Q5_oversample.csv", header = T, sep = ",")

## Labelbox Data
labelbox <- stream_in(file("../gold-standard-toxicity/data/tidy/gold-standard-toxicity-9_6_2024.ndjson"))

## Merge
sample_convention <- bind_rows(conv_01, conv_02, conv_03, conv_04, conv_05,
                               over_conv_01, over_conv_02, over_conv_03, over_conv_04, over_conv_05)
sample_protests <- bind_rows(prot_01, prot_02, prot_03, prot_04, prot_05, prot_06, prot_07, prot_08, prot_09, prot_10,
                             over_prot_01, over_prot_02, over_prot_03, over_prot_04, over_prot_05, over_prot_06,
                             over_prot_07, over_prot_08, over_prot_09, over_prot_10)

## Toxicity levels
sample_convention$tox_60 <- ifelse(sample_convention$TOXICITY > 0.60, 1, 0)
sample_convention$tox_70 <- ifelse(sample_convention$TOXICITY > 0.70, 1, 0)
sample_convention$tox_80 <- ifelse(sample_convention$TOXICITY > 0.80, 1, 0)
sample_convention$tox_90 <- ifelse(sample_convention$TOXICITY > 0.90, 1, 0)
sample_convention$insult_60 <- ifelse(sample_convention$INSULT_EXPERIMENTAL > 0.60, 1, 0)
sample_convention$insult_70 <- ifelse(sample_convention$INSULT_EXPERIMENTAL > 0.70, 1, 0)
sample_convention$insult_80 <- ifelse(sample_convention$INSULT_EXPERIMENTAL > 0.80, 1, 0)
sample_convention$insult_90 <- ifelse(sample_convention$INSULT_EXPERIMENTAL > 0.90, 1, 0)

sample_protests$tox_60 <- ifelse(sample_protests$TOXICITY > 0.60, 1, 0)
sample_protests$tox_70 <- ifelse(sample_protests$TOXICITY > 0.70, 1, 0)
sample_protests$tox_80 <- ifelse(sample_protests$TOXICITY > 0.80, 1, 0)
sample_protests$tox_90 <- ifelse(sample_protests$TOXICITY > 0.90, 1, 0)
sample_protests$insult_60 <- ifelse(sample_protests$INSULT_EXPERIMENTAL > 0.60, 1, 0)
sample_protests$insult_70 <- ifelse(sample_protests$INSULT_EXPERIMENTAL > 0.70, 1, 0)
sample_protests$insult_80 <- ifelse(sample_protests$INSULT_EXPERIMENTAL > 0.80, 1, 0)
sample_protests$insult_90 <- ifelse(sample_protests$INSULT_EXPERIMENTAL > 0.90, 1, 0)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Human Annotations ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Dataframe
goldstd <- data.frame(id_obs = character(2000), 
                      subsample = character(2000),
                      coder_1 = character(2000), 
                      coder_2 = character(2000), 
                      consensus = numeric(2000),
                      sec_create_1 = numeric(2000),
                      sec_create_2 = numeric(2000),
                      sec_review_1 = numeric(2000),
                      sec_review_2 = numeric(2000),
                      stringsAsFactors = FALSE)

## Loop through the 2000 observations
for (i in 1:2000) {
  
  ## ID
  id_obs <- labelbox$data_row$external_id[i]
  
  ## Dataset
  subsample <- labelbox$data_row$details$dataset_name[i] 
  
  ## Classification coder 1
  if (length(labelbox$projects$clxcnbmvz0cbb07y66m486j39$labels[[i]]$annotations$classifications) >= 1) {
    coder_1 <- labelbox$projects$clxcnbmvz0cbb07y66m486j39$labels[[i]]$annotations$classifications[[1]]$radio_answer$value
  } else {
    coder_2 <- NA
  }
  
  ## Classification coder 2
  if (length(labelbox$projects$clxcnbmvz0cbb07y66m486j39$labels[[i]]$annotations$classifications) >= 2) {
    coder_2 <- labelbox$projects$clxcnbmvz0cbb07y66m486j39$labels[[i]]$annotations$classifications[[2]]$radio_answer$value
  } else {
    coder_2 <- NA
  }
  
  ## Consensus
  if (!is.null(labelbox$projects$clxcnbmvz0cbb07y66m486j39$labels[[i]]$performance_details$consensus_score)) {
    consensus <- labelbox$projects$clxcnbmvz0cbb07y66m486j39$labels[[i]]$performance_details$consensus_score[1]
  } else {
    consensus <- NA
  }
  
  ## Seconds to create 1
  if (!is.null(labelbox$projects$clxcnbmvz0cbb07y66m486j39$labels[[i]]$performance_details$seconds_to_create[1])) {
    sec_create_1 <- labelbox$projects$clxcnbmvz0cbb07y66m486j39$labels[[i]]$performance_details$seconds_to_create[1]
  } else {
    sec_create_1 <- NA
  }
  
  ## Seconds to create 2
  if (!is.null(labelbox$projects$clxcnbmvz0cbb07y66m486j39$labels[[i]]$performance_details$seconds_to_create[2])) {
    sec_create_2 <- labelbox$projects$clxcnbmvz0cbb07y66m486j39$labels[[i]]$performance_details$seconds_to_create[2]
  } else {
    sec_create_2 <- NA
  }
  
  ## Seconds to review 1
  if (!is.null(labelbox$projects$clxcnbmvz0cbb07y66m486j39$labels[[i]]$performance_details$seconds_to_review[1])) {
    sec_review_1 <- labelbox$projects$clxcnbmvz0cbb07y66m486j39$labels[[i]]$performance_details$seconds_to_review[1]
  } else {
    sec_review_1 <- NA
  }
  
  ## Seconds to review 2
  if (!is.null(labelbox$projects$clxcnbmvz0cbb07y66m486j39$labels[[i]]$performance_details$seconds_to_review[2])) {
    sec_review_2 <- labelbox$projects$clxcnbmvz0cbb07y66m486j39$labels[[i]]$performance_details$seconds_to_review[2]
  } else {
    sec_review_2 <- NA
  }
  
  ## Merge
  goldstd[i, ] <- data.frame(id_obs = id_obs, subsample = subsample, coder_1 = coder_1, coder_2 = coder_2, consensus = consensus, 
                             sec_create_1 = sec_create_1, sec_create_2 = sec_create_2, sec_review_1 = sec_review_1, 
                             sec_review_2 = sec_review_2, stringsAsFactors = FALSE)
}

## Checking
table(goldstd$consensus)
193 + 1717 + 90
table(goldstd$coder_1) ## toxic 1185
table(goldstd$coder_2) ## toxic 1008

## Observations validated directly (n = 90)
goldstd$coder_2[is.na(goldstd$coder_2)] <- goldstd$coder_1[is.na(goldstd$coder_2)]
goldstd$sec_create_2[is.na(goldstd$sec_create_2)] <- goldstd$sec_create_1[is.na(goldstd$sec_create_2)]
goldstd$sec_review_2[is.na(goldstd$sec_review_2)] <- goldstd$sec_review_1[is.na(goldstd$sec_review_2)]

## Check variable
goldstd$check <- ifelse(goldstd$coder_1 == goldstd$coder_2, 1, 0)

## Logical test
table(goldstd$consensus, goldstd$check)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### VOR Datasets ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Protests and Convention
## table(goldstd$subsample)
convention <- filter(goldstd, subsample == "CON_Q1" | subsample == "CON_Q2" | subsample == "CON_Q3" | subsample == "CON_Q4" | subsample == "CON_Q5")
protests <- filter(goldstd, subsample != "CON_Q1" & subsample != "CON_Q2" & subsample != "CON_Q3" & subsample != "CON_Q4" & subsample != "CON_Q5")

## Observations without human agreement
1000 - sum(convention$consensus) + 1000 - sum(protests$check) ## 165 convention and 28 protests

## Convention
convention$id_obs <- gsub("id_|\\.txt", "", convention$id_obs)
convention$id_obs <- as.numeric(convention$id_obs)
convention$coder_1 <- ifelse(convention$coder_1 == "toxico", 1, 0)
convention$coder_2 <- ifelse(convention$coder_2 == "toxico", 1, 0)
convention$subsample <- NULL
convention$check <- NULL
goldstd_Convention <- left_join(convention, sample_convention, by = "id_obs")
write.csv(goldstd_Convention, "data/tidy/goldstd_Convention.csv", fileEncoding = "UTF-8", row.names =  FALSE)

## Protests in Argentina and Chile
protests$id_obs <- gsub("id_|\\.txt", "", protests$id_obs)
protests$id_obs <- as.numeric(protests$id_obs)
protests$coder_1 <- ifelse(protests$coder_1 == "toxico", 1, 0)
protests$coder_2 <- ifelse(protests$coder_2 == "toxico", 1, 0)
protests$subsample <- NULL
protests$check <- NULL
goldstd_protests <- left_join(protests, sample_protests, by = "id_obs")
write.csv(goldstd_protests, "data/tidy/goldstd_protests.csv", fileEncoding = "UTF-8", row.names =  FALSE)
