ARQUIVO_ENTRADA = 'C:\Users\junio\Desktop\aaflf\arquivo_entrada_aa_av2.txt'
ARQUIVO_SAIDA_RECURSIVA = 'C:\Users\junio\Desktop\aaflf\arquivo_saida_recursiva_aa_av2.txt'
ARQUIVO_SAIDA_DINAMICA_MEMOIZACAO = 'C:\Users\junio\Desktop\aaflf\arquivo_saida_dinamica_memoizacao_aa_av2.txt'
ARQUIVO_SAIDA_DINAMICA = 'C:\Users\junio\Desktop\aaflf\arquivo_saida_dinamica_aa_av2.txt'
ARQUIVO_SAIDA_GULOSO_ITERATIVO = 'C:\Users\junio\Desktop\aaflf\arquivo_saida_guloso_iterativo_aa_av2.txt'

	
def recursiva_cima_para_baixo
	inicio = Time.now
	array_arquivo = File.readlines(ARQUIVO_ENTRADA).sort.reverse
	File.open(ARQUIVO_SAIDA_RECURSIVA,"w") do |file|
	  file.puts array_arquivo
	end
	fim = Time.now
	tempo = fim - inicio
	array_arquivo.push(tempo) 
end

def dinamica_cima_para_baixo_memoizacao
	inicio = Time.now
    array_arquivo = File.readlines(ARQUIVO_ENTRADA).sort.reverse
	File.open(ARQUIVO_SAIDA_DINAMICA_MEMOIZACAO,"w") do |file|
	  file.puts array_arquivo
	end
	fim = Time.now
	tempo = fim - inicio
	array_arquivo.push(tempo) 
end

def dinamica_baixo_para_cima
	inicio = Time.now
	array_arquivo = File.readlines(ARQUIVO_ENTRADA).sort
	File.open(ARQUIVO_SAIDA_DINAMICA,"w") do |file|
	  file.puts array_arquivo
	end
	fim = Time.now
	tempo = fim - inicio
	array_arquivo.push(tempo) 
end		

def algoritmo_guloso_iterativo
	inicio = Time.now
	array_arquivo = File.readlines(ARQUIVO_ENTRADA).sort
	File.open(ARQUIVO_SAIDA_GULOSO_ITERATIVO,"w") do |file|
	  file.puts array_arquivo
	end
	fim = Time.now
	tempo = fim - inicio
	array_arquivo.push(tempo) 
end		

puts'-------------------------------------------'
puts'--------Recursiva-Cima-Para-Baixo----------'
puts recursiva_cima_para_baixo()
puts'-------------------------------------------'
puts'--------Dinamica-Cima-Para-Baixo-----------'
puts'--------------Memoizacao-------------------'
puts dinamica_cima_para_baixo_memoizacao()
puts'-------------------------------------------'
puts'--------Dinamica-Baixo-Para-Cima-----------'
puts dinamica_baixo_para_cima()
puts'-------------------------------------------'
puts'--------Algoritmo-Guloso-Interativo--------'
puts algoritmo_guloso_iterativo()