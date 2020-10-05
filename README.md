## Introdução

Esse projeto faz parte do processo de seleção do Instituto Atlântico. O objetivo é criar uma API que se integra com a [OMDb API](http://www.omdbapi.com/).

O projeto utiliza Rails 6.0.3.3 e Ruby 2.7.1. Está configurado com `.ruby-gemset` e `.ruby-version`.

-----

## Instalação

### Instalação de gems

```bash
bundle install
```

### Configuração de variáveis de ambiente

Para o projeto rodar, é necessário colocar uma chave de API do OMDb.

Execute:

```bash
EDITOR=nano rails credentials:edit --environment development
```

E no yml, insira a seguinte estrutura:

```yml
omdb:
  access_key: [[Sua chave aqui]]
```

Feche o editor, e deve ser criado no sistema os arquivos `config/credentials/development.key` e `development.yml.enc`

### Rodar o servidor

```bash
rails s
```

## Exemplos de teste:

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/68d53cf26b0100a74820)

### Para o endpoint de busca pelo ID

```
GET localhost:3000/api/v1/movies/tt8946378
```

### Para o endpoint de pesquisa

```
GET localhost:3000/api/v1/movies?title=knives+out
```
