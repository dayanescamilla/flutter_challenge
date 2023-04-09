import 'package:flutter/material.dart';

import '../request/api_call.dart';

class MathPage extends StatefulWidget {
  const MathPage({Key? key}) : super(key: key);

  @override
  State<MathPage> createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
  String? dataMath;
  final bool _bool = true;
  @override
  void initState() {
    APICall().getRandomMath().then((value){
      dataMath = value.data;
      return dataMath;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return           Container(
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
    );
  }
}
