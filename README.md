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
