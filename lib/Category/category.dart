import 'package:Online_grocery_app/Category/Health/Allbeverages.dart';
import 'package:Online_grocery_app/Category/Health/coffee.dart';
import 'package:Online_grocery_app/Category/Health/energy.dart';
import 'package:Online_grocery_app/Category/Health/fruitjuices.dart';
import 'package:Online_grocery_app/Category/Health/health.dart';
import 'package:Online_grocery_app/Category/Health/tea.dart';
import 'package:Online_grocery_app/Category/Health/water.dart';
import 'package:Online_grocery_app/Category/basictile.dart';
import 'package:Online_grocery_app/Category/categorylist.dart';
import 'package:Online_grocery_app/Helpers/Devicesize.dart';

import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  Category({Key key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  UniqueKey keytile;
  bool isexpanded = false;

  void expandtile() {
    setState(() {
      keytile = UniqueKey();
      isexpanded = true;
    });
  }

  void shrinktile() {
    setState(() {
      keytile = UniqueKey();
      isexpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shop By Category"),
        ),
        body: Stack(children: [
          Positioned(
            top: displayHeight(context) * 0.02,
            child: Container(
              height: displayHeight(context) * 0.78,
              width: displayWidth(context),
              child: ListView(
                children:
                    Categorylist.map((tile) => BasicTileWidget(tile: tile))
                        .toList(),
              ),
            ),
          ),
        ]));
  }
}

class BasicTileWidget extends StatefulWidget {
  final Mytile tile;

  const BasicTileWidget({
    Key key,
    @required this.tile,
  }) : super(key: key);

  @override
  _BasicTileWidgetState createState() => _BasicTileWidgetState();
}

class _BasicTileWidgetState extends State<BasicTileWidget> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    final title = widget.tile.title;
    final image = widget.tile.image;
    final tiles = widget.tile.children;
    Color color = Colors.grey;

    String name;
    if (tiles.isEmpty) {
      return ListTile(
          title: Text(title),
          onTap: () {
            
            if (title == "All Beverages")
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => All()));
            else if (title == "Coffee")
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cof()));
            else if (title == "Energy & Soft drinks")
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Energy()));
            else if (title == "Water")
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Water()));
            else if (title == "Tea")
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Tea()));
            else if (title == "Health Drink & Supplement")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>HealthDrinks()));
            else if (title == "Fruit Drinks & Juices")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => fruitdrinks()));
          });
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        child: Card(
          elevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 8.0),
            child: Container(
              child: ExpansionTile(
                leading: Container(
                    width: displayWidth(context) * 0.2,
                    child: Image(
                      image: AssetImage(image),
                      fit: BoxFit.fill,
                    )),
                title: Text(title),
                children:
                    tiles.map((tile) => BasicTileWidget(tile: tile)).toList(),
              ),
            ),
          ),
        ),
      );
    }
  }
}
