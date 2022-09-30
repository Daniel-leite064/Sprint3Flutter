import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ApiModel.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});
  
  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Previsão do tempo em São Paulo"),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: ApiService().getWeather('sao paulo'),
        builder: (context, AsyncSnapshot snapshot) {
          var status = snapshot.connectionState;
          if (status == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          
          if (status == ConnectionState.done) {
            return ListView(
              children: [
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    snapshot.data['cidade'].toString(),
                    style: GoogleFonts.lato(fontSize: 50),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    'Temperatura atual de ${snapshot.data['temperatura']} ºC',
                    style: GoogleFonts.lato(fontSize: 25),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    'Máxima de ${snapshot.data['tempMax']} ºC',
                    style: GoogleFonts.lato(fontSize: 25),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    'Mínima de ${snapshot.data['tempMin']} ºC',
                    style: GoogleFonts.lato(fontSize: 25),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    'Sensação térmica de ${snapshot.data['sensacao']} ºC',
                    style: GoogleFonts.lato(fontSize: 25),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    'Umidade de ${snapshot.data['umidade']}%',
                    style: GoogleFonts.lato(fontSize: 25),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: Text('Erro ao carregar API!'),
          );
        },
      ),
    );
  }
}
