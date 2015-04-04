##age distribution

#load libs
library(ggplot2);library(ggthemes);library(plyr);library(reshape);library(grid);library(scales);library(RColorBrewer)
 
#load data  
setwd("raw_data")
ed <- read.csv('hours.csv')

newed<-melt(ed, id=c("Attribute"))

#set colors for uber and driver driver bars
pal2 <- c("#636363", "#ffff00")

#define graph
a<-ggplot(data=newed, aes(x=Attribute, y=value, fill=variable))+ 
	geom_bar(stat="identity", position=position_dodge(), colour="black")+
	scale_fill_manual(values = pal2, guide_legend(colour="black")) +
	theme(legend.key = element_rect(colour = "black"))+
	my_theme()+
	theme(legend.key = element_rect(colour = "black"))+
	theme(legend.title=element_blank())+
	guides(fill = guide_legend(override.aes = list(colour = NULL)))+
	labs(title= "hi", x="", y="")+
	ggtitle(expression(atop(bold("Ubers vs. Taxis: Hours Worked"), atop(italic("Percentage (%) of drivers working a given range of hours/week"),"")))) +
	theme(plot.title = element_text(size = 20, face = "bold", colour = "black", vjust = -1, hjust=0.5))

#plot graph with fixed x axis labels     
a+ scale_x_discrete(labels=c("1-15", "16-34", "35-49", "50+"))