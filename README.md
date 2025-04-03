# **PLPA6820_SK**
## **Course Repository for PLPA6820**

Welcome to the **PLPA6820_SK** repository! This repository is dedicated to coursework, assignments, and projects related to **PLPA6820**. The content primarily focuses on **data analysis, visualization, and statistical approaches** using **R** for research applications in **plant pathology and biological sciences**.

---

## **Course Topics Covered**
This repository includes **various R-related topics**, such as:


### **1.Reproducibility & Git**
- Version control and repository management with Git & GitHub
- Best practices for organizing R projects
- Documenting workflows and updating README files
- [Reproducibility & Git Class Note](Intro_to_R_Note/Intro%20to%20R_ShakibaKazemian.R)

### **2.Basic Data Visualization**
- Creating **publication-ready plots** using `ggplot2`
- Enhancing plots with `ggpubr`, `ggrepel`, and custom themes
- Using **color-blind-friendly palettes** for better accessibility
- [Basic Data Visualization Class Note](Data_Visualization/Data%20Visualization1_Notes_SK.R)

### **3.Advanced Data Visualization**
- Faceted plots and multi-panel figures with `facet_wrap()`
- Combining multiple plots using `ggarrange()`
- Customizing legends, labels, and themes for clarity
- [Advanced Data Visualization Class Note](Data_Visualization/Data%20Visualization2_Notes_SK.R)

### **4.R Markdown for Reproducible Reports**
- Introduction to R Markdown (.Rmd) for combining code, text, and plots
- Formatting reports using Markdown syntax (headings, lists, tables)
- Embedding code chunks and inline R expressions
- Exporting reports to HTML, PDF, and Word
- [R Markdown Class Note](R_Markdown/R_Markdown_Class_Note.Rmd)

### **5. Data Wrangling**
- Cleaning and transforming data using tidyverse
- Selecting and filtering data with select(), filter()
- Creating new variables with mutate()
- Summarizing data with summarise() and group_by()
- Reshaping data with pivot_wider() and pivot_longer()
- Merging datasets using left_join(), right_join(), inner_join(), and full_join()
- [Data Wrangling Class Note](Data_Wrangeling/Data_Wrangling_ClassNote_SK.Rmd)

### **6. Loops & Functions**
- Automating repetitive tasks using for loops and while loops
- Writing custom functions to make code modular and reusable
- Applying functions across data with apply(), lapply(), map() from purrr
- Use cases in data cleaning, simulation, and batch plotting
- [Loops & Functions Class Note](Loops_and_Functions/Loops_and_Functions_Note_SK.Rmd)

### **7. Linear Models & Statistical Testing**
- Fundamentals of **linear regression**, **ANOVA**, and **correlation** in R  
- Using `lm()`, `anova()`, and `cor.test()` for model fitting and evaluation  
- Checking model assumptions with residual diagnostics  
- Interpreting **t-tests** as linear models  
- Performing **ANOVA with post-hoc tests** using `emmeans` and `multcomp`  
- Modeling **interactions** and visualizing them with `ggplot2`  
- Introduction to **mixed effects models** using `lmer()` from the `lme4` package  
- [Linear Models Class Note](Linear_Models/Linear_Models_Note_SK.Rmd)

---
## **Directory Tree**

```r
fs::dir_tree()
```

```bash
├── Data_Visualization
│   ├── Coding Challenge 2_Data visualization 1_SK.R
│   ├── Coding Challenge 3_ Data visualization 2_SK.R
│   ├── Data Visualization1_Notes_SK.R
│   ├── Data Visualization2_Notes_SK.R
│   ├── MycotoxinData.csv
│   └── Plots for DataVisualization 2 (Advanced)
│       ├── ADON_plot.png
│       ├── Combined_Plot.png
│       ├── Combined_Plot_ttest.png
│       ├── DON_plot.png
│       └── SeedMass_plot.png
├── Data_Wrangeling
│   ├── Bull_richness.csv
│   ├── Coding_Challenge5
│   │   ├── CodingChallenge5_DataWrangeling_SK.pdf
│   │   ├── CodingChallenge5_DataWrangeling_SK.Rmd
│   │   ├── DiversityData.csv
│   │   └── Metadata.csv
│   ├── Data_Wrangling_ClassNote_SK.html
│   └── Data_Wrangling_ClassNote_SK.Rmd
├── Intro_to_R_Note
│   ├── Coding challenge1_Introduction to R _SK.R
│   └── Intro to R_ShakibaKazemian.R
├── Linear_Models
│   ├── Bull_richness.csv
│   ├── Coding_Challenge7
│   │   ├── CodingChallenge7_LinearModel_SK.md
│   │   ├── CodingChallenge7_LinearModel_SK.pdf
│   │   ├── CodingChallenge7_LinearModel_SK.Rmd
│   │   └── PlantEmergence.csv
│   ├── Linear_Models_Note_SK.html
│   ├── Linear_Models_Note_SK.md
│   └── Linear_Models_Note_SK.Rmd
├── Loops_and_Functions
│   ├── Coding_Challenge6
│   │   ├── Cities.csv
│   │   ├── CodingChallenge6_Iterations&Functions_SK.Rmd
│   │   ├── CodingChallenge6_Iterations-Functions_SK.md
│   │   └── CodingChallenge6_Iterations-Functions_SK.pdf
│   ├── EC50_all.csv
│   ├── Loops_and_Functions_Note_SK.html
│   └── Loops_and_Functions_Note_SK.Rmd
├── PLPA6820_SK.Rproj
├── README.md
└── R_Markdown
    ├── Coding_Challenge4
    │   ├── Coding_Challenge4_Markdown_SK.docx
    │   ├── Coding_Challenge4_Markdown_SK.md
    │   ├── Coding_Challenge4_Markdown_SK.Rmd
    │   ├── Combined_Plot_ttest.png
    │   └── MycotoxinData.csv
    ├── R_Markdown_Class_Note.html
    ├── R_Markdown_Class_Note.Rmd
    └── Shrek.jpg
```

---
### DOI:
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.14933733.svg)](https://doi.org/10.5281/zenodo.14933733)
