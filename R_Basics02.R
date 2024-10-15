x=10
if(x>5){
  result="x is greater than 5"
}else if(x==5){
  result="x equal 5"
}else{
  result="x is less than 5"
}
result

for(i in 1:5){
  print(i)
}

i=1
while(i<=5){
  print(i)
  i=i+1
}

add_numbers=function(a,b){
  sum=a+b
  return(sum)
}
add_numbers(3,4)
data()

#load and view the dataset
data()
data(mtcars)
head(mtcars)
library(ggplot2)
ggplot(mtcars,aes(x=hp,y=mpg))+
  geom_point()+
  labs(title="horsepower vs. MPG")

library(dplyr)
mtcars %>%
  filter(gear==4) %>%
  summarize(mean_mpg=mean(mpg))
library(tidyr)
mtcars_long=mtcars %>%
  gather(key="measurement",value="value",mpg:carb)
head(mtcars_long)

library(readr)
my_data=read_csv("C:/Users/Admin/Desktop/CSV File/hello_world.csv")
tail(my_data)
head(my_data)

library(purrr)
numbers=list(1,2,3,4,5)
squared=map(numbers,~.x^2)
squared

library(stringr)
str_replace("the cat is on the roof","cat","dog")

library(forcats)
mtcars$gear=factor(mtcars$gear)
mtcars$gear=fct_reorder(mtcars$gear,mtcars$hp,median)
levels(mtcars$gear)

students=list(
  names=c("alice","bob","charlie","david","eva"),
  marks=c(85,42,38,59,90),
  passed=c(TRUE,TRUE,FALSE,TRUE,TRUE)
)
passed_students=students$names[students$passed]
passed_marks=students$marks[students$passed]
print(passed_students)
print(passed_marks)

