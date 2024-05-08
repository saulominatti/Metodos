#Os exercícios 1 e 2 foram resolvidos. As funções foram implementadas
#nos arquivos respectivos que os exercícios solicitaram.

#Questão 3a
valor = Float64(π)
valor_aprox = 22 / 7
expressao_questao_3a = absolute_error(valor, valor_aprox)
resposta_questao_3a = 0.0012644892673496777

#Questão 3b
valor = Float64(π)
valor_aprox = 3.1415
expressao_questao_3a = absolute_error(valor, valor_aprox)
resposta_questao_3a = 9.265358979293481e-5

#Questao 4a
valor = factorial(7)
valor_aprox = sqrt(2 * Float64(π) * 7) * (7 / exp(1))^7
expressao_questao_4a = relative_error(Float64(valor), valor_aprox)
resposta_questao_4a = 0.011826223886416323

#Questao 4b
valor = factorial(20)
valor_aprox = sqrt(2 * Float64(π) * 20) * (20 / exp(1))^20
expressao_questao_4b = relative_error(Float64(valor), valor_aprox)
resposta_questao_4b = 0.0041576526228797

#Questao 5a
valor = 10
tol = 10^(-3)
expressao_questao_5a = approximated_value_interval_given_relative_error(Float64(valor), tol)
resposta_questao_5a = (9.99, 10.01)

#Questao 5b
valor = 100
tol = 10^(-3)
expressao_questao_5b = approximated_value_interval_given_relative_error(Float64(valor), tol)
resposta_questao_5b = (99.9, 100.1)

#Questao 5c
valor = -50
tol = 10^(-3)
expressao_questao_5c = approximated_value_interval_given_relative_error(Float64(valor), tol)
resposta_questao_5c = (-50.05, -49.95)

#Questao 5d
valor = 10
tol = 10^(-4)
expressao_questao_5d = approximated_value_interval_given_relative_error(Float64(valor), tol)
resposta_questao_5d = (9.999, 10.001)

#Questao 5e
valor = 100
tol = 10^(-4)
expressao_questao_5e = approximated_value_interval_given_relative_error(Float64(valor), tol)
resposta_questao_5e = (99.99, 100.01)

#Questao 5f
valor = -50
tol = 10^(-4)
expressao_questao_5e = approximated_value_interval_given_relative_error(Float64(valor), tol)
resposta_questao_5e = (-50.005, -49.995)

#Questao 6a (usando trunc)
valor = ((13 / 14) - 6 / 7) / (2 * exp(1) - 5.4)
numerador = trunc_sum(Float64(13 / 14), -Float64(6 / 7), digits = 3)
denominador = trunc_sum(2 * exp(1), -Float64(5.4), digits = 3)
valor_aprox = trunc_mul(numerador, 1 / denominador, digits = 3)
expressao1_questao_6a = absolute_error(valor, valor_aprox)
resposta1_questao_6a = 0.07445986071397837
expressao2_questao_6a = relative_error(valor, valor_aprox)
resposta2_questao_6a = 0.0381153472184052

#Questao 6b (usando round)
valor = ((13 / 14) - 6 / 7) / (2 * exp(1) - 5.4)
numerador = round_sum(Float64(13 / 14), -Float64(6 / 7), digits = 3)
denominador = round_sum(2 * exp(1), -Float64(5.4), digits = 3)
valor_aprox = round_mul(numerador, 1 / denominador, digits = 3)
expressao1_questao_6b = absolute_error(valor, valor_aprox)
resposta1_questao_6b = 0.007540139286021708
expressao2_questao_6b = relative_error(valor, valor_aprox)
resposta2_questao_6b = 0.0038597309235619145
