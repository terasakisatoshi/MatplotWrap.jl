module MatplotWrap

using Libdl
using Pkg.Artifacts

using CxxWrap

#const libmplxx = joinpath(@__DIR__, "..", "deps", "build", "lib", "libmplxx.$(dlext)")
const libmplxx = joinpath(artifact"libmplxx","libmplxx.$(Libdl.dlext)")
isfile(libmplxx) && @wrapmodule(libmplxx, :define_julia_module)

export plot, plot3, scatter, matplot_show

function plot(_x::AbstractVector{T1}, _y::AbstractVector{T2}, line_spec::AbstractString="") where {T1,T2 <: Real}
    x = convert.(Cdouble, _x) |> StdVector
    y = convert.(Cdouble, _y) |> StdVector
    plot(x, y, StdString(line_spec))
end

function plot(_y::AbstractVector{T}, line_spec::AbstractString="") where {T <: Real}
    _x = collect(1.0:length(_y))
    plot(_x, _y, line_spec)
end

function plot3(_x::AbstractVector{T1}, _y::AbstractVector{T2}, _z::AbstractVector{T3}) where {T1,T2,T3 <: Real}
    x = convert.(Cdouble, _x) |> StdVector
    y = convert.(Cdouble, _y) |> StdVector
    z = convert.(Cdouble, _z) |> StdVector
    plot3(x, y, z)
end

function scatter(_x::AbstractVector{T1}, _y::AbstractVector{T2}) where {T1,T2 <: Real}
    x = convert.(Cdouble, _x) |> StdVector
    y = convert.(Cdouble, _y) |> StdVector
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
