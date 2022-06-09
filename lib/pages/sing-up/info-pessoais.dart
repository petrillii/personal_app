import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:via_cep_flutter/via_cep_flutter.dart';

class InfoPessoais extends StatefulWidget {
  const InfoPessoais({Key? key}) : super(key: key);

  @override
  State<InfoPessoais> createState() => _InfoPessoaisState();
}

class _InfoPessoaisState extends State<InfoPessoais> {
  TextEditingController _dt_nascimento = TextEditingController();
  final TextEditingController _peso = TextEditingController();
  final TextEditingController _altura = TextEditingController();
  final TextEditingController _bf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var dados =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

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
                  "Informações\nPessoais",
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
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Flexible(
                      child: Text(
                          'Essas informações servem para você poder acompanhar seu progresso e poderão ser alteradas a qualquer momento.',
                          style: TextStyle(
                            color: Color.fromARGB(255, 131, 132, 133),
                            fontSize: 19,
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _dt_nascimento,
                obscureText: false,
                decoration: const InputDecoration(
                  isDense: true,
                  labelText: "Data de nascimento",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 131, 132, 133),
                  ),
                  hintText: 'Insira sua data de nascimento',
                  hintStyle: TextStyle(
                    fontSize: 15,
                  ),
                ),
                onTap: _presentDatePicker,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _peso,
                obscureText: false,
                decoration: const InputDecoration(
                  isDense: true,
                  labelText: "Peso",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 131, 132, 133),
                  ),
                  hintText: 'Peso (KG)',
                  hintStyle: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _altura,
                obscureText: false,
                decoration: const InputDecoration(
                  isDense: true,
                  labelText: "Peso",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 131, 132, 133),
                  ),
                  hintText: 'Altura (cm)',
                  hintStyle: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _bf,
                obscureText: false,
                decoration: const InputDecoration(
                  isDense: true,
                  labelText: "% Massa Corpórea",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 131, 132, 133),
                  ),
                  hintText: '% Massa Corpórea',
                  hintStyle: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
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
                      dados["dt_nascimento"] = _dt_nascimento.text;
                      dados["peso"] = _peso.text;
                      dados["altura"] = _altura.text;
                      dados["bf"] = _bf.text;
                      Navigator.pushNamed(context, '/preferences',
                          arguments: dados);

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

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1920),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _dt_nascimento.text =
            DateFormat("dd/MM/yyyy").format(pickedDate).toString();
      });
    });
  }
}
