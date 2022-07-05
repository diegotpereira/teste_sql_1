create database bd_teste_sql;
use bd_teste_sql;

-- Tabela de Produtos
CREATE TABLE TBL_PRODUTOS(
	cod_prod INT(8) NOT NULL,
    loj_prod INT(8),
    desc_pro char(40),
    dt_inclu_prod date,
    preco_prod DECIMAL(8,3),
	PRIMARY KEY (cod_prod)
);

-- Com base na tabela de “produtos” acima favor inserir 
-- um registro na referida tabela passando os seguintes 
-- valores : cod_prod =170, loj_prod=2, 
-- desc_prod=LEITE CONDESADO MOCOCA, 
-- dt_inclu_prod=30/12/2010  e preço_prod = R$45,40.
INSERT INTO TBL_PRODUTOS values(170, 2, 'LEITE CONDENSADO MOCOCA', STR_TO_DATE('30-12-2020', '%d-%m-%Y'), 45.40);

-- O Índice da tabela  de “produtos é o cód_prod e a loj_prod, 
-- com base no referido índice faça a alteração do preço do 
-- produto para R$95,40, lembrando que o cod_prod =170 e a 
-- loj_prod=2: 
UPDATE TBL_PRODUTOS SET preco_prod = "95.40" WHERE cod_prod = "170";

-- Com base na tabela de “produtos” monte um select trazendo 
-- todos os registros da loja 1 e 2:
INSERT INTO TBL_PRODUTOS values(160, 1, 'CREME DE LEITE MOCOCA', STR_TO_DATE('29-12-2020', '%d-%m-%Y'), 40.30);

SELECT * FROM TBL_PRODUTOS



-- Com base na tabela de “produtos” monte um select para trazer 
-- a maior e a menor data  de inclusão do produto “dt_inclu_prod”: