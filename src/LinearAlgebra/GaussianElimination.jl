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



function solve_system(matrix_A::Matrix{Float64}, b::Vector{Float64})
    n = length(b)

    dimension_failure(matrix_A,n) && return

    A = [copy(matrix_A) copy(b)] 

    ## O código acima é equivalente a fazer: if dimension_failure(A, n)
       ##                                        return
   ##                                            end
    
   for i=1:(n-1) #Step 1#

    #Step 2: Tome p o menor inteiro em [i,n] tal que a_pi != 0#
    p=i
    msg_erro = false

    for k=i:n
        if A[k, i] != 0
            p=k
            break
        end

        if k == n
            msg_erro == true
        end
    end

    if msg_erro
        prntln("O sistema não admite única solução.")
        return
    end

    #Step 3: Se p != i, E_p <-> E-I

    if p != i
        v = copy(A[p, :])
        A[p, :] = A[i, :]
        A[i, :] = v
    end

    #Step 4: atualização das linhas#

    for j = (i+1):n
        m = A[j, i]/A[i, i] #Step 5#
        #Step 6: E_j - mE_i -> E_j

        A[j,:] = A[j,:] - m*A[i,:]
    end
  end

  #Step 7#

  if A[n, n] == 0
    print("Sistema não admite única solução")
    return
  end
  
  #Step 8#

  x = Vector{Float64}(undef, n)
  x[n] = A[n, n+1]/A[n, n]

  #Step 9#
  for i = n-1:-1:1
    soma = 0
    for j = i+1:n
        soma += A[i,j]*x[j]
    end
    x[i] = (A[i, n+1] - soma)/A[i,i]
  end

    #Step 10#
    return x

end
