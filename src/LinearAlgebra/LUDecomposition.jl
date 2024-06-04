using LinearAlgebra

#Recebe uma matriz quadrada e retorna as matrizes L e U em que A = LU, com
# L triangular inferior e U triangular superior. Fonte: Livro do Burden#

function solve_LU(A::Matrix{Float64})

    n = size(A)[1]

    dimension_failure(A, n) && return

    L = Matrix{Float64}(I, n, n)
    U = zeros((n, n))

    if A[1,1] != 0
        U[1,1] = L[1,1]/A[1,1]
    else
        return("Fatoração impossível")
    end

    for j = 2:n
        U[1,j] = A[1,j]/L[1,1]
        L[j,1] = A[j,1]/U[1,1]
    end

    for i = 2:(n-1)
        soma = A[i,i]
        for k = 1:(i-1)
            soma -= L[i,k]U[k,i]
        end
        U[i,i] = (soma)/L[i,i]
        for j = (i+1):n
            soma = A[i,j]
            for k in 1:(i-1)
                soma -= L[i,k]U[k,j]
            end 
            U[i,j]=(soma)/L[i,i]
            soma = A[j,i]
            for k in 1:(i-1)
                soma -= L[j,k]U[k,i]
            end 
            L[j, i] = (soma)/U[i,i]    
        end
    end
    soma = A[n,n]
    for k = 1:(n-1)
        soma -= L[n,k]U[k,n]
    end
    U[n,n] = (soma)/L[n,n]

    return (L, U)
end

#solve_LU([1.0 -1.0; -2.0 0.0])
#solve_LU([1.0 2.0 1.0; -1.0 1.0 1.0; -2.0 -1.0 -1.0])
#solve_LU([1.0 2.0 -1.0; 2.0 -1.0 -1.0; 1.0 0.0 1.0])


#solve_LU([1.0 2.0 1.0; -1.0 1.0 1.0; -2.0 -1.0 -1.0])[1]*solve_LU([1.0 2.0 1.0; -1.0 1.0 1.0; -2.0 -1.0 -1.0])[2]
#X = Matrix{Float64}(I, 2, 2)