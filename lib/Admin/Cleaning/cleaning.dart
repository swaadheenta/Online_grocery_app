import 'package:Online_grocery_app/Admin/Fruits/Freshvegetables.dart';
import 'package:flutter/material.dart';
import 'package:Online_grocery_app/Helpers/Devicesize.dart';

class  cleaning extends StatelessWidget {
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
              title: Text("Detergents & Dishwash"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => fv()));
              },
            ),
            Divider(),
            ListTile(
              //leading: Icon(Icons.library_books_rounded),
              title: Text("Disposables,Garbage bag"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
             // leading: Icon(Icons.add_circle),
              title: Text("Freshners & Repellents"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
             // leading: Icon(Icons.category),
              title: Text("Mops.Brushes & Scrubs"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              //leading: Icon(Icons.category),
              title: Text("Pooja needs"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
             // leading: Icon(Icons.category),
              title: Text("Car & Shoe Care"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
           
          ],
        ),
      ),
    );
  }
}
