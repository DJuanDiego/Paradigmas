#/BIN/BASH
#
# Script de execução.

# Escrito por Juan Diego - Lajes/RN -> 06/08/2019

# Script criado para a realização de download de dados obtidos 
# através de dork com o intuito de aprender e aplicar técnicas de 
# mineração de dados e apresentar como projeto da disciplina de 
# Paradigmas de Programação 2019.1 - UFERSA/Angicos.

# Executa o Crawler em python.
python bin/Crawler.py

# Executa o script de limpeza.
bash bin/Limpeza.sh

# Baixa os arquivos
cat saida.txt \
| parallel --gnu "wget -c {}"
