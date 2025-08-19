x <- c(1, 3, 5, 7, 9)
# know the mean is 5

new_mean <- function(x) {
	n <- length (x)
	mean_val <- sum(x) / n
	return(mean_val)
}

new_mean (x)

y <- c(2738, 2773, 2862, 4089)
new_mean(y)
mean(y)


#Creating square function
#x can stand for any letter, it is just placeholder variable, arguement
square <- function(x) {
	value <- x^2
	return(value)
}

square(4)
square(5)
square(53)
53^2

#Creating addition function with text output feature
add_two_numbers <- function(a, b) {
	sum_value <- a+b
	sentence <- paste ("The result is", sum_value)
	return(sentence)
}

add_two_numbers(1, 2)


#setting a default for an arguement
prop <- function(x, multiplier = 1) {
	n <- length(x)
	mean_val <- multiplier * sum(x) / n
	return(mean_val)
}

raise <- function(g, power = 2) {
	value <- g^power
	return(value)
}


raise(2, 4)
raise (2)
raise(5)


#Exercise 2.6.1

j <- c(3, 7, 5, 9, 6, 1)

sd(j)

standev <- function (j){
	if (length(j) <=1) {return (NA)}
	else {
		mean_j <- mean(j)
   diff <- j - mean_j
   sqdiff <- diff^2
   num <- sum (sqdiff)

   denom <- length(j) - 1
   standev_answer <- sqrt(num/denom)

   return(standev_answer) }

}

standev(j)
p <- 4
standev(p)


#Exercise 2.6.2
jb <- c(3, 7, 5, 9, 6, 1, NA, NA)
sd(jb)

standevna <- function (j, na.rm = TRUE){
	if (na.rm == TRUE) {jnona <- na.omit(j)}
		else {jnona <- j}
	if (length(j) <=1) {return (NA)}
	else {
	mean_jnona <- mean(jnona)
	diff <- jnona - mean_jnona
	sqdiff <- diff^2
	num <- sum (sqdiff)

	denom <- length(jnona) - 1
	standev_answer <- sqrt(num/denom)

	return(standev_answer)}
}

standevna(jb, na.rm = FALSE)
