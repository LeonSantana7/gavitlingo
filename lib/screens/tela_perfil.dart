import 'package:flutter/material.dart';
import 'tela_vocabulario.dart';

class TelaPerfil extends StatefulWidget {
  final String nivel;

  TelaPerfil({required this.nivel});

  @override
  _TelaPerfilState createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  String nomeUsuario = 'Nome do Usuário';
  String emailUsuario = 'usuario@email.com';

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerNome.text = nomeUsuario;
    _controllerEmail.text = emailUsuario;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _controllerNome,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _controllerEmail,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nomeUsuario = _controllerNome.text;
                  emailUsuario = _controllerEmail.text;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Perfil atualizado com sucesso!'),
                  ),
                );
              },
              child: Text('Atualizar Perfil'),
            ),
            SizedBox(height: 20),
            Text(
              'Informações do Perfil',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Nome: $nomeUsuario'),
            Text('E-mail: $emailUsuario'),
            SizedBox(height: 10),
            Text(
              'Nível: ${widget.nivel}',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaVocabulario(nivel: widget.nivel),
                  ),
                );
              },
              child: Text('Ir para Vocabulário'),
            ),
          ],
        ),
      ),
    );
  }
}
