library(nsRFA)
help(nsRFA)
data(hydroSIMN)
annualflows
summary(annualflows)
x <- annualflows["dato"][,]
cod <- annualflows["cod"][,]
split(x,cod)
REGLMR (x, cod)
HW.original(x,cod)
REGTST (x, cod, A=0, B=0, Nsim=500)

fac <- factor(annualflows["cod"][,],levels=c(34:38))
x2 <- annualflows[!is.na(fac),"dato"]
cod2 <- annualflows[!is.na(fac),"cod"]

HW.original(x2,cod2)

plot(HW.original(x2,cod2))