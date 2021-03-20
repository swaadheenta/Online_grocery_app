import 'package:Online_grocery_app/Admin/Fruits/Freshvegetables.dart';
import 'package:flutter/material.dart';
import 'package:Online_grocery_app/Helpers/Devicesize.dart';

class  babycare extends StatelessWidget {
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
              title: Text("All baby care"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => fv()));
              },
            ),
            Divider(),
            ListTile(
              //leading: Icon(Icons.library_books_rounded),
              title: Text("Diapers & Wipes"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
             // leading: Icon(Icons.add_circle),
              title: Text("Baby Food & Formula"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
             // leading: Icon(Icons.category),
              title: Text("Baby bath & hygiene"),
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
              title: Text("Mothers & Maternity"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
             // leading: Icon(Icons.category),
              title: Text("Feeding & Nursing"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
