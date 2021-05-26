import 'package:Online_grocery_app/Category/BabyCare/Bath.dart';
import 'package:Online_grocery_app/Category/BabyCare/Food.dart';
import 'package:Online_grocery_app/Category/Bakery/Cakes.dart';
import 'package:Online_grocery_app/Category/Bakery/Bread.dart';
import 'package:Online_grocery_app/Category/Bakery/Dairy.dart';
import 'package:Online_grocery_app/Category/Bakery/Icecream.dart';
import 'package:Online_grocery_app/Category/Beauty/Haircare.dart';
import 'package:Online_grocery_app/Category/Beauty/Makeup.dart';
import 'package:Online_grocery_app/Category/Beauty/Oralcare.dart';
import 'package:Online_grocery_app/Category/Beauty/Skincare.dart';
import 'package:Online_grocery_app/Category/Cleaning/Cars.dart';
import 'package:Online_grocery_app/Category/Cleaning/Detergents.dart';
import 'package:Online_grocery_app/Category/Cleaning/Freshners.dart';
import 'package:Online_grocery_app/Category/Cleaning/Mops.dart';
import 'package:Online_grocery_app/Category/Foodgrains/Atta.dart';
import 'package:Online_grocery_app/Category/Foodgrains/Dals.dart';

import 'package:Online_grocery_app/Category/Foodgrains/Oils.dart';
import 'package:Online_grocery_app/Category/Foodgrains/Rice.dart';
import 'package:Online_grocery_app/Category/Foodgrains/Salt.dart';
import 'package:Online_grocery_app/Category/Fruits/fruits.dart';

import 'package:Online_grocery_app/Category/Fruits/vegetables.dart';

import 'package:Online_grocery_app/Category/Health/coffee.dart';
import 'package:Online_grocery_app/Category/Health/energy.dart';

import 'package:Online_grocery_app/Category/Health/health.dart';
import 'package:Online_grocery_app/Category/Health/tea.dart';
import 'package:Online_grocery_app/Category/Health/water.dart';
import 'package:Online_grocery_app/Category/Kitchen/Crockery.dart';
import 'package:Online_grocery_app/Category/Kitchen/accessories.dart';
import 'package:Online_grocery_app/Category/Snacks/Biscuits.dart';
import 'package:Online_grocery_app/Category/Snacks/Noodles.dart';
import 'package:Online_grocery_app/Category/Snacks/Pickles.dart';
import 'package:Online_grocery_app/Category/Snacks/sauces.dart';
import 'package:Online_grocery_app/Category/Snacks/snacks.dart';
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
      backgroundColor: Color(0xffb273443),
        appBar: AppBar(
          backgroundColor: Color(0xffb273443),
          title: Text("Categories",style: TextStyle(fontSize: displayWidth(context)*0.045),),
          /*leading: IconButton(
            onPressed:()
            {
              Navigator.pop(context);
            } ,
            icon: Icon(Icons.arrow_back_ios),iconSize: displayWidth(context)*0.045,),*/
            centerTitle: true,
        ),
        body: Stack(children: [
          Positioned(
            top: displayHeight(context) * 0.02,
            child: Container(
              height: displayHeight(context) * 0.75,
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
            
           
             if (title == "Coffee")
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
           
              else if (title == "Atta,Flours & Sooji")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Atta()));
               else if (title == "Dals & Pulses")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Dal()));
              else if (title == "Rice & Rice Products")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Rice()));
             
              else if (title == "Salt, Sugar & Jaggery")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Salt()));
                  else if (title == "Edible Oils & Ghee")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Oils()));
                
                  else if (title == "Detergents & Dishwash")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Detergents()));
                   else if (title == "Freshners & Repellents")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>Freshners() ));
                   else if (title == "Mops,Brushes & Scrubs")
           
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>Mops() ));
                else if (title == "Car & Shoe Care")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Car()));
                  else if (title == "Dairy")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Dairy()));
                  else if (title == "Breads")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Bread()));
                  else if (title == "Icecreams")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Icecream()));
                  else if (title == "Cakes & Pastries")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Cakes()));
                    else if (title == "Chocolates & Biscuits")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => biscuits()));
                    else if (title == "Noodles, Pasta & Vermicilli")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => noodles()));
                    else if (title == "Snacks & Namkeen")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => snacks()));
                    else if (title == "Spreads, Sauces & Ketchup")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => sauces()));
                    else if (title == "Pickles & Chutney")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => pickles()));
                    else if (title == "Fresh Vegetables")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => vegetables()));
                   else if (title == "Fresh Fruits")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => fruits()));
                   else if (title == "Hair Care")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => hair()));
                   else if (title == "Oral Care")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => oral()));
                  else if (title == "Skin Care")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => skin()));
                  else if (title == "Makeup")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => makeup()));
                    else if (title == "Bath & Hygiene")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => bath()));
                    else if (title == "Baby Food")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => food()));
                   else if (title == "Crockery & Cutlery")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => crockery()));
                   else if (title == "Kitchen Accessories")
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => accessories()));
                  
                  


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
