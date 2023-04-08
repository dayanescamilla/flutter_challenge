import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('NumbersAPI')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 400,
              child: const Card(
                elevation: 10,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Center(child: Text('Aqui va un texto', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),)),
              ),
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Hola:)');
        },
        child: const Icon(Icons.change_circle, size: 30),),
    );
  }
}
