import 'package:flutter/material.dart';

Widget buildPage(int index) {
  List<Widget> widgets = [
    Center(child: Text("Home")),
    Center(child: Text("Search")),
    Center(child: Text("Courses")),
    Center(child: Text("Chat")),
    Center(child: Text("Profile")),
  ];
  return widgets[index];
}
