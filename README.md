# Scraper

Você precisa ter o Ruby instalado. A versão recomendada para execução é a 2.7.1. 
Veja mais detalhes [aqui](https://www.ruby-lang.org/en/documentation/installation/).

Após ter o Ruby instalado execute o comando `bundle` no diretório onde baixou o 
código fonte.

```bash
$ bundle
Fetching gem metadata from https://rubygems.org/.......
Resolving dependencies...
Using bundler 2.1.4
Using mini_portile2 2.4.0
Using nokogiri 1.10.10
Bundle complete! 1 Gemfile dependency, 3 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
```

Para executar o projeto recomendo que tenha o `jq` instalado, de forma a facilitar a
visualização dos dados extraídos.

```bash
$ ruby scrapper.rb | jq
[
  {
    "name": "Diego Alves",
    "img": "https://fla-bucket-s3-us.s3.amazonaws.com/public/images/players/1/1593711836.png",
    "url": "https://www.flamengo.com.br/elencos/elenco-profissional/diego-alves-carreira",
    "position": "Goleiros",
    "number": "1"
  },
(...)
```
