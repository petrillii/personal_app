import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../model/about-us.model.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  List<AboutUsModel> content = [];

  carregarJson() async {
    final String arquivo =
        await rootBundle.loadString('lib/data/about-us.json');
    final dynamic data = await json.decode(arquivo);

    setState(() {
      data.forEach((item) {
        content.add(AboutUsModel.fromJson(item));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await carregarJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0,
                width: 30.0,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromARGB(255, 255, 91, 98),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
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
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: content.length,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: ListTile(
                    title: Text(
                      content[index].titulo,
                      style: const TextStyle(fontSize: 28),
                      textAlign: TextAlign.end,
                    ),
                    subtitle: Text(
                      content[index].descricao,
                      textAlign: TextAlign.end,
                    ),
                  ),
                );
              case 1:
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: ListTile(
                    title: Text(
                      content[index].titulo,
                      style: const TextStyle(fontSize: 28),
                      textAlign: TextAlign.start,
                    ),
                    subtitle: Text(
                      content[index].descricao,
                      textAlign: TextAlign.start,
                    ),
                  ),
                );
              case 2:
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: ListTile(
                    title: Text(
                      content[index].titulo,
                      style: const TextStyle(fontSize: 28),
                      textAlign: TextAlign.end,
                    ),
                    subtitle: Text(
                      content[index].descricao,
                      textAlign: TextAlign.end,
                    ),
                  ),
                );
              case 3:
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: ListTile(
                    title: Text(
                      content[index].titulo,
                      style: const TextStyle(fontSize: 28),
                      textAlign: TextAlign.start,
                    ),
                    subtitle: Text(
                      content[index].descricao,
                      textAlign: TextAlign.start,
                    ),
                    trailing: const SizedBox(
                      height: 100,
                      width: 65,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/images/profile_edu.jpg',
                        ),
                      ),
                    ),
                  ),
                );
              case 4:
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: ListTile(
                    title: Text(
                      content[index].titulo,
                      style: const TextStyle(fontSize: 28),
                      textAlign: TextAlign.end,
                    ),
                    subtitle: Text(
                      content[index].descricao,
                      textAlign: TextAlign.end,
                    ),
                    leading: const SizedBox(
                      height: 100,
                      width: 65,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/images/profile_abner.jpeg',
                        ),
                      ),
                    ),
                  ),
                );
              default:
                return ListTile(
                  title: Text(
                    content[index].titulo,
                    style: const TextStyle(fontSize: 28),
                  ),
                  subtitle: Text(content[index].descricao),
                );
            }
          },
        ),
      ),
    );
  }
}
