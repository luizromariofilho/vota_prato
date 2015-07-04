class Restaurante < ActiveRecord::Base
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
