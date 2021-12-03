import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_model.dart';

class LeftDropDown extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataModel>(context);
    final write = Provider.of<DataModel>(context, listen: false);

    return DropdownButton<String>(
      value: provider.dropDownA,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        write.updateA(newValue);
        },
      items: provider.languages
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
