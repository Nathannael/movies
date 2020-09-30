## Sobre o desafio

Este é um simples teste para o qual você desenvolverá uma aplicação de acordo com os requisitos e orientações neste documento.

## Como funciona?

1.  Crie seu branch para desenvolver a solução;
2.  Resolva o desafio da melhor forma que conseguir;
3.  Utilize os commits como se estivesse em um projeto colaborativo, pois isso fará parte do processo de avaliação;
4.  Quando terminar abra um Pull Request para o branch `master` deste repositório, dessa forma que saberemos que você concluiu o desafio e podemos iniciar a revisão do código;
5.  Entraremos em contato com você para dar um feedback.

## A solução a ser desenvolvida
  
### API
Você deverá desenvolver uma API que irá se integrar com um serviço externo.

A API deverá ser desenvolvida em Ruby on Rails.

Esse serviço deve se comunicar com a API [OMDb API](http://www.omdbapi.com/) para fornecer os dados de uma forma diferente da API externa.

#### Sugestões de Endpoints

```
\movies\:id (busca um filme pelo id dele)
\movies?title=STRING_PESQUISA (busca um filme pelo título)
```

Json Response
```
  movies: {
      movie: {
          id
          title
          year
          genre
      }
  }
```

## Avaliação
A proposta deste desafio é para avaliar a construção da API, boas práticas de programação, uso do GIT, conhecimento da linguagem e lib/framework utilizados, entre outras skills que serão demonstradas ao decorrer do projeto.

### Dicas

* Escreva um bom README com informações que auxiliem quem for ler o código (ex: funcionamento da API, como startar o projeto e como buildar);
* Seria ótimo poder executar a solução do desafio com apenas **um** comando (ou com o menor trabalho possível); =)
* Não precisa de Frontend, mas alguns exemplos no Postman seriam bons;
* Fazer perguntas é bom. Não vamos te penalizar por perguntar;
* Testes unitários serão bem valorizados;
* Utilizar mocks para simular o retorno da API externa contam pontos positivos;
* Uso do git será bem valorizado;
* Seu código será avaliado por: semântica, estrutura, legibilidade, tamanho, elegância (entre outros fatores);
* Não existe a necessidade de fazer deploy CI/CD da aplicação. Mas se feito, será um bônus.
