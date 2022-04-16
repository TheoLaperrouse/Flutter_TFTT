import 'package:flutter/material.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/models/ordering.dart';
import 'package:flutter_tftt/utils/utils.dart';
//widgets
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:flutter_tftt/widgets/drawer.dart';

class OrderingForm extends StatefulWidget {
  @override
  _OrderingState createState() => _OrderingState();
}

class _OrderingState extends State<OrderingForm> {
  final _ordering = TextEditingController();
  final _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Commande de Matériel",
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage: "Commande Matériel"),
        body: Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () =>
                      Utils.launchLink('https://www.wsport.com/catalogue/'),
                  child: Text(
                    'Voir le Catalogue Wack Sport',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _name,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      labelText: 'Nom & Prénom',
                      hintText: 'Nom & Prénom pour remise à la réception',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _ordering,
                  maxLines: 7,
                  decoration: const InputDecoration(
                      labelText: 'Votre commande',
                      hintText:
                          '\nVeuillez ajouter votre commande\n(Si plaques : Renseigner Epaisseur plaque/couleur)\nExemple : Plaque rouge Rasanter 47 2.1mm',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    debugPrint(_ordering.text.toString());
                    await postOrdering(new Ordering(
                        name: _name.text, ordering: _ordering.text));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Votre commande a bien été passé, retour à l'accueil")));
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: Text("Passer la commande (Mail à l'entraîneur)"),
                )
              ],
            )));
  }
}
