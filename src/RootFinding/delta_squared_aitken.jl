

# Vamos esboçar um pseudocódigo para o algoritmo delta quadrado de Aitken.

# INPUT: p_n (sequência) e n o índice do termo da sequência de Aitken desejado. Como sequências são funções, vou tomar o input da forma 
# p (função). Já assumimos que a sequência p_n converge linearmente a um valor.

# OUTPUT: o termo desejado da sequência p^_n em que p^_n converge a p mais rapidamente que p_n, ou mensagem de erro#

#STEP 1:
# IF p(n) - 2*p(n+1) + p(n+2) != 0
#   OUTPUT(p(n) - (p(n+1) - p(n))^2/(p(n) - 2*p(n+1) + p(n+2)))
#   STOP
# END

#STEP 2:
#OUTPUT("Não é possível calcular o termo dessa sequência.")
#STOP




function delta_squared_aitken(p::Function, n::Int64)
    """
    Retorna o termo desejado da sequência do método de Aitken.
    """
    if n <= 0
        println("O índice deve ser positivo.")
        return 
    end

    if p(n) - 2*p(n+1) + p(n+2) != 0
        return p(n) - ((p(n+1) - p(n))^2)/(p(n) - 2*p(n+1) + p(n+2))
    end

    println("Não é possível calcular o termo dessa sequência.")
    return 
end


#Testando a função#
delta_squared_aitken(x -> 1/(x^2), 32)


#A função abaixo #
function vdelta_squared_aitken(p::Function, n::Int64)
    """
    Retorna um vetor com os termos da sequência do método de Aitken até o termo desejado.
    """


    if n <= 0
        println("O índice deve ser positivo.")
        return 
    end
    
    v = zeros(n)
    msg_erro = false
    
    for i in 1:n    
        if p(i) - 2*p(i+1) + p(i+2) != 0
            v[i] = p(i) - ((p(i+1) - p(i))^2)/(p(i) - 2*p(i+1) + p(i+2))
        else 
            msg_erro = true
            break
        end
    end

    if msg_erro
        println("Não foi possível calcular a sequência.")
        return
    end

    return v

end


#Testando a função#
vdelta_squared_aitken(x -> (x+1)/((x+1)^2-1), 15)


function sequence(p::Function, n::Int64)
    """
    Retorna um vetor com até n termos da sequência desejada, para poder 
    comparar com a do método de Aitken.
    """
    if n <= 0
        println("O índice deve ser positivo.")
        return 
    end
    
    v = zeros(n)
    
    for i in 1:n    
       v[i] = p(i)
    end

    return v
end


#Testando as funções#
vdelta_squared_aitken(x -> 1/x, 15)
sequence(x -> 1/x, 15)