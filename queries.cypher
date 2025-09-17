// Caminhos
MATCH path=(:Pessoa)<-[:VINCULADO_A_PESSOA]-(:Parlamentar)<-[:VINCULADO_A_PARLAMENTAR]-(:Documento)-[:FORNECIDO_POR]->(:Estabelecimento)<-[:TEM_ESTABELECIMENTO]-(:Empresa)<-[:TEM_SOCIEDADE_EMPRESA]-(:Pessoa)
RETURN path LIMIT 25


// Suspeita direta
MATCH path=(p1:Pessoa)<-[:VINCULADO_A_PESSOA]-(:Parlamentar)<-[:VINCULADO_A_PARLAMENTAR]-(:Documento)-[:FORNECIDO_POR]->(:Estabelecimento)<-[:TEM_ESTABELECIMENTO]-(:Empresa)<-[:TEM_SOCIEDADE_EMPRESA]-(p1)
RETURN path

// Suspeita em niveis
MATCH path=(p1:Pessoa)<-[:VINCULADO_A_PESSOA]-(:Parlamentar)<-[:VINCULADO_A_PARLAMENTAR]-(:Documento)-[:FORNECIDO_POR]->(:Estabelecimento)<-[:TEM_ESTABELECIMENTO]-(:Empresa)(()-[:TEM_SOCIEDADE_EMPRESA]-()){1,7}(p1)
RETURN path 
LIMIT 100

//Despesa em empresa de outro parlamentar
MATCH path=(:Parlamentar)<-[:VINCULADO_A_PARLAMENTAR]-(:Documento)-[:FORNECIDO_POR]->(:Estabelecimento)<-[:TEM_ESTABELECIMENTO]-(:Empresa)<-[:TEM_SOCIEDADE_EMPRESA]-(:Pessoa)<-[:VINCULADO_A_PESSOA]-(:Parlamentar)
RETURN path 
//LIMIT 10

//Query Dashboard
MATCH path=(p1:Pessoa)<-[:VINCULADO_A_PESSOA]-(:Parlamentar)<-[:VINCULADO_A_PARLAMENTAR]-(d:Documento)-[:FORNECIDO_POR]->(:Estabelecimento)<-[:TEM_ESTABELECIMENTO]-(:Empresa)(()-[:TEM_SOCIEDADE_EMPRESA]-()){1,6}(p1)
WITH DISTINCT d
RETURN sum(d.valorLiquido)

