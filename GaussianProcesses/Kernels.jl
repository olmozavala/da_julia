
using Distributions
using Plots
using GaussianProcesses
using Random
using Optim
gr()

# Squared Exponential covariance function
kern = SE(0.0,0.0)

