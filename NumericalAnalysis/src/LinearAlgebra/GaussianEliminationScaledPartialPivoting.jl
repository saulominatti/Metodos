

function solve_system_partial_pivoting(matrix_A::Matrix{Float64}, b::Vector{Float64})
    n = length(b)

    dimension_failure(matrix_A, n) && return

    A = [copy(matrix_A) copy(b)]

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
        #STEP 6#
        if p != i
            v = copy(A[p, :])
            A[p, :] = A[i, :]
            A[i, :] = v
        end


        #STEP 7
        for j = (i+1):n
            #STEP 8#
            m = A[j, i] / A[i, i] #Step 5#
            #Step 9: E_j - mE_i -> E_j
            A[j, :] = A[j, :] - m * A[i, :]
        end
    end

    #Step 10#
    if A[n, n] == 0
        print("Sistema não admite única solução")
        return
    end

    #Step 11#
    x = Vector{Float64}(undef, n)
    x[n] = A[n, n+1] / A[n, n]

    #Step 12#
    for i = n-1:-1:1
        soma = 0
        for j = i+1:n
            soma += A[i, j] * x[j]
        end
        x[i] = (A[i, n+1] - soma) / A[i, i]
    end

    #Step 13#
    return x
end

#solve_system_partial_pivoting([1.0 -1 1 1; 2 -1 -1 0; 1 -2 0 1; 5 0 1 -1],  [4.0, -3, 1, 5])

#solve_system_partial_pivoting([1.0 -1 1 1; 2 -1 -1 0; 1 -2 0 1; 5 0 1 -1],[4.0, -3, 1, 4])
