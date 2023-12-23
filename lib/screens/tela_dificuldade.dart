import 'package:flutter/material.dart';
import 'tela_perfil.dart';

class TelaDificuldade extends StatelessWidget {
  const TelaDificuldade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleção de Nível de Dificuldade'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Escolha o seu nível de dificuldade'),
            ElevatedButton(
              onPressed: () {
                _irParaTelaPerfil(context, 'Iniciante', vocabularioIniciante);
              },
              child: const Text('Iniciante'),
            ),
            ElevatedButton(
              onPressed: () {
                _irParaTelaPerfil(
                    context, 'Intermediário', vocabularioIntermediario);
              },
              child: const Text('Intermediário'),
            ),
            ElevatedButton(
              onPressed: () {
                _irParaTelaPerfil(context, 'Avançado', vocabularioAvancado);
              },
              child: const Text('Avançado'),
            ),
          ],
        ),
      ),
    );
  }

  void _irParaTelaPerfil(
      BuildContext context, String nivel, List<String> vocabulario) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            TelaPerfil(nivel: nivel, vocabulario: vocabulario),
      ),
    );
  }
}

// Defina os vocabulários correspondentes
List<String> vocabularioIniciante = ['palavra1', 'palavra2', 'palavra3'];
List<String> vocabularioIntermediario = ['palavra4', 'palavra5', 'palavra6'];
List<String> vocabularioAvancado = ['palavra7', 'palavra8', 'palavra9'];
