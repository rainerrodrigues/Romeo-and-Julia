function areApproxEqual(f1::Float64, f2::Float64)::Bool
    return abs(f1 - f2) <= eps(f1)
end