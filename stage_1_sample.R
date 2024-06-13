## Draft Sample Code for Labelling
## Bastián González-Bustamante
## R version 4.3.3 (2024-02-29 ucrt) -- "Angel Food Cake"
## June 2024

## Clean Environment
rm(list = ls())

## Package
library(arrow)
library(tidyverse)

## Open Parquet
pointer_digital_protests <- open_dataset("../digital-protests/data/tidy/toxicity/tox_digital_protests.gz.parquet")
pointer_Convention <- open_dataset("../twConvention/data/tidy/toxicity/tox_Convention.gz.parquet")

## Identify problematic messages for classification
suspended <- "account is temporarily unavailable"
url_pattern <- "https://t.co/"
## emoji_pattern <- "[\U0001F600-\U0001F64F\U0001F300-\U0001F5FF\U0001F680-\U0001F6FF\U0001F700-\U0001F77F\U0001F780-\U0001F7FF\U0001F800-\U0001F8FF\U0001F900-\U0001F9FF\U0001FA00-\U0001FA6F\U0001FA70-\U0001FAFF]"

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Argentina Q1 ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ARG_Q1 <- pointer_digital_protests %>% 
  filter(country == "Argentina" & !str_detect(text, "^RT") & !str_detect(text, "\n") & !str_detect(text, suspended) & !str_detect(text, url_pattern)
         & TOXICITY <= 0.20) %>%
  collect()
ARG_Q1 <- ARG_Q1 %>% distinct(text, .keep_all = TRUE)
ARG_Q1 <- sample_n(ARG_Q1, 120, replace = FALSE)
table(duplicated(ARG_Q1$id_obs))

ARG_Q1_sample <- slice(ARG_Q1, 1:100)
ARG_Q1_oversample <- slice(ARG_Q1, 101:120)
write.csv(ARG_Q1_sample, "data/raw/csv/ARG_Q1_sample.csv", fileEncoding = "UTF-8", row.names =  FALSE)
write.csv(ARG_Q1_oversample, "data/raw/csv/ARG_Q1_oversample.csv", fileEncoding = "UTF-8", row.names =  FALSE)

