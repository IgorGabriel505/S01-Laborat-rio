class PhoneWave
  def enviar_dmail(mensagem)
    puts "D-Mail: \"#{mensagem}\""
    puts "A mensagem foi enviada para o passado!"
  end
end

class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end

class LaboratorioDeGadgets
  def initialize
    @phonewave = PhoneWave.new
    @membros = []
  end

  def admitir(membro)
    @membros << membro
    puts "Lab Mem #{membro.numero}: #{membro.nome} foi admitido no laboratório."
  end

  def experimento(mensagem)
    puts "\n--- Membros presentes no experimento ---"
    @membros.each do |m|
      puts "Lab Mem #{m.numero}: #{m.nome}"
    end
    puts ""
    @phonewave.enviar_dmail(mensagem)
  end
end

# Composição: o PhoneWave é criado dentro do initialize do LaboratorioDeGadgets e só existe nele; se o laboratório deixar de existir, o PhoneWave também deixa.
# Agregação: os membros (MembroDoLab) são criados fora do laboratório e apenas recebidos pelo admitir; eles continuam existindo mesmo sem o laboratório.

okabe = MembroDoLab.new(1, "Rintaro Okabe")
mayuri = MembroDoLab.new(2, "Mayuri Shiina")

laboratorio = LaboratorioDeGadgets.new
laboratorio.admitir(okabe)
laboratorio.admitir(mayuri)

laboratorio.experimento("Não compre o IBN 5100.")
