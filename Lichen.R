library(dplyr)
library(ggplot2)

#load in lichen dataset

lichen<- read.csv("Lichen.csv")
lichen$Severity <- trimws(lichen$Severity) #one site had space after HS label

##PERCENT COVER  -- percent cover of caribou lichens in a 1x1m plot 
#______________________________________________________________________________#

#grouping lichen percent cover data by site and severity classes - using a grouped mean across entire site
#maybe not helpful - ignore
lichen.grouped<- lichen %>%
  group_by(Site, Severity) %>%
  summarise(Mean_Cov = mean(Lichen_Cov))

#subsetting lichen percent cover data by fire year 

LichenCov_80s<- lichen %>%
  filter(Site %in% c("87", "SL85"))

LichenCov_2012<- lichen %>%
  filter(Site %in% c("NL12", "TK12", "HL12"))

LichenCov_2023<-lichen %>%
  filter(Site %in% c("NL23", "VC23", "HL23"))


#trying plotting from raw dataset so as to not erase alllll variation lol

LichenCov_all<- ggplot(lichen, aes(x=Severity, y=Lichen_Cov))+geom_boxplot()
LichenCov_all 

LichenCov_Plot_80s<- ggplot(LichenCov_80s, aes(x=Severity, y=Lichen_Cov))+geom_boxplot()
LichenCov_Plot_80s

LichenCov_Plot_2012<- ggplot(LichenCov_2012, aes(x=Severity, y=Lichen_Cov))+geom_boxplot()
LichenCov_Plot_2012

LichenCov_Plot_2023<- ggplot(LichenCov_2023, aes(x=Severity, y=Lichen_Cov))+geom_boxplot()
LichenCov_Plot_2023

#VOLUME - incorporating height into the mix.... goal is to get total volume per plot
#______________________________________________________________________________#

lichen.grouped<- lichen %>%
  group_by(Site, Severity) %>%
  summarise(across(c(Lichen_H1, Lichen_H2, Lichen_H3), mean, na.rm=TRUE))

