library(nsRFA)

print(getwd())
setwd("C:/Users/User/Documents/R")
print(getwd())

data <- read.csv("region5_hom.csv", header = TRUE)
print(data)


x <- data["dato"][,]
cod <- data["cod"][,]
split(x,cod)



REGLMR (x, cod)

HW.original(x,cod)


HW.tests(x,cod,Nsim = 500)
ADbootstrap.test(x,cod,Nsim=200)


DK.test(x,cod)

discordancy(x,cod)

df <- data.frame(discordancy(x,cod))
write.csv(df, "discordancy.csv", row.names=FALSE)

criticalD()
REGTST (x, cod, Nsim=500)
REGTST (x, cod, A=0, B=0, Nsim=500)