import 'package:flutter/material.dart';
import 'tela_vocabulario.dart';

class TelaPerfil extends StatefulWidget {
  final String nivel;
  final List<String> vocabulario; // Adicione esta linha

  const TelaPerfil({Key? key, required this.nivel, required this.vocabulario})
      : super(key: key);

  @override
  TelaPerfilState createState() => TelaPerfilState();
}

class TelaPerfilState extends State<TelaPerfil> {
  late final TextEditingController _controllerNome;
  late final TextEditingController _controllerEmail;

  String nomeUsuario = 'Nome do Usuário';
  String emailUsuario = 'usuario@email.com';

  @override
  void initState() {
    super.initState();
    _controllerNome = TextEditingController(text: nomeUsuario);
    _controllerEmail = TextEditingController(text: emailUsuario);
  }

  @override
  void dispose() {
    _controllerNome.dispose();
    _controllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _controllerNome,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _controllerEmail,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nomeUsuario = _controllerNome.text;
                  emailUsuario = _controllerEmail.text;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Perfil atualizado com sucesso!'),
                  ),
                );
              },
              child: const Text('Atualizar Perfil'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Informações do Perfil',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Nome: $nomeUsuario'),
            Text('E-mail: $emailUsuario'),
            const SizedBox(height: 10),
            Text(
              'Nível: ${widget.nivel}',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaVocabulario(
                      nivel: widget.nivel,
                      vocabulario:
                          widget.vocabulario, // Passe a lista de vocabulário
                    ),
                  ),
                );
              },
              child: const Text('Ir para Vocabulário'),
            ),
          ],
        ),
      ),
    );
  }
}
