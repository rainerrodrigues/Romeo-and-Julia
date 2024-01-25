function getMax(vect::Vector{Int}, isSortedDesc::Bool)::Int
    return isSortedDesc ? vect[1] : sort(vect)[1]
end