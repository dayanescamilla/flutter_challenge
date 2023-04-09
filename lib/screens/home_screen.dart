import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? information;
  final bool _bool = true;

  @override
  void initState() {
    super.initState();
    getRequest();
  }

  Future getRequest() async {
    Response response;
    response = await Dio().get('http://numbersapi.com/random');

    var data = await json.decode(json.encode(response.data));

    information = data;
    return information;

    // var url = Uri.parse('http://numbersapi.com/random');
    // var response = await http.get(url);
    //
    // var data = await json.decode(json.encode(response.body));
    // information = data;
    // return information;
  }

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
            if (information != null)
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Card(
                elevation: 10,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 5),
                  child: AnimatedCrossFade(
                    crossFadeState: _bool
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 350),
                    firstChild: Text(
                      information!,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
                    ),
                    secondChild: Text(
                      information!,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {});
          information = await getRequest();
        },
        child: const Icon(Icons.change_circle, size: 30),),
    );
  }
}
