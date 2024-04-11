function g(f::Function, x::Float64)
    return f(x+f(x))/f(x) - 1
end 

function steffensen(f::Function, p_0::Float64, tol::Float64, N::Int64)
    """
    Retorna uma aproximação de p (ou mensagem de erro), em que f(p)=0, dado um palpite inicial p_0,
    uma tolerância tol, e um número máximo de iterações N, utilizando o Método de Steffensen.

    """
    p_i = p_0
    p = p_0

    for i in 1:N
        p = p_i - f(p_i)/g(f, p_i)
        if abs(p-p_i) < tol
            return p
        end
        p_i = p
    end

    return "Método falhou: número máximo iterações atingido."

end


function steffensen(f::Function, p_0::Float64, tol::Float64, N::Int64)
    """
    Retorna uma aproximação de p (ou mensagem de erro), em que f(p)=0, dado um palpite inicial p_0,
    uma tolerância tol, e um número máximo de iterações N, utilizando o Método de Steffensen.
    """
    p_i = p_0

    for i in 1:N
        if f(p_i + f(p_i)) - f(p_i) == 0
            return "Método falhou: problemas no domínio da função"
        end
        p = p_i - f(p_i)^2 / (f(p_i + f(p_i)) - f(p_i))
        if abs(p - p_i) < tol
            return p
        end
        p_i = p
    end

    return "Método falhou: número máximo de iterações atingido."
end


#Testando a função#
steffensen(x -> x^2/3, 0.7, 10^(-10), 300)
steffensen(x -> x^3 - 1, 0.5, 10^(-3), 300)