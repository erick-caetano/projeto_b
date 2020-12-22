Projeto
Java version 14
Maven version 3.6.3

O projeto tem como objetivo criar um app para cadastrar usuários, utilizando as ferramentas banco mySQL, Spring-boot e angularJS.
Para o backend foi utilizado os conceitos de REST API.

Endereços de consulta cidades cadastradas
http://localhost:8081/api/cadastro/cidades


Consulta todos os usuarios cadastrados
http://localhost:8081/api//cadastros

Para cadastrar é necessário usar os comandos "curl" nos endereços abaixo
/cadastro/usuario
curl -X POST -H 'Content-Type: application/json' -d '{"nome":"erick","email":"erickic@gmail.com","d_nasc":"20/05/1992","senha":"xxxxxx","flag_tipo":"F", "cpf_cnpj":"41099570875"}' http://localhost:8081/api/cadastro/usuario

/cadastro/endereco
curl -X POST http://localhost:8081/api/Cadastro/endereco -F id_cidade=8 -F bairro="santiago" -F cep=3 -F end="rua" 

/cadastro/enderecosusuario
curl -X POST http://localhost:8081/api/Cadastro/enderecosusuario   -F id_usuario=7 -F id_endereco=17 -F numero=1234 -F flag_p=2  

/cadastro/telefone
curl -X POST -H 'Content-Type: application/json' -d'{"id_ddd":"5", "id_usuario":"33","numero_tel":"3232323","flag_ativo":"A"}' http://localhost:8081/api/Cadastro/telefone 

Para acessar o banco de dados o endereeço é http://localhost:8889
Server:mysql
User:admin
password:admin

FrontEnd
WIP