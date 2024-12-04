# Aplicativo Interativo de Ensino de Música

Desenvolvedor: Noah Stelmak Bussmann  
Curso: Engenharia de Software

## Tabela de Conteúdo

1. [Visão Geral](#visão-geral)
2. [Funcionalidades](#funcionalidades)
    1. [Funcionalidades Principais](#funcionalidades-principais)
    2. [Funcionalidades Adicionais](#funcionalidades-adicionais)
3. [Especificações Técnicas](#especificações-técnicas)
    1. [Requisitos Funcionais](#requisitos-funcionais)
    2. [Requisitos Não Funcionais](#requisitos-não-funcionais)
    3. [Tecnologias Utilizadas](#tecnologias-utilizadas)
4. [Cenários de Uso](#cenários-de-uso)
5. [Princípios de Design](#princípios-de-design)
6. [Limitações](#limitações)
7. [Configuração e Instalação](#configuração-e-instalação)
8. [Melhorias Futuras](#melhorias-futuras)
11. [Créditos](#créditos)

## Visão Geral

Este projeto é um aplicativo desktop projetado para ensinar os fundamentos do piano a aspirantes a músicos, por meio de uma experiência de aprendizagem interativa e personalizada. O aplicativo combina música e tecnologia, oferecendo lições e exercícios que podem ser acessados offline, sem necessidade de cadastros ou conexão com a internet.

## Funcionalidades

### Funcionalidades Principais

- **Fundamentos de Piano**: Aprenda e pratique conceitos básicos de piano de forma interativa.
- **Compatibilidade MIDI**: Use dispositivos MIDI para praticar e receba feedback em tempo real.
- **Suporte ao Teclado do Computador**: Use o teclado do computador como alternativa ao teclado MIDI.
- **Reprodução Interativa**: Siga as partituras com reprodução em tempo real e avaliação de desempenho.

### Funcionalidades Adicionais

- **Modos de Jogo**: Inclui modos de jogo como memória e prática livre.
- **Planos de Fundo e Efeitos Visuais**: Visuais estilizados e efeitos de partículas para uma experiência imersiva.

## Especificações Técnicas

### Requisitos Funcionais

1. Ensinar fundamentos de piano.
2. Suportar entrada de dispositivos MIDI e teclado do computador.
3. Avaliar o desempenho do usuário e fornecer feedback.
4. Exibir e tocar partituras de forma interativa.
5. Configurações personalizáveis para dispositivos MIDI e teclado.

### Requisitos Não Funcionais

1. Interface intuitiva e fácil de usar.
2. Funcionalidade offline — sem necessidade de conexão com a internet.
3. Baixa latência na interação com MIDI e teclado do computador.
4. Reproduzir sons de piano de alta qualidade.

### Tecnologias Utilizadas

- **Godot Engine**: Motor de jogo multiplataforma usado para desenvolvimento do aplicativo.
- **GDScript**: Linguagem de script para criar a lógica do jogo.

## Cenários de Uso

1. **Aprender Fundamentos de Piano**
    - Acesse lições e exercícios interativos.
    - Receba feedback imediato para melhorar suas habilidades.

2. **Praticar com Dispositivos MIDI**
    - Conecte seu dispositivo MIDI e pratique com avaliação em tempo real.

3. **Tocar Musicas**
    - Siga a reprodução interativa e melhore a precisão de sua performance.

## Princípios de Design

- **Arquitetura: Model-View-Controller (MVC)**.
- **Componentes Principais**:
    - **Interface do Usuário (UI)**: Exibe lições, exercícios e feedback.
    - **Motor de Música**: Gerencia reprodução de sons e interação MIDI.
    - **Lógica**: Avalia desempenho, fornece feedback e gerencia progresso.
    - **Gerenciador de Recursos**: Garante o carregamento de áudio, partituras e elementos visuais.

## Limitações

- Não cobre teoria musical avançada.
- Opções de sintetizadores são limitadas na versão inicial.

## Configuração e Instalação

1. Clone o repositório.
2. Abra o projeto no Godot Engine.
3. Execute a cena principal para iniciar o aplicativo.

## Melhorias Futuras

1. Ampliar suporte a sintetizadores.
2. Adicionar lições e exercícios mais avançados.
3. Implementar uma versão mobile e web do aplicativo.
4. Multiplayer: Permitir que usuários joguem ou pratiquem em conjunto. 

### Créditos

- [Godot Engine](https://godotengine.org/): Motor de jogo open-source usado no desenvolvimento.  
- [Stylized Sky Backgrounds por Kalponic Studio](https://kalponic-studio.itch.io/stylized-sky-background): Fundos de céu estilizados.

