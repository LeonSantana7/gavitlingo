import 'package:flutter/material.dart';

class TelaProgresso extends StatelessWidget {
  final int pontuacaoTotal;
  final int totalPerguntas;

  const TelaProgresso({
    Key? key,
    required this.pontuacaoTotal,
    required this.totalPerguntas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progresso e Estatísticas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pontuação: $pontuacaoTotal',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              'Perguntas Certas: $pontuacaoTotal/$totalPerguntas',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: pontuacaoTotal / totalPerguntas,
              color: Colors.blue, // Cor da barra de progresso
              backgroundColor: Colors.grey,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
