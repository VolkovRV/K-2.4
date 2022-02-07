import 'package:flutter/material.dart';
import 'package:untitled1/utils/global_theme.dart';

class AppBarScreen extends StatefulWidget {
  const AppBarScreen({Key? key}) : super(key: key);

  @override
  _AppBarScreenState createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return MaterialApp(
      theme: globalTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Демо AppBar"),
          actions: <Widget>[
            IconButton(
                tooltip: "Баланс",
                onPressed: () {},
                icon: const Icon(Icons.account_balance)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            TextButton(
                onPressed: () {},
                child: const Text ("Профиль"),
              style: buttonStyle,
            ),
          ],
        ),
        body: Center(child: Text("Контент")),
      ),
    );
  }
}
