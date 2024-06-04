using LinearAlgebra

#Recebe uma matriz quadrada e retorna as matrizes P'L e U em que A = P'LU, com
# P a matriz de permutação, L triangular inferior e U triangular superior. Esse 
# método permite fatorar qualquer matriz não-singular A, sem precisar efetuar
# a troca de linhas e colunas de A, apenas aplicando o método usual da Fatoração
# LU sobre o produto matricial PA. Esse código recorre o código já implementado
# solve_LU.

function solve_PLU(A::Matrix{Float64})
    n = size(A)[1]

    dimension_failure(A, n) && return

    P = Matrix{Float64}(I, n, n)

    #Step 1#
    for i = 1:(n-1)
        #Step 2#
        s = zeros(Float64, n)
        for k = i:n

            #Step 3#
            for j = i:n
                if s[k] < abs(A[k, j])
                    s[k] = abs(A[k, j])
                end
            end
            #Step 4#
            if s == zeros(Float64, n)
                println("Fatoração Impossível")
                return
            end
        end
        #STEP 5#
        p = i
        for k = i:n
            if abs(A[p, i]) / s[p] < abs(A[k, i]) / s[k]
                p = k
                break
            end
        end
        #STEP 6 - Atualiza a matriz de permutação#
        if p != i
            v = copy(P[p, :])
            P[p, :] = P[i, :]
            P[i, :] = v
        end
    end
    return ((P')*solve_LU(P*A)[1], solve_LU(P*A)[2])
end

#solve_PLU([0.0 -1.0; -2.0 0.0])
#solve_PLU([0.0 2.0 -1.0; 2.0 -1.0 -1.0; 1.0 0.0 1.0])

#solve_PLU([1.0 -1.0; -2.0 0.0])[1]*solve_PLU([1.0 -1.0; -2.0 0.0])[2]
#solve_PLU([1.0 -1.0; -1.0 -1.0])[1]*solve_PLU([1.0 -1.0; -1.0 -1.0])[2]


#solve_PLU([0.0 2.0 1.0; -1.0 1.0 1.0; -0.0 -1.0 -1.0])
#solve_PLU([0.0 2.0 1.0; -1.0 1.0 1.0; -0.0 -1.0 -1.0])[1] * solve_PLU([0.0 2.0 1.0; -1.0 1.0 1.0; -0.0 -1.0 -1.0])[2]


#X = Matrix{Float64}(I, 2, 2)
#solve_PLU(X)#