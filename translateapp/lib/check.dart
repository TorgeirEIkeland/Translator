/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class TextWithProviderData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<DataModel>(context).data);
  }
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: TextWithProviderData(),),
          body: Level1(),
        )
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            onChanged: (newValue) {
              Provider.of<DataModel>(context, listen: false).updateText(newValue);
            },
          ),
          Level3(),
        ],
      ),
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextWithProviderData(),
    );
  }
}

class DataModel extends ChangeNotifier {
  String data = "Important!";

  void updateText(String newValue) {
    data = newValue;
    notifyListeners();
  }
}
*/