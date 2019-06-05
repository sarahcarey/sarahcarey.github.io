#### Intro to Botany Fall 2017
#### R script for analysis of moss area measurements
#### By S.Carey


### First we will need to read in our data file.
### To do so, change the code below to have the name of the file be what
### you have saved your moss data as
### NOTE: if you have spaces in the name of your file you should change them
### to underscores.


#moss_data <- read.csv("name_of_sheet_with_your_data.csv")
moss_data <- read.csv("Ceratodon_intro_bot_canned_data.csv")

### now in the R environment you have an object named "moss_data" that contains
### the exact information as your .csv file. In the "Data" section of R studio
### (in the upper right corner of the screen)
### you will see the object "moss_data" and a grid symbol next to it. Click
### the grid symbol to view the contents of moss_data. If the format
### does not look as it did in your .cvs file, then something has gone wrong



### now that we have our data in R we can begin to analyze it.
### We want to run a t-test between our Males and Females to 
### see if there is a significant difference in growth between them.

### To run the t-test run the code below:

ttest <- t.test(moss_data$Area~moss_data$Sex)
ttest

### In the console window below you will find the results of your t-test
### locate your p-value in the output. If it is equal to or below 0.05 
### then you have
### found a significant difference in growth between your sexes.
### if your value is above 0.05 then there is no significant difference
### in the area of your Males and Females.

### The output of the t-test will also give you the mean area for your
### Males and Females. If you have a significant difference between your 
### sexes in area you can use these data to determine which sex
### has a larger area than the other.  


### Now we want to plot our data so we can visually represent it.
### Use the code below to make a boxplot of your data. You should see the
### plot pop up in the bottom right corner of R studio.


boxplot(moss_data$Area~moss_data$Sex, 
     col= c("deeppink", "blue"),
     main="Area of Males and Females",
     ylab="Area", 
     xlab="Sex", 
     cex.axis=1, 
     cex.lab=1.25,
     cex.main=1.25)


### if you want to make the plot bigger you can hit "Zoom" and it 
### will open a new window


### Okay, let's run similar code as above, but add some more lines of code
### to also visualize our data points to 
### help us understand what a boxplot shows

boxplot(moss_data$Area~moss_data$Sex, 
     col= c("deeppink", "blue"),
     main="Area of Males and Females",
     ylab="Area", 
     xlab="Sex", 
     cex.axis=1, 
     cex.lab=1.25,
     cex.main=1.25)
stripchart(moss_data$Area~moss_data$Sex,
           vertical=TRUE,
           add=TRUE, 
           pch=20,
           cex=2,
           col="green")


### You will need a boxplot representing your data on your posters.
### If you would like to customize your plot use the copied version of the
### plot code **below**, but ****leave the versions above unedited!!!!****

#col= changes the color of the boxes in the plot (see note below for color options!)
#main= the title of the plot
#ylab= the label of the y-axis
#xlab= the label of the x-axis
#cex.axis= changes the size of the ticks on your axes
#cex.lab= changes the size of the labels on your axes
#cex.main= changes the size of text of your plot title
#cex= changes the plotting text and symbols size (won't be visible on boxplots unless you have 
# outliers or add stripchart)
#pch= changes the plot symbols (won't be visible on boxplots unless you have outliers
# or add stripchart)


boxplot(moss_data$Area~moss_data$Sex, 
     col= c("salmon", "blue"),
     main="Area of Males and Females",
     ylab="Area", 
     xlab="Sex", 
     cex.axis=1, 
     cex.lab=1.25,
     cex.main=1.25)


### options for colors you can use in your plot can be found at this link:
### http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

### other useful plot graphical parameters can be found at this link:
### https://www.statmethods.net/advgraphs/parameters.html


#### You can export your plot to a .png or other formats by hitting 
#### the tab "Export" > "Save as image"
## BUT!!! It will be really poor quality for your poster. So I
## STRONGLY do not recommend doing that for your poster. It will be crazy pixelated.

### In order to export your plot in high quality use the code below.
### Where I've put the comment "##### YOUR BOXPLOT CODE HERE" you should 
### put your final boxplot code with all your modifications
### You can adjust the width= and height= commands, but I strongly
### suggest leaving units= and res= commands alone

png("moss_area_by_sex.png", width = 4, height = 4, units = 'in', res = 300)
##### YOUR BOXPLOT CODE HERE
dev.off()





