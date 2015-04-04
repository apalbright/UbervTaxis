##earnings by city

#load libs
library(ggplot2);library(ggthemes);library(plyr);library(reshape);library(grid);library(scales);library(RColorBrewer)

#load data
setwd("raw_data")
ed <- read.csv('earning.csv')

newed<-melt(ed, id=c("Attribute"))

#set colors for uber and taxi driver bars
pal2 <- c("#636363", "#ffff00")

#plot graph
ggplot(data=newed, aes(x=Attribute, y=value, fill=variable))+ 
	geom_bar(stat="identity", position=position_dodge(), colour="black")+
	scale_fill_manual(values = pal2, guide_legend(colour="black")) +
	theme(legend.key = element_rect(colour = "black"))+
	my_theme()+
	theme(legend.key = element_rect(colour = "black"))+
	theme(legend.title=element_blank())+
	guides(fill = guide_legend(override.aes = list(colour = NULL)))+
	labs(title= "", x="", y="")+
	ggtitle(expression(atop(bold("Ubers vs. Taxis: Earnings by City"), atop(italic("Median earnings ($) per hour by city"),"")))) +
    theme(plot.title = element_text(size = 20, face = "bold", colour = "black", vjust = -1, hjust=0.5))
