library(lattice)
library(ggplot2)

#Read Data from the csv file to a variable beefData
beefData<-read.csv('BeefData.csv',header=TRUE)
#Display beefData
beefData

#************************************************************************************************************************************************************

#Basic Plotting functions
subsetData<-beefData[1:15,]
plot(subsetData$ChickPrice, subsetData$BeefPrice, main="Price of Chicken and Beef along with year", xlab="Chicken Price", ylab="Beef Price", pch=19)

#Adding arrows. Draws arrows between datapoints for the first 15 observations. I took a subset so that the chart doesn't look cluttered with all the arrows.
s <- seq(14)
arrows(subsetData$ChickPrice[s], subsetData$BeefPrice[s], subsetData$ChickPrice[s+1], subsetData$BeefPrice[s+1], col="blue", length=0.07,angle=40)

#Adding text. Puts the year that each of the points in the chart belongs to right next to it.
s <- seq(15)
text(subsetData$ChickPrice[s], subsetData$BeefPrice[s],paste(subsetData$Year[s]),pos=3, cex=0.70, col="black")

#Draws points of different colors and adds legend to the chart
morecpi<-subset(subsetData, CPI>50.0)
lesscpi<-subset(subsetData, CPI<=50.0)
#Draw all the datapoints corresponding to CPI>50.0 in blue color.
points(morecpi$ChickPrice[s], morecpi$BeefPrice[s], type="p", pch=19, col = "blue", subset=morecpi$CPI[s])
#Draw all the datapoints corresponding to CPI<=50.0 in red color.
points(lesscpi$ChickPrice[s], lesscpi$BeefPrice[s], type="p", pch=19, col = "red", subset=lesscpi$CPI[s])
#Puts the legend on the top left corner
legend("topleft", legend=c("> 50.0 CPI", "<=50.0 CPI"), col=c("blue","red"), pch =19, cex=0.77)
#Draw a baseline
abline(a=-10, b=2, col="green")

plot(beefData$RealChickenPrice,beefData$RealBeefPrice, pch=18, main = "Real Chicken and Beef Price chart", ylab = "Real Beef Price", xlab = "Real Chicken Price");
qqplot(beefData$Year, beefData$CPI, pch=17, col="brown", ylab="CPI", xlab = "Year", main="Consumer Price Index (CPI) for years 1965 to 2000")

#lattice package
densityplot(~beefData$BeefConsump, main="Beef Consumption over the years 1965 to 2000", xlab="Beef Consumption", col="darkred", pch=16)
splom(beefData[c(2,3,7,8)], main="Matrix plot of Chicken price, Beef Price, DPI adjusted Chicken Price and DPI adjusted Beef Price", pch=16, col="black")

#ggplot2 package
qplot(ChickPrice, BeefPrice, data=beefData, color=CPI, main="Chicken Price VS Beef Price with Consumer Price Index (CPI)", ylab = "Beef Price", xlab = "Chicken Price")




