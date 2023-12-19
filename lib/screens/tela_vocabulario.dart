import 'package:flutter/material.dart';
import 'dart:math';
import 'tela_quiz.dart'; // Importe a tela de quiz

class TelaVocabulario extends StatelessWidget {
  final String nivel;

  TelaVocabulario({required this.nivel});

  List<String> palavras = [
    'apple',
    'banana',
    'car',
    'house',
    'sun',
    'flower',
    'computer',
    'programming',
    'flutter',
    'learning',
  ];

  String gerarPalavra() {
    int comprimentoMinimo =
        nivel == 'Iniciante' ? 4 : (nivel == 'Intermediário' ? 6 : 8);
    List<String> palavrasDisponiveis = palavras
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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.aprenderVocabulario(nivel),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.telaVocabulario(nivel),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.palavra(palavra),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaQuiz()),
                );
              },
              child: Text('Iniciar Quiz'),
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
