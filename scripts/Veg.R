setwd("//home.uvic.ca/spenserm/Desktop/FieldData Analysis")

library(dplyr)
library(ggplot2)
library(forcats)

#load in shrub dataset
#making edits to make sure structure is intact

shrubs<- read.csv("ShrubTraits.csv")

shrubs<- shrubs %>%
  mutate(Severity= case_when(
    Severity == "HS" ~ "High Severity",
    Severity == "MS" ~ "Medium Severity",
    Severity == "UB" ~ "Unburned"
  ))

#shrubs.grouped<- shrubs %>%
  #mutate(type=fct_collapse(Severity, 
       #                    Burned = c("MS", "HS"),
       #                    Unburned = "UB"))

#create deciduous shrub column
shrubs.grouped<- shrubs %>%
  mutate(Decid_Shrub_Cov = Bet_Cov + Aln_Cov + Sal_Cov )

#subsetting shrub data by fire year 

Shrubs_80s<- shrubs %>%
  filter(Site %in% c("87", "SL85"))

Shrubs_2012<- shrubs%>%
  filter(Site %in% c("NL12", "TK12", "HL12"))

Shrubs_2023<-shrubs %>%
  filter(Site %in% c("NL23", "VC23", "HL23"))


#grouped
Shrubs_80sgrouped<- shrubs.grouped %>%
  filter(Site %in% c("87", "SL85"))

Shrubs_2012grouped<- shrubs.grouped%>%
  filter(Site %in% c("NL12", "TK12", "HL12"))

Shrubs_2023grouped<-shrubs.grouped %>%
  filter(Site %in% c("NL23", "VC23", "HL23"))


#all deciduous shrub cover
ShrubsBet_Plot<- ggplot(shrubs.grouped, aes(x=Severity, y=Decid_Shrub_Cov, fill = Severity))+geom_boxplot()  + scale_fill_manual(values=c("red", "orange", "darkgreen")) + guides(fill = "none") + xlab('Severity') + ylab('Deciduous Shrub % Cover')
ShrubsBet_Plot

ShrubsBet_Plot_80s<- ggplot(Shrubs_80sgrouped, aes(x=Severity, y=Decid_Shrub_Cov, fill = Severity))+geom_boxplot(outlier.shape = NA)+ theme(axis.title = element_text(size = 16), axis.text = element_text(size = 14), axis.title.x = element_blank())+ scale_fill_manual(values=c("red", "orange", "darkgreen")) + guides(fill = "none") + xlab('Severity') + ylab('Deciduous Shrub % Cover')
ShrubsBet_Plot_80s

ShrubsBet_Plot_2012<- ggplot(Shrubs_2012grouped, aes(x=Severity, y=Decid_Shrub_Cov, fill = Severity))+geom_boxplot()+ scale_fill_manual(values=c("red", "orange", "darkgreen")) + guides(fill = "none") + xlab('Severity') + ylab('Deciduous Shrub % Cover')
ShrubsBet_Plot_2012

ShrubsBet_Plot_2023<- ggplot(Shrubs_2023grouped, aes(x=Severity, y=Decid_Shrub_Cov, fill = Severity))+geom_boxplot()+ scale_fill_manual(values=c("red", "orange", "darkgreen")) + guides(fill = "none") + xlab('Severity') + ylab('Deciduous Shrub % Cover')
ShrubsBet_Plot_2023

#looking at betula cover
ShrubsBet_Plot<- ggplot(shrubs, aes(x=Severity, y=Bet_Cov))+geom_boxplot()
ShrubsBet_Plot

ShrubsBet_Plot_80s<- ggplot(Shrubs_80s, aes(x=Severity, y=Bet_Cov))+geom_boxplot()
ShrubsBet_Plot_80s

ShrubsBet_Plot_2012<- ggplot(Shrubs_2012, aes(x=Severity, y=Bet_Cov))+geom_boxplot()
ShrubsBet_Plot_2012

ShrubsBet_Plot_2023<- ggplot(Shrubs_2023, aes(x=Severity, y=Bet_Cov))+geom_boxplot()
ShrubsBet_Plot_2023


