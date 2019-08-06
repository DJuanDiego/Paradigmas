#/BIN/BASH
#
# Limpeza de dados.

# Escrito por Juan Diego - Lajes/RN -> 06/08/2019

# Script criado para a realização de limpeza de dados obtidos 
# através de dork com o intuito de aprender e aplicar técnicas de 
# mineração de dados e apresentar como projeto da disciplina de 
# Paradigmas de Programação 2019.1 - UFERSA/Angicos.


# Certifique-se de que o arquivo possui o mesmo nome utilizado no 
# comando e que o script e o arquivo estão no mesmo diretório.

# Lê o arquivo, substitui '%20' por espaços, separa os campos e 
# seleciona o segundo, seleciona as linhas que contêm mkv e mp4
# e redireciona para um novo arquivo.
cat saidasMT-8.csv \
| sed -E 's/%20/ /g' \
| cut -d, -f 2 \
| egrep 'mkv|mp4' > saida_limpa.txt

# Repete uma string até que o processo seja finalizado, seleciona o
# número de linhas exatas do arquivo 'saida_limpa.txt', separa os 
# campos e escolhe a primeira coluna e redireciona para um novo 
# arquivo.
yes ''http://peterlinnik.com/downloads/Plex Movies/'' \
| head -$(wc -l saida_limpa.txt \
  | cut -d' ' -f 1) > Site.txt

# Une as linhas dos arquivos em pares e redireciona a saída para um
# novo arquivo.
paste Site.txt saida_limpa.txt > saida.txt 

# Remove as tabulações tabulações das linhas e escreve no arquivo.
sed -i -E 's/\t//g' saida.txt