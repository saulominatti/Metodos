
module NumericalAnalysis
include("Includes.jl")
export round_sum, round_mul, trunc_sum, trunc_mul, absolute_error, relative_error, approximated_value_interval_given_relative_error, bisection, solve_system,
fixed_point, newton, secant, steffensen, delta_squared_aitkusien, vdelta_squared_aitken, sequence, horner_method
end # module NumericalAnalysis