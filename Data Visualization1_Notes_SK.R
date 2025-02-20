#### Data Visualization1 ####

# load a built-in dataset
data("mtcars")

# checking the structure of the dataframe
str(mtcars)

# making the first simple scatter plot using plot() function (base plot)
plot(x = mtcars$wt, y = mtcars$mpg)

# adding x and y labels to make the plot fancier! 
plot(x = mtcars$wt, y = mtcars$mpg,
     xlab = "Car Weight", 
     ylab = "Miles per gallon", 
     font.lab = 6,
     pch = 20) 

#### ggplots ####

# installing and loading the package
install.packages("ggplot2")
library(ggplot2)

## plot example
ggplot() # if you received blank result or error, load it in your library first


# the first argument in a ggplot is the data, so we need to put a dataframe in it
# the next thing is aesthetics (where we put our x and y)
# and we can add layers of data after + sign
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() + # you don't necessarily need to put sth in the parenthesis
  geom_smooth(method = lm, se = FALSE)

# we can also change the orders for layers by changing which layer is displayed on top
# and add more layers
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_smooth(method = lm, se = FALSE, color = "grey") +
  geom_point(aes(size = wt, color = wt)) + # color will change based on the weight
  xlab("Weight") +
  ylab("Miles per gallon")

# lets make it more complicated an another variable
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_smooth(method = lm, se = FALSE, color = "grey") +
  geom_point(aes(size = cyl, color = hp)) +
  xlab("log 10 Weight") +
  ylab("% Miles per gallon") +
  scale_color_gradient(low = "orange", high = "black") + #we can change the scale color range
  scale_x_log10() + # changes the x bar to log of x
  scale_y_continuous(labels = scales::percent) # transform the y axes to percentage

## another example with a categorical data (categorical + numeric)
# Read in the data
bull.richness <- read.csv("Bull_richness.csv")
bull.richness.soy.no.till <- bull.richness[bull.richness$Crop == "Soy" & 
                                             bull.richness$Treatment == "No-till",] # subset to soy data

## Boxplots
ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, color = Fungicide)) + 
  geom_boxplot() +
  xlab("") +
  ylab("Fungal Ritchness")+
  geom_point(position = position_jitterdodge(dodge.width=0.9))

# Note:
# We use the function "geom_point()" to show the distribution of the data which adds points to the plot
# we use the function “position_jitterdoge()” to make a distribution of the points over the boxplot

## Bar plots
# We can also do mean_ci instead of mean_se.
ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, color = Fungicide, fill = Fungicide)) + 
  stat_summary(fun=mean,geom="bar") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") + 
  xlab("") + 
  ylab("Fungal Ritchness")

# Note: there is a difference between the actual coloring or the fill in bar charts
# color usually refers to the outside lines, while "fill" function will change the color of actual bars
# Error bars are based on the "color" function
# "Color" controls the outside color but "fill" will control the inside color

# calculate common summary statistics and plot them from raw data using the "stat" feature of ggplot
# using stat_summary() to plot the mean and standard error
ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, color = Fungicide, fill = Fungicide)) + 
  stat_summary(fun=mean,geom="bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") + 
  xlab("") + 
  ylab("Bulleribasidiaceae richness")

## Lines connection
ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, group = Fungicide, color = Fungicide)) + 
  stat_summary(fun=mean,geom="line") +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.5) +
  ylab("Bulleribasidiaceae \n richness") + 
  xlab("") 

## Faceting
# using the function facet_wrap()
# we use the “~” sign to say what variables we want to facet by
ggplot(bull.richness, aes(x = GrowthStage, y = richness, group = Fungicide, color = Fungicide)) + 
  stat_summary(fun=mean,geom="line") +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.5) +
  ylab("Bulleribasidiaceae \n richness") + 
  xlab("") +
  facet_wrap(~Treatment)

# adding titles and separate data by treatment
ggplot(bull.richness, aes(x = GrowthStage, y = richness, group = Fungicide, color = Fungicide)) + 
  stat_summary(fun=mean,geom="line") +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.5) +
  ylab("Bulleribasidiaceae \n richness") + 
  xlab("") +
  facet_wrap(~Treatment*Crop, scales = "free")

# or we can switch the order of the facet
ggplot(bull.richness, aes(x = GrowthStage, y = richness, group = Fungicide, color = Fungicide)) + 
  stat_summary(fun=mean,geom="line") +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.5) +
  ylab("Bulleribasidiaceae \n richness") + 
  xlab("") +
  facet_wrap(~Crop*Treatment, scales = "free") 
# we can add free_y or free_x to specify it for x and y axis

