import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String _errorEmail = '';
  var txtEmail = TextEditingController();
  bool isChecked = false;

  @override
  void initState() {
    //PEGAR O EMAIL DA ROTA DE LOGIN PARA COLOCAR NO CAMPO DE ESQUECI A SENHA
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: (AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Column(
          children: <Widget>[
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromARGB(255, 255, 91, 98),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
                TextButton(
                  child: const Text(
                    'VOLTAR',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 91, 98), fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text('Esqueceu a Senha ?',
                    style: TextStyle(
                      fontSize: 40,
                    )),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Favor digitar seu email de cadastro',
                    style: TextStyle(
                      fontSize: 19,
                    )),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Para envio do link de confirmação',
                    style: TextStyle(
                      fontSize: 19,
                    )),
              ],
            ),
            const SizedBox(height: 100),
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/update-password');
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
                          "ENVIAR",
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
          ],
        ),
      ),
    );
  }

  campoEmail(rotulo, variavel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 5),
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
          hintText: 'Insira ' + rotulo,
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
}
