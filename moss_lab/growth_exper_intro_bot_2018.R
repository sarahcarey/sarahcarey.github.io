#### Intro to Botany Fall 2018
#### R script for analysis of moss area measurements
#### By S.Carey


### First we will need to read in our data file.
### To do so, change the code below to have the name of the file be what
### you have saved your moss data as
### NOTE: if you have spaces in the name of your file you should change them
### to underscores.


#moss_data <- read.csv("name_of_sheet_with_your_data.csv")
moss_data <- read.csv("Ceratodon_intro_bot_canned_data_2018.csv")

### now in the R environment you have an object named "moss_data" that contains
### the exact information as your .csv file. In the "Data" section of R studio
### (in the upper right corner of the screen)
### you will see the object "moss_data" and a grid symbol next to it. Click
### the grid symbol to view the contents of moss_data. If the format
### does not look as it did in your .cvs file, then something has gone wrong



### now that we have our data in R we can begin to analyze it.
### We want to run a t-test or ANOVA to
### see if there is a significant difference in growth between 
### our "treatments"


############################# t-test #############################

###If you are running a t-test use one of the code options below


## the code for analyzing differences between males and females
ttest <- t.test(moss_data$Area~moss_data$Sex)

## the code for analyzing differences between 2 populations
ttest <- t.test(moss_data$Area~moss_data$Population)

## the code for analyzing differences between 2 light treatments
ttest <- t.test(moss_data$Area~moss_data$Light_treatment)

########## to find your p-value ##########

##run the code below:
ttest

### In the console window below you will find the results of your t-test
### locate your p-value in the output. If it is equal to or below 0.05 
### then you have found a significant difference in
### area of your males and females, 2 populations, OR 2 light treatments.
### if your value is above 0.05 then there is no significant difference
### between your variables.

### The output of the t-test will also give you the mean area for your
### variables. If you have a significant difference between your 
### variables in area you can use these data to determine which variable
### has a larger area than the other.  



############################# ANOVA #############################

### if you're running an ANOVA use one of the code options below

### if you're comparing 3 or more populations you're running a one-way ANOVA using:
anova <- aov(moss_data$Area~moss_data$Population)

### if you're comparing different populations and separate sexes you're running a two-way ANOVA using:
anova <- aov(moss_data$Area~moss_data$Sex*moss_data$Population)

### if you're comparing different populations and light treatments you're running a two-way ANOVA using:
anova <- aov(moss_data$Area~moss_data$Population*moss_data$Light_treatment)

### if you're comparing different sexes and light treatments you're running a two-way ANOVA using:
anova <- aov(moss_data$Area~moss_data$Sex*moss_data$Light_treatment)


########## to find your p-value ##########

##run the code below:
summary(anova)

### In the console window below you will find the results of your ANOVA
### locate your p-values in the output. They'll be under the column PR(>F)
### There should be 1 if you're running a one-way ANOVA
### and 3 if you're running a two-way ANOVA. For the two-way there should be a p-value for
### each of your two variables and the interaction between them
###
### If your p-value is equal to or below 0.05 then you have
### found a significant difference in growth between that variable (or the interaction of variables)
### if your value is above 0.05 then there is no significant difference
### in the area of your variables.

### An ANOVA can tell you that there IS a significant difference
### but it doesn't tell you WHICH variables are significantly different
### to find the significantly different variables you need to run a Tukey's test

### to run Tukey's run the code below:
tukey <- TukeyHSD(anova)
tukey

### In the console window below you will find the results of your Tukey's test
### Each pairwise comparison is listed, each with a p-value. 
### If it is equal to or below 0.05 
### then you have
### found a significant difference in growth between those particular variables.



############################# BOXPLOTS #############################


### Now we want to plot our data so we can visually represent it.
### Use the code below to make a boxplot of your data. 

### first find the code you ran for your ttest or ANOVA and paste it below:
### Your code:



### you should either have code that is in the format:
### ttest <- t.test(code_specfic_to_question)
# OR
### anova <- aov(code_specfic_to_question)

### you will need to use the code_specfic_to_question in the boxplot 
### to plot your data correctly


### paste your code_specfic_to_question in the lines indicated below:


boxplot(#code_specfic_to_question, 
        col= c("deeppink", "blue"),
        main="type your title here",
        ylab="type your y axis here", 
        xlab="type your x axis here", 
        cex.axis=1, 
        cex.lab=1.25,
        cex.main=1.25)
stripchart(#code_specfic_to_question,
           vertical=TRUE,
           add=TRUE, 
           pch=20,
           cex=2,
           col="green")


### You should see the
### plot pop up in the bottom right corner of R studio.




### if you want to make the plot bigger you can hit "Zoom" and it 
### will open a new window



### You will need a boxplot representing your data on your posters.
### If you would like to customize your plot use the following commands:

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





