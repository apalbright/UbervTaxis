#female drivers plot

#load libs
library(ggplot2);library(ggthemes);library(plyr);library(reshape);library(grid);library(scales);library(RColorBrewer)
 
#load numbers--since it's only three percentages it's not worth loading in the gender.csv file 
	DF <- data.frame(type = c("Ubers","Taxis","NYC Taxis"), 
                  per = c(13.8,8,1)) 
 
#place percentages in the middle of the bars
 	DF <- ddply(DF, .(type), transform, pos = cumsum(per) - (0.5 * per))
 
#plot graph 
ggplot(DF, aes(x = type, y = per)) + 
	my_theme()+
	geom_bar(stat = "identity", fill = "firebrick", colour="black") + 
	labs(title= "Ubers vs. Taxis: Gender \nPercentage of female drivers", x="", y="")+
	ggtitle(expression(atop(bold("Ubers vs. Taxis: Gender"), atop(italic("Percentage of female drivers"),"")))) +
    theme(plot.title = element_text(size = 20, face = "bold", colour = "black", vjust = -1, hjust=0.5))+
    theme(plot.margin = unit(c(0, 1, 0, 0), "cm"))+
    geom_text(aes(label = c("1%", "8%","13.8%"), y = pos), size = 8, family="Georgia", face="bold")

