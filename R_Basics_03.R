library(dplyr)
library(ggplot2)
library(moments)
install.packages("moments")
install.packages("palmerpenguins")

library(palmerpenguins)
data(iris)
data(penguins)

calc_mode=function(x){
  return(as.numeric(names(sort(table(x),decreasing=TRUE))
                    [1]))
}

print("---------iris data analysis----------")
#mean
iris_mean=sapply(iris[,1:4],mean,na.rm=TRUE)
print(paste("mean of iris dataset:",iris_mean))
#median
iris_median=sapply(iris[,1:4],median,na.rm=TRUE)
print(paste("median of iris dataset:",iris_median))
#mode
iris_mode=sapply(iris[,1:4],calc_mode)
print(paste("mode of iris dataset:",iris_mode))
#variance
iris_variance=sapply(iris[,1:4],var,na.rm=TRUE)
print(paste("variance of iris dataset:",iris_variance))

iris_mode = sapply(iris[, 1:4], calc_mode)
print(iris_mode)

#STANDARD DEVIATION
iris_sd=sapply(iris[,1:4],sd,na.rm=TRUE)
print(paste("sd of iris dataset:", iris_sd))


#SKEWNESS
# If you haven't installed the e1071 package yet, uncomment the line below:
# install.packages("e1071")

# Load the e1071 package (it contains both skewness and kurtosis functions)
library(e1071)

# Calculate skewness for the first 4 columns of the iris dataset
iris_skewness = sapply(iris[, 1:4], skewness, na.rm = TRUE)
print(paste("Skewness of iris dataset:", iris_skewness))

# Calculate kurtosis for the first 4 columns of the iris dataset
iris_kurtosis = sapply(iris[, 1:4], kurtosis, na.rm = TRUE)
print(paste("Kurtosis of iris dataset:", iris_kurtosis))


#hypothesis testing(t-test) b\w sepal.length of setosa and versicolor
setosa=subset(iris,Species=="setosa")$Sepal.Length
versicolor=subset(iris,Species=="versicolor")$Sepal.Length
t_test=t.test(setosa,versicolor)
print(t_test)

#visualization of iris dataset
#histogram for sepal.length
ggplot(iris,aes(x=Sepal.Length))+geom_histogram(binwidth=0.3,fill="blue",color="black")+ggtitle("historgram of sepal length in iris dataset")

#boxplot for sepal.length across species
ggplot(iris,aes(x=Species,y=Sepal.Length,fill=Species))+
  geom_boxplot()+
  ggtitle("boxplot of sepal length by species in iris dataset")

#perform statistical analysis on palmer penguine dataset
print("-------palmer penguine dataset analysis-------")
#remove rows with missing values
penguins_clean=na.omit(penguins)
#mean
penguins_mean=sapply(penguins_clean[,3:6],mean,na.rm=TRUE)
print(paste("Mean of palmer penguins dataset:",penguins_mean))
#median
penguins_median=sapply(penguins_clean[,3:6],median,na.rm=TRUE)
print(paste("Median of palmer penguins dataset:",penguins_median))

#hypothesis testing(t-test) b\w flipper_length_mm of Adelie and Gentoo species
adelie=subset(penguins_clean,species=="Adelie")$flipper_length_mm
Gentoo=subset(penguins_clean,species=="Gentoo")$flipper_length_mm
t_test_penguins=t.test(adelie,Gentoo)
print(t_test_penguins)

#visualization
#histogram for flipper_length_mm

ggplot(penguins_clean,aes(x=species,y=flipper_length_mm,fill=species))+geom_boxplot()+ggtitle("boxplot of flipper length by species in palmer penguins dataset")
