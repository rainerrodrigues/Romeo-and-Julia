function getInit(arr::Vector)::Vector
    n = length(arr);
    return arr[1:(n-1)]
end