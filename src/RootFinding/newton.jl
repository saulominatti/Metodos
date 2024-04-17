function newton(f::Function, g::Function, p_0::Float64, tol::Float64, N::Int64)
    """
    Retorna uma aproximação de p (ou mensagem de erro), em que f(p)=0, dada g a derivada de f, um palpite inicial p_0,
     uma tolerância tol, e um número máximo de iterações N.

    """
    p_i = p_0
    p = p_0
    for i in 1:N
        if g(p_i)==0
            return "Método falhou pois a derivada anulou."
        end
        p = p_i - f(p_i)/g(p_i)
        if abs(p-p_i) < tol
            return p
        end
        p_i = p
    end
    return "Método falhou: número máximo iterações atingido."
end

#Testando a função#
#newton(x -> x^2 - 3, x -> 2x, 0.5, 10^(-10), 50)
#newton(x -> x^3 - 4, x -> 3x^2, 0.5, 10^(-10), 50)
#newton(x -> cos(x), x -> -sin(x), 1.0, 10^(-10), 50)
#newton(x -> x^2, x -> 2x, 0.0, 10^(-10), 50)
#newton(x -> sin(x), x -> cos(x), 1.0, 10^(-1000), 50)