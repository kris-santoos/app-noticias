# KNews

Gerencie seus artigos de notícias mundiais de onde você quiser. Use o KNews! Projeto desenvolvido para facilitar o aprendizado prático de Ruby on Rails, focado em boas práticas e funcionalidades comuns em aplicações web.

Ruby on Rails  
Sistema de modelagem com ERB (implementação própria para autenticação)  
Front-end com Bootstrap  
Banco de dados PostgreSQL  

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

## API Utilizada
A aplicação utiliza a API NewsAPI.

## Suposições e Decisões de Design
* O projeto foi criado com foco em uma interface intuitiva e amigável para facilitar a pesquisa e o gerenciamento de artigos de notícias.
* Inclusão da funcionalidade de salvar artigos para leitura posterior, proporcionando maior comodidade e personalização para os usuários.
* Adoção do Docker para garantir um ambiente de desenvolvimento consistente, simplificando a configuração e implantação da aplicação.
* Utilização do PostgreSQL como banco de dados padrão, assegurando robustez e escalabilidade.

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
Dica: Para visualizar e gerenciar o banco de dados de forma gráfica, você pode usar ferramentas como o Navicat, que facilita a navegação pelas tabelas e dados do PostgreSQL.

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

Observação:
Se você optar por rodar o projeto localmente (fora do Docker), certifique-se de que o serviço PostgreSQL esteja ativo.
No Linux, você pode iniciar o serviço com:
```shell
sudo service postgresql start
```
No Windows/Mac, inicie o serviço via painel de controle ou preferências do sistema.
