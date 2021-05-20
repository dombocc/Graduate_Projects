#Start the library
library(openxlsx)

#set a variable with the data file path
csvFilename = "C:/Users/Dominic/OneDrive/DataMining/Final Project/newData4.25.2020.csv"

crashes = read.csv(csvFilename)
head(crashes)

########################################Severity BarPlot
MakeFreq = table(crashes$Severity)
MakeFreq
par(mar = c(8,6,6,4),mpg = c(6,0,0),
    cex.main = 2.5, #title font size
    cex.lab = 1.5, #label font size
    cex.axis = .9) #axis font size
HBARTitle = "Severity of Crashes"
HBARCol = c("black")
HBARYlab = "No. of Crashes"
HBARXlab = "Types of Crashes"
MakeNames = c("Fatal","Minor","No Injury")
#Barchart
xx= barplot(MakeFreq, horiz = FALSE,
            col = HBARCol,
            names.arg = MakeNames,
            main = HBARTitle,
            xlab = HBARXlab,
            ylab = HBARYlab,
            col.axis = "red",
            las = 1,
            ylim = c(0,700000))
text(x=MakeFreq, y=xx, label=MakeFreq, pos=3, cex=1.5, col="red")


########################################Environmental Conditions
#Crosstab the data
XTFreqs = table(crashes$Severity,crashes$Environmental.Condition)
XTFreqs
#Define the options
MyTitle = "Severity by Enviromental Conditions"
MyXlab = "Environment Condition"
MyYlab = "No. of Accidents"
MyCols = c("red","darkblue","green")
SubNames = c("Fatal","Minor","No Injury")
SubNames2 = c("Clear","Snow","Rain","Overcast","Fog","Windy","Other")
par(cex.main = 2,
    cex.lab = 1.75,
    cex.axis = 1.5)
#create the grouped barplot
XX = barplot(XTFreqs, main = MyTitle,
             names.arg = SubNames2,
             xlab = MyXlab,
             ylab = MyYlab,
             col = MyCols,
             beside = TRUE, #Place them next to each other
             axis.lty = 1)
legend("topright", legend = SubNames, cex=1.5,fill = MyCols, bty = "n")


########################################Surface Conditions
#Crosstab the data
XTFreqs = table(crashes$Severity,crashes$Surface.Condition)
XTFreqs
#Define the options
MyTitle = "Severity by Surface Conditions"
MyXlab = "Surface Condition"
MyYlab = "No. of Accidents"
MyCols = c("red","darkblue","green")
SubNames = c("Fatal","Minor","No Injury")
SubNames2 = c("Dry","Wet","Frozen","Sandy","Oily","Other")
par(cex.main = 2,
    cex.lab = 1.75,
    cex.axis = 1.5)
#create the grouped barplot
XX = barplot(XTFreqs, main = MyTitle,
             names.arg = SubNames2,
             xlab = MyXlab,
             ylab = MyYlab,
             col = MyCols,
             beside = TRUE, #Place them next to each other
             axis.lty = 1)
legend("topright", legend = SubNames, cex=1.5,fill = MyCols, bty = "n")



########################################Light Conditions
#Crosstab the data
XTFreqs = table(crashes$Severity,crashes$Light.Condition)
XTFreqs
#Define the options
MyTitle = "Severity by Light Conditions"
MyXlab = "Light Condition"
MyYlab = "No. of Accidents"
MyCols = c("red","darkblue","green")
SubNames = c("Fatal","Minor","No Injury")
SubNames2 = c("Dark","Daylight","Dusk","Dawn")
par(cex.main = 2,
    cex.lab = 1.75,
    cex.axis = 1.5)
#create the grouped barplot
XX = barplot(XTFreqs, main = MyTitle,
             names.arg = SubNames2,
             xlab = MyXlab,
             ylab = MyYlab,
             col = MyCols,
             beside = TRUE, #Place them next to each other
             axis.lty = 1)
legend("topright", legend = SubNames, cex=1.5,fill = MyCols, bty = "n")


########################################Intersection
#Crosstab the data
XTFreqs = table(crashes$Severity,crashes$Intersection)
XTFreqs
#Define the options
MyTitle = "Severity by Intersection Location"
MyXlab = "Type of Intersection"
MyYlab = "No. of Accidents"
MyCols = c("red","darkblue","green")
SubNames = c("Fatal","Minor","No Injury")
SubNames2 = c("No Intersection","Intersection","Rail-Road")
par(cex.main = 2,
    cex.lab = 1.75,
    cex.axis = 1.5)
#create the grouped barplot
XX = barplot(XTFreqs, main = MyTitle,
             names.arg = SubNames2,
             xlab = MyXlab,
             ylab = MyYlab,
             col = MyCols,
             beside = TRUE, #Place them next to each other
             axis.lty = 1)
legend("topright", legend = SubNames, cex=1.5,fill = MyCols, bty = "n")


