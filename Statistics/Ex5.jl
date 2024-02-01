function getResultOf6TennisGamesUnderHA()::Int
    return Rand.rand([0, 1, 1, 1, 1, 1], 6) |> sum
end

function play6tennisGamesGetPvalue()::Float64
    # result when HA is true
    result::Int = getResultOf6TennisGamesUnderHA()
    # probability based on which we may decide to reject H0
    oneTailPval::Float64 = Dsts.pdf.(Dsts.Binomial(6, 0.5), result:6) |> sum
    return oneTailPval
end

function didFailToRejectHO(pVal::Float64)::Bool
    return pVal > 0.05
end

using Rand

numOfSimul = 100_000
Rand.seed!(321)
notRejectedH0 = [
    didFailToRejectHO(play6tennisGamesGetPvalue()) for _ in 1:numOfSimul
    ]
probOfType2error = sum(notRejectedH0) / length(notRejectedH0)