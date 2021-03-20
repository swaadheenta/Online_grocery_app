import 'package:Online_grocery_app/Admin/Fruits/Freshvegetables.dart';
import 'package:flutter/material.dart';
import 'package:Online_grocery_app/Helpers/Devicesize.dart';

class  health extends StatelessWidget {
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
              title: Text("All Beverages"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => fv()));
              },
            ),
            Divider(),
            ListTile(
              //leading: Icon(Icons.library_books_rounded),
              title: Text("Coffee"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
             // leading: Icon(Icons.add_circle),
              title: Text("Energy & Soft drinks"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
             // leading: Icon(Icons.category),
              title: Text("Water"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              //leading: Icon(Icons.category),
              title: Text("Tea"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
             // leading: Icon(Icons.category),
              title: Text("Health Drink & Supplement"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
             // leading: Icon(Icons.category),
              title: Text("Fruit Drinks & Juices"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
