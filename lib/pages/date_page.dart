import 'package:flutter/material.dart';

import '../request/api_call.dart';

class DatePage extends StatefulWidget {
  const DatePage({Key? key}) : super(key: key);

  @override
  State<DatePage> createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  String? dataDate;
  final bool _bool = true;

  @override
  void initState() {
    APICall().getRandomDate().then((value){
      dataDate = value.data;
      return dataDate;
    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return           Container(
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
    );
  }
}
