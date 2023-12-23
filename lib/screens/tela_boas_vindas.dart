import 'package:flutter/material.dart';
import 'tela_dificuldade.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gavitlingo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Colors.teal),
        fontFamily: 'Montserrat',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            foregroundColor:
                Colors.white, // Substituir 'onPrimary' por 'foregroundColor'
            elevation: 3,
          ),
        ),
      ),
      home: const TelaBoasVindas(),
    );
  }
}

class TelaBoasVindas extends StatelessWidget {
  const TelaBoasVindas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
            const Text(
              'Gavitlingo',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                fontFamily: 'Montserrat',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _irParaTelaDificuldade(context);
              },
              child: const Text(
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

  void _irParaTelaDificuldade(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TelaDificuldade()),
    );
  }
}
