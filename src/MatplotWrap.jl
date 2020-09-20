module MatplotWrap
using CxxWrap

const _ext = @static Sys.isapple() ? "dylib" : "so"

using CxxWrap
const libmplxx = joinpath(@__DIR__, "..", "deps", "build", "lib", "libmplxx.$(_ext)")
isfile(libmplxx) && @wrapmodule(libmplxx, :define_julia_module)

export plot, scatter, matplot_show

function plot(_x::AbstractVector{T1}, _y::AbstractVector{T2}, opt::AbstractString="") where {T1,T2 <: Real}
    x = convert.(Float64, _x) |> StdVector
    y = convert.(Float64, _y) |> StdVector
    plot(x, y, StdString(opt))
end

function plot(_y::AbstractVector{T}, opt::AbstractString="") where {T <: Real}
    _x = collect(1.0:length(_y))
    plot(_x, _y, opt)
end

function scatter(_x::AbstractVector{T1}, _y::AbstractVector{T2}) where {T1,T2 <: Real}
    x = convert.(Float64, _x) |> StdVector
    y = convert.(Float64, _y) |> StdVector
    scatter(x, y)
end

function scatter(_y::AbstractVector{T}) where {T <: Real}
    _x = collect(1.0:length(_y))
    scatter(_x, _y)
end

function __init__()
    @initcxx
end

end # module
