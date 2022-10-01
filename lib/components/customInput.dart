import 'package:flutter/material.dart';

class customInput extends StatelessWidget {
  final String label;
  final TextEditingController? inputController;
  final FocusNode? focusNode;

  customInput({required this.label, this.inputController, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Color.fromARGB(255, 169, 77, 212),
      focusNode: focusNode,
      controller: inputController,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 169, 77, 212))),
        label: Text(label),
        floatingLabelStyle: TextStyle(color: Color.fromARGB(255, 169, 77, 212)),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 169, 77, 212))),
      ),
    );
  }
}
