#### Coding Challenge 3: Data Visualization 2_SK ####

### **Step 1: Load Libraries & Define Color Palette**
library(tidyverse)
library(ggpubr)

# Define color palette (color-blind friendly)
cbbPalette <- c("#56B4E9", "#009E73")  # Colors for Ambassador and Wheaton

### **Step 2: Load & Clean Data**
# Load the dataset 
mycotoxin_data <- read.csv("MycotoxinData.csv")

# Clean the dataset: Remove non-numeric values and drop NA rows
mycotoxin_data_clean <- mycotoxin_data %>%
  mutate(
    DON = as.numeric(str_replace_all(as.character(DON), "[^0-9\\.]", "")),
    X15ADON = as.numeric(str_replace_all(as.character(X15ADON), "[^0-9\\.]", "")),
    MassperSeed_mg = as.numeric(str_replace_all(as.character(MassperSeed_mg), "[^0-9\\.]", ""))
  ) %>%
  drop_na(DON, X15ADON, MassperSeed_mg) %>%  # Remove rows with NA values
  mutate(
        Cultivar = as.factor(Cultivar)
  )

# Verify that NA values are removed
summary(mycotoxin_data_clean)

### **Q1: DON Boxplot (Default Order)**
DON_plot_Q1 <- ggplot(mycotoxin_data_clean, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(outlier.shape = NA, position = position_dodge(0.75)) +
  geom_jitter(aes(color = Cultivar), 
              position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75), 
              alpha = 0.6) +
  facet_wrap(~Cultivar) +
  scale_fill_manual(values = cbbPalette) +
  scale_color_manual(values = cbbPalette) +
  theme_classic() +
  labs(x = "", y = "DON (ppm)", fill = "Cultivar")

# Display the plot
DON_plot_Q1

### **Q2: Reorder Treatment Levels and create DON Boxplot**
mycotoxin_data_clean$Treatment <- factor(mycotoxin_data_clean$Treatment, 
                                         levels = c("NTC", "Fg", "Fg + 37", "Fg + 40", "Fg + 70"))  # New order

DON_plot_Q2 <- ggplot(mycotoxin_data_clean, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(outlier.shape = NA, position = position_dodge(0.75)) +
  geom_jitter(aes(color = Cultivar), 
              position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75), 
              alpha = 0.6) +
  facet_wrap(~Cultivar) +
  scale_fill_manual(values = cbbPalette) +
  scale_color_manual(values = cbbPalette) +
  theme_classic() +
  labs(x = "", y = "DON (ppm)", fill = "Cultivar")

# Display the plot
DON_plot_Q2

### **Q3: Create Plots for 15ADON and Seed Mass**
# 15ADON Boxplot
ADON_plot <- ggplot(mycotoxin_data_clean, aes(x = Treatment, y = X15ADON, fill = Cultivar)) +
  geom_boxplot(outlier.shape = NA, position = position_dodge(0.75)) +
  geom_jitter(aes(color = Cultivar), position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75), alpha = 0.6) +
  facet_wrap(~Cultivar) +
  scale_fill_manual(values = cbbPalette) +
  scale_color_manual(values = cbbPalette) +
  theme_classic() +
  labs(x = "", y = "15ADON", fill = "Cultivar")

# Mass per Seed Boxplot
SeedMass_plot <- ggplot(mycotoxin_data_clean, aes(x = Treatment, y = MassperSeed_mg, fill = Cultivar)) +
  geom_boxplot(outlier.shape = NA, position = position_dodge(0.75)) +
  geom_jitter(aes(color = Cultivar), position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75), alpha = 0.6) +
  facet_wrap(~Cultivar) +
  scale_fill_manual(values = cbbPalette) +
  scale_color_manual(values = cbbPalette) +
  theme_classic() +
  labs(x = "", y = "Seed Mass (mg)", fill = "Cultivar")

# Display the plots
DON_plot
ADON_plot
SeedMass_plot

# Save the plots
ggsave("DON_plot.png", DON_plot, width = 8, height = 6, dpi = 300)
ggsave("ADON_plot.png", ADON_plot, width = 8, height = 6, dpi = 300)
ggsave("SeedMass_plot.png", SeedMass_plot, width = 8, height = 6, dpi = 300)


### **Q4: Combine Plots into One Figure**
Combined_Plot <- ggarrange(
  DON_plot, ADON_plot, SeedMass_plot,  
  labels = c("A", "B", "C"),  
  ncol = 3, nrow = 1,  
  common.legend = TRUE,  
  legend = "right"
)

# Display the combined plot
print(Combined_Plot)

# Save the combined figure
ggsave("Combined_Plot.png", Combined_Plot, width = 12, height = 5, dpi = 300)


### **Q5: Add Pairwise t-tests to Each Plot**
DON_plot_ttest <- DON_plot + stat_compare_means(method = "t.test", aes(group = Treatment), label = "p.signif")
ADON_plot_ttest <- ADON_plot + stat_compare_means(method = "t.test", aes(group = Treatment), label = "p.signif")
SeedMass_plot_ttest <- SeedMass_plot + stat_compare_means(method = "t.test", aes(group = Treatment), label = "p.signif")

# Combine all updated plots into one figure
Combined_Plot_ttest <- ggarrange(
  DON_plot_ttest, ADON_plot_ttest, SeedMass_plot_ttest,  
  labels = c("A", "B", "C"),  
  ncol = 3, nrow = 1,  
  common.legend = TRUE,  
  legend = "right"
)

# Display the final combined plot with t-tests
print(Combined_Plot_ttest)

# Save the final combined figure
ggsave("Combined_Plot_ttest.png", Combined_Plot_ttest, width = 12, height = 5, dpi = 300)
