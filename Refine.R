#### File name: ProjectSec_3_1; Date: February 10, 2018; Author: Maria 
library(data.table)
library(readxl)
library(dplyr)
library(readr)
library(tidyr)
library(stringr)

# 0: Load the data in RStudio
## Load   data from refine_original csv file
refine_original <- fread("refine_original.csv")

#1: Clean up brand names
## transform in lowercase
refine_clean <-refine_original
refine_clean$company <- as.data.frame(sapply(refine_original$company,tolower))
patt1 <- grepl(pattern="ak",refine_clean$company)
patt2 <-grepl(pattern="s", refine_clean$company)
patt3 <- grepl(pattern ="$ten", refine_clean$company)
patt4 <- grepl(pattern ="^un", refine_clean$company)
##correct misspelling
refine_clean$company[patt1==TRUE]<- "akzo"
refine_clean$company[patt2==TRUE] <- "philips"
refine_clean$company[patt3==TRUE] <- "van houten"
refine_clean$company[patt4==TRUE] <- "unilever"


# 2: Separate product code and number                      
refine_clean <- separate(refine_clean, `Product code / number`, c("product_code", "product_number"), sep ="-")

#3: Add product categories
refine_clean <-  cbind(refine_clean, "product_category"<- "NA") 
names(refine_clean)[8]<-paste("product_category") 

refine_clean$product_category[grepl(pattern="p",refine_clean$product_code)==TRUE]<-"Smartphone"
refine_clean$product_category[grepl(pattern="v",refine_clean$product_code)==TRUE]<-"TV"
refine_clean$product_category[grepl(pattern="x",refine_clean$product_code)==TRUE]<-"Laptop"
refine_clean$product_category[grepl(pattern="q",refine_clean$product_code)==TRUE]<-"Tablet"


##4: Add full address for geocoding
refine_clean_dups <- select(refine_clean,address,city,country)
refine_clean_dups <- unite(refine_clean_dups,"full_address", address, city, country, sep=', ')
refine_clean <-cbind(refine_clean,refine_clean_dups)

# Reorder  column 
#data[c("size", "id", "weight")] by name
#df2[,c(1,3,2,4)] by index
refine_clean<-refine_clean[,c(1,2,3,8,7,4,5,6,9)]

#5: Create dummy variables for company and product category
## 5.1: Add four binary (1 or 0) columns for company: 
###company_philips, 
refine_clean$company_philips[grepl(pattern="philips",refine_clean$company)==TRUE]<-1
refine_clean$company_philips[grepl(pattern="philips",refine_clean$company)==!TRUE]<-0

###  company_akzo
refine_clean$company_akzo[grepl(pattern="akzo",refine_clean$company)==TRUE]<-1
refine_clean$company_akzo[grepl(pattern="akzo",refine_clean$company)==!TRUE]<-0 

### company_van_houten 
refine_clean$company_van_houten[grepl(pattern="van houten",refine_clean$company)==TRUE]<-1
refine_clean$company_van_houten[grepl(pattern="van houten",refine_clean$company)==!TRUE]<-0 

### company_unilever
refine_clean$company_unilever[grepl(pattern="unilever",refine_clean$company)==TRUE]<-1
refine_clean$company_unilever[grepl(pattern="unilever",refine_clean$company)==!TRUE]<-0 

## 5.2: Add four binary (1 or 0) columns for product category:
### product_smartphone
refine_clean$product_smartphone[grepl(pattern="Smartphone",refine_clean$product_category)==TRUE]<-1
refine_clean$product_smartphone[grepl(pattern="Smartphone",refine_clean$product_category)==!TRUE]<-0 

### product_tv
refine_clean$product_tv[grepl(pattern="TV",refine_clean$product_category)==TRUE]<-1
refine_clean$product_tv[grepl(pattern="TV",refine_clean$product_category)==!TRUE]<-0 

### product_laptop
refine_clean$product_laptop[grepl(pattern="Laptop",refine_clean$product_category)==TRUE]<-1
refine_clean$product_laptop[grepl(pattern="Laptop",refine_clean$product_category)==!TRUE]<-0 

### product_tablet.
refine_clean$product_tablet[grepl(pattern="Tablet",refine_clean$product_category)==TRUE]<-1
refine_clean$product_tablet[grepl(pattern="Tablet",refine_clean$product_category)==!TRUE]<-0      

write.csv(refine_clean, file = "refine_clean.csv", row.names = FALSE)