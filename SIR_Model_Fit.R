rm(list=ls())
library('deSolve')

setwd('C:/Users/Andrew/Documents/Uni Trier/Semester 4/Numerics Seminar')
Full_RKI_Data <- read.csv('Fallzahlen_Gesamtuebersicht 2.csv', sep=';')
#Cumulative Infections from 2/25/20 till 3/20/20
#Infected <-as.numeric(Full_RKI_Data$X[3:27])
Infected <-as.numeric(Full_RKI_Data$X[3:19])

Infected
Day <- 1:(length(Infected))
N <- 83149300 # population of Germany acc. to Destatis

old <- par(mfrow = c(1, 2))
plot(Day, Infected, type ="b")
plot(Day, Infected, log = "y")
abline(lm(log10(Infected) ~ Day))
title("Total infections COVID-19 Germany", outer = TRUE, line = -2)

lm(log10(Infected) ~ Day)

SIR <- function(time, state, parameters) {
  par <- as.list(c(state, parameters))
  with(par, {
    dS <- -alpha/N * I * S
    dI <- alpha/N * I * S - beta * I
    dR <- beta * I
    list(c(dS, dI, dR))
  })
}

init <- c(S = N-Infected[1], I = Infected[1], R = 0)
RSS <- function(parameters) {
  names(parameters) <- c("alpha", "beta")
  out <- ode(y = init, times = Day, func = SIR, parms = parameters)
  print(parameters[1])
  fit <- out[ , 3]
  print(out)
  sum((Infected - fit)^2)
}

Opt <- optim(c(0, 1), RSS, method = "L-BFGS-B", lower = c(0, 0), upper = c(1, 1), hessian = TRUE)


Opt_par <- setNames(Opt$par, c("alpha", "beta"))
Opt_par
##      alpha     beta 
## 0.6427585 0.3572415

##  R_0 
## ~1.8

t <- 1:100 # time in days
fit <- data.frame(ode(y = init, times = t, func = SIR, parms = Opt_par))
col <- 1:3 # colour

matplot(fit$time, fit[ , 2:4], type = "l", xlab = "Day", ylab = "Number of subjects", lwd = 2, lty = 1, col = col)
matplot(fit$time, fit[ , 2:4], type = "l", xlab = "Day", ylab = "Number of subjects", lwd = 2, lty = 1, col = col, log = "y")
## Warning in xy.coords(x, y, xlabel, ylabel, log = log): 1 y value <= 0
## omitted from logarithmic plot

points(Day, Infected)
legend("bottomright", c("Susceptibles", "Infecteds", "Recovereds"), lty = 1, lwd = 2, col = col, inset = 0.05)
title("SIR model COVID-19 Germany", outer = TRUE, line = -2)

