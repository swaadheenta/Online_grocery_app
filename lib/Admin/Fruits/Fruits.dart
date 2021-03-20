import 'package:Online_grocery_app/Admin/Fruits/Freshvegetables.dart';
import 'package:flutter/material.dart';
import 'package:Online_grocery_app/Helpers/Devicesize.dart';

class  fnv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Subcategory"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30),
        child: ListView(
          children: <Widget>[
            ListTile(
            //  leading: Icon(Icons.add_circle_outline),
              title: Text("Fresh Vegetables"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => fv()));
              },
            ),
            Divider(),
            ListTile(
              //leading: Icon(Icons.library_books_rounded),
              title: Text("Herbs & Seasonings"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
             // leading: Icon(Icons.add_circle),
              title: Text("Fresh Fruits"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
             // leading: Icon(Icons.category),
              title: Text("Exotic Fruits & veggies"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              //leading: Icon(Icons.category),
              title: Text("Organic Fruits & Vegetables"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
             // leading: Icon(Icons.category),
              title: Text("Cuts & Sprouts"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
             // leading: Icon(Icons.category),
              title: Text("Flowers Bouquets & Bunches"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
