import 'package:flutter/material.dart';

class customCard extends StatelessWidget {
  final String? indicador;
  final String? tipo;
  final String? produto;
  final String? area;
  final Function? deleteItem;
  final int? id;
  final Function? updateItem;

  customCard(
      {this.indicador,
      this.tipo,
      this.produto,
      this.area,
      this.deleteItem,
      this.id,
      this.updateItem});

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
          const Spacer(),
          Column(children: [
            Text(
              indicador!,
              style: TextStyle(fontSize: 20),
            ),
            // const Spacer(),
            Text(
              tipo!,
              style: TextStyle(fontSize: 20),
            )
          ]),
          const Spacer(),
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      updateItem!();
                    },
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      deleteItem!();
                    },
                    icon: Icon(Icons.delete),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
