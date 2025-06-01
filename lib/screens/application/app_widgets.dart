import 'package:code_academy_app/screens/home/home_page.dart';
import 'package:code_academy_app/screens/profile/profile.dart';
import 'package:code_academy_app/screens/search/search_page.dart';
import 'package:code_academy_app/screens/courses/courses_page.dart';
import 'package:code_academy_app/screens/chat/chat_page.dart';
import 'package:flutter/material.dart';

Widget buildPage(int index) {
  List<Widget> widgets = [
    const HomePage(),
    const SearchPage(),
    const CoursesPage(),
    const ChatPage(),
    ProfileScreen(),
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
