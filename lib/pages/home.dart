
import 'package:alcoolougaz/widgets/logo.widget.dart';
import 'package:alcoolougaz/widgets/submit-form.dart';
import 'package:alcoolougaz/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var gasolinaController = new MoneyMaskedTextController();
  var alcoolController = new MoneyMaskedTextController();
  var busy = false;
  var calculado = false;
  var textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  ),
  drawer: Drawer(
    child: ListView(
      //padding: EdgeInsets.zero,
      children: const <Widget>[
        //SizedBox(height: 30,),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Messages'),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
      ],
    ),
  ),
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[ 
          Logo(),
          calculado 
          ? Success(func: calcularNovamente, text: textResult)
          : SubmitForm(
            busy: busy, 
            alcoolController: alcoolController, 
            gasolinaController: gasolinaController,
            func: calcular,
          ),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        //currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        //onTap: _onItemTapped,
      ),
    );
  }

  calcular() {
    setState(() {
      busy = true;
      calculado = true;

      double valorGasolina = double.parse(gasolinaController.text.replaceAll(".", "").replaceAll(",", "."));
      double valorAlcool = double.parse(alcoolController.text.replaceAll(".", "").replaceAll(",", "."));

      if (valorGasolina == 0) {
        textResult = "Vai de gasolina!";
        return;
      }

      double result = (valorAlcool * 100 / valorGasolina);


      if (result > 70) {
        textResult = "Vai de gasolina!";
      }
      else {
        textResult = "Vai de alcool!";
      }
    });
  }

  calcularNovamente()
  {
    setState(() {
      alcoolController = new MoneyMaskedTextController();
      gasolinaController = new MoneyMaskedTextController();
      busy = false;
      calculado = false;
    });
  }
}