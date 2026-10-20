class CoquetelAfterlife
  attr_reader :nome

  def initialize(nome, preco)
    @nome = nome
    @_preco = preco
  end

  def preco
    @_preco
  end

  def preco=(valor)
    if valor >= 5 && valor <= 200
      @_preco = valor
    else
      puts "Preço inválido!"
    end
  end

  def ficha
    "Drink: #{nome} | Preço: #{preco} eurodólares"
  end
end

class DrinkDeLenda < CoquetelAfterlife
  attr_reader :lenda

  def initialize(nome, preco, lenda)
    super(nome, preco)
    @lenda = lenda
  end

  def ficha
    super + " | Homenagem a: #{lenda}"
  end
end

coquetel = CoquetelAfterlife.new("Night City Sunset", 25)
silverhand = DrinkDeLenda.new("Johnny Silverhand", 60, "Johnny Silverhand")
jackie = DrinkDeLenda.new("Jackie Welles", 45, "Jackie Welles")

cardapio = [coquetel, silverhand, jackie]

puts "--- Cardápio do Afterlife ---"
cardapio.each do |drink|
  puts drink.ficha
end

puts "\n--- Reajuste de preço ---"
silverhand.preco = 500
silverhand.preco = 80
puts silverhand.ficha

# jackie.nome = "Outro Drink"
