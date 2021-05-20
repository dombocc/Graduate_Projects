###Graphs for Filtered Crash Dataset
##Read the data into a R dataframe.
filename = "/Users/robertmason/Desktop/FilteredData1.csv" 
Crashes = read.csv(file=filename,
                    header = TRUE,
                    fill=TRUE,
                    sep = ",",
                    stringsAsFactors = FALSE,
                    na.strings = "")
names(Crashes)
dim(Crashes)
head(Crashes)

########################################Environmental Conditions
EnvironmentFreqs = table(Crashes[,4])
EnvironmentFreqs

par(mar = c(8,8,6,4),mgp = c(5,1,0),
    cex.main = 3, #title font size
    cex.lab = 1.5, #label font size
    cex.axis = 1) #axis font size
HBARTitle = "Environmental Conditions"
HBARCol = rainbow(12)
HBARYlab = "No. of Crashes"
HBARXlab = "Weather Condition"
EnvironmentNames = c("Blowing Sand/Dirt","Clear","Freezing Rain","Overcast","Severe Crosswinds","Wintery Mix","Snow & Wind","Fog","Other","Rain","Sleet/Hail","Snow")
#Barchart
xx= barplot(EnvironmentFreqs, horiz = FALSE,
            col = HBARCol,
            names.arg = EnvironmentNames,
            main = HBARTitle,
            xlab = HBARXlab,
            ylab = HBARYlab,
            col.axis = "red",
            ylim = c(0,5000))
text(x=EnvironmentFreqs, y=xx, label=EnvironemntFreqs, pos=3, cex=1.5, col="red")

########################################Month BarPlot
MonthsFreq = table(Crashes[,51])
MonthsFreq
par(mar = c(8,8,6,4),mgp = c(5,1,0),
    cex.main = 3, #title font size
    cex.lab = 1.5, #label font size
    cex.axis = 1) #axis font size
HBARTitle = "Monthly Crashes"
HBARCol = rainbow(12)
HBARYlab = "No. of Crashes"
HBARXlab = "Monthly Crashes"
MonthsNames = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
#Barchart
xx= barplot(MonthsFreq, horiz = FALSE,
            col = HBARCol,
            names.arg = MonthsNames,
            main = HBARTitle,
            xlab = HBARXlab,
            ylab = HBARYlab,
            col.axis = "red",
            ylim = c(0,4000))
text(x=MonthsFreq, y=xx, label=MonthsFreq, pos=3, cex=1.5, col="red")

########################################Daily Crashes BarPlot
DaysFreq = table(Crashes[,49])
DaysFreq
par(mar = c(8,8,6,4),mgp = c(5,1,0),
    cex.main = 3, #title font size
    cex.lab = 1.5, #label font size
    cex.axis = 1) #axis font size
HBARTitle = "Crashes by Day of the Week"
HBARCol = rainbow(7)
HBARYlab = "No. of Crashes"
HBARXlab = "Day"
DayNames = c("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")
#Barchart
xx= barplot(DaysFreq, horiz = FALSE,
            col = HBARCol,
            names.arg = DayNames,
            main = HBARTitle,
            xlab = HBARXlab,
            ylab = HBARYlab,
            col.axis = "red",
            ylim = c(0,7000))
text(x=DaysFreq, y=xx, label=DaysFreq, pos=3, cex=1.5, col="red")

####Crash Hours
CrashHourFREQS = table(Crashes[,50]) # Computing the frequencies
CrashHourFREQS
TimeofDay = array(dim=c(41286,1))
TimeofDay[Crashes[,50]<6 & Crashes[,50]<=22] = "Overnight"                       
TimeofDay[Crashes[,50]>=6 & Crashes[,50]<=11] = "Morning"     
TimeofDay[Crashes[,50]>=12 & Crashes[,50]<=16] = "Afternoon"
TimeofDay[Crashes[,50]>=17 & Crashes[,50]<22] = "Evening"
#Check
head(TimeofDay, n=5)
Crashes=data.frame(Crashes,TimeofDay)
#Check - Variable looks to have added correctly
names(Crashes)
dim(Crashes)
head(Crashes, n=5)
CrashTimeFreqs = table(Crashes[,61])
CrashTimeFreqs
RelCrashTimeFreq = prop.table(CrashTimeFreqs) 
RelCrashTimeFreq
CrashTimePercs = RelCrashTimeFreq*100
CrashTimePercs

