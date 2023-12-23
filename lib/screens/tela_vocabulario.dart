import 'package:flutter/material.dart';
import 'dart:math';
import 'tela_quiz.dart';

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
    AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appLocalizations?.aprenderVocabulario(nivel) ?? '',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              appLocalizations?.telaVocabulario(nivel) ?? '',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              appLocalizations?.palavra(palavra) ?? '',
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

class AppLocalizations {
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String aprenderVocabulario(String nivel) {
    return 'Aprender Vocabulário - $nivel';
  }

  String telaVocabulario(String nivel) {
    return 'Tela de Vocabulário - Nível: $nivel';
  }

  String palavra(String palavra) {
    return 'Palavra: $palavra';
  }
}
