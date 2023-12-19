import 'package:flutter/material.dart';
import 'tela_dificuldade.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gavitlingo',
      theme: ThemeData(
        primaryColor: Colors.teal,
        fontFamily: 'Montserrat',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.amber,
            onPrimary: Colors.white,
            elevation: 3,
          ),
        ),
      ),
      home: TelaBoasVindas(),
    );
  }
}

class TelaBoasVindas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bem-vindo ao Gavitlingo',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gavitlingo',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _irParaTelaDificuldade(context);
              },
              child: Text(
                'Escolha a dificuldade',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
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
