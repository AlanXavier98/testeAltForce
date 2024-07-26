# Documentação do Aplicativo de Loja Online
## Introdução
### Este documento fornece uma visão geral da documentação do aplicativo de loja online desenvolvido com Flutter. O aplicativo foi criado seguindo as especificações fornecidas no teste, utilizando o design do Figma como base e consumindo dados de uma API.
## Funcionalidades
O aplicativo de loja online inclui as seguintes funcionalidades:
## Login e Boas-Vindas
### Tela de login implementada
###Mensagem de boas-vindas exibida após o login
## Listagem e Detalhes de Produtos
Listagem de produtos disponíveis na loja
## Filtro de produtos por categoria
### Listagem de produtos em promoção
### Listagem de produtos por categoria específica
### Listagem de categorias disponíveis
### Exibição de detalhes do produto selecionado (imagens, preço, descrições, variações, reviews, estoque, etc.)
## Carrinho de Compras
### Adição de produtos ao carrinho de compras
### Exibição do carrinho de compras com os itens adicionados
## Pedidos
### Listagem dos pedidos realizados
### Visualização do progresso de cada pedido
### Avaliação de um pedido já entregue
## Perfil do Usuário
### Tela de configurações do perfil
### Cadastro de endereço
### Cadastro de cartão de crédito
## Tecnologias Utilizadas
### Flutter 3.22.2
### flutter_modular para navegação entre telas e injeção de dependências
### get para gerenciamento de estado
### dio para consumo de API
### Conceitos de Clean Architecture e design patterns como Dependency Injection, DataSource, Repository, Service, Model, View, Controller
## Estrutura do Projeto
### O projeto segue uma estrutura modular, com cada funcionalidade principal sendo implementada em seu próprio módulo. Aqui está a estrutura básica do projeto:
```
lib/
│
├── main.dart
│
├── app_module.dart
├── app_widget.dart
│
├── colors/
│   └── app_colors.dart
│
├── modules/
│   ├── main/
│   │   ├── controllers/
│   │   │   └── main_controller.dart
│   │   ├── views/
│   │   │   └── main_screen.dart
│   │   └── main_module.dart
│   │
│   ├── login/
│   │   ├── controllers/
│   │   │   └── login_controller.dart
│   │   ├── views/
│   │   │   └── login_screen.dart
│   │   ├── services/
│   │   │   └── login_service.dart
│   │   └── login_module.dart
│   │
│   ├── product/
│   │   ├── controllers/
│   │   │   ├── cart_controller.dart
│   │   │   └── product_controller.dart
│   │   ├── views/
│   │   │   ├── cart_screen.dart
│   │   │   ├── product_list_screen.dart
│   │   │   └── products_widgets/
│   │   │       ├── category_filters_widgets.dart
│   │   │       └── grid_product_widget.dart
│   │   ├── services/
│   │   │   └── product_service.dart
│   │   └── product_module.dart
│   │
│   ├── order/
│   │   ├── views/
│   │   │   └── order_list_screen.dart
│   │   └── order_module.dart
│   │
│   ├── profile/
│   │   ├── views/
│   │   │   └── profile_screen.dart
│   │   └── profile_module.dart
```
## Instruções de Execução
### Certifique-se de ter o Flutter 3.22.2 instalado em seu ambiente de desenvolvimento.
### Clone o repositório do projeto.
### Abra o projeto em seu IDE Flutter preferido.
### Obtenha as dependências do projeto executando flutter pub get no terminal.
### Conecte um dispositivo ou emulador.
### Execute o aplicativo com flutter run.
