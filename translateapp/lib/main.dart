import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translateapp/translate_page.dart';

import 'data_model.dart';

void main() {
  runApp(TranslateApp());
}

class TranslateApp extends StatelessWidget {
  const TranslateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DataModel(),
        child: MaterialApp(home: TranslatePage())
    );
  }
}

