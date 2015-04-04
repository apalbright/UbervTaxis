##drivers by education level

#load libs
library(ggplot2);library(ggthemes);library(plyr);library(reshape);library(grid);library(scales);library(RColorBrewer)
  
#load data
setwd("raw_data")
ed <- read.csv('education.csv')

newed<-melt(ed, id=c("Attribute"))

#set colors for uber and taxi driver bars
pal2 <- c("#636363", "#ffff00")

#plot graph
a<-ggplot(data=newed, aes(x=Attribute, y=value, fill=variable))+ 
	geom_bar(stat="identity", position=position_dodge(), colour="black")+
	scale_fill_manual(values = pal2, guide_legend(colour="black")) +
	theme(legend.key = element_rect(colour = "black"))+
	my_theme()+
	theme(legend.key = element_rect(colour = "black"))+
	theme(legend.title=element_blank())+
	guides(fill = guide_legend(override.aes = list(colour = NULL)))+
	labs(title= "", x="", y="")+
	ggtitle(expression(atop(bold("Ubers vs. Taxis: Education Level"), atop(italic("Percentage (%) of drivers by highest level of education"),"")))) +
	theme(plot.title = element_text(size = 20, face = "bold", colour = "black", vjust = -1, hjust=0.5))

#change x axis labels to accurately reflect data
a+ scale_x_discrete(labels=c("Less than High School", "High School", "Some College/Associate's", "College Degree","Postgraduate Degree"))