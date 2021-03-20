
import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Finalscreen extends StatefulWidget {
  Finalscreen({Key key}) : super(key: key);

  @override
  _FinalscreenState createState() => _FinalscreenState();
}

class _FinalscreenState extends State<Finalscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: displayHeight(context) * 0.1,
            left: displayWidth(context) * 0.1,
            child: Container(
                height: displayHeight(context),
                
                width: displayWidth(context) * 0.8,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Two")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return new ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.docs.length,
                          padding: const EdgeInsets.only(top: 15.0),
                          itemBuilder: (context, index) {
                            DocumentSnapshot ds = snapshot.data.docs[index];
                            return Card(
                              elevation: 10.0,
                              child: Container(
                                height: displayHeight(context)*0.15,
                                child: ListTile(
                                  title: Text(ds['field1']),
                                  subtitle: Text(ds['field2']),
                                  leading: Container(
                                    height: displayHeight(context)*0.1,
                                    width: displayWidth(context)*0.2,
                                    child: Image.network(ds['field5'])),
                                  
                                ),
                              ),
                            );
                          });
                    }
                  },
                )),
          ),
        ],
      ),
    );
  }
}
