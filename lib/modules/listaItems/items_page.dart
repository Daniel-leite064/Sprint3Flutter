import 'package:flutter/material.dart';
import 'package:sprint3_app/components/customCard.dart';
import 'package:sprint3_app/components/customInput.dart';
import 'package:sprint3_app/db/items_database.dart';
import 'package:sprint3_app/model/item.dart';

class ItemsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ItemsPageState();
  }
}

class ItemsPageState extends State<ItemsPage> {
  TextEditingController indicadorEditingController = TextEditingController();
  TextEditingController tipoEditingController = TextEditingController();
  TextEditingController produtoEditingController = TextEditingController();
  TextEditingController areaEditingController = TextEditingController();

  late List<Item> items;

  @override
  void initState() {
    super.initState();
    items = [];
    refreshItems();
  }

  Future addNewItem() async {
    await ItemsDatabase.instance.create(
      Item(
        indicador: indicadorEditingController.text,
        tipo: tipoEditingController.text,
        produto: produtoEditingController.text,
        area: areaEditingController.text,
      ),
    );

    refreshItems();
    //limpa campos
    indicadorEditingController.text = '';
    tipoEditingController.text = '';
    produtoEditingController.text = '';
    areaEditingController.text = '';
  }

  Future refreshItems() async {
    this.items = await ItemsDatabase.instance.readAllItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
            child: Column(children: [
          customInput(
            label: "indicador",
            inputController: indicadorEditingController,
          ),
          const SizedBox(height: 25),
          customInput(
            label: "tipo",
            inputController: tipoEditingController,
          ),
          const SizedBox(height: 25),
          customInput(
            label: "produto",
            inputController: produtoEditingController,
          ),
          const SizedBox(height: 25),
          customInput(
            label: "area",
            inputController: areaEditingController,
          ),
          const SizedBox(height: 40),
          ListView.separated(
            shrinkWrap: true,
            itemCount: items.length,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 25,
            ),
            itemBuilder: (context, index) {
              var indicador = items[index];
              return customCard(
                indicador: indicador.indicador,
                tipo: indicador.tipo,
                produto: indicador.produto,
                area: indicador.area,
              );
            },
          )
        ])),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 169, 77, 212),
        tooltip: 'Adicionar',
        onPressed: addNewItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}