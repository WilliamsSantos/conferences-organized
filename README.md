# Web-Coding-Challenge-Stant
> Uma simples aplicação para organização de conferências.

![Image Organizer](https://i.imgur.com/ZNCU8hy.png)

## Gems:
    - gem 'rack-cors'
    - gem 'rack-attack'
    - gem 'devise'
    - gem 'simple_token_authentication', '~> 1.0'
    - gem 'rspec-rails', '~> 4.0.0'

## Rodando o Projeto:

- clone o repositório https://github.com/WilliamsSantos/Web-Coding-Challenge-Stant.git

- tenha certeza de que tem a versão `2.7.0` do ruby ​​e a versão `6.0.3.2` do Rails instalado na sua máquina.
- Entre na pasta `ApiConferences` e rode o comando a seguir para instalar as dependências:

```sh
bundle install
```

Após instalar as dependências crie o usuário de autenticação através do comando:

```sh
rake db:seeds
```

Por fim rode o comando a seguir para iniciar o servidor puma:

```sh
rails s
```

Entre na pasta `frontConferences` e abra o arquivo index.html para ter acesso a página principal