function bisection(f::Function, a::Float64, b::Float64, tol::Float64, N::Int64)
    """Retorna a raiz aproximada para f no intervalo (a,b)
    utilizando o método da Bissecção (ou uma mensagem de erro), 
    em que"tol" é a tolerância para a aproximação da raiz,
    e "N" é o número máximo de iterações desejado.
    """
    if sign(f(a)) * sign(f(b)) >= 0
        return "Método falhou: A função não muda de sinal no intervalo."
    end
    a_i = a
    b_i = b
    for i in 1:N
        p = (a_i + b_i) / 2
        f_p = f(p)
        if f_p == 0 || (b_i - a_i) / 2 < tol
            return p
        elseif sign(f(a_i)) * sign(f_p) > 0
            a_i = p
        else 
            b_i = p
        end
    end
    return "Método falhou: Número máximo de iterações atingido."
end

#Testando a função:
bisection(x -> (x^3-3), -10.0, 10.0, 10^(-10), 50)
bisection(x -> (x^5 - 7), -10.0, 10.0, 10^(-10), 50)
bisection(x -> (x^5 - 7), -10.0, -7.0, 10^(-10), 50)
bisection(x -> (x^5 - 38x^3 +x-1), -10.0, 10.0, 10^(-1000), 50)