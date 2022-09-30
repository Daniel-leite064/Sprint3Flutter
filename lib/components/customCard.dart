import 'package:flutter/material.dart';

class customCard extends StatelessWidget {
  final String? indicador;
  final String? tipo;
  final String? produto;
  final String? area;

  customCard({this.indicador, this.tipo, this.produto, this.area});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border:
              Border.all(color: Color.fromARGB(255, 169, 77, 212), width: 2)),
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              indicador!,
              style: TextStyle(color: Color.fromARGB(255, 169, 77, 212)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              tipo!,
              style: TextStyle(color: Color.fromARGB(255, 169, 77, 212)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              produto!,
              style: TextStyle(color: Color.fromARGB(255, 169, 77, 212)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              area!,
              style: TextStyle(color: Color.fromARGB(255, 169, 77, 212)),
            ),
          ),
        ],
      ),
    );
  }
}
