using LinearAlgebra
using Plots
using Random, Distributions
using StatsBase
gr()
# Base.run(`clear`)

## ============ Covariance Matrix ==========
## Generate some data
tsteps = 10000
# Standar deviations
σ₀ = 1   
σ₁ = .5 
T₀ = rand(Normal(0,σ₀), tsteps)
T₁ = rand(Normal(0,σ₁), tsteps)

scatter(T₀, T₁, label="Obs", msw = 0, mc = :blue, ms=2)

## Compute covariance matrix
m₀ = mean(T₀)
m₁ = mean(T₁)
# m, c = mean_and_cov([T₀ T₁])

# -- Manually cov matrix ---
A = zeros(2,2)
A[1,1] = ((T₀ .- m₀)'*(T₀ .- m₀))/tsteps
A[1,2] = ((T₁ .- m₁)'*(T₀ .- m₀))/tsteps
A[2,1] = ((T₀ .- m₀)'*(T₁ .- m₁))/tsteps
A[2,2] = ((T₁ .- m₁)'*(T₁ .- m₁))/tsteps

# -- Automatic cov matrix ---
c = cov([T₀ T₁])
display(c)
display(A)