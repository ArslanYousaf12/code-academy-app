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

var bottomTabs = [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
  BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
  BottomNavigationBarItem(icon: Icon(Icons.book), label: "Courses"),
  BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
  BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
];
