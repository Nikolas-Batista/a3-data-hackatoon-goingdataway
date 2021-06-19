
/* Salarios medios de homens e mulheres que trabalho com tecnologia na regiao sudeste por ano */
CREATE VIEW Questao1 AS
SELECT `vinculos`.`Ano`, `meta_genero`.`desc`, `vinculos`.`Vl Remun Média Nom`, `vinculos`.`CNAE 2.0 Classe`
FROM `vinculos`
INNER JOIN `meta_genero`
ON `vinculos`.`Sexo Trabalhador` = `meta_genero`.`codigo`
WHERE `vinculos`.`Regiao` = 'SUDESTE' 
AND `vinculos`.`CNAE 2.0 Classe` BETWEEN 62000 AND 63999
/*LIMIT 100*/
;

/* Salarios medios por nivel de escolaridade no agronegocio da regiao sul*/
CREATE VIEW Questao2 AS
SELECT  `meta_escolaridades`.`desc`, `vinculos`.`Vl Remun Média Nom`,`vinculos`.`CNAE 2.0 Classe`
FROM `vinculos`
INNER JOIN `meta_escolaridades`
ON `vinculos`.`Escolaridade após 2005` = `meta_escolaridades`.`codigo`
WHERE `vinculos`.`Regiao` = 'SUL' 
AND `vinculos`.`CNAE 2.0 Classe` BETWEEN 0 AND 1999 /*Filtro agronegocio*/
/*LIMIT 100*/
;

/* Entre os setores de tecnologia, industria automobilistica e profissionais da saúde, qual deles teve o maior crescimento? Qual foi o número de trabalhadores por ano?*/
CREATE VIEW Questao3 AS
SELECT `vinculos`.`Ano` AS `Ano`, `vinculos`.`CNAE 2.0 Classe` AS `CNAE 2.0 Classe` 
FROM `vinculos`
WHERE `CNAE 2.0 Classe` BETWEEN  29000 and 29999 OR 
	  `CNAE 2.0 Classe` BETWEEN  62000 and 63999 OR
      `CNAE 2.0 Classe` BETWEEN  86000 and 88999
/*LIMIT 100*/
;

/*Nos últimos 10 anos, quais foram os setores que possuem, em cada ano, o maior número de trabalhadores que possuem jornada semanal inferior a 40hs? */
CREATE VIEW Questao4 AS
SELECT `meta_faixa_hora`.`desc`, `vinculos`.`Ano`, `vinculos`.`CNAE 2.0 Classe`, `vinculos`.`Qtd Hora Contr`
FROM `vinculos`
JOIN `meta_faixa_hora` 
ON `vinculos`.`Faixa Hora Contrat` = `meta_faixa_hora`.`codigo`
WHERE `vinculos`.`Faixa Hora Contrat`BETWEEN 1 AND 5
AND `vinculos`.`Qtd Hora Contr`BETWEEN 0 AND 39
/*LIMIT 100*/
;

/* VIEW Questao 5*/
CREATE VIEW Questao5 AS
SELECT `Ano`, `meta_genero`.`desc` AS 'Genero'
FROM `vinculos`
INNER JOIN `meta_genero`
ON `vinculos`.`Sexo Trabalhador` = `meta_genero`.`codigo`
WHERE `Ind Trab Intermitente` = 1 
/*LIMIT 100*/
;