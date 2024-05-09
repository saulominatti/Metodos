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

    @test solve_integral(g, a, b, 1000) ≈ sol.u atol = tol

    #Problem 2
    @test solve_integral(g, b, a, 1000) ≈ -sol.u atol = tol

    #Problem 3
    @test solve_integral(g, a, a, 1) == 0

    #Problem 4
    f(x, p) = log(x * p)
    p = 0.5
    a = 1.0
    b = 7.0
    domain = (a, b)
    prob = IntegralProblem(f, domain, p)
    sol = solve(prob, QuadGKJL())

    g(x) = log(x * p)

    @test solve_integral(g, a, b, 1000) ≈ sol.u atol = tol


    #Problem 5
    f(x, p) = exp(x * p)
    p = 1.0
    a = -4.5
    b = 3.1
    domain = (a, b)
    prob = IntegralProblem(f, domain, p)
    sol = solve(prob, QuadGKJL())

    g(x) = exp(x*p)

    @test solve_integral(g, a, b, 1000) ≈ sol.u atol = tol

    #Problem 6
    f(x, p) = (x*p)^3 - 3(x*p)^2 + 7*(x*p) -22
    p = 2.2
    a = -1.0
    b = 12.0
    domain = (a, b)
    prob = IntegralProblem(f, domain, p)
    sol = solve(prob, QuadGKJL())

    g(x) = (x*p)^3 - 3(x*p)^2 + 7*(x*p) -22

    @test solve_integral(g, a, b, 1000) ≈ sol.u atol = tol


end
