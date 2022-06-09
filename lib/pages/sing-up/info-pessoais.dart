import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPessoais extends StatefulWidget {
  const InfoPessoais({Key? key}) : super(key: key);

  @override
  State<InfoPessoais> createState() => _InfoPessoaisState();
}

class _InfoPessoaisState extends State<InfoPessoais> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
          title: Row(
        children: [
          Row(
            children: [
              Text("a"),
            ],
          ),
        ],
      ))),
    );
  }
}
