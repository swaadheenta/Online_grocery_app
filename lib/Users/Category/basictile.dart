import 'package:flutter/material.dart';

class Mytile {
  String image=null;
  String title;
  List<Mytile> children;
  Mytile(this.image, this.title, [this.children = const <Mytile>[]]);

  get tiles => null;
}
