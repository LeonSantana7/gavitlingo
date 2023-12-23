import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'database_helper.dart'; // Importe o arquivo database_helper.dart
import 'screens/tela_boas_vindas.dart';
import 'screens/tela_quiz.dart';
import 'screens/tela_perfil.dart';
import 'localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().initializeDatabase();
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gavitlingo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('pt'),
      ],
      locale: const Locale('pt'),
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaBoasVindas(),
        '/quiz': (context) => const TelaQuiz(
              vocabulario: ['word1', 'word2', 'word3'],
            ),
        '/perfil': (context) => const TelaPerfil(
              nivel: 'Iniciante',
            ),
      },
    );
  }
}
