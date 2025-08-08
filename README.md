# KNews

Gerencie sua agenda de contatos onde você quiser. Use o Contact List! Projeto criado com o objetivo de ensinar Ruby on Rails a programadores de outras linguagens no curso [Ruby on Rails 5 na prática](https://www.udemy.com/ruby-on-rails-5-na-pratica).

## Requisitos Necessários:

* Docker (versão `26.1.3` ou superior)
* Docker Compose (versão `2.39.1` ou superior)
* Git
* PostgreSQL (local ou via Docker)

## Funcionalidades

- Cadastro de usuários  
- Login de Usuário  
- Gerenciamento de artigos de notícias  
- Customização do perfil  

## Para executar o projeto:

### Clone em sua máquina

```shell
git clone https://github.com/kris-santoos/app-noticias
```

### Instale as dependências
```shell
cd app-noticias
bundle install
```

### Configure o Banco de Dados
Copie o arquivo *config/database.exemple.yml* e cole na mesma pasta, renomeando para *database.yml*
e configure seu bando de dados(Por default, estamos usando PostgreSQL).
Crie e migre o banco dentro do container Docker com os comandos:
```shell
docker-compose run web rails db:create
docker-compose run web rails db:migrate
```

### Execute a aplicação
Para rodar a aplicação via Docker Compose, use:
```shell
docker-compose up
```
Acesse a aplicação em: http://localhost:3000

### Parar a aplicação
Para parar os containers, use:
```shell
docker-compose down
```