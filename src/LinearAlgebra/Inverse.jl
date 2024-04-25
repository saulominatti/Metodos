

#Descrição do algoritmo:#

# Vamos utilizar o solve_system_partial_pivoting para 
 # resolver n vezes para os vetores canonicos,
 # a resposta é a compilação dos vetores resposta em coluna


using LinearAlgebra

function inverse_matrix(matrix_A::Matrix{Float64})
    n = size(matrix_A,1)

    if n != size(matrix_A,2)
        println("A matriz deve ser quadrada!")
        return
    end

    if det(matrix_A)==0
        println("A matriz deve ser inversível!")
        return
    end

    C = zeros(n, n)

    for l=1:n
        b = zeros(Float64, n)
        b[l] = 1
        C[:,l] = solve_system_partial_pivoting(matrix_A, b)
    end

    return C
       
end

# inverse_matrix([1.0 -1 1 1; 2 -1 -1 0; 1 -2 0 1; 5 0 1 -1])