## Ensure UTF-8
ARG_Q1_sample <- data.frame(lapply(ARG_Q1_sample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(ARG_Q1_sample)) {
  id <- ARG_Q1_sample[i, "id_obs"]
  text <- ARG_Q1_sample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/ARG_Q1_sample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## Ensure UTF-8
ARG_Q1_oversample <- data.frame(lapply(ARG_Q1_oversample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(ARG_Q1_oversample)) {
  id <- ARG_Q1_oversample[i, "id_obs"]
  text <- ARG_Q1_oversample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/ARG_Q1_oversample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Argentina Q2 ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ARG_Q2 <- pointer_digital_protests %>% 
  filter(country == "Argentina" & !str_detect(text, "^RT") & !str_detect(text, "\n") & !str_detect(text, suspended) & !str_detect(text, url_pattern)
         & TOXICITY >= 0.21 & TOXICITY <= 0.40) %>%
  collect()
ARG_Q2 <- ARG_Q2 %>% distinct(text, .keep_all = TRUE)
ARG_Q2 <- sample_n(ARG_Q2, 120, replace = FALSE)
table(duplicated(ARG_Q2$id_obs))

ARG_Q2_sample <- slice(ARG_Q2, 1:100)
ARG_Q2_oversample <- slice(ARG_Q2, 101:120)
write.csv(ARG_Q2_sample, "data/raw/csv/ARG_Q2_sample.csv", fileEncoding = "UTF-8", row.names =  FALSE)
write.csv(ARG_Q2_oversample, "data/raw/csv/ARG_Q2_oversample.csv", fileEncoding = "UTF-8", row.names =  FALSE)

## Ensure UTF-8
ARG_Q2_sample <- data.frame(lapply(ARG_Q2_sample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(ARG_Q2_sample)) {
  id <- ARG_Q2_sample[i, "id_obs"]
  text <- ARG_Q2_sample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/ARG_Q2_sample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## Ensure UTF-8
ARG_Q2_oversample <- data.frame(lapply(ARG_Q2_oversample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(ARG_Q2_oversample)) {
  id <- ARG_Q2_oversample[i, "id_obs"]
  text <- ARG_Q2_oversample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/ARG_Q2_oversample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Argentina Q3 ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ARG_Q3 <- pointer_digital_protests %>% 
  filter(country == "Argentina" & !str_detect(text, "^RT") & !str_detect(text, "\n") & !str_detect(text, suspended) & !str_detect(text, url_pattern)
         & TOXICITY >= 0.41 & TOXICITY <= 0.60) %>%
  collect()
ARG_Q3 <- ARG_Q3 %>% distinct(text, .keep_all = TRUE)
ARG_Q3 <- sample_n(ARG_Q3, 120, replace = FALSE)
table(duplicated(ARG_Q3$id_obs))

ARG_Q3_sample <- slice(ARG_Q3, 1:100)
ARG_Q3_oversample <- slice(ARG_Q3, 101:120)
write.csv(ARG_Q3_sample, "data/raw/csv/ARG_Q3_sample.csv", fileEncoding = "UTF-8", row.names =  FALSE)
write.csv(ARG_Q3_oversample, "data/raw/csv/ARG_Q3_oversample.csv", fileEncoding = "UTF-8", row.names =  FALSE)

## Ensure UTF-8
ARG_Q3_sample <- data.frame(lapply(ARG_Q3_sample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(ARG_Q3_sample)) {
  id <- ARG_Q3_sample[i, "id_obs"]
  text <- ARG_Q3_sample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/ARG_Q3_sample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## Ensure UTF-8
ARG_Q3_oversample <- data.frame(lapply(ARG_Q3_oversample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(ARG_Q3_oversample)) {
  id <- ARG_Q3_oversample[i, "id_obs"]
  text <- ARG_Q3_oversample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/ARG_Q3_oversample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Argentina Q4 ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ARG_Q4 <- pointer_digital_protests %>% 
  filter(country == "Argentina" & !str_detect(text, "^RT") & !str_detect(text, "\n") & !str_detect(text, suspended) & !str_detect(text, url_pattern)
         & TOXICITY >= 0.61 & TOXICITY <= 0.80) %>%
  collect()
ARG_Q4 <- ARG_Q4 %>% distinct(text, .keep_all = TRUE)
ARG_Q4 <- sample_n(ARG_Q4, 120, replace = FALSE)
table(duplicated(ARG_Q4$id_obs))

ARG_Q4_sample <- slice(ARG_Q4, 1:100)
ARG_Q4_oversample <- slice(ARG_Q4, 101:120)
write.csv(ARG_Q4_sample, "data/raw/csv/ARG_Q4_sample.csv", fileEncoding = "UTF-8", row.names =  FALSE)
write.csv(ARG_Q4_oversample, "data/raw/csv/ARG_Q4_oversample.csv", fileEncoding = "UTF-8", row.names =  FALSE)

## Ensure UTF-8
ARG_Q4_sample <- data.frame(lapply(ARG_Q4_sample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(ARG_Q4_sample)) {
  id <- ARG_Q4_sample[i, "id_obs"]
  text <- ARG_Q4_sample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/ARG_Q4_sample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## Ensure UTF-8
ARG_Q4_oversample <- data.frame(lapply(ARG_Q4_oversample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(ARG_Q4_oversample)) {
  id <- ARG_Q4_oversample[i, "id_obs"]
  text <- ARG_Q4_oversample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/ARG_Q4_oversample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Argentina Q5 ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ARG_Q5 <- pointer_digital_protests %>% 
  filter(country == "Argentina" & !str_detect(text, "^RT") & !str_detect(text, "\n") & !str_detect(text, suspended) & !str_detect(text, url_pattern)
         & TOXICITY >= 0.81) %>%
  collect()
ARG_Q5 <- ARG_Q5 %>% distinct(text, .keep_all = TRUE)
ARG_Q5 <- sample_n(ARG_Q5, 120, replace = FALSE)
table(duplicated(ARG_Q5$id_obs))

ARG_Q5_sample <- slice(ARG_Q5, 1:100)
ARG_Q5_oversample <- slice(ARG_Q5, 101:120)
write.csv(ARG_Q5_sample, "data/raw/csv/ARG_Q5_sample.csv", fileEncoding = "UTF-8", row.names =  FALSE)
write.csv(ARG_Q5_oversample, "data/raw/csv/ARG_Q5_oversample.csv", fileEncoding = "UTF-8", row.names =  FALSE)

## Ensure UTF-8
ARG_Q5_sample <- data.frame(lapply(ARG_Q5_sample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(ARG_Q5_sample)) {
  id <- ARG_Q5_sample[i, "id_obs"]
  text <- ARG_Q5_sample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/ARG_Q5_sample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## Ensure UTF-8
ARG_Q5_oversample <- data.frame(lapply(ARG_Q5_oversample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(ARG_Q5_oversample)) {
  id <- ARG_Q5_oversample[i, "id_obs"]
  text <- ARG_Q5_oversample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/ARG_Q5_oversample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Chile Q1 ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CHL_Q1 <- pointer_digital_protests %>% 
  filter(country == "Chile" & !str_detect(text, "^RT") & !str_detect(text, "\n") & !str_detect(text, suspended) & !str_detect(text, url_pattern)
         & TOXICITY <= 0.20) %>%
  collect()
CHL_Q1 <- CHL_Q1 %>% distinct(text, .keep_all = TRUE)
CHL_Q1 <- sample_n(CHL_Q1, 120, replace = FALSE)
table(duplicated(CHL_Q1$id_obs))

CHL_Q1_sample <- slice(CHL_Q1, 1:100)
CHL_Q1_oversample <- slice(CHL_Q1, 101:120)
write.csv(CHL_Q1_sample, "data/raw/csv/CHL_Q1_sample.csv", fileEncoding = "UTF-8", row.names =  FALSE)
write.csv(CHL_Q1_oversample, "data/raw/csv/CHL_Q1_oversample.csv", fileEncoding = "UTF-8", row.names =  FALSE)

## Ensure UTF-8
CHL_Q1_sample <- data.frame(lapply(CHL_Q1_sample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CHL_Q1_sample)) {
  id <- CHL_Q1_sample[i, "id_obs"]
  text <- CHL_Q1_sample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CHL_Q1_sample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## Ensure UTF-8
CHL_Q1_oversample <- data.frame(lapply(CHL_Q1_oversample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CHL_Q1_oversample)) {
  id <- CHL_Q1_oversample[i, "id_obs"]
  text <- CHL_Q1_oversample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CHL_Q1_oversample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Chile Q2 ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CHL_Q2 <- pointer_digital_protests %>% 
  filter(country == "Chile" & !str_detect(text, "^RT") & !str_detect(text, "\n") & !str_detect(text, suspended) & !str_detect(text, url_pattern)
         & TOXICITY >= 0.21 & TOXICITY <= 0.40) %>%
  collect()
CHL_Q2 <- CHL_Q2 %>% distinct(text, .keep_all = TRUE)
CHL_Q2 <- sample_n(CHL_Q2, 120, replace = FALSE)
table(duplicated(CHL_Q2$id_obs))

CHL_Q2_sample <- slice(CHL_Q2, 1:100)
CHL_Q2_oversample <- slice(CHL_Q2, 101:120)
write.csv(CHL_Q2_sample, "data/raw/csv/CHL_Q2_sample.csv", fileEncoding = "UTF-8", row.names =  FALSE)
write.csv(CHL_Q2_oversample, "data/raw/csv/CHL_Q2_oversample.csv", fileEncoding = "UTF-8", row.names =  FALSE)

## Ensure UTF-8
CHL_Q2_sample <- data.frame(lapply(CHL_Q2_sample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CHL_Q2_sample)) {
  id <- CHL_Q2_sample[i, "id_obs"]
  text <- CHL_Q2_sample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CHL_Q2_sample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## Ensure UTF-8
CHL_Q2_oversample <- data.frame(lapply(CHL_Q2_oversample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CHL_Q2_oversample)) {
  id <- CHL_Q2_oversample[i, "id_obs"]
  text <- CHL_Q2_oversample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CHL_Q2_oversample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Chile Q3 ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CHL_Q3 <- pointer_digital_protests %>% 
  filter(country == "Chile" & !str_detect(text, "^RT") & !str_detect(text, "\n") & !str_detect(text, suspended) & !str_detect(text, url_pattern)
         & TOXICITY >= 0.41 & TOXICITY <= 0.60) %>%
  collect()
CHL_Q3 <- CHL_Q3 %>% distinct(text, .keep_all = TRUE)
CHL_Q3 <- sample_n(CHL_Q3, 120, replace = FALSE)
table(duplicated(CHL_Q3$id_obs))

CHL_Q3_sample <- slice(CHL_Q3, 1:100)
CHL_Q3_oversample <- slice(CHL_Q3, 101:120)
write.csv(CHL_Q3_sample, "data/raw/csv/CHL_Q3_sample.csv", fileEncoding = "UTF-8", row.names =  FALSE)
write.csv(CHL_Q3_oversample, "data/raw/csv/CHL_Q3_oversample.csv", fileEncoding = "UTF-8", row.names =  FALSE)

## Ensure UTF-8
CHL_Q3_sample <- data.frame(lapply(CHL_Q3_sample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CHL_Q3_sample)) {
  id <- CHL_Q3_sample[i, "id_obs"]
  text <- CHL_Q3_sample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CHL_Q3_sample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## Ensure UTF-8
CHL_Q3_oversample <- data.frame(lapply(CHL_Q3_oversample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CHL_Q3_oversample)) {
  id <- CHL_Q3_oversample[i, "id_obs"]
  text <- CHL_Q3_oversample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CHL_Q3_oversample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Chile Q4 ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CHL_Q4 <- pointer_digital_protests %>% 
  filter(country == "Chile" & !str_detect(text, "^RT") & !str_detect(text, "\n") & !str_detect(text, suspended) & !str_detect(text, url_pattern)
         & TOXICITY >= 0.61 & TOXICITY <= 0.80) %>%
  collect()
CHL_Q4 <- CHL_Q4 %>% distinct(text, .keep_all = TRUE)
CHL_Q4 <- sample_n(CHL_Q4, 120, replace = FALSE)
table(duplicated(CHL_Q4$id_obs))

CHL_Q4_sample <- slice(CHL_Q4, 1:100)
CHL_Q4_oversample <- slice(CHL_Q4, 101:120)
write.csv(CHL_Q4_sample, "data/raw/csv/CHL_Q4_sample.csv", fileEncoding = "UTF-8", row.names =  FALSE)
write.csv(CHL_Q4_oversample, "data/raw/csv/CHL_Q4_oversample.csv", fileEncoding = "UTF-8", row.names =  FALSE)

## Ensure UTF-8
CHL_Q4_sample <- data.frame(lapply(CHL_Q4_sample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CHL_Q4_sample)) {
  id <- CHL_Q4_sample[i, "id_obs"]
  text <- CHL_Q4_sample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CHL_Q4_sample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## Ensure UTF-8
CHL_Q4_oversample <- data.frame(lapply(CHL_Q4_oversample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CHL_Q4_oversample)) {
  id <- CHL_Q4_oversample[i, "id_obs"]
  text <- CHL_Q4_oversample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CHL_Q4_oversample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Chile Q5 ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CHL_Q5 <- pointer_digital_protests %>% 
  filter(country == "Chile" & !str_detect(text, "^RT") & !str_detect(text, "\n") & !str_detect(text, suspended) & !str_detect(text, url_pattern)
         & TOXICITY >= 0.81) %>%
  collect()
CHL_Q5 <- CHL_Q5 %>% distinct(text, .keep_all = TRUE)
CHL_Q5 <- sample_n(CHL_Q5, 120, replace = FALSE)
table(duplicated(CHL_Q5$id_obs))

CHL_Q5_sample <- slice(CHL_Q5, 1:100)
CHL_Q5_oversample <- slice(CHL_Q5, 101:120)
write.csv(CHL_Q5_sample, "data/raw/csv/CHL_Q5_sample.csv", fileEncoding = "UTF-8", row.names =  FALSE)
write.csv(CHL_Q5_oversample, "data/raw/csv/CHL_Q5_oversample.csv", fileEncoding = "UTF-8", row.names =  FALSE)

## Ensure UTF-8
CHL_Q5_sample <- data.frame(lapply(CHL_Q5_sample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CHL_Q5_sample)) {
  id <- CHL_Q5_sample[i, "id_obs"]
  text <- CHL_Q5_sample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CHL_Q5_sample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## Ensure UTF-8
CHL_Q5_oversample <- data.frame(lapply(CHL_Q5_oversample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CHL_Q5_oversample)) {
  id <- CHL_Q5_oversample[i, "id_obs"]
  text <- CHL_Q5_oversample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CHL_Q5_oversample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Convention Q1 ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CON_Q1 <- pointer_Convention %>% 
  filter(!str_detect(text, "^RT") & !str_detect(text, "\n") & !str_detect(text, suspended) & !str_detect(text, url_pattern)
         & TOXICITY <= 0.20) %>%
  collect()
CON_Q1 <- CON_Q1 %>% distinct(text, .keep_all = TRUE)
CON_Q1 <- sample_n(CON_Q1, 240, replace = FALSE)
table(duplicated(CON_Q1$id_obs))

CON_Q1_sample <- slice(CON_Q1, 1:200)
CON_Q1_oversample <- slice(CON_Q1, 201:240)
write.csv(CON_Q1_sample, "data/raw/csv/CON_Q1_sample.csv", fileEncoding = "UTF-8", row.names =  FALSE)
write.csv(CON_Q1_oversample, "data/raw/csv/CON_Q1_oversample.csv", fileEncoding = "UTF-8", row.names =  FALSE)

## Ensure UTF-8
CON_Q1_sample <- data.frame(lapply(CON_Q1_sample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CON_Q1_sample)) {
  id <- CON_Q1_sample[i, "id_obs"]
  text <- CON_Q1_sample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CON_Q1_sample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## Ensure UTF-8
CON_Q1_oversample <- data.frame(lapply(CON_Q1_oversample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CON_Q1_oversample)) {
  id <- CON_Q1_oversample[i, "id_obs"]
  text <- CON_Q1_oversample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CON_Q1_oversample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Convention Q2 ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CON_Q2 <- pointer_Convention %>% 
  filter(!str_detect(text, "^RT") & !str_detect(text, "\n") & !str_detect(text, suspended) & !str_detect(text, url_pattern)
         & TOXICITY >= 0.21 & TOXICITY <= 0.40) %>%
  collect()
CON_Q2 <- CON_Q2 %>% distinct(text, .keep_all = TRUE)
CON_Q2 <- sample_n(CON_Q2, 240, replace = FALSE)
table(duplicated(CON_Q2$id_obs))

CON_Q2_sample <- slice(CON_Q2, 1:200)
CON_Q2_oversample <- slice(CON_Q2, 201:240)
write.csv(CON_Q2_sample, "data/raw/csv/CON_Q2_sample.csv", fileEncoding = "UTF-8", row.names =  FALSE)
write.csv(CON_Q2_oversample, "data/raw/csv/CON_Q2_oversample.csv", fileEncoding = "UTF-8", row.names =  FALSE)

## Ensure UTF-8
CON_Q2_sample <- data.frame(lapply(CON_Q2_sample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CON_Q2_sample)) {
  id <- CON_Q2_sample[i, "id_obs"]
  text <- CON_Q2_sample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CON_Q2_sample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## Ensure UTF-8
CON_Q2_oversample <- data.frame(lapply(CON_Q2_oversample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CON_Q2_oversample)) {
  id <- CON_Q2_oversample[i, "id_obs"]
  text <- CON_Q2_oversample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CON_Q2_oversample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Convention Q3 ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CON_Q3 <- pointer_Convention %>% 
  filter(!str_detect(text, "^RT") & !str_detect(text, "\n") & !str_detect(text, suspended) & !str_detect(text, url_pattern)
         & TOXICITY >= 0.41 & TOXICITY <= 0.60) %>%
  collect()
CON_Q3 <- CON_Q3 %>% distinct(text, .keep_all = TRUE)
CON_Q3 <- sample_n(CON_Q3, 240, replace = FALSE)
table(duplicated(CON_Q3$id_obs))

CON_Q3_sample <- slice(CON_Q3, 1:200)
CON_Q3_oversample <- slice(CON_Q3, 201:240)
write.csv(CON_Q3_sample, "data/raw/csv/CON_Q3_sample.csv", fileEncoding = "UTF-8", row.names =  FALSE)
write.csv(CON_Q3_oversample, "data/raw/csv/CON_Q3_oversample.csv", fileEncoding = "UTF-8", row.names =  FALSE)

## Ensure UTF-8
CON_Q3_sample <- data.frame(lapply(CON_Q3_sample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CON_Q3_sample)) {
  id <- CON_Q3_sample[i, "id_obs"]
  text <- CON_Q3_sample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CON_Q3_sample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## Ensure UTF-8
CON_Q3_oversample <- data.frame(lapply(CON_Q3_oversample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CON_Q3_oversample)) {
  id <- CON_Q3_oversample[i, "id_obs"]
  text <- CON_Q3_oversample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CON_Q3_oversample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Convention Q4 ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CON_Q4 <- pointer_Convention %>% 
  filter(!str_detect(text, "^RT") & !str_detect(text, "\n") & !str_detect(text, suspended) & !str_detect(text, url_pattern)
         & TOXICITY >= 0.61 & TOXICITY <= 0.80) %>%
  collect()
CON_Q4 <- CON_Q4 %>% distinct(text, .keep_all = TRUE)
CON_Q4 <- sample_n(CON_Q4, 240, replace = FALSE)
table(duplicated(CON_Q4$id_obs))

CON_Q4_sample <- slice(CON_Q4, 1:200)
CON_Q4_oversample <- slice(CON_Q4, 201:240)
write.csv(CON_Q4_sample, "data/raw/csv/CON_Q4_sample.csv", fileEncoding = "UTF-8", row.names =  FALSE)
write.csv(CON_Q4_oversample, "data/raw/csv/CON_Q4_oversample.csv", fileEncoding = "UTF-8", row.names =  FALSE)

## Ensure UTF-8
CON_Q4_sample <- data.frame(lapply(CON_Q4_sample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CON_Q4_sample)) {
  id <- CON_Q4_sample[i, "id_obs"]
  text <- CON_Q4_sample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CON_Q4_sample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## Ensure UTF-8
CON_Q4_oversample <- data.frame(lapply(CON_Q4_oversample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CON_Q4_oversample)) {
  id <- CON_Q4_oversample[i, "id_obs"]
  text <- CON_Q4_oversample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CON_Q4_oversample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Chile Q5 ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CON_Q5 <- pointer_Convention %>% 
  filter(!str_detect(text, "^RT") & !str_detect(text, "\n") & !str_detect(text, suspended) & !str_detect(text, url_pattern)
         & TOXICITY >= 0.81) %>%
  collect()
CON_Q5 <- CON_Q5 %>% distinct(text, .keep_all = TRUE)
CON_Q5 <- sample_n(CON_Q5, 240, replace = FALSE)
table(duplicated(CON_Q5$id_obs))

CON_Q5_sample <- slice(CON_Q5, 1:200)
CON_Q5_oversample <- slice(CON_Q5, 201:240)
write.csv(CON_Q5_sample, "data/raw/csv/CON_Q5_sample.csv", fileEncoding = "UTF-8", row.names =  FALSE)
write.csv(CON_Q5_oversample, "data/raw/csv/CON_Q5_oversample.csv", fileEncoding = "UTF-8", row.names =  FALSE)

## Ensure UTF-8
CON_Q5_sample <- data.frame(lapply(CON_Q5_sample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CON_Q5_sample)) {
  id <- CON_Q5_sample[i, "id_obs"]
  text <- CON_Q5_sample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CON_Q5_sample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}

## Ensure UTF-8
CON_Q5_oversample <- data.frame(lapply(CON_Q5_oversample, function(x) {
  if (is.character(x)) {
    Encoding(x) <- "UTF-8"
  }
  return(x)
}))

## Loop for Separate TXT files
for (i in 1:nrow(CON_Q5_oversample)) {
  id <- CON_Q5_oversample[i, "id_obs"]
  text <- CON_Q5_oversample[i, "text"]
  
  ## Create Files based on ID
  file_name <- paste0("data/raw/CON_Q5_oversample/id_", id, ".txt")
  
  ## TXT with UTF-8
  writeLines(text, file_name, useBytes = TRUE)
}
