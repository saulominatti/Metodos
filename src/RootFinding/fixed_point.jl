function fixed_point(g::Function, p_0::Float64, tol::Float64, N::Int64)
    """ Retorna uma aproximação para p em que g(p)=p (ponto fixo de g) (ou
    uma mensagem de erro), em que "tol" é a tolerância para a aproximação do ponto fixo,
    e "N" é o número máximo de iterações desejado.
    """
    p = p_0
    p_i = p_0
    for i in 1:N
        p = g(p_i)
        if abs(p-p_i) < tol
            return p
        end
        p_i = p
    end
    return "Método falhou: Número máximo de iterações atingido."
end

## Testando a função ##
#fixed_point(x -> 0.1x + 2, 0.2, 10^(-10), 50)
#fixed_point(x -> 0.3x - 3, 0.2, 10^(-10), 50)
#fixed_point(x -> 0.9x + 0.9, 0.5, 10^(-10), 50)
#fixed_point(x -> 0.1x + 2, 0.2, 10^(-1000), 50)