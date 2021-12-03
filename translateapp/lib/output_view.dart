import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_model.dart';

class OutputView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          color: Colors.blue,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Language',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                SizedBox(height: 8),
                Text(
                  Provider.of<DataModel>(context).outputText,
                  maxLines: 5,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(Provider.of<DataModel>(context).inputText, style: TextStyle(color: Colors.white))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
