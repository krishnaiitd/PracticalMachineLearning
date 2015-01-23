## Quiz 3 of R programming ##

library(datasets)
data(iris)

virginica <- subset(iris, Species == 'virginica')

mean(virginica$Sepal.Length)

