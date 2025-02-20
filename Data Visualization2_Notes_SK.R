#### Data Visualization2_Note ####
# How to make publication-worthy figures

# Loading necessary packages
library(tidyverse)
install.packages("ggpubr") # For making multiple plots together and integrating statistics
library(ggpubr)
install.packages("ggrepel") # For repelling overlapping text labels
library(ggrepel)
library(ggplot2)

# Note:
# The goal in publications is to have consistent color pallets and having consistent style

# color blind friendly pallet consisting of 8 colors
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# First, let's load our data:
sample.data.bac <- read.csv("BacterialAlpha.csv", na.strings = "na")

# Let's change the time point from "int" as "as.factor" to make sure it plots properly
sample.data.bac$Time_Point <- as.factor(sample.data.bac$TimePoint)
sample.data.bac$Crop <- as.factor(sample.data.bac$Crop)

# Note: by default, ggplot will operate alphabetically, but we can change the orders
sample.data.bac$Crop <- factor(sample.data.bac$Crop, levels = c("Soil", "Cotton", "Soybean"))
str(sample.data.bac)

### Let's make our figures ###
# Plot 1- B

bac.even <- ggplot(sample.data.bac, aes(x = Time_Point, y = even, color = Crop)) +  # Define aesthetics: x-axis as Time.Point, y-axis as even, and color by Crop
  geom_boxplot(position = position_dodge(0.85)) +  # Add boxplots with dodged positions to avoid overlap
  geom_point(position = position_jitterdodge(0.05)) +  # Add jittered points to show individual data points, avoiding overlap
  ylab("Pielou's evenness") +  # Label the y-axis
  xlab("Hours post sowing") +  # Label the x-axis
  scale_color_manual(values = cbbPalette, name = "", labels = c("Soil no seeds", "Cotton spermosphere", "Soybean spermosphere")) +  # Manually set colors and labels for the Crop variable
  theme_classic()   # Use a classic theme for the plot
bac.even

# Plot 2- A
sample.data.bac.nosoil <- subset(sample.data.bac, Crop != "Soil")

water.imbibed <- ggplot(sample.data.bac.nosoil, aes(Time_Point, 1000 * Water_Imbibed, color = Crop)) +  # Define aesthetics: x-axis as Time.Point, y-axis as Water_Imbibed (converted to mg), and color by Crop
  geom_jitter(width = 0.5, alpha = 0.5) +  # Add jittered points to show individual data points with some transparency
  stat_summary(fun = mean, geom = "line", aes(group = Crop)) +  # Add lines representing the mean value for each Crop group
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.5) +  # Add error bars representing the standard error of the mean
  xlab("Hours post sowing") +  # Label the x-axis
  ylab("Water Imbibed (mg)") +  # Label the y-axis
  scale_color_manual(values = c(cbbPalette[[2]], cbbPalette[[3]]), name = "", labels = c("", "")) +  # Manually set colors for the Crop variable
  theme_classic() +  # Use a classic theme for the plot
  theme(strip.background = element_blank(), legend.position = "none") +  # Customize theme: remove strip background and position legend to the right
  facet_wrap(~Crop, scales = "free")  # Create separate panels for each Crop, allowing free scales
water.imbibed


# Plot 3- C
water.imbibed.cor <- ggplot(sample.data.bac.nosoil, aes(y = even, x = 1000 * Water_Imbibed, color = Crop)) +  # Define aesthetics: y-axis as even, x-axis as Water_Imbibed (converted to mg), and color by Crop
  geom_point(aes(shape = Time_Point)) +  # Add points with different shapes based on Time.Point
  geom_smooth(se = FALSE, method = lm) +  # Add a linear model smooth line without confidence interval shading
  xlab("Water Imbibed (mg)") +  # Label the x-axis
  ylab("Pielou's evenness") +  # Label the y-axis
  scale_color_manual(values = c(cbbPalette[[2]], cbbPalette[[3]]), name = "", labels = c("Cotton", "Soybean")) +  # Manually set colors for the Crop variable
  scale_shape_manual(values = c(15, 16, 17, 18), name = "", labels = c("0 hrs", "6 hrs", "12 hrs", "18 hrs")) +  # Manually set shapes for the Time.Point variable
  theme_classic() +  # Use a classic theme for the plot
  guides(color = "none") + # Remove the color legend
  theme(strip.background = element_blank(), legend.position = "none") + #customize theme: remove strip background and position legend
  facet_wrap(~Crop, scales = "free")  # Create separate panels for each Crop, allowing free scales

water.imbibed.cor


#### Figure 2; significance levels added with Adobe or powerpoint #### 

# Arrange multiple ggplot objects into a single figure
figure2 <- ggarrange(
  water.imbibed,  # First plot: water.imbibed
  bac.even,  # Second plot: bac.even
  water.imbibed.cor,  # Third plot: water.imbibed.cor
  labels = "auto",  # Automatically label the plots (A, B, C, etc.)
  nrow = 3,  # Arrange the plots in 3 rows
  ncol = 1,  # Arrange the plots in 1 column
  legend = FALSE  # Do not include a legend in the combined figure
)

figure2

### Factorial ANOVA type designs: "stat_compare_means" function 
bac.even + 
  stat_compare_means(method = "anova") # apply an anova to the groups

### Example with pvalues as significance levels
bac.even + 
  geom_pwc(aes(group = Crop), method = "t_test", label = "p.adj.format")

### example with * as significance levels
bac.even + 
  geom_pwc(aes(group = Crop), method = "t_test", label = "p.adj.signif")

### Example with combined pvalue and * to indicate significance
bac.even + 
  geom_pwc(aes(group = Crop), method = "t_test", label = "{p.adj.format}{p.adj.signif}")


#### Displaying correlation data

water.imbibed.cor + 
  stat_cor(label.y = 0.7) +
  stat_regline_equation()

#### Specific point labeling
diff.abund <- read.csv("diff_abund.csv")

str(diff.abund)

## Make a volcano plot for Soybean vs. Soil
diff.abund$log10_pvalue <- -log10(diff.abund$p_CropSoybean)
diff.abund.label <- diff.abund[diff.abund$log10_pvalue > 30,]

## Make a boxplot (with emphasize on the certain points as a different shape or color)
volcano <- ggplot() + 
  geom_point(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue)) + 
  geom_point(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue), color = "red", shape = 17, size = 4) +
  geom_text_repel(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, label = Label), color = "red") + 
  theme_classic() + 
  xlab("Log fold change Soil vs. Soybean") +
  ylab("-log10 p-value")
volcano

