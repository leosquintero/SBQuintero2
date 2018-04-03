

#0: Load the data in RStudio
titanic_original <- read.csv("titanic_original.csv", stringsAsFactors = FALSE)


#1: Port of embarkation
titanic_original$embarked[titanic_original$embarked == ""] <- "S"

#2: Age
age_mean <- round(mean(titanic_original$age, na.rm = TRUE))
titanic_original$age[is.na(titanic_original$age)] <- 30

titanic_original$age[titanic_original$age == "NA"] <- 30
titanic_original$age <- gsub(pattern = "na.rm", replacement = 30, x = titanic_original$age)
titanic_original$age <- replace_na(titanic_original$age, replace = c(30))

#3: Lifeboat
titanic_original$boat[titanic_original$boat == ""] <- "NA"

#4: Cabin
#Does it make sense to fill missing cabin numbers with a value?
# It does not make sence to fill the missing values. 
#What does a missing value here mean?
#It means alone passangers that did not survive

titanic_original$has_cabin_number <- ifelse(nchar(titanic_original$cabin) == 0, 0, 1)

#finding a corelation
correlation <- cor(titanic_original$has_cabin_number, titanic_original$survived)

#5: Submit the project on Github
write.csv(titanic_original, file = "titanic_clean.csv")
