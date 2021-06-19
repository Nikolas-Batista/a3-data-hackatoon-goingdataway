<h1 align="center">
  Desafio A3 Data
</h1>

<p> Análise de Dados referente aos dados do RAIS  </p>

# Tecnologias Utilizadas 

  - [Anaconda](https://www.anaconda.com/)
  	- [Spyder](https://www.spyder-ide.org/)
  		- [Python](https://www.python.org/)
	- [Rstudio](https://www.rstudio.com/)
		- [R](https://www.r-project.org/)
  - [Xampp](https://www.apachefriends.org/pt_br/index.html)
	- [Phpmyadmin](https://www.phpmyadmin.net/)
  - [Power Bi](https://powerbi.microsoft.com/pt-br/)

	
# Objetivo do Projeto :dart:
<p>Este projeto visa implementar um pipeline de extração, tranformação e disponibilização de dados e resolver perguntas chave de um desafio.</p>

# Dados a coletar
- [RAIS](ftp://ftp.mtps.gov.br/pdet/microdados/)

# Descrição dos Scripts
## Download dos dados através de script R
<p><strong>get-files-2010-2017 e get-files-2018 -2019: </strong>Estes scripts executam de forma automatizada o download da base de dados no servidor do mte, 
extraem de forma temporária os arquivos .7z e convertem de forma definitiva em arquivos do tipo .rda.</p>


## Leitura dos arquivos em Python e adição ao Banco de dados
<p><strong>carregar_dados_bd: </strong>Este script realiza a leitura dos arquivos .rda, realiza um pré-processamento dos dados desejados e adiciona ao banco de dados. Além disso, adiona colunas para futuras analises de dados. </p>


## Querys no Banco de dados e criação de Views
<p> Com intuito de agilizar o processo de consulta ao banco, foram geradas Views e tabelas de metadados
para resolução das questões do desafio. </p>


## Insights com Power Bi
<p>As resoluções das questões do desafio foram resolvidas de forma visual. </p>
