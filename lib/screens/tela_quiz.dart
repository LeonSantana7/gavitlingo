import 'package:flutter/material.dart';
import 'tela_progresso.dart';

class TelaQuiz extends StatefulWidget {
  final List<String> vocabulario;

  const TelaQuiz({Key? key, required this.vocabulario}) : super(key: key);

  @override
  TelaQuizState createState() => TelaQuizState();
}

class TelaQuizState extends State<TelaQuiz>
    with SingleTickerProviderStateMixin {
  late List<Map<String, String>> perguntasRespostas;
  int indexPergunta = 0;
  int pontuacao = 0;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    perguntasRespostas = gerarPerguntas();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Use const here
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  List<Map<String, String>> gerarPerguntas() {
    return widget.vocabulario.map((palavra) {
      return {
        'palavra': palavra,
        'pergunta': 'O que significa a palavra "$palavra"?',
        'resposta': 'Tradução de $palavra',
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> perguntaResposta = perguntasRespostas[indexPergunta];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste de Compreensão'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              perguntaResposta['pergunta']!,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                verificarResposta(true, perguntaResposta['resposta']!);
              },
              child: const Text('Verdadeiro'),
            ),
            ElevatedButton(
              onPressed: () {
                verificarResposta(false, perguntaResposta['resposta']!);
              },
              child: const Text('Falso'),
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
              child: const Text('Ver Progresso'),
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Opacity(
                  opacity: _animation.value,
                  child: const Text(
                    'Resposta Correta!',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                );
              },
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
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    if (respostaCorretaBool) {
      pontuacao++;
      _animationController.forward(from: 0);
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
