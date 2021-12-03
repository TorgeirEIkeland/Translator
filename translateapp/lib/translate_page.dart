import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translateapp/data_model.dart';
import 'package:translateapp/input_view.dart';
import 'package:translateapp/recent_translations_view.dart';
import 'package:translateapp/right_dropdown.dart';
import 'package:translator/translator.dart';

import 'drop_button.dart';
import 'output_view.dart';

class TranslatePage extends StatefulWidget {
  @override
  _TranslatePageState createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {

  @override
  Widget _swapLanguage() {
    return GestureDetector(
        child: Icon(Icons.update), // didnt find the correct icon :(
      onTap: () {
          Provider.of<DataModel>(context, listen: false).swapLanguage();
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFd7d7d7), //light grey background
        appBar: AppBar(
          title: Text('Translate'),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LeftDropDown(),
                  SizedBox(width: 50),
                  _swapLanguage(),
                  SizedBox(width: 50),
                  RightDropDown()
                ],
              ),

              SizedBox(height: 16),
              InputView(),
              SizedBox(height: 16),
              OutputView(),
              SizedBox(height: 16),
              TraslationsView(),
            ],
          ),
        ));
  }
}
