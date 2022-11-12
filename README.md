# Numeric Seminar
## SIR Model 


<details><summary>Basic SIR Model</summary>
<p>
SIR model without vital dynamics:

The dynamics of an epidemic (like flu) are often much faster than the dynamics of birth and death. Therefore a SIR model without vital dynamics omits births and deaths (demography) which can be modeled by ODE's as follows:

  $$\frac{dS}{dt} = -\frac{\beta IS}{N}$$
  
  $$\frac{dI}{dt} = \frac{\beta IS}{N} - \gamma I$$
  
  $$\frac{dR}{dt} = \gamma I$$

  
| Variables | Description |
| --------- | ----------- |
| **S(0)**     |  Initial numbers of susceptible subjects |
| **R(0)**     | Initial numbers of removed subjects |
| **N**    | Constancy of population |
| **R_0**     | Basic reproduction number |
| **S(t)**     | Number of susceptible individuals as a function of time |
| **R(t)**     | Number of removed individuals as a function of time |

$$S(t) = S(0)e^{-R_0 \frac{(R(t)-R(0))}{N}}$$

  
</p>
</details>
