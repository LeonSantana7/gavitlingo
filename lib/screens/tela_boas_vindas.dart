import 'package:flutter/material.dart';
import 'tela_dificuldade.dart'; // Importe a tela de dificuldade

class TelaBoasVindas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo ao Gavitlingo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Mensagem de boas-vindas'),

            // Botão para ir para a tela de dificuldade
            ElevatedButton(
              onPressed: () {
                _irParaTelaDificuldade(context);
              },
              child: Text('Ir para a Tela de Dificuldade'),
            ),
          ],
        ),
      ),
    );
  }

  // Função para navegar para a tela de dificuldade
  void _irParaTelaDificuldade(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaDificuldade()),
    );
  }
}
