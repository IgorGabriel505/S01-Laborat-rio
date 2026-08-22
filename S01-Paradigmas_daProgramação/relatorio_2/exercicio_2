
print("Digite a quantidade de elementos (N):")
local N = tonumber(io.read())

local tabela = {}



for i = 1, N do
    print("Digite o elemento " .. i .. ":")
    tabela[i] = tonumber(io.read())
end

print("Digite o numero X a ser buscado:")
local X = tonumber(io.read())

function contarOcorrencias(tabela, alvo)
    local quantidade = 0

    for i = 1, #tabela do
        if tabela[i] == alvo then
            quantidade = quantidade + 1
        end
    end

    return quantidade
end





local resultado = contarOcorrencias(tabela, X)

print("O numero " .. X .. " aparece " .. resultado .. " vez(es) na tabela.")
