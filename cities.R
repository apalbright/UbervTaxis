##hours by city

#load libs
library(ggplot2);library(ggthemes);library(plyr);library(reshape);library(grid);library(scales);library(RColorBrewer)

#load data
setwd("raw_data")
ed <- read.csv('citiesuberx.csv')

newed<-melt(ed, id=c("City"))

#plot graph
ggplot(data = newed, aes(x = City, y=value, fill = variable)) + 
	geom_bar(stat="identity", colour="black")+ coord_flip()+ 
	theme(legend.key = element_rect(colour = "black"))+
	my_theme()+
	theme(legend.key = element_rect(colour = "black"))+
	guides(fill = guide_legend(override.aes = list(colour = NULL)))+
	scale_fill_brewer(palette="GnBu", name ="Hours/Week", breaks=c("X1.to.15", "X16.to.34","X35.to.49","X50.or.more"), labels=c("1-15", "16-34","35-49","50+"))+
	labs(title= "", x="", y="")+
	ggtitle(expression(atop(bold("Uber: Hours Worked by City"), atop(italic("Percentage (%) of drivers working a given range of hours/week"),"")))) +
    theme(plot.title = element_text(size = 20, face = "bold", colour = "black", vjust = -1, hjust=0.5))
	

