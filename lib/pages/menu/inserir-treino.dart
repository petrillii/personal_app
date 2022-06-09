import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/mensagem.dart';

class InserirTreino extends StatefulWidget {
  const InserirTreino({Key? key}) : super(key: key);

  @override
  State<InserirTreino> createState() => _InserirTreinoState();
}

class _InserirTreinoState extends State<InserirTreino> {
  var txtExercicio = TextEditingController();
  var txtCategoria = TextEditingController();
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
                  "INSIRA UM\nNOVO TREINO",
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
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            campoTexto('Nome Exercicio', txtExercicio, Icons.sports_gymnastics),
            const SizedBox(height: 20),
            campoTexto('Categoria', txtCategoria, Icons.category_outlined),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Color.fromARGB(255, 0, 0, 0),
                    ),
                    child: const Text('salvar'),
                    onPressed: () {
                      FirebaseFirestore.instance.collection('treinos').add(
                        {
                          "Nome Exercicio": txtExercicio.text,
                          "categoria": txtCategoria.text,
                        },
                      );
                      sucesso(context, 'O item foi adicionado com sucesso.');
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Color.fromARGB(255, 0, 0, 0),
                      ),
                      child: const Text('cancelar'),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  campoTexto(texto, controller, icone, {senha}) {
    return TextField(
      controller: controller,
      obscureText: senha != null ? true : false,
      style: const TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        isDense: true,
        labelText: texto,
        labelStyle: const TextStyle(
          fontSize: 15,
          color: Color.fromARGB(255, 131, 132, 133),
        ),
        hintStyle: const TextStyle(
          fontSize: 15,
        ),
        prefixIcon: Icon(icone, color: Color.fromARGB(255, 0, 0, 0)),
        prefixIconColor: Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}
