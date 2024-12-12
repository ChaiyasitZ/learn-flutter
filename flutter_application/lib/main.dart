import 'package:flutter/material.dart';

void main() {
  var app = MaterialApp(
    title: 'My App',
    home: Scaffold(
      appBar: AppBar(
        title: Text('Hello World'),
      ),
      body: Text("แสดงข้อความ Body"),
      ),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  runApp(app);