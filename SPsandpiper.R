#### SPsandpiper.R
#### Script to generate the analysis and figures of the semipalmated
####  sandpiper matrix population model shown in lecture

## Direct matrix entry
# Semipalmated sandpiper model
A <- matrix(data=c(0.02115, 0.074, 0.0846, 0.563, 0, 0, 
                   0, 0.563, 0.563),
            nrow=3, ncol=3, byrow=TRUE)
N <- c(23.5, 14.2, 7.3)

## Population projection
# Look at one year, using matrix multiplication:
N1 <- A %*% N

# Set up an array to store 20 years of simulated data
Nt <- matrix(0,21,3)
Nt[1,] <- N

# Project the model forward, using a for loop (!)
for (i in 1:20) {
  Nt[i+1,] <- A %*% Nt[i,]
}

# Make some plots
matplot(0:20, Nt, type='l', xlab="time")
matplot(0:20, Nt, type='l', xlab="time", log='y',col=1:3, lty=1:3)
legend("topright", c("1-yr old", "2-yr old", "3+ yr old"), col=1:3, lty=1:3)

# Much the same result can be obtained using pop.projection() and 
#   stage.vector.plot() in the popbio package

# Look at population growth rate from generation 19 to 20, and 20 to 21
# Notice that it is the same for all three stages, and the same in the two years
Nt[20,]/Nt[19,]
Nt[21,]/Nt[20,]

# Now look at growth rates from the entire time series. Notice how, in early
# years, it is quite variable both between years and between stages
Nt[2:21,]/Nt[1:20,]



## Calculate the asymptotic growth rate and stable age distribution
# Eigenanalysis
eigen(A)
lambda <- eigen(A)$values[1]
# This produces complex numbers - to get rid of the zero imaginary 
#  part, use the Re() function:
lambda <- Re(eigen(A)$values[1])

# Stable age distribution:
SAD <- Re(eigen(A)$vectors[,1])/sum(Re(eigen(A)$vectors[,1]))

# The same results can be caluated using the lambda() and stable.stage()
#   functions in the popbio package
