##age distribution

#load libs
library(ggplot2);library(ggthemes);library(plyr);library(reshape);library(grid);library(scales);library(RColorBrewer)

#laod data
setwd("raw_data")
ed <- read.csv('race.csv')

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
	labs(title= "Ubers vs. Taxis: Race \nPercentage (%) of drivers of a given race", x="", y="")+
	ggtitle(expression(atop(bold("Ubers vs. Taxis: Race"), atop(italic("Percentage (%) of drivers of a given race"),"")))) +
	theme(plot.title = element_text(size = 20, face = "bold", colour = "black", vjust = -1, hjust=0.5))