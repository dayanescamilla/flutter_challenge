import 'package:flutter/material.dart';

import '../request/api_call.dart';

class TriviaPage extends StatefulWidget {
  const TriviaPage({Key? key}) : super(key: key);

  @override
  State<TriviaPage> createState() => _TriviaPageState();
}


class _TriviaPageState extends State<TriviaPage> {
  String? dataTrivia;
  final bool _bool = true;

  @override
  void initState() {
    APICall().getRandomTrivia().then((value){
      dataTrivia = value.data;
      return dataTrivia;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (dataTrivia != null)
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 500,
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
    );
  }
}
