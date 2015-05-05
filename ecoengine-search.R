## Load library(ecoengine)
library(ecoengine)
## Download all California bird records in Ecoengine
cal_birds <- ee_observations(clss = 'aves', min_date = '1900-01-01 00:00:00', max_date = '2015-01-01 00:00:00', state_province = 'California', georeferenced = TRUE, page = "all")$data
# save search result as serialized object to be loaded into Shiny app
saveRDS(cal_birds, file = "data/cal_birds.rds")
## Download all California mammal records in Ecoengine
cal_mammals <- ee_observations(clss = 'mammalia', min_date = '1900-01-01 00:00:00', max_date = '2015-01-01 00:00:00', state_province = 'California', georeferenced = TRUE, page = "all")$data
# save search result as serialized object to be loaded into Shiny app
saveRDS(cal_mammals, file = "data/cal_mammals.rds")
## Download all California reptile records in Ecoengine
cal_reptiles <- ee_observations(clss = 'reptilia', min_date = '1900-01-01 00:00:00', max_date = '2015-01-01 00:00:00', state_province = 'California', georeferenced = TRUE, page = "all")$data
# save search result as serialized object to be loaded into Shiny app
saveRDS(cal_reptiles, file = "data/cal_reptiles.rds")
## Download all California amphibian records in Ecoengine
cal_amphibians <- ee_observations(clss = 'amphibia', min_date = '1900-01-01 00:00:00', max_date = '2015-01-01 00:00:00', state_province = 'California', georeferenced = TRUE, page = "all")$data
# save search result as serialized object to be loaded into Shiny app
saveRDS(cal_amphibians, file = "data/cal_amphibians.rds")
## Download all California insect records in Ecoengine
cal_insects <- ee_observations(clss = 'insecta', min_date = '1900-01-01 00:00:00', max_date = '2015-01-01 00:00:00', state_province = 'California', georeferenced = TRUE, page = "all")$data
# save search result as serialized object to be loaded into Shiny app
saveRDS(cal_insects, file = "data/cal_insects.rds")
## Download all California plant records in Ecoengine
cal_plants <- ee_observations(kingdom = 'plantae', min_date = '1900-01-01 00:00:00', max_date = '2015-01-01 00:00:00', state_province = 'California', georeferenced = TRUE, page = "all")$data
# save search result as serialized object to be loaded into Shiny app
saveRDS(cal_plants, file = "data/cal_plants.rds")



