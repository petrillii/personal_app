import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({Key? key}) : super(key: key);

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  var txtPassword1 = TextEditingController();
  var txtPassword2 = TextEditingController();
  bool isChecked = false;
  bool _passwordVisible2 = false;
  bool _passwordVisible1 = false;

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
                Text('Atualizar sua ',
                    style: TextStyle(
                      fontSize: 40,
                    )),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text('senha',
                    style: TextStyle(
                      fontSize: 40,
                    )),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Favor insira sua nova senha',
                    style: TextStyle(
                      fontSize: 19,
                    )),
              ],
            ),
            const SizedBox(height: 100),
            campoSenha1('Nova Senha', txtPassword1),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 35, 0),
            ),
            const SizedBox(height: 20),
            campoSenha2('Confirmar Senha', txtPassword2),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 35, 0),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sucess-password');
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
                          "ATUALIZAR SENHA",
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

  campoSenha1(rotulo, variavel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
      child: (TextFormField(
        controller: variavel,
        obscureText: !_passwordVisible1,
        decoration: InputDecoration(
          isDense: true,
          labelText: rotulo,
          labelStyle: const TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 131, 132, 133),
          ),
          hintText: 'Insira a senha',
          hintStyle: const TextStyle(
            fontSize: 15,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible1 ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible1 = !_passwordVisible1;
              });
            },
          ),
        ),
      )),
    );
  }

  campoSenha2(rotulo, variavel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
      child: (TextFormField(
        controller: variavel,
        obscureText: !_passwordVisible2,
        decoration: InputDecoration(
          isDense: true,
          labelText: rotulo,
          labelStyle: const TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 131, 132, 133),
          ),
          hintText: 'Insira a senha',
          hintStyle: const TextStyle(
            fontSize: 15,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible2 ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible2 = !_passwordVisible2;
              });
            },
          ),
        ),
      )),
    );
  }
}
