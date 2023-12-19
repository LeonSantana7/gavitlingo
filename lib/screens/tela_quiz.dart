import 'package:flutter/material.dart';
import 'tela_progresso.dart';

class TelaQuiz extends StatefulWidget {
  @override
  _TelaQuizState createState() => _TelaQuizState();
}

class _TelaQuizState extends State<TelaQuiz> {
  final List<Map<String, String>> perguntasRespostas = [
    {
      'palavra': 'apple',
      'pergunta': 'O que significa a palavra "apple"?',
      'resposta': 'Maçã',
    },
  ];

  int indexPergunta = 0;
  int pontuacao = 0;

  @override
  Widget build(BuildContext context) {
    Map<String, String> perguntaResposta = perguntasRespostas[indexPergunta];

    return Scaffold(
      appBar: AppBar(
        title: Text('Teste de Compreensão'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              perguntaResposta['pergunta']!,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                verificarResposta(true, perguntaResposta['resposta']!);
              },
              child: Text('Verdadeiro'),
            ),
            ElevatedButton(
              onPressed: () {
                verificarResposta(false, perguntaResposta['resposta']!);
              },
              child: Text('Falso'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaProgresso(
                      pontuacaoTotal: pontuacao,
                      totalPerguntas: perguntasRespostas.length,
                    ),
                  ),
                );
              },
              child: Text('Ver Progresso'),
            ),
          ],
        ),
      ),
    );
  }

  void verificarResposta(bool respostaUsuario, String respostaCorreta) {
    bool respostaCorretaBool =
        respostaUsuario == (respostaCorreta.toLowerCase() == 'verdadeiro');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(respostaCorretaBool
              ? 'Resposta Correta!'
              : 'Resposta Incorreta!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );

    if (respostaCorretaBool) {
      pontuacao++;
    }

    setState(() {
      indexPergunta++;
      if (indexPergunta >= perguntasRespostas.length) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TelaProgresso(
              pontuacaoTotal: pontuacao,
              totalPerguntas: perguntasRespostas.length,
            ),
          ),
        );
      }
    });
  }
}
