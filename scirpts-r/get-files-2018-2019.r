
################################################################################
## INGESTION MICRODADOS DADOS RAIS  - ARQUIVOS 2018 E 2019                    ##
## ********        GOING DATA WAY     ********                                ##
##  A3 DATA HACKATOON 2021                                                    ##
################################################################################

## O script utilizará os seguintes pacotes
if (!require(data.table)) { 
  install.packages('data.table') 
  library(data.table) 
}

## Criando arquivos e diretório temporários
tfzip <- tempfile(fileext='.zip') 
td <- tempdir()
tf7z <- tempfile(pattern='7za', tmpdir=td, fileext='.exe')
fart <- tempfile(pattern='fart', tmpdir=td, fileext='.exe');  

## Baixando o 7zip para descompactar os microdados. O 7zip traz mais funções que o unzip nativo do R
## O arquivo é um executável que será baixado no diretório temporário e deletado no fim do processo
#download.file('./7zip/7za.exe', tf7z, mode='wb')
download.file('http://cemin.wikidot.com/local--files/raisrm/7za.exe', tf7z, mode='wb')

  

#lista de variaveis
colunas <- c('IBGE Subsetor','CNAE 2.0 Classe','Faixa Hora Contrat','Escolaridade após 2005', 'Qtd Hora Contr','Vl Remun Média Nom', 'Sexo Trabalhador','Ind Trab Intermitente')

# Lista de arquivos

# URL exemplo ftp://ftp.mtps.gov.br/pdet/microdados/RAIS/2017/RAIS_VINC_PUB_CENTRO_OESTE

# Arquivos entre 2018 e 2019 seguem uma nova nomenclatura
regionlst <- list("RAIS_VINC_PUB_CENTRO_OESTE","RAIS_VINC_PUB_MG_ES_RJ","RAIS_VINC_PUB_NORDESTE", "RAIS_VINC_PUB_NORTE","RAIS_VINC_PUB_SP","RAIS_VINC_PUB_SUL" )

# Busca todos os arquivos de cada ano
filelist <- list()
for(ano in 2018:2019){
    for(region in regionlst){
        
        filelist <- c(filelist, paste0("ftp://ftp.mtps.gov.br/pdet/microdados/RAIS/",ano,"/",region,".7z")) # Obter endereço de cada arquivo
    }
}
#print(filelist)
# Tentar baixar cada arquivo comprimido e extrair txt
for(file in filelist){
    counter <- 0
    tempFilename = 'tempfile'
    txtfile <- tools::file_path_sans_ext(basename(file))
    while(counter<10){
        counter <- sum(counter, 1)
        options(timeout=600) # aumentar o timeout  do tempo de execução para arquivos muito grandes
        try1 <- try(download.file(file, destfile=tfzip, mode='wb', method='libcurl'), silent=F)
        if(class(try1)=='try-error'){
            countdown <- function(from)
            {
            while(from!=0)
            {
                Sys.sleep(1)
                from <- from - 1
                cat(rep("\n",50))
                cat('Tentativa', counter, 'de 10. Falha na conexão com o servidor. ')
                cat('O programa fará nova tentativa em',from,'segundo(s).')
            }
            }
            countdown(10)
        }
        else{break}
    }

    dirtxt <- paste0(td,'\\txt',ano,sep='')
    path.file <- paste0(dirtxt,'\\',txtfile, ".txt",sep='')
    cat('Descompactando os microdados. Aguarde.')
    system(paste0(tf7z,' e ',tfzip,' -o',dirtxt,' -y',sep='')) # descompacta arquivo no diretorio temporario

    cat('Gerando RDA. Aguarde.')
    # Ler e salvar em Rda
    
    df <- suppressWarnings(fread(path.file, sep = ';', dec = ',', select=colunas, header = TRUE, encoding = 'Latin-1'))
    
    cat('RDA. Gerado.')

    
    dfname <- txtfile
    #txtfile = paste0(getwd(),'/',txtfile,'.Rda')
    txtfile = paste0("C:\\Users\\Nikol\\Desktop\\RAIS\\Teste 2",'\\',txtfile,'.Rda')
    
    cat(paste0('Caminho arquivo rda: ', txtfile))

    assign(dfname, df)
    save(list=dfname, file=txtfile)

    cat('RDA. Salvo.')
    # Liberar ram a cada loop
    gc()
}


