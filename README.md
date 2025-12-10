## App Quiz Flutter – Fatec

Aplicativo de quiz desenvolvido em Flutter para a disciplina **Programação para Dispositivos Móveis II** (Fatec), seguindo as aulas do professor Parisotto.

O app apresenta perguntas de múltipla escolha, com imagens, pontuação por resposta e mensagem final de resultado (PARABÉNS, APROVADO, RECUPERAÇÃO ou REPROVADO).

### Funcionalidades

- **Quiz com perguntas e respostas**: três perguntas de exemplo, cada uma com várias alternativas.
- **Imagens por pergunta**: cada questão exibe uma imagem relacionada (`cazaquistao.jpg`, `ouro.png`, `misterioso.jpg`).  
- **Pontuação por resposta**: cada alternativa possui um peso (0, 1, 4 ou 5 pontos).
- **Resumo das respostas**: ao final, o app mostra todas as perguntas, respostas escolhidas e se cada uma estava certa ou errada (cores verde e vermelha).
- **Mensagem final**: cálculo do total de pontos e exibição de uma mensagem de resultado.
- **Layout rolável**: uso de `ListView` para permitir rolagem quando houver muitos botões.
- **Fonte personalizada**: uso do pacote `google_fonts` com a fonte Montserrat.

### Tecnologias utilizadas

- **Flutter** (SDK 3.10.3+)
- **Dart**
- **google_fonts**

### Estrutura principal

- `lib/main.dart` – widget raiz, `Scaffold` com cor de fundo personalizada, navegação entre perguntas e resultado, cálculo da pontuação.
- `lib/dados.dart` – lista de perguntas, respostas, imagens e pontos.
- `lib/pergunta_respostas.dart` – modelo de dados (`PerguntaRespostas`).
- `lib/lista_perguntas.dart` – exibição da pergunta atual, imagem e botões de respostas.
- `lib/botoes.dart` – widget de botão reutilizável para as alternativas.
- `lib/itens.dart` – exibição de cada pergunta/resposta no resumo final.
- `lib/resultado.dart` – tela de resultado com total de pontos e mensagem.
- `assets/images/` – imagens usadas no quiz.

### Como rodar o projeto

1. Certifique-se de ter o Flutter instalado e configurado.
2. Clone este repositório e entre na pasta do projeto:

```bash
cd appfatec
```

3. Baixe as dependências:

```bash
flutter pub get
```

4. Rode o app em um emulador ou dispositivo físico:

```bash
flutter run
```

### Observações

- As imagens do quiz estão em `assets/images` e são referenciadas no arquivo `pubspec.yaml`.
- A ordem das perguntas e das respostas é embaralhada a cada inicialização do app (uso de `shuffle()`).

### Créditos

Projeto desenvolvido como exercício acadêmico na Fatec, baseado nas aulas do professor **Parisotto**.
