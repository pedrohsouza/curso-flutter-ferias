import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      home: TelaPrincipal(),
    ),
  );
}

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _EstadoTelaCadastro();
}

class _EstadoTelaCadastro extends State<TelaCadastro> {
  // TextEditingController
  String _email = '';
  String _senha = '';
  String? _erroEmail;
  String? _erroSenha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Cadastre-se'),
            TextFormField(
              initialValue: _email,
              onChanged: (texto) => setState(() => _email = texto),
              decoration: InputDecoration(
                labelText: 'E-mail',
                errorText: _erroEmail,
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              initialValue: _senha,
              onChanged: (texto) => setState(() => _senha = texto),
              decoration: InputDecoration(
                labelText: 'Senha',
                errorText: _erroSenha,
                border: OutlineInputBorder(),
              ),
            ),
            MaterialButton(
              padding: const EdgeInsets.all(10),
              color: Colors.blue,
              child: Text('entrar'),
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _email,
                    password: _senha,
                  );
                } on FirebaseAuthException catch (e) {
                  setState(() {
                    String codigo = e.code;
                    if (codigo == 'invalid-email') {
                      // _erroEmail = 'E-mail inválido';
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TelaCadastro(),
                          ));
                    } else if (codigo == 'email-already-in-use') {
                      _erroEmail = 'Usuário já existe';
                    } else if (codigo == 'weak-password') {
                      _erroSenha = 'Senha fraca';
                    } else {
                      _erroEmail = codigo;
                    }
                  });
                  return;
                }

                setState(() {
                  _erroEmail = null;
                  _erroSenha = null;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class TelaAtenticacao extends StatefulWidget {
  const TelaAtenticacao({super.key});

  @override
  State<TelaAtenticacao> createState() => _TelaAtenticacaoState();
}

class _TelaAtenticacaoState extends State<TelaAtenticacao> {
  // TextEditingController
  String _email = '';
  String _senha = '';
  String? _erroEmail;
  String? _erroSenha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Cadastre-se'),
            TextFormField(
              initialValue: _email,
              onChanged: (texto) => setState(() => _email = texto),
              decoration: InputDecoration(
                labelText: 'E-mail',
                errorText: _erroEmail,
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              initialValue: _senha,
              onChanged: (texto) => setState(() => _senha = texto),
              decoration: InputDecoration(
                labelText: 'Senha',
                errorText: _erroSenha,
                border: OutlineInputBorder(),
              ),
            ),
            MaterialButton(
              padding: const EdgeInsets.all(10),
              color: Colors.blue,
              child: Text('entrar'),
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _email,
                    password: _senha,
                  );
                } on FirebaseAuthException catch (e) {
                  setState(() {
                    String codigo = e.code;
                    if (codigo == 'invalid-email') {
                      _erroEmail = 'E-mail inválido';
                    } else if (codigo == 'user-disabled') {
                      _erroEmail = 'Usuário desabilitado';
                    } else if (codigo == 'user-not-found') {
                      _erroEmail = 'usuário não encontrado';
                    } else if (codigo == 'wrong-password') {
                      _erroSenha = 'Senha inválida';
                    }
                  });
                  return;
                }

                setState(() {
                  _erroEmail = null;
                  _erroSenha = null;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // AsyncSnapshot

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('Carregando...'),
            );
          }

          User? usuario = snapshot.data;
          if (usuario == null) {
            return TelaAtenticacao();
          } else {
            return TelaProjetos();
          }
        },
      ),
    );
  }
}

class TelaProjetos extends StatelessWidget {
  const TelaProjetos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Meus projetos'),
          MaterialButton(
            color: Colors.red,
            child: Text('sair'),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
