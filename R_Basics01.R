# Variables and basic operations
x = 2
print(x)
x = 3
x = "hello"
print(x)

for (x in 1:10) {
  print(x)
}

ht = c(452, 784, 698, 784, 214, 256, 856, 445)
print(ht[3])
print(ht[4:6])
obs = 1:8
wt = c(21, 45, 85, 65, 69, 35, 19, 37)
bmi = wt / ((ht / 100) ^ 2)
print(21 / 4.52^2)
print(length(ht))
print(mean(ht))
print(median(ht))
print(var(ht))

name = "ananya"
print(name)
x = 5
print(paste(x, name))

M = cbind(obs, ht, wt, bmi)
print(typeof(M))
print(class(M))
print(is.matrix(M))
print(dim(M))

plot(ht, wt, xlab = "height", ylab = "weight", col = "blue", type = "o", cex = 5)

v1 = v2 = v3 = "orange"
print(typeof(v1))
print(dim(v1))
print(typeof(name))
print(typeof(x))

abc = "bladder"
int = 55L
print(int)

library(tibble)
install.packages("tidyverse")
mydat = as_tibble(M)
print(names(mydat))
print(mydat)
print(summary(mydat))

library(readr)
write_csv(mydat, "my_data.csv")
mydat2 = read_csv("my_data.csv")
print(mydat2)

setwd("~/F:")
print(getwd())
print(dir())

ex_fn = function(a, b = 2) {
  r = a / b
  return(r)
}
print(ex_fn(3))
print(ex_fn(12, 6))
print(ex_fn(b = 0, a = 6))

print(ht + wt)
print(sum(wt))
print(prod(wt))

var = readline(prompt = 'enter a line: ')
nos = floor(runif(10) * 10)

# Lab 2
mat = matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3, byrow = TRUE)
mat_add = mat + 5
mat_mul = mat * 2
mat_transpose = t(mat)

print("Original Matrix:")
print(mat)
print("Matrix after addition:")
print(mat_add)
print("Matrix after multiplication:")
print(mat_mul)
print("Matrix transpose:")
print(mat_transpose)
print("Matrix after multiplying with its transpose:")
mat_prod = mat %*% t(mat)
print(mat_prod)

mat1 = matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3, byrow = TRUE)
mat2 = matrix(c(9, 8, 7, 6, 5, 4, 3, 2, 1), nrow = 3, byrow = TRUE)

mat_add = mat1 + mat2
mat_sub = mat1 - mat2

mat_scaler_add = mat1 + 5
mat_scaler_mul = mat1 * 2

mat_mult = mat1 %*% mat2
mat_h = mat1 * mat2

my_list = list(vector = c(1, 2, 3), matrix = matrix(1:9, nrow = 3), name = "Sample list")
print("Vector in list:")
print(my_list$vector)
my_list$name = "updated name"
print(my_list$name)

student_list = list(names = c("ananya", "disha", "prameela", "akshata"),
                    marks = c(90, 88, 89, 45),
                    passed = c(TRUE, TRUE, TRUE, FALSE))
cat("STUDENT NAMES:", student_list$names, sep = " ")

passed_students = student_list$names[student_list$passed]

student_list$marks[4] = 80
student_list$age = c(20, 21, 20, 18)

nested_list = list(classA = list(name = c("abhinav", "dharav"), marks = c(66, 45)),
                   classB = list(name = c("allva", "dummy"), marks = c(20, 43)))
print(nested_list)
classA_names = nested_list$classA$name

estudent_list = list(names = c("arya", "prakash"),
                     marks = c(73, 64),
                     passed = c(TRUE, FALSE))
combined_list = list(
  names = c(estudent_list$names, student_list$names),
  marks = c(estudent_list$marks, student_list$marks),
  passed = c(estudent_list$passed, student_list$passed)
)

print(combined_list)

estudent_list = NULL

list_length = length(combined_list)

sorted_marks = sort(combined_list$marks)

month_temp = c(34, 21, 32, 20, 24, 28, 29, 30)
mean_temp = mean(month_temp)
cat("Mean temperature:", mean_temp)
more_than_avg_temp = month_temp[month_temp > mean_temp]
cat("Temperatures more than avg:", more_than_avg_temp)
diff = max(month_temp) - min(month_temp)

sales = matrix(c(22, 13, 43, 54, 67, 86, 33, 45, 45, 43, 72, 83, 23, 78, 49, 72), nrow = 4, byrow = TRUE)
print(sales)
row_sums = rowSums(sales)
print(row_sums)

col_sums = colSums(sales)
cat("Total sales for each region:", col_sums, sep = "\n")

highest_all_rows = max.col(sales)
highest = highest_all_rows[3]
print(highest)

