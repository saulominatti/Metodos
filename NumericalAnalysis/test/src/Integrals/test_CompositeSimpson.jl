tol = 10^(-6)

@testset "Test CompositeSimpson solve_integral" begin

    #Problem 1
    f(x, p) = sin(x * p)
    p = 1.7
    a = -2.0
    b = 5.0
    domain = (a, b)
    prob = IntegralProblem(f, domain, p)
    sol = solve(prob, QuadGKJL())

    g(x) = sin(x * p)

    @test solve_integral(g, a, b, 1000000) ≈ sol.u atol = tol

    #Problem 2
    @test solve_integral(g, b, a, 1000000) ≈ -sol.u atol = tol

    #Problem 3
    @test solve_integral(g, a, a, 1) == 0
end
