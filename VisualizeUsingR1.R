library(lattice)
library(ggplot2)


#Read Data from the csv file to a variable housingData
housingData<-read.csv('housing_price.csv',header=TRUE)
#Display housingData
housingData

#************************************************************************************************************************************************************

#Using Basic Plotting functions
subsetData<-housingData[1:10,]
plot(subsetData$price2014, subsetData$price2007, main="Price in 2014 and 2007 along with area (in acres)", xlab="Price in 2014", ylab="Price in 2007", pch=19)

#Adding arrows. Draws arrows between datapoints for the first 10 observations. I took a subset so that the chart doesn't look cluttered with all the arrows.
s <- seq(9)
arrows(subsetData$price2014[s], subsetData$price2007[s], subsetData$price2014[s+1], subsetData$price2007[s+1], col="blue", length=0.07,angle=40)

#Adding text. Puts the area group that each of the points in the chart belongs to right next to it (values marked <=1/4 acre and >1/4 acre).
s <- seq(10)
text(subsetData$price2014[s], subsetData$price2007[s],paste(subsetData$acregroup[s], "area"),pos=3, cex=0.70, col="black")

#Draws points of different colors and adds legend to the chart
yesgarage<-subset(subsetData, garagegroup=="yes")
nogarage<-subset(subsetData, garagegroup=="no")
#Draw all the datapoints corresponding to garagegroup="yes" in green color.
points(yesgarage$price2014[s], yesgarage$price2007[s], type="p", pch=19, col = "green", subset=yesgarage$garagegroup[s])
#Draw all the datapoints corresponding to garagegroup="no" in red color.
points(nogarage$price2014[s], nogarage$price2007[s], type="p", pch=19, col = "red", subset=nogarage$garagegroup[s])
#Puts the legend on the top left corner
legend("topleft", legend=c("Has Garage", "No Garage"), col=c("green","red"), pch =19, cex=0.77)
#Draw a baseline
abline(a=-30, b=1.2, col="purple")

barplot(housingData$price2014, xlab="Houses", ylab = "Price in 2014", main = "Price of houses in 2014")
plot(housingData$squarefeet,housingData$acre, main = "Squarefeet and Acre chart of Houses", ylab = "Squarefeet (in thousands)", xlab = "Acre", pch=16, col="black");
hist(housingData$squarefeet, main="Squarefeet Range of Houses", xlab="Squarefeet (in thousands)", ylab = "No of Houses")


#lattice package
xyplot(price2014 ~ price1998|sfgroup*bedgroup,  data = housingData, pch=19, col="black", main="Price in 1998 vs 2014 by Square Feet and Bedroom Groups", ylab="Price in 2014", xlab="Price in 1998")
splom(housingData[c(22,23,24, 25)], main="Matrix plot of Price from 1998 to 2014")

#ggplot2 package
qplot(bikescore, walkscore, data=housingData, color=distgroup, main="Walkscore VS Bikescore with Distance group")




