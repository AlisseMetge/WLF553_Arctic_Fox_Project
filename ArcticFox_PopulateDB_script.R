# Load packages

library(tidyverse)
library(DBI)

## Establish connection to database
ArcticFox_db <- dbConnect(RSQLite::SQLite(), "ArcticFox_db.db")

# Load Data ####

phenology <- read.csv("raw_data/morph_phenology.csv")
moult <- read.csv("raw_data/seasonal_moulting_phenology.csv")
sites <- read.csv("raw_data/sites.csv")

# Create modified tables and populate the database ####
# sites table csv was already created manually

# Populate sites table ####

dbWriteTable(ArcticFox_db, "sites", sites, append = TRUE)

# check
dbGetQuery(ArcticFox_db, "SELECT * FROM sites;")

# Create site_year_conditions table ####

site_year_conditions <- phenology %>%
  left_join(sites, by = "site") %>%
  mutate(site_id_year = paste(site_id, year, sep = "_")) %>%
  select(-c(morph, indiv_ID, start_95, median_50, end_0)) %>%
  distinct() %>%
  select(-site, -site_id_year) %>%
  relocate(site_id, .before = year)

# Populate site_year_conditions table ####

dbWriteTable(ArcticFox_db, "site_year_conditions", 
             site_year_conditions, append = TRUE)

#check:
dbGetQuery(ArcticFox_db, "SELECT * FROM site_year_conditions;")


# Create individuals table ####

individuals <- phenology %>% 
  select(indiv_ID, morph)%>%
  distinct()

# Populate the individuals table ####

dbWriteTable(ArcticFox_db, "individuals", individuals, append = TRUE)

#check:
dbGetQuery(ArcticFox_db, "SELECT * FROM individuals;")

# Create molt observations table ####
site_year_conditions <- dbGetQuery(ArcticFox_db, 
                                   "SELECT * FROM site_year_conditions;")

molt_observations <- moult %>%
  left_join(sites, by = "site") %>%
  left_join(site_year_conditions) %>%
  select(site_year_id, indiv_ID, date, moult_score)

# Populate the molt_observation table

dbWriteTable(ArcticFox_db, "molt_observations", 
             molt_observations, append = TRUE)

#check:
dbGetQuery(ArcticFox_db, "SELECT * FROM molt_observations;")
