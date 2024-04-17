function horner_method(a::Vector{Float64}, x::Float64)
    """
    Calcula, otimizadamente, a expressão p(x) = a_n * x^n + ... + a_1 * x^1 + a_0
    dado o vetor a = [a_0, a_1, ..., a_n].
    """
    #Eu optei por avaliar o polinômio em um vetor de n+1 coordenadas (nesse caso, o termo de grau n é a_{n+1}
    # e o termo de grau 0 é o a_{1}, por exemplo)#

    n = length(a) - 1
    
    ## Para avaliar o polinômio caso o grau seja 0 ou 1, da maneira padrão#
    if n == 0
        return [a[1], 0]
    end
    if n == 1
        return [a[2]*x + a[1], a[2]]
    end

    y = a[n+1]
    z = a[n+1]

    
    for j in n:2
            y = a[j] + x*y
            z = y + x*z
     end
    

    y = a[1] + x*y

    return [y, z]
end
##Testando a função##
horner_method([3.0, 1.0, 1.0], 3.0)
horner_method([2.0, 1.0, 2.0], 3.0)