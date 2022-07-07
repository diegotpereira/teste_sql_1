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

CREATE TABLE TBL_ESTOQUE(
	cod_prod INT(8) NOT NULL,
    loj_prod INT(8),
    qtd_prod DECIMAL(15,3),
	PRIMARY KEY (cod_prod)
);

CREATE TABLE TBL_LOJAS(
    loj_prod INT(8) NOT NULL,
    qtd_prod DECIMAL(15,3),
	PRIMARY KEY (loj_prod)
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
SELECT cod_prod, MAX(dt_inclu_prod), MIN(dt_inclu_prod) FROM TBL_PRODUTOS GROUP BY cod_prod

-- Com base na tabela de “produtos” monte um select para trazer a 
-- quantidade total de registros existentes na tabela de “produtos”:
SELECT count(cod_prod) FROM TBL_PRODUTOS;


-- Com base na tabela de “produtos” monte um select para trazer todos 
-- os produtos que comecem com a letra “L” na tabela de “produtos”:
SELECT * FROM TBL_PRODUTOS WHERE desc_pro LIKE 'L%'

-- Com base na tabela de “produtos” monte um select para trazer a soma 
-- de todos os preços dos produtos totalizado por loja:
SELECT  SUM(preco_prod) AS Total FROM TBL_PRODUTOS GROUP BY loj_prod;

-- Com base na tabela de “produtos” monte um select para trazer a soma de 
-- todos os preços dos produtos totalizados por loja que seja maior que R$100.000
SELECT SUM(preco_prod) as TOTAL FROM TBL_PRODUTOS WHERE preco_prod >= 100 ORDER BY loj_prod;


-- A)Montar um unico select para trazer os seguintes campos: o código da loja do produto, 
-- a descrição da loja, código do produto, a descrição do produto, 
-- o preço do produto, a quantidade em estoque do produto. Considere  que o 
-- código da loja para esta consulta seja igual a 1.
SELECT p.loj_prod, l.desc_loj, p.cod_prod, p.desc_pro, p.preco_prod, e.qtd_prod 
FROM TBL_PRODUTOS p, TBL_LOJAS l, TBL_ESTOQUE e WHERE p.loj_prod = 1;

-- B)Observe a estrutura da tabela de estoque e da tabela de produtos, 
-- monte um select para trazer todos os produtos que existem na tabela 
-- de produtos que não existem na tabela de estoque.
SELECT * FROM TBL_PRODUTOS p WHERE p.cod_prod NOT IN (SELECT cod_prod FROM TBL_ESTOQUE);

-- C)Observe a estrutura da tabela de estoque e da tabela de produtos, 
-- monte um select para trazer todos os produtos que existem na tabela 
-- de estoque que não existem na tabela de produtos.

SELECT * FROM TBL_ESTOQUE e WHERE e.cod_prod NOT IN (SELECT cod_prod FROM TBL_PRODUTOS);


