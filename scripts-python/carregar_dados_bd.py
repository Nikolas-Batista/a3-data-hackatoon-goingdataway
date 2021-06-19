# -*- coding: utf-8 -*-
"""
Created on Wed Jun 16 17:04:38 2021

@author: Nikolas Batista & Guilherme Batista 
@team: Going Data Way

A3 Data Hackatoon 2021
"""

import glob
import os
import timeit

import inserir_arquivo_bd as bdfn

# Constantes globais
regiaonorte = "AC AM AP PA RO RR TO"
regiaonordeste = "AL BA CE MA PB PE PI RN SE"
regiaocentrooeste = "DF GO MT ML"
regiaosudeste = "ES MG RJ SP"
regiaosul = "PR RS SC"
contador_arquivos_processados = 0

# Obter pasta com arquivos
pasta_arquivos_fonte = os.getcwd()+'/rdas' #'E:/Google Drive/Desafio A3 Data/Download Desafio A3/' # Insira aqui a pasta com os arquivos microdados Rda 

start = timeit.timeit() # contar tempo de execucao
print('Inicio de execucao')
# Ler arquivos na pasta e criar uma lista de arquivos
lista_arquivos_fonte_2017 = glob.glob(pasta_arquivos_fonte + "[A-Z][A-Z]201[0-9].[R-r]da")
lista_arquivos_fonte_2018 = glob.glob(pasta_arquivos_fonte + "RAIS_VINC*")

########################## Inserir arquivos antes de 2017 na base

for arquivo in lista_arquivos_fonte_2017:
    nomecompletoarquivo = os.path.basename(arquivo)
    uf = nomecompletoarquivo[0:2]
    ano = nomecompletoarquivo[2:6]
    chave = nomecompletoarquivo.split('.')[0]
    
    # Obter a regiao correspondente ao arquivo
    regiao = ""
    if uf in regiaonorte:
        regiao = "NORTE"
    else:
        if uf in regiaonordeste:
            regiao = "NORDESTE"
        else:
            if uf in regiaocentrooeste:
                regiao = "CENTRO-OESTE"
            else:
                if uf in regiaosudeste:
                    regiao = "SUDESTE"
                else:
                    regiao = "SUL"
                    
    # TODO: Funcao inserir na base de dados
    if bdfn.inserir_arquivo_bd(arquivo,nomecompletoarquivo,ano,regiao,chave):
        contador_arquivos_processados += 1
    
########################## Inserir arquivos antes de 2018 na base     
for arquivo2018 in lista_arquivos_fonte_2018:
    nomecompletoarquivo = os.path.basename(arquivo2018)
    temp = nomecompletoarquivo.split('.')[0] # nome do aqruivo sem extensao
    #ano = temp.split('_')[-1]
    ano = temp[-4:]
    chave = temp.replace('_'+ano, '')
    regiao=""
    if "NORTE" in temp:
        regiao = "NORTE"
    else:
        if "NORDESTE" in temp:
            regiao = "NORDESTE"
        else:
            if "CENTRO-OESTE" in temp:
                regiao = "CENTRO-OESTE"
            else:
                if "MG_ES_RJ" in temp:
                    regiao = "SUDESTE"
                else:
                    if "SP" in temp:
                        regiao = "SUDESTE"
                    else:
                        regiao = "SUL"
                        
                        
    # TODO: Funcao inserir na base de dados
    if bdfn.inserir_arquivo_bd(arquivo2018,nomecompletoarquivo,ano,regiao,chave):
        contador_arquivos_processados += 1
    

end = timeit.timeit()
elapsed = end - start
print('Fim da execucao! ELapsed time: ' + elapsed )