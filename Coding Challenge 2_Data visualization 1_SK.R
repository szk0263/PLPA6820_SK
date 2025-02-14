#### Coding Challenge 2: Data visualization 1 ####

### Q2:
# Load necessary libraries
library(ggplot2)
library(readr)  # For reading CSV files
library(dplyr)  # For data manipulation

# Read the data
data <- read_csv("MycotoxinData.csv")

# Create the boxplot
ggplot(data, aes(x = Treatment, y = DON, color = Cultivar)) + 
  geom_boxplot() +  # Boxplot visualization
  labs(y = "DON (ppm)", x = "") +  # Custom axis labels
  theme_minimal()  # Clean theme


### Q3:
# Bar chart with mean and SE error bars
ggplot(data, aes(x = Treatment, y = DON, fill = Cultivar)) + 
  stat_summary(fun = mean, geom = "bar", position = "dodge", alpha = 0.7) +  # Mean bar chart
  stat_summary(fun.data = mean_se, geom = "errorbar", position = position_dodge(width = 0.9), width = 0.2) +  # SE error bars
  labs(y = "DON (ppm)", x = "") +  # Custom axis labels
  theme_minimal() +  # Clean theme
  scale_fill_brewer(palette = "Set1")  # Nice color palette


### Q4:
# Create the boxplot with jittered points
ggplot(data, aes(x = Treatment, y = DON, color = Cultivar)) +
  geom_boxplot() +
  xlab("") +
  ylab("DON (ppm)") +
  geom_point(position = position_jitterdodge(dodge.width = 0.9), 
             shape = 21, fill = "white", color = "black")


# Create the bar chart with standard error bars and jittered points
ggplot(data, aes(x = Treatment, y = DON, color = Cultivar, fill = Cultivar)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  xlab("") +
  ylab("DON (ppm)") +
  geom_point(position = position_jitterdodge(dodge.width = 0.9), 
             shape = 21, fill = "white", color = "black")



### Q5:
# Define the colorblind palette
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", 
                "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# Boxplot with Points
ggplot(data, aes(x = Treatment, y = DON, fill = Cultivar, color = Cultivar)) +
  geom_boxplot(color = "black") +
  xlab("") +
  ylab("DON (ppm)") +
  geom_point(position = position_jitterdodge(dodge.width = 0.9), 
             shape = 21, color = "black", size = 2) +
  scale_fill_manual(values = cbbPalette)

# Bar Chart with Points
ggplot(data, aes(x = Treatment, y = DON, fill = Cultivar, color = Cultivar)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  xlab("") +
  ylab("DON (ppm)") +
  geom_point(position = position_jitterdodge(dodge.width = 0.9), 
             shape = 21, color = "black", size = 2) +
  scale_fill_manual(values = cbbPalette)

### Q6:
# Boxplot with Points Faceted by Cultivar
ggplot(data, aes(x = Treatment, y = DON, fill = Cultivar, color = Cultivar)) +
  geom_boxplot(color = "black") +
  xlab("") +
  ylab("DON (ppm)") +
  geom_point(position = position_jitterdodge(dodge.width = 0.9), 
             shape = 21, fill = "white", color = "black", size = 2) +
  scale_fill_manual(values = cbbPalette) +
  facet_wrap(~ Cultivar)

# Bar Chart with Points Faceted by Cultivar
ggplot(data, aes(x = Treatment, y = DON, fill = Cultivar, color = Cultivar)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  xlab("") +
  ylab("DON (ppm)") +
  geom_point(position = position_jitterdodge(dodge.width = 0.9), 
             shape = 21, fill = "white", color = "black", size = 2) +
  scale_fill_manual(values = cbbPalette) +
  facet_wrap(~ Cultivar)


### Q7:
# Boxplot with transparent Points
ggplot(data, aes(x = Treatment, y = DON, fill = Cultivar, color = Cultivar)) +
  geom_boxplot(color = "black") +
  xlab("") +
  ylab("DON (ppm)") +
  geom_point(position = position_jitterdodge(dodge.width = 0.9), 
             shape = 21, color = "black", size = 2, alpha = 0.6) +
  scale_fill_manual(values = cbbPalette)

# Bar Chart with transparent Points
ggplot(data, aes(x = Treatment, y = DON, fill = Cultivar, color = Cultivar)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  xlab("") +
  ylab("DON (ppm)") +
  geom_point(position = position_jitterdodge(dodge.width = 0.9), 
             shape = 21, color = "black", size = 2, alpha = 0.6) +
  scale_fill_manual(values = cbbPalette)


### Q8:
# Violin Plot with Overlaid Points 
ggplot(data, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_violin(trim = FALSE, color = "black") +
  geom_point(position = position_jitter(width = 0.2), 
             shape = 21, fill = "white", color = "black", size = 2, alpha = 0.6) +
  xlab("") +
  ylab("DON (ppm)") +
  theme_minimal() +
  scale_fill_manual(values = cbbPalette)


