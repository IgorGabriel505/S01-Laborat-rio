module Depoente
  def depor
    raise NotImplementedError
  end
end

module Detivel
  def ser_detido
    puts "#{nome} foi levado(a) pela Scotland Yard."
  end
end

class Envolvido
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end
end

class TestemunhaOcular < Envolvido
  include Depoente

  def depor
    puts "#{nome} (testemunha): Vi um homem de casaco escuro saindo da casa às 23h."
  end
end

class SuspeitoDoCrime < Envolvido
  include Depoente
  include Detivel

  def depor
    puts "#{nome} (suspeito): Eu estava no teatro a noite toda."
  end
end

class Investigacao
  def initialize(caso)
    @caso = caso
    @envolvidos = []
  end

  def registrar(envolvido)
    @envolvidos << envolvido
  end

  def ouvir_todos
    puts "--- Caso: #{@caso} ---"
    @envolvidos.each do |e|
      e.depor
    end
  end

  def acionar_scotland_yard
    puts "\n--- Scotland Yard acionada ---"
    detidos = @envolvidos.select { |e| e.respond_to?(:ser_detido) }
    detidos.each(&:ser_detido)
  end
end

hudson = TestemunhaOcular.new("Sra. Hudson")
moriarty = SuspeitoDoCrime.new("James Moriarty")
moran = SuspeitoDoCrime.new("Sebastian Moran")

investigacao = Investigacao.new("O Mistério de Baker Street")
investigacao.registrar(hudson)
investigacao.registrar(moriarty)
investigacao.registrar(moran)

investigacao.ouvir_todos
investigacao.acionar_scotland_yard
