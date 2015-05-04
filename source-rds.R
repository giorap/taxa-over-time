## Load serialized objects obtained from library(ecoengine) search (see ecoengine-observations.R)
cal_amphibians <- data.frame(readRDS("data/cal_amphibians.rds"), 
                             taxon = 'Amphibians')
cal_birds <- data.frame(readRDS("data/cal_birds.rds"),
                        taxon = 'Birds')
cal_insects <- data.frame(readRDS("data/cal_insects.rds"),
                          taxon = 'Insects')                                    
cal_mammals <- data.frame(readRDS("data/cal_mammals.rds"),
                          taxon = 'Mammals')                                    
cal_plants <- data.frame(readRDS("data/cal_plants.rds"),
                         taxon = 'Plants')                                   
cal_reptiles <- data.frame(readRDS("data/cal_reptiles.rds"),
                           taxon = 'Reptiles')                                     
## Process data objects
# Bind individual taxon data.frames
taxon_table <- rbind(cal_amphibians, cal_birds, cal_insects, 
                     cal_mammals, cal_plants, cal_reptiles)
# Add a year field
taxon_table$year <- as.numeric(substr(taxon_table$begin_date, 1, 4))
# Remove years prior to 1900
taxon_table <- subset(taxon_table, year >= 1900)
