import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class TextDemoScreen extends StatelessWidget {
  const TextDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  border: Border.all(color: Colors.blueAccent, width: 3 )
    ),
                width: 200,
                  height: 200,
      margin: const EdgeInsets.only(top: 50),
      alignment: Alignment.center,
      child: const Text('просто длинный длинный текст',
        overflow: TextOverflow.clip,
        softWrap: true,
        style: TextStyle(color: Colors.white,fontSize: 16),
      ),
    ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    border: Border.all(color: Colors.blueAccent, width: 3 )
                ),
                width: 200,
                height: 200,
                margin: const EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                child: const Text.rich(
                    TextSpan (text: 'Фрагмент',
                        style: TextStyle(color: Colors.white,fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(text: " стилизованного", style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: " текста", style: TextStyle(fontStyle: FontStyle.italic)),
                    ]),
                ),
              ),
            ],
          ),
        ),
        ),
    );
  }
}
