using Distributions

n = 6
k = 5
p = 0.5

# Probability of getting at least 5 successes
prob_one_tailed = 1 - cdf(Binomial(n, p), k - 1)

println("One-tailed probability: ", round(prob_one_tailed, digits=4))
# Probability of getting exactly 5 successes
prob_exactly_5 = pdf(Binomial(n, p), k)

# Probability of getting exactly 6 successes
prob_exactly_6 = pdf(Binomial(n, p), n)

# Two-tailed probability
prob_two_tailed = prob_exactly_5 + prob_exactly_6

println("Two-tailed probability: ", round(prob_two_tailed, digits=4))
