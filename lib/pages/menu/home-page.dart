import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/mensagem.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _cep = TextEditingController();
  final TextEditingController _rua = TextEditingController();
  final TextEditingController _num = TextEditingController();
  final TextEditingController _bairro = TextEditingController();
  final TextEditingController _cidade = TextEditingController();
  final TextEditingController _celular = TextEditingController();
  var categorias;
  var usuarios;
  var userData;
  var userName = "Olá, ";
  int _selectedIndex = 2;
  @override
  void initState() {
    _getThingsOnStartup().then((value) {
      print('Async done');
    });
    categorias = FirebaseFirestore.instance.collection('categorias');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      Container(
        padding: const EdgeInsets.all(50),
        child: StreamBuilder<QuerySnapshot>(
          //fonte de dados
          stream: categorias.snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(child: Text('Não foi possível conectar.'));
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                final dados = snapshot.requireData;
                return ListView.builder(
                  itemCount: dados.size,
                  itemBuilder: (context, index) {
                    return exibirDocumento(dados.docs[index]);
                  },
                );
            }
          },
        ),
      ),
      const Text(
        'COMUNIDADE',
        //style: optionStyle,
      ),
      Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Aqui estão seus dados cadastraados",
                style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
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
                hintText: 'Insira seu CEP',
                hintStyle: TextStyle(
                  fontSize: 15,
                ),
              ),
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
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  updateInfo();
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
                      "SALVAR ALTERAÇÕES",
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
      ),
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/inserir-treino');
        },
      ),
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
            userData = document.get('dados');
            userName += userData["nome"];
            _cep.text = userData["cep"];
            _rua.text = userData["rua"];
            _num.text = userData["num"];
            _cidade.text = userData["cidade"];
            _celular.text = userData["celular"];
            _bairro.text = userData["bairro"];
          });
        }
      }
    }
  }

  updateInfo() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    final uid = user?.uid;
    QuerySnapshot snap =
        await FirebaseFirestore.instance.collection('usuarios').get();
    for (var document in snap.docs) {
      if (document.get('uid') == uid) {
        FirebaseFirestore.instance
            .collection('usuarios')
            .doc(document.id.toString())
            .set({
          "dados": {
            "cep": _cep.text,
            "rua": _rua.text,
            "num": _num.text,
            "cidade": _cidade.text,
            "celular": _celular.text,
            "bairro": _bairro.text
          },
        }, SetOptions(merge: true)).then((result) =>
                {sucesso(context, "Informações atualizadas com sucesso")});
      }
    }
  }

  exibirDocumento(item) {
    String nome = item.data()['nome'];
    int quantPersonais = item.data()['quant_personais'];

    return SingleChildScrollView(
        child: Column(
      children: [
        ListTile(
          title: Text(nome),
          subtitle: Text(quantPersonais.toString() + " Peronais"),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              categorias.doc(item.id).delete();
              sucesso(context, 'O documento foi apagado com sucesso.');
            },
          ),
          onTap: () {},
        ),
      ],
    ));
  }

  addTrain() async {}

  addCat() async {}

  deleteTrain() async {}

  deleteCat() async {}

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
