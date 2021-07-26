tsunami = read.csv(file="tsunami_dataset.csv")
hist(tsunami$EQ_MAGNITUDE, xlab="Magnitude", main = "Frequency of tsunami magnitudes")
summary(tsunami$EQ_MAGNITUDE)
tsunamiCountries = table(tsunami$COUNTRY); tsunamiCountries
# summary(tsunami$COUNTRY)

# Please install packages for full functionality
# install.packages("datacombine")
# library("datacombine")

tsunamiMagnitude = tsunami$EQ_MAGNITUDE; tsunamiMagnitude
tsunamiMagnitude2 = tsunami[!is.na(tsunamiMagnitude),]; # Creating a new dataset without NAs in magnitude
tsunamiMagnitude3 = tsunamiMagnitude2$EQ_MAGNITUDE; tsunamiMagnitude3
mean(tsunamiMagnitude3)

sd(tsunamiCountries)
# How likely is it that magnitude is bigger than 7?
pnorm(7, mean = 7.046676, sd = 0.7961247, FALSE)

RGNMagnitudes = rnorm(10, mean = 7.046676, sd = 0.7961247) # RGN Magnitudes
damage = RGNMagnitudes * rnorm(1); abs(damage)


# Loop through non NA elements
# for(n in 1:length(tsunamiMagnitude)) {
#   if(!is.na(tsunamiMagnitude[n])) {
#     print(tsunamiMagnitude[n])
#   }
# }

# cleanMagnitude[n] <- tsunamiMagnitude[n]
# cleanMagnitude

# if(tsunamiMagnitude == !is.na(data))

table(tsunamiMagnitude)
tsunamiDamage = tsunami$DAMAGE_TOTAL_DESCRIPTION

plot(tsunamiMagnitude, tsunamiDamage, ylim = max(tsunamiMagnitude))

# install.packages("ggpubr")
library("ggpubr")

# Libraries


# install.packages(c("ggplot2", "devtools", "dplyr", "stringr"))
# install.packages(c("cowplot", "googleway", "ggplot2", "ggrepel", 
#                    "ggspatial", "libwgeom", "sf", "rnaturalearth", "rnaturalearthdata"))
# install.packages("ggmap")
# install.packages("mapproj")

library(ggplot2)
library(dplyr)
library(mapproj)
library(maps)
library(tidyverse)
library(plotly)

tsunamiLong <- tsunami$LONGITUDE
tsunamiLat <- tsunami$LATITUDE

world <- map_data("world")

ggplot() +
  geom_map(
    data = world, map = world,
    aes(long, lat, map_id = region),
    color = "#777777", fill = "lightgray", size = 0.01
  ) +
geom_point(
  data = tsunami,
  aes(tsunamiLong, tsunamiLat, color = tsunamiMagnitude), # or DAMAGE_TOTAL_DESCRIPTION
  alpha = 0.7
)

##################################
#### 22 03 2021

# randomMagnitude = rnorm(1, mean = 7.046676, sd = 0.7961247); randomMagnitude
# 
# # 1000 iterations
# 
# nArray = c()
# damageArray = c()
# 
# for(n in 1:1000) {
#   luck <- runif(1, 1, 10);
#   
#   damage = randomMagnitude * luck;
#   
#   nArray[n] <- n
#   
#   damageArray[n] <- damage
#   
# }
# 
# summary(damageArray)
# 
# plot(nArray, damageArray, type = "p")

# low medium high extreme