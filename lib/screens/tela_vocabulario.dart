import 'package:flutter/material.dart';
import 'dart:math';
import 'tela_quiz.dart';
import 'package:gavitlingo/localizations.dart';

class TelaVocabulario extends StatelessWidget {
  final String nivel;
  final List<String> vocabulario;

  const TelaVocabulario({
    Key? key,
    required this.nivel,
    required this.vocabulario,
  }) : super(key: key);

  String gerarPalavra() {
    int comprimentoMinimo =
        nivel == 'Iniciante' ? 4 : (nivel == 'Intermediário' ? 6 : 8);
    List<String> palavrasDisponiveis = vocabulario
        .where((palavra) => palavra.length >= comprimentoMinimo)
        .toList();
    if (palavrasDisponiveis.isNotEmpty) {
      return palavrasDisponiveis[Random().nextInt(palavrasDisponiveis.length)];
    } else {
      return 'Sem palavras disponíveis';
    }
  }

  @override
  Widget build(BuildContext context) {
    String palavra = gerarPalavra();

    // Obtém a instância de AppLocalizations
    AppLocalizations appLocalizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appLocalizations.translateVocabularyLearning(
            appLocalizations.translateLevel(nivel),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              appLocalizations.translateVocabularyScreen(
                appLocalizations.translateLevel(nivel),
              ),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              appLocalizations.translateWord(palavra),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaQuiz(
                      vocabulario: vocabulario,
                    ),
                  ),
                );
              },
              child: const Text('Iniciar Quiz'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaQuiz(
                      vocabulario: vocabulario,
                    ),
                  ),
                );
              },
              child: const Text('Ir para Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
