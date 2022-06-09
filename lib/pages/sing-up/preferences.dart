import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../model/sign-up.model.dart';
import '../widgets/mensagem.dart';

class Preferences extends StatefulWidget {
  const Preferences({Key? key}) : super(key: key);

  @override
  State<Preferences> createState() => _Preferences();
}

class _Preferences extends State<Preferences> {
  var selectedCategories;
  @override
  Widget build(BuildContext context) {
    var dados =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: (AppBar(
        centerTitle: false,
        automaticallyImplyLeading:
            false, //TIRA O BOTAO AUTOMATICO DE VOLTAR DA APP BAR
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        )),
        title: Column(
          children: <Widget>[
            Row(
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
          ],
        ),
        bottom: (PreferredSize(
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  "Preferências",
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Selecionar modalidades do seu agrado',
                    style: TextStyle(
                      fontSize: 19,
                    )),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    generateCategories(colorR: Colors.white, name: 'Musculação')
                  ],
                ),
                Row(
                  children: [
                    generateCategories(colorR: Colors.red, name: 'HIIT')
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    generateCategories(colorR: Colors.purple, name: 'Yoga')
                  ],
                ),
                Row(
                  children: [
                    generateCategories(
                        colorR: Colors.blue.shade200, name: 'Meditação')
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    generateCategories(colorR: Colors.orange, name: 'Funcional')
                  ],
                ),
                Row(
                  children: [
                    generateCategories(
                        colorR: Colors.green.shade100, name: 'Fit Dance')
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    generateCategories(colorR: Colors.green, name: 'LPO')
                  ],
                ),
                Row(
                  children: [
                    generateCategories(
                        colorR: Colors.yellow, name: 'Calistenia')
                  ],
                )
              ],
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
                      criarConta(dados);
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
                          "CONTINUAR",
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
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: const Text(
                    'Pular',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    criarConta(dados);
                  },
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  generateCategories({required Color colorR, required String name}) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          selectedCategories["pref_cat"] = name;
          //CATEGORIA SELECIONADA
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(colorR),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ))
            /* shape: (
            : BorderRadius.circular(10),
          ), */
            ),
        child: Ink(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              name,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  void criarConta(data) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: data["email"], password: data["senha"])
        .then((res) {
      data.remove("senha");
      FirebaseFirestore.instance.collection('usuarios').add({
        'dados': data,
        'uid': res.user!.uid.toString(),
        'preferencias': selectedCategories
      });
      Navigator.pushNamed(context, '/home-page');
    }).catchError((e) {
      switch (e.code) {
        case 'invalid-email':
          erro(context, 'O formato do email é inválido.');
          break;
        case 'email-already-in-use':
          erro(context, 'O email já foi cadastrado.');
          break;
        default:
          erro(context, e.code.toString());
      }
    });
  }
}
