library(tidyverse) #for data manipulation

install.packages("titanic")
install.packages("caret")
install.packages("ggcorrplot")


library(titanic)   
library(dplyr)     #data manipulation 
library(caret)      #for z-score based outlier detection\n

library(ggcorrplot)  #for correlation plot

#1.import dataset(titanic)
data=titanic::titanic_train

#2.handle missing data
#replace missing "age" values with the median
data$Age[is.na(data$Age)]=median(data$Age,na.rm=TRUE)

#replace missing "embarked" value with mode
mode_embarked=as.character(names(sort(table(data$Embarked),decreasing=TRUE
                                      ))[1])
data$Embarked[is.na(data$Embarked)]=mode_embarked

#3.remove outlier using z-score
numeric_columns=sapply(data,is.numeric)
#calculate z-scores for each numeric column
z_scores=as.data.frame(scale(data[,numeric_columns]))
#identify rows that have z-score greater than 3 or less than -3
outlier_condition=apply(z_scores,1,function(row) any(abs(row)>3))
#filter out the outlier
data_clean=data[!outlier_condition,]


#4.summarize the dataset before and after cleaning

#summary before cleaning
summary_before=summary(titanic::titanic_train)
#summary after cleaning
summary_after=summary(data_clean)

#calculate correlation matrix
correlation_matrix=cor(data_clean[,numeric_columns],use="complete.obs")

#5.export cleaned data to a new csv file
write.csv(data_clean,"cleaned_titanic_data.csv",row.names=FALSE)

#display summary
print("summary before cleaning:")
print(summary_before)
print("summary after cleaning:")
print(summary_after)
print("CORRELATION MATRIX:")
print(correlation_matrix)

#6.plot the correlation matrix
ggcorrplot(correlation_matrix,method="circle",lab=TRUE,title="Correlation matrix of titanic dataset")




#####INCOME DATASET#######
library(tidyverse)
library(dplyr)     #data manipulation 
library(caret) 

data=read.csv("C:/Users/Admin/Downloads/adult.csv/adult.csv",header=FALSE)

colnames(data)=c("age","workclass","fnlwgt","educational-num","education","marital_status","occupation","relationship","race","sex","capital-gain
","capital_loss","hours-per-week","native_country","income")

#replace missing "?" values with NA
data[data=="?"]=NA

#replace missing values in categorical columns with mode 
replace_mode=function(x){
  mode_value=as.character(names(sort(table(x),decreasing=TRUE))[1])
  x[is.na(x)]=mode_value
  return(x)
}

data=data %>%
  mutate_if(is.character,replace_mode)

#replace missing numeric value with median
data=data %>%
  mutate_if(is.numeric,~ifelse(is.na(.),median(.,na.rm=TRUE), .))

#define "remove outlier" function
remove_outliers=function(x){
  z_scores=scale(x)
  x[abs(z-scores)<=3]
}

#remove outlier using z-score
numeric_columns=sapply(data,is.numeric)
#apply z-score outlier removal to numeric columns
data_clean=data %>%
  filter(!apply(as.data.frame(scale(data[,numeric_columns])),1,function(row) any(abs(row)>3)))

#summary_before cleaning 
summary_before=summary(read.csv("C:/Users/Admin/Downloads/adult.csv/adult.csv",header=FALSE))

summary_after=summary(data_clean)

#calculate correlation matrix
correlation_matrix=cor(data_clean[,numeric_columns],use="complete.obs")

#5.export cleaned data to a new csv file
write.csv(data_clean,"cleaned_adult_income_data.csv",row.names=FALSE)

#display summary
print("summary before cleaning:")
print(summary_before)
print("summary after cleaning:")
print(summary_after)
print("CORRELATION MATRIX:")
print(correlation_matrix)

#6.plot the correlation matrix
ggcorrplot(correlation_matrix,method="circle",lab=TRUE,title="Correlation matrix of adult income dataset")

