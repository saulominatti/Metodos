#Objetivo: I = int f(x)dx de x = a até x = b 

#Entrada: a, b, n par e a função f 

#A aproximação utiliza o método de Simpson composto

function solve_integral(f::Function, a::Float64, b::Float64, number_of_subintervals::Int64)

    if a == b
        return 0
    end

    #Step 1
    h = (b - a) / (2 * number_of_subintervals)
    s1 = 0 # sum f(x_par)
    s2 = 0 # sum f(x_impares)

    #Step 2

    for i = 1:2*number_of_subintervals-1
        if i % 2 == 0
            s1 += f(a + i * h)
        else
            s2 += f(a + i * h)
        end
    end

    #Step 3#
    return (h / 3) * (f(a) + 2 * s1 + 4 * s2 + f(b))

end
