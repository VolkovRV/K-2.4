import 'package:flutter/material.dart';

class NavigationDrawerScreen extends StatefulWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  _NavigationDrawerScreenState createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
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
                            borderRadius: BorderRadius.all(Radius.circular(50.0))
                          ),
                          child: Image.network("https://miro.medium.com/max/1124/1*zIh4g0sCaByZFcfH6O6wDw.png"),
                        ),
                        const Text("Навигация во Flutter")
                      ],
                    )

              ),
              ),
              ListTile(
                leading: const Icon(Icons.one_k),
                title: const Text("Каталог"),
                onTap: () {
                  _messengerKey.currentState!.showSnackBar(
                    const SnackBar(content: Text("Переход в каталог")));
                },
              ),
              ListTile(
                leading: const Icon(Icons.one_k),
                title: const Text("Корзина"),
                onTap: () {
                  _messengerKey.currentState!.showSnackBar(
                      const SnackBar(content: Text("Переход в Корзина")));
                },
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("Профиль"),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Настройки"),
                onTap: () {
                  _messengerKey.currentState!.showSnackBar(
                      const SnackBar(content: Text("Переход в Настройки")));
                },
              ),
            ],
          ),
        ),
        body: Center(child: Text("Содержимое экрана")),
      )
    );
  }
}
