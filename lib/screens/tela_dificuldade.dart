import 'package:flutter/material.dart';
import 'tela_perfil.dart';
import 'tela_progresso.dart';

class TelaDificuldade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleção de Nível de Dificuldade'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Escolha o seu nível de dificuldade'),
            ElevatedButton(
              onPressed: () {
                _irParaTelaPerfil(context, 'Iniciante');
              },
              child: Text('Iniciante'),
            ),
            ElevatedButton(
              onPressed: () {
                _irParaTelaPerfil(context, 'Intermediário');
              },
              child: Text('Intermediário'),
            ),
            ElevatedButton(
              onPressed: () {
                _irParaTelaPerfil(context, 'Avançado');
              },
              child: Text('Avançado'),
            ),
          ],
        ),
      ),
    );
  }

  // Função para navegar para a tela de perfil com o nível selecionado
  void _irParaTelaPerfil(BuildContext context, String nivel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaPerfil(nivel: nivel),
      ),
    );
  }
}
