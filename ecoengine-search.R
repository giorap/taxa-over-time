### R code to download and process records from the Berkeley Econinformatics Engine  
### on which the taxa-over-time Shiny app is based
## Load packages
library(ecoengine)
library(dplyr)
## Download Ecoegine records
# Download all California amphibian records in Ecoengine
cal_amphibians <- ee_observations(clss = 'amphibia', min_date = '1900-01-01 00:00:00', max_date = '2015-01-01 00:00:00', state_province = 'California', georeferenced = TRUE, page = "all")$data
# Download all California bird records in Ecoengine
cal_birds <- ee_observations(clss = 'aves', min_date = '1900-01-01 00:00:00', max_date = '2015-01-01 00:00:00', state_province = 'California', georeferenced = TRUE, page = "all")$data
# Download all California insect records in Ecoengine
cal_insects <- ee_observations(clss = 'insecta', min_date = '1900-01-01 00:00:00', max_date = '2015-01-01 00:00:00', state_province = 'California', georeferenced = TRUE, page = "all")$data
# Download all California mammal records in Ecoengine
cal_mammals <- ee_observations(clss = 'mammalia', min_date = '1900-01-01 00:00:00', max_date = '2015-01-01 00:00:00', state_province = 'California', georeferenced = TRUE, page = "all")$data
# Download all California plant records in Ecoengine
cal_plants <- ee_observations(kingdom = 'plantae', min_date = '1900-01-01 00:00:00', max_date = '2015-01-01 00:00:00', state_province = 'California', georeferenced = TRUE, page = "all")$data
# Download all California reptile records in Ecoengine
cal_reptiles <- ee_observations(clss = 'reptilia', min_date = '1900-01-01 00:00:00', max_date = '2015-01-01 00:00:00', state_province = 'California', georeferenced = TRUE, page = "all")$data
## Process data.frames
# Add a taxon field
cal_amphibians$taxon <- 'Amphibians'
cal_birds$taxon <- 'Birds'
cal_insects$taxon <- 'Insects'
cal_mammals$taxon <- 'Mammals'
cal_plants$taxon <- 'Plants'
cal_reptiles$taxon <- 'Reptiles'
# Bind individual taxon data.frames
taxon_table <- rbind(cal_amphibians, cal_birds, cal_insects, 
                     cal_mammals, cal_plants, cal_reptiles)
# Add a year field
taxon_table$year <- as.numeric(substr(taxon_table$begin_date, 1, 4))
# Remove years prior to 1900
taxon_table <- taxon_table %>% filter(year >= 1900)
# Keep useful columns only
taxon_table <- taxon_table[c('taxon', 'year')]
## Save serialized object
saveRDS(taxon_table, file = 'data/taxon_table.rds')
