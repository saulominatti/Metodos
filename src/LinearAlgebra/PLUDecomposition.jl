using LinearAlgebra

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
                println("O sistema não admite única solução.")
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
        #STEP 6 - Atualiza a matriz de permutação desejada#
        if p != i
            v = copy(P[p, :])
            P[p, :] = P[i, :]
            P[i, :] = v
        end
    end
    return ((P')*solve_LU(P*A)[1], solve_LU(P*A)[2])
end

solve_PLU([2.0 -1.0 0.0; 0.0 3.0 0.1; 0.1 0.2 0.04])

solve_PLU([2.0 0.0; 0.0 1.0])

X = Matrix{Float64}(I, 2, 2)
solve_PLU(X)