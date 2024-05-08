function secant(f::Function, p_0::Float64, p_1::Float64, tol::Float64, N::Int64)
    """
    Retorna uma aproximação de p em que f(p)=0 (ou mensagem de erro), dados palpites iniciais p_0 e p_1 distintos,
     uma tolerância tol, e um número máximo de iterações N.
    """
    if f(p_0) == f(p_1)
        return "Método falhou: f(p_0) e f(p_1) estão muito próximos."
    end
    p = p_1
    p_i = p_1
    q_i = p_0
    f_p_i = f(p_i)
    f_q_i = f(q_i)
    for i = 1:N
        if f_q_i == f_p_i
            return "Método falhou: f(p_i) está muito próximo de f(q_i)."
        end
        p = p_i - (f_p_i * (p_i - q_i)) / (f_p_i - f_q_i)
        if abs(p_i - q_i) < tol
            return p
        end
        q_i = p_i
        p_i = p
        f_p_i = f(p_i)
        f_q_i = f(q_i)
    end
    return "Método falhou: número máximo iterações atingido."
end

## Testando a função ##
#secant(x->x^2-3, 0.5, 0.75, 10^(-10), 50)
#secant(x->x^3-1.01, 0.5, 0.6, 10^(-10), 50)
#secant(x->cos(x), 0.5, 1.2, 10^(-100), 50)
#secant(x->(cos(x+1))^5, 0.5, 0.6, 10^(-10), 100)
#secant(x->(cos(x+1))^5, 0.5, 0.6, 10^(-10), 1000)
#secant(x->log(x), 0.601, 0.6, 10^(-10), 10)
#secant(x->3*log(x), 0.601, 0.601, 10^(-10), 10)
