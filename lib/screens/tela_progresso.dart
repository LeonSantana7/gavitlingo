import 'package:flutter/material.dart';

class TelaProgresso extends StatelessWidget {
  final int pontuacaoTotal;
  final int totalPerguntas;

  TelaProgresso({required this.pontuacaoTotal, required this.totalPerguntas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progresso e Estatísticas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pontuação: $pontuacaoTotal',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Perguntas Respondidas: $pontuacaoTotal/$totalPerguntas',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
