library(nsRFA)

print(getwd())
setwd("C:/Users/User/Documents/R")
print(getwd())

data <- read.csv("Book1.csv", header = TRUE)
print(data)


x <- data["dato"][,]
cod <- data["ï..cod"][,]
split(x,cod)



REGLMR (x, cod)
REGTST (x, cod, Nsim=500)
HW.original(x,cod)
REGTST (x, cod, A=0, B=0, Nsim=500)

HW.tests(x,cod,Nsim = 500)
DK.test(x,cod)
ADbootstrap.test(x,cod,Nsim=200)