import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:email_validator/email_validator.dart';

import '../widgets/mensagem.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _errorEmail = '';
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();
  bool isChecked = false;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return const Color.fromARGB(255, 255, 162, 1);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/logo.svg',
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('PERSONAL APP',
                      style: TextStyle(
                        fontSize: 30,
                      )),
                ],
              ),
              const SizedBox(height: 50),
              campoEmail('Email', txtEmail),
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 5, 35, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      _errorEmail,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              campoSenha('Senha', txtPassword),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 35, 0),
                child: Row(
                  children: [
                    TextButton(
                      child: const Text(
                        'Esqueceu a senha?',
                        style: TextStyle(
                            color: Color.fromARGB(255, 131, 132, 133),
                            fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgot-password');
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 35, 0),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        TextButton(
                          child: const Text(
                            'Lembrar de mim?',
                            style: TextStyle(
                                color: Color.fromARGB(255, 131, 132, 133),
                                fontSize: 15),
                          ),
                          onPressed: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        login(txtEmail.text, txtPassword.text);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [
                                  0.4,
                                  1.0,
                                ],
                                colors: [
                                  Color.fromARGB(255, 255, 91, 98),
                                  Color.fromARGB(255, 255, 162, 1)
                                ]),
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          width: 300,
                          height: 100,
                          alignment: Alignment.center,
                          child: const Text(
                            "ENTRAR",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [
                                  0.4,
                                  1.0,
                                ],
                                colors: [
                                  Color.fromARGB(255, 255, 91, 98),
                                  Color.fromARGB(255, 255, 162, 1)
                                ]),
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          width: 300,
                          height: 100,
                          alignment: Alignment.center,
                          child: const Text(
                            "CONTINUAR COM GOOGLE",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: const Text(
                      'INSCREVA-SE',
                      style: TextStyle(
                          color: Color.fromARGB(255, 131, 132, 133),
                          fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login(email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((res) {
      //TUDO CERTO
      Navigator.pushNamed(context, '/home-page');
    }).catchError((e) {
      switch (e.code) {
        case 'invalid-email':
          erro(context, 'Senha ou Email incorretos.');
          break;
        case 'user-not-found':
          erro(context, 'Usuário não encontrado.');
          break;
        case 'wrong-password':
          erro(context, 'Senha ou Email incorretos.');
          break;
        default:
          erro(context, e.code.toString());
      }
    });
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorEmail = "Insira um Email";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorEmail = "Endereço de Email inválido";
      });
    } else {
      setState(() {
        _errorEmail = "";
      });
    }
  }

  campoEmail(rotulo, variavel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
      child: (TextFormField(
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
        onChanged: (val) {
          validateEmail(val);
        },
      )),
    );
  }

  campoSenha(rotulo, variavel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
      child: (TextFormField(
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
      )),
    );
  }
}
