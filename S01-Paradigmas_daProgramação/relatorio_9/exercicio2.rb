class Instrumentista
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def interpretar(peca)
    raise NotImplementedError, "#{self.class} deve implementar interpretar"
  end
end

class Solista < Instrumentista
  def interpretar(peca)
    puts "#{nome} (#{instrumento}) conduz a melodia principal de #{peca}."
  end
end

class Acompanhador < Instrumentista
  def interpretar(peca)
    puts "#{nome} (#{instrumento}) acompanha o ritmo do solista em #{peca}."
  end
end

class Regente
  attr_reader :nome

  def initialize(nome)
    @nome = nome
    @orquestra = []
  end

  def convocar(instrumentista)
    @orquestra << instrumentista
  end

  def reger(peca)
    puts "\n--- Regente #{nome} conduz a peça: #{peca} ---"
    @orquestra.each do |i|
      i.interpretar(peca)
    end
  end

  def escalacao
    @orquestra.map { |i| "#{i.class}: #{i.nome}" }
  end
end

kaori = Solista.new("Kaori Miyazono", "Violino")
kousei = Acompanhador.new("Kousei Arima", "Piano")
regente = Regente.new("Hiroko Seto")

regente.convocar(kaori)
regente.convocar(kousei)
regente.reger("Introdução e Rondó Caprichoso")

puts "\n--- Escalação ---"
regente.escalacao.each do |texto|
  puts texto
end

takeshi = Instrumentista.new("Takeshi Aiza", "Piano")
# takeshi.interpretar("Balada nº 1")
