class Restaurante < ActiveRecord::Base

  scope :massas, -> {
    where(:especialidade => "massa")
  }
  scope :recentes, -> {
    where(["created_at > ?",3.months.ago])
  }
  scope :pelo_nome,->{
    order('nome')
  }

	has_many :qualificacoes
	has_and_belongs_to_many :pratos
	
	validates_presence_of :nome, message:"Deve ser preenchido"
	validates_presence_of :endereco, message:"Deve ser preenchido"
	validates_presence_of :especialidade, message:"Deve ser preenchido"

	validates_uniqueness_of :nome, message: "Nome já cadastrado"
	validates_uniqueness_of :endereco, message: "Endereço já cadastrado"

	validate :primeira_letra_deve_ser_maiuscula

	private
	def primeira_letra_deve_ser_maisucula
		erros.add(:nome, "Primeira letra deve ser maiúscula") unless nome = ~/[A-Z].*/
	end

end