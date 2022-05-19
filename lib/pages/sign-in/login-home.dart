import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginHome extends StatelessWidget {
  const LoginHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text(
                  'ENTRAR',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 91, 98), fontSize: 18),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
              SizedBox(
                height: 50.0,
                width: 30.0,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 255, 91, 98),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/logo.svg',
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('PERSONAL APP',
                      style: TextStyle(
                        fontSize: 30,
                      )),
                ],
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
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
                            "INSCREVA-SE",
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
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/login');
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
                            "CONTINUAR COM GOOGLE",
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
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: const Text(
                      'SOBRE',
                      style: TextStyle(
                          color: Color.fromARGB(255, 131, 132, 133),
                          fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/onboarding');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: const Text(
                      'QUEM SOMOS NÓS',
                      style: TextStyle(
                          color: Color.fromARGB(255, 131, 132, 133),
                          fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/aboutus');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
