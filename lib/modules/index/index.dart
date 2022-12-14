import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sprint3_app/modules/listaItems/items_page.dart';

import '../ApiPage/ApiPage.dart';
import 'indexController.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = TextEditingController();

  final password = TextEditingController();

  final city = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Center(
            child: Text(
              "Sprint 3 Mobile!",
              style: GoogleFonts.lato(fontSize: 50),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.all(40),
                width: 300,
                height: 600,
                child: Form(
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        style: GoogleFonts.lato(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                      _textForm(user, "Nome", false),
                      const SizedBox(height: 30),
                      _textForm(password, "Senha", true),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 200,
                        child: Consumer<IndexController>(
                          builder: (context, value, __) {
                            return ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                              onPressed: () {
                                String nome = user.text;
                                String senha = password.text;
                                if (nome == value.nome &&
                                    senha == value.senha) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ItemsPage()));
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Senha inv??lida"),
                                        actions: [
                                          TextButton(
                                            child: const Text('Ok'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              setState(() {
                                                user.text = "";
                                                password.text = "";
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              child: Text(
                                "Entrar",
                                style: GoogleFonts.lato(
                                    fontSize: 20, color: Colors.white),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ApiPage()))
                          },
                          child: const Text('Previs??o do tempo em SP'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

_textForm(controller, txt, bool boole) {
  return TextField(
    obscureText: boole,
    controller: controller,
    decoration: InputDecoration(
      hintText: txt,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Colors.blue,
          width: 2.0,
        ),
      ),
    ),
  );
}
