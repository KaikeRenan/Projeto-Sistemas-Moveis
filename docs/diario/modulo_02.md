Dificuldades Enfrentadas no Módulo 02

Durante o desenvolvimento do Módulo 02, enfrentamos algumas dificuldades principalmente relacionadas à execução dos testes e à organização da estrutura do projeto Flutter.

Em relação ao código em si, não tivemos problemas relevantes de implementação. No entanto, encontramos dificuldades ao tentar executar o projeto para realizar os testes. O Flutter não estava conseguindo localizar corretamente os arquivos dentro do diretório frontend/lib, o que impedia a aplicação de rodar normalmente.

Após investigar o problema, identificamos que a estrutura de pastas estava causando conflito na execução do projeto. Como solução, removemos a pasta lib de dentro do diretório frontend e reorganizamos a estrutura do projeto para que o Flutter pudesse reconhecer corretamente os arquivos da aplicação.

Após essa correção, conseguimos executar o projeto normalmente e dar continuidade ao desenvolvimento.

Com essas correções realizadas, os testes passaram a reconhecer corretamente as models do projeto e puderam ser executados normalmente, também realizamos a criação das demais telas do esboço da aplicação, complementando a parte visual planejada para o projeto.

*teste das models foi realizado com o comando flutter test test/models no terminal