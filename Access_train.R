library(shinydashboard)
library(leaflet)
library(ggmap)
library(ggplot2)
library(googleway)
library(dplyr)

#read file
stations<-read.csv("/Users/yokk/Desktop/MDS/2018_2/IE_Project/Dataset/metro_stations_accessibility.csv",sep=",")
access_stations<- stations[stations$lift=='Yes',]# removed if lift ==No

station_icon <-iconList(
  "Yes"= makeIcon(iconUrl = "/Users/yokk/Desktop/MDS/2018_2/IE_Project/Dataset/icons/train.png"
                       ,iconRetinaUrl = "/Users/yokk/Desktop/MDS/2018_2/IE_Project/Dataset/icons/train.png"
                       ,24,24)
  ,"No"= makeIcon(iconUrl = "/Users/yokk/Desktop/MDS/2018_2/IE_Project/Dataset/icons/notrain.png"
                     ,iconRetinaUrl = "/Users/yokk/Desktop/MDS/2018_2/IE_Project/Dataset/icons/notrain.png"
                     ,10,10)
)

#plot leaflet
leaflet() %>% addTiles() %>%
  addMarkers(data=stations[stations$lift=="Yes",]
               ,~x.coordinates,~y.coordinates,icon = station_icon
             ,label = ~as.character(station)
             ,labelOptions = labelOptions(noHide = F, textsize = "10px"
                                          ,direction = "bottom", textOnly = TRUE
                                          ,style = list(
                                             "color" = "#1E8449")))%>%
  addMarkers(data = stations[stations$lift=="No",]
    ,~x.coordinates,~y.coordinates,icon = station_icon
    ,label = ~as.character(station)
    ,labelOptions = labelOptions(noHide = F, textsize = "10px"
                                           ,direction = "bottom", textOnly = TRUE
                                           ,style = list("color" = "#CB4335"))
    ,markerOptions(stroke = TRUE,opacity = 0.2,
                   fillOpacity = 0.2,riseOnHover = T)
    )

