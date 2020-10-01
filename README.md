# Organizador de Conferências
> Uma simples aplicação para organização de conferências.

![Image Organizer](https://i.imgur.com/ZNCU8hy.png)

## BACKEND
### Linguagem:
    - Ruby
    - Rails
### Gems:
    - gem 'rails', '~> 6.0.3', '>= 6.0.3.2' 
    - gem 'rack-cors'
    - gem 'rack-attack'
    - gem 'devise'
    - gem 'simple_token_authentication', '~> 1.0'
    - gem 'rspec-rails', '~> 4.0.0'
    - Bundler version 2.1.2

## FRONT-END:
    Vue.js

## Rodando o Projeto:

1. clone o repositório https://github.com/WilliamsSantos/Web-Coding-Challenge-Stant.git

2. tenha certeza de que tem a versão `2.7.0` do ruby ​​e a versão `6.0.3.2` do Rails instalado na sua máquina.
3. Entre na pasta `ApiConferences` e rode o comando a seguir para instalar as dependências:

```sh
bundle install
```
4. Após instalar as dependências crie as migrations com o comando:
```sh
rake db:migrate
```

5. Após isso crie o usuário de autenticação através do comando:

```sh
rake db:seed
```

6. Rode os testes no teminal com o comando: 
```
rspec
``` 

7. Por fim rode o comando a seguir para iniciar o servidor puma:

```sh
rails s
```

8. Entre na pasta `frontConferences` e abra o arquivo index.html para ter acesso a página principal.
