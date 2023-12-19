import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/tela_boas_vindas.dart';
import 'screens/tela_quiz.dart';
import 'screens/tela_perfil.dart';
import 'localizations.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gavitlingo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('pt'),
      ],
      locale: Locale('pt'),
      initialRoute: '/',
      routes: {
        '/': (context) => TelaBoasVindas(),
        '/quiz': (context) => TelaQuiz(),
        '/perfil': (context) => TelaPerfil(
              nivel: 'Iniciante',
            ),
      },
    );
  }
}
