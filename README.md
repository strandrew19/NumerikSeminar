# Numeric Seminar

## Objective
The obejctive of this project to code a differential solver to evaluate a basic version of the SIR (Susceptible, Infected, Recovered) Model after COVID-19 in Germany (Regionally/State Level) and add elements such wearing masks, hand washing and gathering points to measure pertubations in the model.

## Basic SIR Model
SIR model without vital dynamics:

The dynamics of an epidemic (like flu) are often much faster than the dynamics of birth and death. Therefore a SIR model without vital dynamics omits births and deaths (demography) which can be modeled by ODE's as follows:

| Variables | Description |
| --------- | ----------- |
| **$$S$$**     |  Number of Susceptible Individuals|
| **$$I$$**     | Number of Infected Individuals|
| **$$R$$**    | Number of Recovered Individuals |
| **$$\alpha$$**     | Basic reproduction number |
| **$$\beta$$**     | Duration of time for recovery |

  $$\frac{dS}{dt} = \overset{(Individuals \times Time)^{-1}}{\overbrace{-\alpha}} \space \overset{Individuals}{\overbrace{SI}}$$
  
  $$\frac{dI}{dt} = \alpha SI - \beta I$$
  
  $$\frac{dR}{dt} = \overset{Time^{-1}}{\overbrace{\beta}} I$$

