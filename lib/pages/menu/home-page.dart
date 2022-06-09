import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:via_cep_flutter/via_cep_flutter.dart';

final TextEditingController _cep = TextEditingController();
final TextEditingController _rua = TextEditingController();
final TextEditingController _num = TextEditingController();
final TextEditingController _bairro = TextEditingController();
final TextEditingController _cidade = TextEditingController();
final TextEditingController _celular = TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userData;
  var userName = "Olá, ";
  int _selectedIndex = 2;
  @override
  void initState() {
    _getThingsOnStartup().then((value) {
      print('Async done');
    });
    super.initState();
  }

  final List<Widget> _widgetOptions = <Widget>[
    Column(
      children: const [
        Text(
          'CONVERSATION',
          //style: optionStyle,
        ),
      ],
    ),
    const Text(
      'METAS/PROGRESSO',
      //style: optionStyle,
    ),
    const Text(
      'HOME',
      //style: optionStyle,
    ),
    const Text(
      'COMUNIDADE',
      //style: optionStyle,
    ),
    SingleChildScrollView(
      child: Form(
        //key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Seus Dados:"),
              TextFormField(
                controller: _cep,
                obscureText: false,
                decoration: const InputDecoration(
                  isDense: true,
                  labelText: "CEP",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 131, 132, 133),
                  ),
                  hintText: 'Insira seu ' + "CEP",
                  hintStyle: TextStyle(
                    fontSize: 15,
                  ),
                ),
                onChanged: (value) {
                  if (_cep.text.length == 8) {
                    _getCep();
                  }
                },
              ),
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
                children: [],
              ),
            ],
          ),
        ),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
                      Row(
                        children: [
                          Text(
                            userName,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                            ),
                          ),
                        ],
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
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Text(
                  "O que vai ser\nHoje?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          preferredSize: const Size.fromHeight(55),
        )),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      )),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: const Color.fromARGB(255, 255, 91, 98),
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.chat_rounded),
          Icon(Icons.event_rounded),
          Icon(Icons.home),
          Icon(Icons.people_alt),
          Icon(Icons.account_circle),
        ],
        index: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Future _getThingsOnStartup() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    final uid = user?.uid;
    QuerySnapshot snap =
        await FirebaseFirestore.instance.collection('usuarios').get();
    if (user == null) {
      Navigator.pushNamed(context, '/login');
    } else {
      for (var document in snap.docs) {
        if (document.get('uid') == uid) {
          setState(() {
            userData = document.get('userData');
            userName += userData["nome"];
          });
        }
      }
    }
  }
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

void _getCep() async {
  print(_cep.text);
  final result = await readAddressByCep(_cep.text);
  if (result.isEmpty) return;
  _rua.text = result['street'];
  _bairro.text = result['neighborhood'];
  _cidade.text = result['city'];
}
