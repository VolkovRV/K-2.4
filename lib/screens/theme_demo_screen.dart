import 'package:flutter/material.dart';
import 'package:untitled1/utils/global_theme.dart';
import 'package:untitled1/utils/strings.dart';

class ThemesDemoApp extends StatelessWidget {
  const ThemesDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
      home: ThemesDemoScreen(),
    );
  }
}

class ThemesDemoScreen extends StatefulWidget {
  const ThemesDemoScreen({Key? key}) : super(key: key);

  @override
  _ThemesDemoScreenState createState() => _ThemesDemoScreenState();
}

class _ThemesDemoScreenState extends State<ThemesDemoScreen> {
  double _currentSliderValue = 20;
  // bool _isDarkTheme = false;

  Widget _navigationDraw() => Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue,
            ),
          child: Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius:
                      BorderRadius.all(Radius.circular(50.0))),
                child: Image.network("https://miro.medium.com/max/1124/1*zIh4g0sCaByZFcfH6O6wDw.png"),
                ),
                const Text("Навигация по Flutter")
              ],
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.one_k),
          title: const Text("Каталог"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.one_k),
          title: const Text("Корзина"),
          onTap: () {},
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text("Профиль"),
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Настройки"),
          onTap: () {},
        ),
      ],
    ),
  );

  PreferredSizeWidget _appBar() => AppBar(
    title: Text("Демо темы", ),
    actions: [
      IconButton(
        icon: const Icon (Icons.add_alert),
        tooltip: 'Уведомления',
        onPressed: () {},
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: _navigationDraw(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text('Заголовок', style: Theme.of(context).textTheme.headline5),
              Container(
                height: 100,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Row(
                children: [
                  Text('Логин: '),
                  Expanded(child: TextField()),
                ],
              ),
              Row(
                children: [
                  Text('Пароль: '),
                  Expanded(child: TextField()),
            ],
          ),
              ElevatedButton(onPressed: () {}, child: Text('Войти')),
              Text(Strings.longBodyText),
              Slider(value: _currentSliderValue,
                  max: 100,
                  divisions: 5,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
                },
        ),
    ],
      ),
    ),
    ),
    );
  }
}

