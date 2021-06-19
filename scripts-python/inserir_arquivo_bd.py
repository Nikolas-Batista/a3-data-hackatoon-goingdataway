# -*- coding: utf-8 -*-
"""
Created on Wed Jun 16 18:28:07 2021

@author: Nikolas Batista & Guilherme Batista 
@team: Going Data Way

A3 Data Hackatoon 2021
"""

import pyreadr
import pandas as pd
import MySQLdb as mysql
import pymysql

############################### Processamento banco de dados
def inserir_arquivo_bd(path,nomecompleto,ano,regiao,chave):
    print('Inserindo arquivo: ' + nomecompleto + ' no BD')
    
    # ler arquivo rda e converter em pyreader
    result = pyreadr.read_r(path)
    
    # Converter o resultado em DataFrame
    df = result[chave]
    # Adicionar Coluna Ind Trabalho Intermitente nos arquivos anteriores a 2017
    if(int(ano) < 2017):
        df["Ind Trab Intermitente"] = 0
    
    # Adicionar Coluna Ano
    df["Ano"] = ano

    # Adicionar Coluna Regiao
    df["Regiao"] = regiao
    
    ### Inserir datafame no banco 
    from sqlalchemy import create_engine

    # Modificar as credenciais de acordo com sua necessidade
    engine = create_engine("mysql+pymysql://pythonuser:pythonuser@localhost/a3database"
                       .format(user="pythonuser",
                               pw="pythonuser",
                               db="a3database"))

    data = df
    data.to_sql('vinculos', con = engine, if_exists = 'append', chunksize = 1000 , index=False) #insercao
    
    return True