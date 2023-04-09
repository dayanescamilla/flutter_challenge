import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/request/api_call.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  // Future getRequest() async {
  //   Response response;
  //   response = await Dio().get('http://numbersapi.com/random');
  //
  //   var data = await json.decode(json.encode(response.data));
  //
  //   information = data;
  //   return information;
  //
  //   // var url = Uri.parse('http://numbersapi.com/random');
  //   // var response = await http.get(url);
  //   //
  //   // var data = await json.decode(json.encode(response.body));
  //   // information = data;
  //   // return information;
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('NumbersAPI')),
        ),
        body: const _Navigation(),
        bottomNavigationBar: const _BottomNavigationBar(),
      ),
    );
  }
}


class _Navigation extends StatefulWidget {
  const _Navigation({Key? key}) : super(key: key);

  @override
  State<_Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<_Navigation> {

  String? dataTrivia, dataDate, dataMath;
  final bool _bool = true;

  @override
  void initState() {
    super.initState();
    APICall().getRandomTrivia().then((value){
      dataTrivia = value.data;
      return dataTrivia;
    });
    APICall().getRandomDate().then((value){
      dataDate = value.data;
      return dataDate;
    });
    APICall().getRandomMath().then((value){
      dataMath = value.data;
      return dataMath;
    });
  }

  @override
  Widget build(BuildContext context) {
    final navModel = Provider.of<_NavigationModel>(context);
    return PageView(
        controller: navModel.pageController,
        children: [
          Container(
            color: Colors.red,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (dataTrivia != null)
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
                              dataTrivia!,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
                            ),
                            secondChild: Text(
                              dataTrivia!,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
                            ),
                          ),
                        ),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: FloatingActionButton(onPressed: () async {
                          setState(() {});
                          dataTrivia = await APICall().getRandomTrivia();
                        },),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.green,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (dataDate != null)
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
                              dataDate!,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
                            ),
                            secondChild: Text(
                              dataDate!,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
                            ),
                          ),
                        ),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: FloatingActionButton(onPressed: () async {
                          setState(() {});
                          dataDate = await APICall().getRandomDate();
                        },),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (dataMath != null)
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
                              dataMath!,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
                            ),
                            secondChild: Text(
                              dataMath!,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
                            ),
                          ),
                        ),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: FloatingActionButton(onPressed: () async {
                          setState(() {});
                          dataMath = await APICall().getRandomMath();
                        },),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ]
    );
  }
}


class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavigationModel>(context);
    return BottomNavigationBar(
        currentIndex: navegacionModel.actualPage,
        onTap: (value) => navegacionModel.actualPage = value,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.description_outlined), label: 'Trivia'),
          BottomNavigationBarItem(icon: Icon(Icons.date_range_outlined),label: 'Fecha'),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_symbols), label: 'Algebra')
        ]);
  }
}



class _NavigationModel with ChangeNotifier{
  int _actualPage = 0;
  PageController _pageController = new PageController();

  int get actualPage => _actualPage;

  set actualPage(int value){
    _actualPage = value;
    _pageController.animateToPage(value, duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
