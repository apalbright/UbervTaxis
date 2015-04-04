##age distribution
##this R script has to be run before all others since it defines "my_theme" 
##which is a function used in all the other R scripts to format the style of the graphs

#load libs
library(ggplot2);library(ggthemes);library(plyr);library(reshape);library(grid);library(scales);library(RColorBrewer);#library(png)

#Create a function for the look of my charts
#Used minimaxir's code as base R code to work off of
my_theme <- function() {

  # Define colors for the chart
  palette <- brewer.pal("Greys", n=9)
  color.background = palette[2]
  color.grid.major = palette[4]
  color.panel = palette[3]
  color.axis.text = palette[9]
  color.axis.title = palette[9]
  color.title = palette[9]

  # Create basic construction of chart
  theme_bw(base_size=9, base_family="Georgia") + 

  # Set the entire chart region to a light gray color
  theme(panel.background=element_rect(fill=color.panel, color=color.background)) +
  theme(plot.background=element_rect(fill=color.background, color=color.background)) +
  theme(panel.border=element_rect(color=color.background)) +

  # Format grid
  theme(panel.grid.major=element_line(color=color.grid.major,size=.25)) +
  theme(panel.grid.minor=element_blank()) +
  theme(axis.ticks=element_blank()) +

  # Format legend
  theme(legend.position="right") +
  theme(legend.background = element_rect(fill=color.panel)) +
  theme(legend.text = element_text(size=10,color=color.axis.title)) + 

  # Format title and axes labels these and tick marks
  theme(plot.title=element_text(color=color.title, size=20, vjust=0.5, hjust=0, face="bold")) +
  theme(axis.text.x=element_text(size=10,color=color.axis.text)) +
  theme(axis.text.y=element_text(size=10,color=color.axis.text)) +
  theme(axis.title.x=element_text(size=12,color=color.axis.title, vjust=-1, face="italic")) +
  theme(axis.title.y=element_text(size=12,color=color.axis.title, vjust=1.8, face="italic")) +

  # Plot margins
  theme(plot.margin = unit(c(0, 0, 0, 0), "cm"))
}
#load data
setwd("raw_data")
age <- read.csv('age.csv')

newage<-melt(age, id=c("Attribute"))

#set colors for uber and taxi driver bars
pal2 <- c("#636363", "#ffff00")

#plot graph
ggplot(data=newage, aes(x=Attribute, y=value, fill=variable))+ 
	geom_bar(stat="identity", position=position_dodge(), colour="black")+
	scale_fill_manual(values = pal2, guide_legend(colour="black")) +
	theme(legend.key = element_rect(colour = "black"))+
	my_theme()+
	theme(legend.key = element_rect(colour = "black"))+
	theme(legend.title=element_blank())+
	guides(fill = guide_legend(override.aes = list(colour = NULL)))+
	scale_y_continuous(breaks=seq(0,40,5))+
	labs(title= "", x="", y="")+
	ggtitle(expression(atop(bold("Ubers vs. Taxis: Age Range"), atop(italic("Percentage (%) of drivers in a given age range"),"")))) +
    theme(plot.title = element_text(size = 20, face = "bold", colour = "black", vjust = -1, hjust=0.5))