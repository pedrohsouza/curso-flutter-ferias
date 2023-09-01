import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class Usuario {
  String nome;
  bool ativo;

  Usuario({required this.nome, required this.ativo});
}

class _Form extends FormBloc<Usuario, void> {
  final TextFieldBloc nome = TextFieldBloc(initialValue: '');
  final BooleanFieldBloc ativo = BooleanFieldBloc(initialValue: false);

  @override
  void onSubmitting() {}
}
