#=
Complexe:
- Julia version: 
- Author: machk
- Date: 2022-07-07
=#
using Test
struct ComplexNumber <: Number
    real::Number
    img::Number
end
Base.show(io::IO, x::ComplexNumber) = print(io, "$(x.real) + $(x.img)*i")
Base.:+(a::ComplexNumber, b::ComplexNumber) = ComplexNumber(a.real + b.real,
                                                                        a.img + b.img)
Base.:-(a::ComplexNumber, b::ComplexNumber) = ComplexNumber(a.real - b.real, a.img - b.img)
Base.:*(a::ComplexNumber, b::ComplexNumber) = ComplexNumber(a.real * b.real - a.img * b.img,
                                                                        a.real * b.img + a.img * b.real)
Base.:/(a::ComplexNumber, b::ComplexNumber) = ComplexNumber(
                                (a.real * b.real + a.img * b.img) / (b.real * b.real + b.img * b.img),
                                (a.img * b.real - a.real * b.img) / (b.real * b.real + b.img * b.img))
Base.:(==)(a::ComplexNumber, b::ComplexNumber) = a.real == b.real && a.img == b.img
Base.:(≈)(a::ComplexNumber, b::ComplexNumber) = a == b || (a.real ≈ b.real && a.img ≈ b.img)
Base.convert(::Type{ComplexNumber}, x::Real) = ComplexNumber(x, 0)
Base.promote_rule(::Type{<: Number}, ::Type{ComplexNumber}) = ComplexNumber
abs(a::ComplexNumber) = √(a.real^2 + a.img^2)
conj(a::ComplexNumber) = ComplexNumber(a.real, -a.img)
real(a::ComplexNumber) = a.real
imag(a::ComplexNumber) = a.img
exp(a::ComplexNumber) = ComplexNumber(ℯ^a.real * (cos(a.img) + sin(a.img)), 0)
jm = ComplexNumber(0, 1)
