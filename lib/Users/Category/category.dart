import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:Online_grocery_app/Users/Category/basictile.dart';
import 'package:Online_grocery_app/Users/Category/categorylist.dart';
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
        top: displayHeight(context)*0.02,
          child: Container(
            height: displayHeight(context)*0.78,
            width: displayWidth(context),
            //color: Colors.blue,
                      child: ListView(
            children:
                Categorylist.map((tile) => BasicTileWidget(tile: tile)).toList(),
        ),
          ),
      ),
    ]));
  }
}

class BasicTileWidget extends StatelessWidget {
  final Mytile tile;


  const BasicTileWidget({
    Key key,
    @required this.tile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = tile.title;
    final image=tile.image;
    final tiles = tile.children;
      Color color=Colors.grey;
    String name;
    if (tiles.isEmpty) {
      return ListTile(
          title: Text(title),
          onTap: () => Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(title))));
    }
    return Padding(
      padding: const EdgeInsets.only(left:5.0 ,right: 5.0),
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: 
       Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 8.0),
          child: Container(
            
          /*  decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: Theme.of(context).hintColor),
            ),*/
           
           // width: displayWidth(context) * 0.6,
            child: ExpansionTile(
              leading:Container(
                //height: displayHeight(context)*0.06,
                width: displayWidth(context)*0.2,
                child: Image(image: AssetImage(image),fit: BoxFit.fill,)),
              title: Text(title),
              children: tiles.map((tile) => BasicTileWidget(tile: tile)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
