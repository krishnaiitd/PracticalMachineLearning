list1 <- c(1:4)
#print(list)

square <- function(x) {
        #print(x^2)
        x^2
}
## lapply ###
# Loop over a list and evaluate a function on each element
class(list1)
llist1 <- lapply(list1, square)
class(llist1)

x <- list(a=1:5, b=rnorm(10)) 
lapply(x, mean)