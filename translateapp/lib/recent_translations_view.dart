import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_model.dart';

class TraslationsView extends StatefulWidget {
  const TraslationsView({Key? key}) : super(key: key);

  @override
  _TraslationsViewState createState() => _TraslationsViewState();
}

class _TraslationsViewState extends State<TraslationsView> {
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataModel>(context);
    return Flexible(
      child: ListView.separated(
        itemCount: provider.list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              tileColor: Colors.white,
              title: Text(provider.list[index].translated),
              subtitle: Text(provider.list[index].sourceText),
              trailing: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(selected ? Icons.star_border : Icons.star),
                ),
                onTap: () {
                  setState(() {
                    selected = !selected;
                  });
                },
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(height: 1);
        },
      ),
    );
  }
}