library(XML)
library(ggplot2)
library(reshape2)

# In order to gather data we first download the csv file from the source link provided.
# In the next step we will upload the csv fie to Rstudio using the Upload option 
# Reading the csv file for cleaning the data

UScrimes <- read.csv(file="crimes.csv", header=TRUE, sep=",")
head (UScrimes)

# Cleaning the data from csv file

part1<-UScrimes[1:10 ,1:4]
part1[,2]=part1$Population/1000
colnames(part1)[2] = "population"
colnames(part1) <- c("Year", "Population", "Violent crimes","Murders")
head(part1,10)

# writing new csv file with cleaned data

write.csv(part1, file = "part1.csv")
# Using the melt command for the 
part1.m <- melt(part1)
part1.m

# Using ggplot2 to plot line graph 
ggplot(part1.m, aes(x=Year, y=value, group=variable, colour=variable)) + geom_line()+coord_trans(y = "log10") 
+xlab("YEAR") + ylab("FIGURES") + 
  ggtitle("Line graph plotting US crimes")
summary(crimes)
