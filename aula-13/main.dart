import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // == Navegações:
  // child
  // push

  // == Operações:
  // set     (definição)
  // update  (atualização)
  // remove  (remoção)
  // get     (leitura)

  runApp(const MaterialApp(home: TelaConsulta()));
}

class TelaAutenticacao extends StatefulWidget {
  const TelaAutenticacao({super.key});

  @override
  State<TelaAutenticacao> createState() => _EstadoTelaAutenticacao();
}

class _EstadoTelaAutenticacao extends State<TelaAutenticacao> {
  String _email = ''; // Armazena o e-mail do usuário
  String _senha = ''; // Armazena a senha do usuário
  String? _erroEmail; // Armazena o erro do campo de e-mail do layout
  String? _erroSenha; // Armazena o erro do campo de senha do layout

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Campo em que o usuário inserirá o seu e-mail
          TextFormField(
            initialValue: _email,
            onChanged: (texto) => setState(() => _email = texto),
            decoration: InputDecoration(
              labelText: 'E-mail',
              errorText: _erroEmail,
              border: const OutlineInputBorder(),
            ),
          ),
          // Campo em que o usuário inserirá a sua senha
          TextFormField(
            initialValue: _senha,
            onChanged: (texto) => setState(() => _senha = texto),
            decoration: InputDecoration(
              labelText: 'Senha',
              errorText: _erroSenha,
              border: const OutlineInputBorder(),
            ),
          ),
          // Botão em que o usuário clicará para entrar
          MaterialButton(
            padding: const EdgeInsets.all(10),
            color: Colors.blue,
            child: Text('Entrar', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              // Fazer validação do campo de e-mail e senha
              // Para o campo de e-mail, ver https://stackoverflow.com/a/50663835/9997212
              // Para o campo de senha, basta ver se tem o mínimo de 6 caracteres

              try {
                // Verifica as informações do usuário na nuvem
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: _email,
                  password: _senha,
                );
              } on FirebaseAuthException catch (e) {
                // Verifica os erros de validação ao verificar na nuvem
                String codigo = e.code;
                // Consultar os códigos em https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
                setState(() {
                  if (codigo == 'invalid-email') {
                    _erroEmail = 'E-mail inválido.';
                  } else if (codigo == 'user-disabled') {
                    _erroEmail = 'Usuário desabilitado.';
                  } else if (codigo == 'user-not-found') {
                    _erroEmail = 'Usuário não encontrado.';
                  } else if (codigo == 'wrong-password') {
                    _erroSenha = 'Senha inválida.';
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
          ),
          SizedBox(height: 5),
          MaterialButton(
            padding: const EdgeInsets.all(10),
            color: Colors.blue,
            child: Text('Criar conta', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaCadastro(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _EstadoTelaCadastro();
}

class _EstadoTelaCadastro extends State<TelaCadastro> {
  String _email = ''; // Armazena o e-mail do usuário
  String _senha = ''; // Armazena a senha do usuário
  String? _erroEmail; // Armazena o erro do campo de e-mail do layout
  String? _erroSenha; // Armazena o erro do campo de senha do layout

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Campo em que o usuário inserirá o seu e-mail
          TextFormField(
            initialValue: _email,
            onChanged: (texto) => setState(() => _email = texto),
            decoration: InputDecoration(
              labelText: 'E-mail',
              errorText: _erroEmail,
              border: const OutlineInputBorder(),
            ),
          ),
          // Campo em que o usuário inserirá a sua senha
          TextFormField(
            initialValue: _senha,
            onChanged: (texto) => setState(() => _senha = texto),
            decoration: InputDecoration(
              labelText: 'Senha',
              errorText: _erroSenha,
              border: const OutlineInputBorder(),
            ),
          ),
          // Botão em que o usuário clicará para se cadastrar
          MaterialButton(
            padding: const EdgeInsets.all(10),
            color: Colors.blue,
            child: Text('Cadastrar', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              // Fazer validação do campo de e-mail e senha
              // Para o campo de e-mail, ver https://stackoverflow.com/a/50663835/9997212
              // Para o campo de senha, basta ver se tem o mínimo de 6 caracteres

              try {
                // Tenta criar as informações do usuário na nuvem
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _email,
                  password: _senha,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaConsulta(),
                  ),
                );
              } on FirebaseAuthException catch (e) {
                // Verifica os erros de validação ao verificar na nuvem
                String codigo = e.code;
                // Consultar os códigos em https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
                setState(() {
                  if (codigo == 'email-already-in-use') {
                    _erroEmail = 'E-mail já existente.';
                  } else if (codigo == 'invalid-email') {
                    _erroEmail = 'E-mail inválido.';
                  } else if (codigo == 'user-disabled') {
                    _erroEmail = 'Usuário desabilitado.';
                  } else if (codigo == 'weak-password') {
                    _erroSenha = 'Senha fraca.';
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
          ),
        ],
      ),
    );
  }
}

class TelaConsulta extends StatelessWidget {
  const TelaConsulta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        // Escuta todos os eventos do aplicativo em forma de usuários
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Se o estado de autenticação ainda está sendo processado
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Carregando...'));
          }

          // Aqui, o estado de autenticação já foi processado
          User? usuario = snapshot.data;

          // Se não há usuario ativo na sessão atual
          if (usuario == null) {
            return const TelaAutenticacao();
          }

          // Aqui, é possível acessar `usuario` para ver o usuário ativo na sessão atual
          return TelaProjetos(uid: usuario.uid);
        },
      ),
    );
  }
}

class TelaProjetos extends StatelessWidget {
  final String uid;

  const TelaProjetos({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Apenas usuários autenticados podem ver esta tela.'),
          Text(uid),
          StreamBuilder<Map>(
            stream: FirebaseDatabase.instance
                .ref()
                .child('usuarios')
                .child(uid)
                .onValue
                .map((event) => event.snapshot.value as Map),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Carregando...');
              }

              var dados = snapshot.data;

              if (dados == null) {
                return Text('dados não existem');
              }
              return ListTile(
                leading: Icon(
                  Icons.add,
                  color: dados['ativo'] ? Colors.green : Colors.red,
                ),
                title: Text(dados['nome']),
                subtitle: Text(dados['data-nascimento']),
              );
            },
          ),
          MaterialButton(
            padding: const EdgeInsets.all(10),
            color: Colors.blue,
            child: Text('inserir dados', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              await FirebaseDatabase.instance
                  .ref()
                  .child('usuarios')
                  .child(uid)
                  .set({
                'nome': 'Enzo',
                'ativo': true,
                'data-nascimento': '29/01'
              });
            },
          ),
          MaterialButton(
            padding: const EdgeInsets.all(10),
            color: Colors.red,
            child: Text('sair', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              // Faz com que o `snapshot` no código anterior vire nulo
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
