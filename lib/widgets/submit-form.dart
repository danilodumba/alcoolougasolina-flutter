import 'package:alcoolougaz/widgets/input.widget.dart';
import 'package:alcoolougaz/widgets/loading-button.widget.dart';
import 'package:flutter/material.dart';

class SubmitForm extends StatelessWidget {

  var gasolinaController;
  var alcoolController;
  var busy = false;
  Function func;

  SubmitForm({
    @required this.alcoolController,
    @required this.gasolinaController,
    @required this.busy,
    @required this.func
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Input(label: "Gasolina", controller: gasolinaController),
        Input(label: "Alcool", controller: alcoolController),
        LoadingButton(text: "CALCULAR", busy: busy, invert: false, func: func,)
      ],
    );
  }
}