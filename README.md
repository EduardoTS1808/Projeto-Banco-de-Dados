# Documentação do Projeto - Carteira Financeira Digital

## 1. Introdução

Este documento descreve o projeto de um sistema de carteira financeira digital de uso pessoal. O projeto foi desenvolvido com base em uma arquitetura simples utilizando HTML, PHP e MySQL, permitindo ao usuário registrar, visualizar e gerenciar informações financeiras.

## 2. Objetivos

Desenvolver um sistema funcional de carteira financeira que permita ao usuário controlar suas receitas, despesas, contas e metas financeiras, com base em um banco de dados relacional estruturado.

## 3. Estrutura do Banco de Dados

O banco de dados chamado 'carteira_digital' contém as seguintes tabelas:
⦁	- USUARIO
⦁	- CONTA
⦁	- CATEGORIA
⦁	- TRANSACAO
⦁	- META_FINANCEIRA


## 5. Estrutura do Projeto

A estrutura de diretórios do projeto é organizada da seguinte forma:

carteira_digital/
├── index.php
├── conexao.php
├── form.php
├── metas.php
├── transacoes.php
├── novosdados.php
├── style.css
└── banco/
    └── carteira_digital.sql

## 6. Tecnologias Utilizadas

⦁	- HTML5 e CSS3
⦁	- PHP 7+
⦁	- MySQL 8+
⦁	- MySQL Workbench
⦁	- Git e GitHub

## 7. Instruções de Uso

1. Instale o XAMPP ou WAMP no seu computador.
2. Coloque a pasta do projeto em `htdocs/` ou `www/`.
3. Crie o banco de dados importando o arquivo `carteira_digital.sql`.
4. Acesse `http://localhost/carteira_digital` no navegador.

## 8. Considerações Finais

O sistema pode ser expandido para integrar autenticação de usuários, exportação de relatórios financeiros, gráficos e notificações. A separação lógica das tabelas e relacionamentos permite alta escalabilidade.