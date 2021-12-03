import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';
import 'data_model.dart';

class InputView extends StatelessWidget {


  void _translate(BuildContext context, String newValue, String fromLan, String toLan) async {
    final translator = GoogleTranslator();

    Future.delayed(Duration(milliseconds: 500), () async {
      var translation =
          await translator.translate(newValue, from: fromLan, to: toLan);
      Provider.of<DataModel>(context, listen: false).updateOutput(translation.text);
      print(fromLan);
      print(toLan);
    });
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.done,
          minLines: 5,
          maxLines: 5,
          autocorrect: false,
          decoration: InputDecoration(
              hintText: 'Text to translate',
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.white))),
          style: TextStyle(
            fontSize: 24,
          ),
          onChanged: (text) {
            Provider.of<DataModel>(context, listen: false).updateInput(text);
            _translate(context, text, provider.leftLan, provider.rightLan);
          },
          onSubmitted: (text) {
            Provider.of<DataModel>(context, listen: false)
                .updateList(Converted(translated: provider.outputText, sourceText: provider.inputText,));
          }),
    );
  }
}
