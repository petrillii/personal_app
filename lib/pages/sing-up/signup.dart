import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_app/model/sign-up.model.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();
  final TextEditingController _confirmarSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int steps = 1;
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        )),
        title: Column(
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'VOLTAR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        bottom: (PreferredSize(
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  "Criar nova\nConta",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          preferredSize: const Size.fromHeight(150),
        )),
        backgroundColor: const Color.fromARGB(255, 255, 91, 98),
        elevation: 0.0,
      )),
      body: (SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              campoTexto("Nome*",
                  _nome), //ALTERAR PARA STEPS AO INVES DE TROCAR DE PAGINA
              const SizedBox(height: 20),
              campoTexto("Email*", _email),
              const SizedBox(height: 20),
              campoSenha("Senha*", _senha),
              const SizedBox(height: 20),
              confirmarSenha("Confirmar Senha*", _confirmarSenha),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: const Text(
                      'Continuar',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 91, 98),
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/info-contatos',
                            arguments: {
                              "nome": _nome.text,
                              "email": _email.text,
                              "senha": _senha.text,
                            });
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromARGB(255, 255, 91, 98),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ))),
    );
  }

  campoTexto(rotulo, variavel) {
    return TextField(
      controller: variavel,
      obscureText: false,
      decoration: InputDecoration(
        isDense: true,
        labelText: rotulo,
        labelStyle: const TextStyle(
          fontSize: 15,
          color: Color.fromARGB(255, 131, 132, 133),
        ),
        hintText: 'Insira seu ' + rotulo,
        hintStyle: const TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }

  campoSenha(rotulo, variavel) {
    return TextFormField(
      controller: variavel,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        isDense: true,
        labelText: rotulo,
        labelStyle: const TextStyle(
          fontSize: 15,
          color: Color.fromARGB(255, 131, 132, 133),
        ),
        hintText: 'Insira sua ' + rotulo,
        hintStyle: const TextStyle(
          fontSize: 15,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
    );
  }

  confirmarSenha(rotulo, variavel) {
    return TextFormField(
        controller: variavel,
        obscureText: !_confirmPasswordVisible,
        decoration: InputDecoration(
          isDense: true,
          labelText: rotulo,
          labelStyle: const TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 131, 132, 133),
          ),
          hintText: 'Insira sua ' + rotulo,
          hintStyle: const TextStyle(
            fontSize: 15,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                _confirmPasswordVisible = !_confirmPasswordVisible;
              });
            },
          ),
        ),
        onChanged: (value) {
          _formKey.currentState!.validate();
        },
        validator: (value) {
          if (value != _senha.text) {
            return 'Senhas não coinscidem';
          }
          return null;
        });
  }

  onSubmit() {
    final String name = _nome.text;
    final String email = _email.text;
    final String password = _senha.text;
    final String confirmPassword = _confirmarSenha.text;

    //Navigator.pushNamed(context, '/forgot-password');
  }
}