#general burned - no severity

ShrubsBetgrouped_Plot<- ggplot(shrubs.grouped, aes(x=type, y=Bet_Cov))+geom_boxplot()
ShrubsBetgrouped_Plot

ShrubsBet_Plot_80sgrouped<- ggplot(Shrubs_80sgrouped, aes(x=type, y=Bet_Cov))+geom_boxplot()
ShrubsBet_Plot_80sgrouped

ShrubsBet_Plot_2012grouped<- ggplot(Shrubs_2012grouped, aes(x=type, y=Bet_Cov))+geom_boxplot()
ShrubsBet_Plot_2012grouped

ShrubsBet_Plot_2023grouped<- ggplot(Shrubs_2023grouped, aes(x=type, y=Bet_Cov))+geom_boxplot()
ShrubsBet_Plot_2023grouped


#looking at salix cover
ShrubsSal_Plot<- ggplot(shrubs, aes(x=Severity, y=Sal_Cov))+geom_boxplot()
ShrubsSal_Plot

ShrubsSal_Plot_80s<- ggplot(Shrubs_80s, aes(x=Severity, y=Sal_Cov))+geom_boxplot()
ShrubsSal_Plot_80s

ShrubsSal_Plot_2012<- ggplot(Shrubs_2012, aes(x=Severity, y=Sal_Cov))+geom_boxplot()
ShrubsSal_Plot_2012

ShrubsSal_Plot_2023<- ggplot(Shrubs_2023, aes(x=Severity, y=Sal_Cov))+geom_boxplot()
ShrubsSal_Plot_2023



#general burned - no severity

ShrubsSalgrouped_Plot<- ggplot(shrubs.grouped, aes(x=type, y=Sal_Cov))+geom_boxplot()
ShrubsSalgrouped_Plot

ShrubsSal_Plot_80sgrouped<- ggplot(Shrubs_80sgrouped, aes(x=type, y=Sal_Cov))+geom_boxplot()
ShrubsSal_Plot_80sgrouped

ShrubsSal_Plot_2012grouped<- ggplot(Shrubs_2012grouped, aes(x=type, y=Sal_Cov))+geom_boxplot()
ShrubsSal_Plot_2012grouped

ShrubsSal_Plot_2023grouped<- ggplot(Shrubs_2023grouped, aes(x=type, y=Sal_Cov))+geom_boxplot()
ShrubsSal_Plot_2023grouped



#looking at rhod cover
ShrubsRhod_Plot<- ggplot(shrubs, aes(x=Severity, y=Rhod_Cov))+geom_boxplot()
ShrubsRhod_Plot

ShrubsRhod_Plot_80s<- ggplot(Shrubs_80s, aes(x=Severity, y=Rhod_Cov))+geom_boxplot()
ShrubsRhod_Plot_80s

ShrubsRhod_Plot_2012<- ggplot(Shrubs_2012, aes(x=Severity, y=Rhod_Cov))+geom_boxplot()
ShrubsRhod_Plot_2012

ShrubsRhod_Plot_2023<- ggplot(Shrubs_2023, aes(x=Severity, y=Rhod_Cov))+geom_boxplot()
ShrubsRhod_Plot_2023


#general burned - no severity

ShrubsRhodgrouped_Plot<- ggplot(shrubs.grouped, aes(x=type, y=Rhod_Cov))+geom_boxplot()
ShrubsRhodgrouped_Plot

ShrubsRhod_Plot_80sgrouped<- ggplot(Shrubs_80sgrouped, aes(x=type, y=Rhod_Cov))+geom_boxplot()
ShrubsRhod_Plot_80sgrouped

ShrubsRhod_Plot_2012grouped<- ggplot(Shrubs_2012grouped, aes(x=type, y=Rhod_Cov))+geom_boxplot()
ShrubsRhod_Plot_2012grouped

ShrubsRhod_Plot_2023grouped<- ggplot(Shrubs_2023grouped, aes(x=type, y=Rhod_Cov))+geom_boxplot()
ShrubsRhod_Plot_2023grouped


