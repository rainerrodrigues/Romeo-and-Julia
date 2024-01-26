import Random as Rand

Rand.seed!(321)
gametes = Rand.rand(["A","B"],16_000)
first(gametes, 5)

function getCounts(v::Vector{T})::Dict{T,Int} where T
    counts::Dict{T,Int} = Dict()
    for elt in v
        if haskey(counts, elt)
            counts[elt] = counts[elt] + 1
        else
            counts[elt] = 1
        end
    end
    return counts
end

function getProbs(counts::Dict{T, Int})::Dict{T,Float64} where T
    total::Int = sum(values(counts))
    return Dict(k => v/total for (k,v) in counts)
end

function getSumof2DiceRoll()::Int
    return sum(Rand.rand(1:6,2))
end

numOfRolls = 100_000;
diceRolls = [getSumof2DiceRoll() for _ in 1:numOfRolls] 
diceCounts = getCounts(diceRolls)
diceProbs = getProbs(diceCounts)

import CairoMakie as Cmk

function getSortedKeysVals(d::Dict{T1,T2})::Tuple{
    Vector{T1},Vector{T2}} where {T1,T2}

    sortedKeys::Vector{T1} = keys(d) |> collect |> sort
    sortedVals::Vector{T2} = [d[k] for k in sortedKeys]
    return (sortedKeys, sortedVals)
end

xs1, ys1 = getSortedKeysVals(diceCounts)
xs2, ys2 = getSortedKeysVals(diceProbs)

fig = Cmk.Figure()
Cmk.barplot(fig[1, 1:2], xs1, ys1,
    color="red",
    axis=(; # the ';' needs to be here
        title="Rolling 2 dice 100'000 times",
        xlabel="Sum of dots",
        ylabel="Number of occurrences",
        xticks=2:12)
)
Cmk.barplot(fig[2, 1:2], xs2, ys2,
    color="blue",
    axis=(; # the ';' needs to be here
        title="Rolling 2 dice 100'000 times",
        xlabel="Sum of dots",
        ylabel="Probability of occurrence",
        xticks=2:12)
)
fig