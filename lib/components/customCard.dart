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
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    indicador!,
                    style: TextStyle(fontSize: 20),
                  ),
                  // const Spacer(),
                  Text(
                    tipo!,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    produto!,
                    style: TextStyle(fontSize: 20),
                  ),
                  // const Spacer(),
                  Text(
                    area!,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