###Pie Chart of Crash Times
par(mar=c(1,9,4,5.5),    # Controls space (in lines) around sides of graph
    cex.main=3.5         # Font Size for title
)

g.cex = 1.75
CrashTimePieTitle = "Crash Frequencies by Time of Day"
CrashTimeNames = c('Afternoon, 43.86%','Evening, 21.95%',
                    'Morning, 32.40%', 'Overnight, 1.78%') 
CrashTimeCols=c("red","green","blue","orange")

pie(CrashTimeFreqs, labels = CrashTimeNames,  # Full names of slices
    cex=g.cex,		   	                          # Font size of slice names
    col = CrashTimeCols,                       # colors of slices
    main=CrashTimePieTitle                     # Graph Title
)

###Rural and Urban
RuralUrbanFREQS = table(Crashes[,41]) # Computing the frequencies
RuralUrbanFREQS

par(mar = c(8,8,6,4),mgp = c(5,1,0),
    cex.main = 3, #title font size
    cex.lab = 1.5, #label font size
    cex.axis = 1) #axis font size
HBARTitle = "Rural vs Urban"
HBARCol = c("red","blue")
HBARYlab = "No. of Crashes"
HBARXlab = "Area"
AreaNames = c("Rural","Urban")
#Barchart
xx= barplot(RuralUrbanFREQS, horiz = FALSE,
            col = HBARCol,
            names.arg = AreaNames,
            main = HBARTitle,
            xlab = HBARXlab,
            ylab = HBARYlab,
            col.axis = "red",
            ylim = c(0,45000))
text(x=RuralUrbanFREQS, y=xx, label=RuralUrbanFREQS, pos=3, cex=1.5, col="red")

###Light Conditions
LightFREQS = table(Crashes[,5]) # Computing the frequencies
LightFREQS

par(mar = c(8,8,6,4),mgp = c(5,1,0),
    cex.main = 3, #title font size
    cex.lab = 1.5, #label font size
    cex.axis = 0.7) #axis font size
HBARTitle = "Light Conditions"
HBARCol = rainbow(7)
HBARYlab = "No. of Crashes"
HBARXlab = "Lighting"
LightNames = c("No Street Lights","Dark/SL Off","Continuous SL","Spotty SL","Dawn","Daylight","Dusk")
#Barchart
xx= barplot(LightFREQS, horiz = FALSE,
            col = HBARCol,
            names.arg = LightNames,
            main = HBARTitle,
            xlab = HBARXlab,
            ylab = HBARYlab,
            col.axis = "red",
            ylim = c(0,35000))
text(x=LightFREQS, y=xx, label=LightFREQS, pos=3, cex=1.5, col="red")

###Surface Conditions
SurfaceFREQS = table(Crashes[,58]) # Computing the frequencies
SurfaceFREQS

par(mar = c(8,8,6,4),mgp = c(5,1,0),
    cex.main = 3, #title font size
    cex.lab = 1.5, #label font size
    cex.axis = 1) #axis font size
HBARTitle = "Surface Conditions"
HBARCol = rainbow(8)
HBARYlab = "No. of Crashes"
HBARXlab = "Surface Condition"
SurfaceNames = c("Dry","Icy","Oily","Other","Slushy","Snowy","Standing Water","Wet")
#Barchart
xx= barplot(SurfaceFREQS, horiz = FALSE,
            col = HBARCol,
            names.arg = SurfaceNames,
            main = HBARTitle,
            xlab = HBARXlab,
            ylab = HBARYlab,
            col.axis = "red",
            ylim = c(0,35000))
text(x=SurfaceFREQS, y=xx, label=SurfaceFREQS, pos=3, cex=1.5, col="red")

