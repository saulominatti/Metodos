"""
INPUT: Número de equações ou variáveis (n), a matriz A e o vetor coluna b.
A = [A,b]
OUTPUT Solução x_1, x_2, ..., x_n =: x do sistema Ax=b

"""
function dimension_failure(A::Matrix{Float64}, n::Int64)
    if n != size(A)[1]
        println("O tamanho da matriz A e do vetor b são incompatíveis.")
        return true
    end
    if size(A)[1] != size(A)[2]
        println("A matriz A precisa ser quadrada!")
        return true
    end
    return false
end

function solve_system(A::Matrix{Float64}, b::Vector{Float64})
    n = length(b)

    dimension_failure(A,n) && return

    Ab = [copy(A) copy(b)] #mudar os A por A' depois!!!#

    ## O código acima é equivalente a fazer: if dimension_failure(A, n)
       ##                                        return
   ##                                            end
    
    
    for i=1:(n-1) #Step 1#
    #Step 2: Tome p o menor inteiro em [i,n] tal que a_pi != 0#
        p=i
        msg_erro = false

        for k=i:n
            if Ab[k, i] != 0
                p=k
             break
        end

        if k == n
            msg_erro == true
        end
        if msg_erro
            return "O sistema não admite única solução."
        end
    
        #Step 3: Se p != i, E_p <-> E-I
    
        if p != i
            v = copy(Ab[p, :])
            Ab[p, :] = Ab[i, :]
            Ab[i, :] = v
        end
    
        #Step 4: atualização das linhas#
    
        for j = (i+1):n
            m = Ab[j, i]/Ab[i, i] #Step 5#
            #Step 6: E_j - mE_i -> E_j
    
            Ab[j,:] = Ab[j,:] - m*Ab[i,:]
        end
      end
    end

   

  #Step 7#

  if Ab[n, n] == 0
    return "Sistema não admite única solução"
  end
  
  #Step 8#

  x = Vector{Float64}(undef, n)
  x[n] = Ab[n, n+1]/Ab[n, n]

  #Step 9#

  #Criando vetores para escrever
  #o somatório como produto interno#

    for i in (n-1):1
        z = zeros[n-i]
        w = zeros[n-i]
        for j in (i+1):n
            z[j]=Ab[i,j]
            w[j]=x[j]
        end
        x[i] = (Ab[i, n+1] - dot(z,w))/Ab[i,n+1]
    end

    #Step 10#
    return x

end

solve_system([1.0 0.0 5.0; 1.0 -2.0 1.0; 1.0 0.0 1.0], [0.0, 0.0, 0.0])