########################################Rural or Urban
#Crosstab the data
XTFreqs = table(crashes$Severity,crashes$Rural.Or.Urban)
XTFreqs
#Define the options
MyTitle = "Severity by Type of Location"
MyXlab = "Rural or Urban"
MyYlab = "No. of Accidents"
MyCols = c("red","darkblue","green")
SubNames = c("Fatal","Minor","No Injury")
SubNames2 = c("Rural","Urban")
par(cex.main = 2,
    cex.lab = 1.75,
    cex.axis = 1.5)
#create the grouped barplot
XX = barplot(XTFreqs, main = MyTitle,
             names.arg = SubNames2,
             xlab = MyXlab,
             ylab = MyYlab,
             col = MyCols,
             beside = TRUE, #Place them next to each other
             axis.lty = 1)
legend("topleft", legend = SubNames, cex=1.5,fill = MyCols, bty = "n")


########################################Distracted Driving Involved
#Crosstab the data
XTFreqs = table(crashes$Severity,crashes$Distracted.Driving.Involved)
XTFreqs
#Define the options
MyTitle = "Severity by Light Conditions"
MyXlab = "Distracted Driving Involved"
MyYlab = "No. of Accidents"
MyCols = c("red","darkblue","green")
SubNames = c("Fatal","Minor","No Injury")
SubNames2 = c("No","Yes")
par(cex.main = 2,
    cex.lab = 1.75,
    cex.axis = 1.5)
#create the grouped barplot
XX = barplot(XTFreqs, main = MyTitle,
             names.arg = SubNames2,
             xlab = MyXlab,
             ylab = MyYlab,
             col = MyCols,
             beside = TRUE, #Place them next to each other
             axis.lty = 1)
legend("topleft", legend = SubNames, cex=1.5,fill = MyCols, bty = "n")


########################################Unsafe Speed Involved
#Crosstab the data
XTFreqs = table(crashes$Severity,crashes$Unsafe.Speed.Involved)
XTFreqs
#Define the options
MyTitle = "Severity by Unsafe Speed"
MyXlab = "Unsafe Speed Involved"
MyYlab = "No. of Accidents"
MyCols = c("red","darkblue","green")
SubNames = c("Fatal","Minor","No Injury")
SubNames2 = c("No","Yes")
par(cex.main = 2,
    cex.lab = 1.75,
    cex.axis = 1.5)
#create the grouped barplot
XX = barplot(XTFreqs, main = MyTitle,
             names.arg = SubNames2,
             xlab = MyXlab,
             ylab = MyYlab,
             col = MyCols,
             beside = TRUE, #Place them next to each other
             axis.lty = 1)
legend("topright", legend = SubNames, cex=1.5,fill = MyCols, bty = "n")



########################################Month BarPlot
MakeFreq = table(crashes$Crash.Month)
MakeFreq
par(mar = c(8,8,6,4),mgp = c(5,1,0),
    cex.main = 3, #title font size
    cex.lab = 1.5, #label font size
    cex.axis = 1) #axis font size
HBARTitle = "Monthly Crashes"
HBARCol = rainbow(12)
HBARYlab = "No. of Crashes"
HBARXlab = "Monthly Crashes"
MakeNames = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
#Barchart
xx= barplot(MakeFreq, horiz = FALSE,
            col = HBARCol,
            names.arg = MakeNames,
            main = HBARTitle,
            xlab = HBARXlab,
            ylab = HBARYlab,
            col.axis = "red",
            ylim = c(0,175000))
text(x=MakeFreq, y=xx, label=MakeFreq, pos=3, cex=1.5, col="red")


########################################Severity by Day of the week
#Crosstab the data
XTFreqs = table(crashes$Severity,crashes$Crash.Month)
XTFreqs
#Define the options
MyTitle = "Severity by Day of the Week"
MyXlab = "Day of the Week"
MyYlab = "No. of Accidents"
MyCols = c("red","darkblue","green")
SubNames = c("Fatal","Minor","No Injury")
SubNames2 = c("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")
par(cex.main = 2,
    cex.lab = 1.75,
    cex.axis = 1.25)
#create the grouped barplot
XX = barplot(XTFreqs, main = MyTitle,
             names.arg = SubNames2,
             xlab = MyXlab,
             ylab = MyYlab,
             col = MyCols,
             beside = TRUE, #Place them next to each other
             axis.lty = 1)
legend("topleft", legend = SubNames, cex=1.5,fill = MyCols, bty = "n")


########################################Plot of crashes over years
table(crashes$Crash.Year)
x = data.frame("Year" = c(2015,2016,2017,2018,2019),"Data" = c(165740,173674,182499,198504,165598))
x
crashes$number = 1
par(mar = c(6,6,6,6),
    cex.main = 2.5,
    cex.lab = 1.75,
    cex.axis = 1.75)
MyTitle = "No. of Crashes Over The Years"
MyXlab = "Years"
MyYlab = "No. of Crashes"
plot(x$Year,x$Data,
     main = MyTitle, xlab = MyXlab, ylab = MyYlab,
     type = "b", #p for points
     #col = ifelse(mpg$transmission == 0,"red","blue"), #color
     #pch = ifelse(mpg$transmission == 0, 1, 2),
     cex = 1)
#legend("topright", pch = c(1,2), col = c("red","blue"),c("Auto","Manual"), bty = "o", cex = 1.25)




