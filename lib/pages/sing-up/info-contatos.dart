import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoContatos extends StatefulWidget {
  const InfoContatos({Key? key}) : super(key: key);

  @override
  State<InfoContatos> createState() => _InfoContatosState();
}

class _InfoContatosState extends State<InfoContatos> {
  final TextEditingController _cep = TextEditingController();
  final TextEditingController _rua = TextEditingController();
  final TextEditingController _num = TextEditingController();
  final TextEditingController _bairro = TextEditingController();
  final TextEditingController _cidade = TextEditingController();
  final TextEditingController _celular = TextEditingController();

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
                  "Informações\nde contato",
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
        //key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              campoTexto("CEP",
                  _cep), //ALTERAR PARA STEPS AO INVES DE TROCAR DE PAGINA
              const SizedBox(height: 20),
              campoTexto("Rua*", _rua),
              const SizedBox(height: 20),
              campoTexto("Nº*", _num),
              const SizedBox(height: 20),
              campoTexto("Bairro*", _bairro),
              const SizedBox(height: 20),
              campoTexto("Cidade*", _cidade),
              const SizedBox(height: 20),
              campoTexto("Celular(DDD)*", _celular),
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
                      Navigator.pushNamed(context, '/preferences');
                      /* if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/info-contatos');
                      } */
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
}