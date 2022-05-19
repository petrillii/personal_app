import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'CONVERSATION',
      //style: optionStyle,
    ),
    Text(
      'METAS/PROGRESSO',
      //style: optionStyle,
    ),
    Text(
      'HOME',
      //style: optionStyle,
    ),
    Text(
      'COMUNIDADE',
      //style: optionStyle,
    ),
    Text(
      'PERFIL',
      //style: optionStyle,
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
}
