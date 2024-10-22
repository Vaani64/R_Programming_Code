#advanced triangle computations
is_valid_triangle=function(a,b,c){
  return((a+b>c)&(b+c>a)&(a+c>b))
}
triangle_type=function(a,b,c){
  if(a==b && b==c){
    return("equilateral")
  }
  else if(a==b ||b==c||c==a){
    return("isoceles")
  }
  else{
    return("scalene")
  }
}
area_triangle=function(a,b,c){
  s=(a+b+c)/2
  #heron's formula
  area=sqrt(s*(s-a)*(s-b)*(s-c))
  return(area)
}

cat("enter the length of the sides of the triangle:\n")
a=as.numeric(readline(prompt="side a:"))
b=as.numeric(readline(prompt="side b:"))
c=as.numeric(readline(prompt="side c:"))

validate_input=function(x){
  if(!is.numeric(x)||x<=0){
    stop("error: input must be positive number")
  }
  return(TRUE)
}

tryCatch({
  validate_input(a)
  validate_input(b)
  validate_input(c)


  if(!is_valid_triangle(a,b,c)){
    stop("Error: the given sides do not form a valid triangle")
  }

  type_of_triangle=triangle_type(a,b,c)
  cat("the triangle is:",type_of_triangle,"\n")
  
  area_of_triangle=area_triangle(a,b,c)
  cat("the area is:",area_of_triangle,"\n")
  
},error=function(e){
  cat( e$message,"\n")
}
)

