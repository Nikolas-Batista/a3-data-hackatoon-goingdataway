
/* Criar tabela vinculo */
CREATE TABLE `vinculos` (
 `Ano` int(11) NOT NULL,
 `Regiao` varchar(10) NOT NULL,
 `CNAE 2.0 Classe` int(11) NOT NULL,
 `Faixa Hora Contrat` int(11) NOT NULL,
 `Escolaridade após 2005` int(11) NOT NULL,
 `Qtd Hora Contr` int(11) NOT NULL,
 `Vl Remun Média Nom` decimal(10,0) NOT NULL,
 `Sexo Trabalhador` int(11) NOT NULL,
 `Ind Trab Intermitente` int(11) NOT NULL DEFAULT 0,
 `IBGE Subsetor` int(11) NOT NULL
)

/*  ---- Criar Tabelas Metadados ----*/
/* Criar Tabelas genero (Sexo Trabalhador) */
CREATE TABLE `meta_genero` (
    `codigo` int(11) NOT NULL,
    `desc`  varchar(10) NOT NULL
);

INSERT INTO `meta_genero`
(`codigo`,`desc`)
VALUES
(1,'HOMEM'),
(2,'MULHER');


/* Criar Tabela Escolaridade */
CREATE TABLE `meta_escolaridades` (
    `codigo` int(11) NOT NULL,
    `desc`  varchar(50) NOT NULL
);

INSERT INTO `meta_escolaridades`
(`codigo`,`desc`)
VALUES
(1,'ANALFABETO'),
(2,'ATE 5. ANO INCOMPLETO'),
(3,'5. ANO COMPLETO AO FUNDAMENTAL'),
(4,'6. ANO COMPLETO AO 9. FUNDAMENTAL'),
(5,'FUNDAMENTAL COMPLETO'),
(6,'MEDIO INCOMPLETO'),
(7,'MEDIO COMPLETO'),
(8,'SUPERIOR INCOMPLETO'),
(9,'SUPERIOR COMPLETO'),
(10,'MESTRADO'),
(11,'DOUTORADO'),
(-1,'IGNORADO');


/* Criar Tabela Faixa hora */
CREATE TABLE `meta_faixa_hora` (
    `codigo` int(11) NOT NULL,
    `desc`  varchar(50) NOT NULL
);

INSERT INTO `meta_faixa_hora`
(`codigo`,`desc`)
VALUES
(1,"ATÉ 12 HORAS"),
(2,"13 A 15 HORAS"),
(3,"16 A 20 HORAS"),
(4,"21 A 30 HORAS"),
(5,"31 A 40 HORAS"),
(6,"41 A 44 HORAS");