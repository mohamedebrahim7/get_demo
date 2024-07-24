import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/home',
    getPages: [
      GetPage(
        name: '/home',
        page: () => MyHomePage(),
      ),
      GetPage(name: '/second', page: () => Second(), children: [
        GetPage(
          name: '/secondChild',
          page: () => SecondChild(),
        )
      ]),
      GetPage(
          name: '/third', page: () => Third(), transition: Transition.upToDown),
    ],
  ));
}

//create class person
class Person {
  String name;
  int age;
  Person(this.name, this.age);
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  String? str;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GetX Demo'),
        ),
        body: Column(
          children: [
            Text(str != null ? str.toString() : 'no data'),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/second',
                    parameters: {'id': '1', 'name': 'ahmed1'},
                    arguments: Person("ali", 12));
              },
              child: Text('Go to Second Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('back '),
            ),
            ElevatedButton(
              onPressed: () async {
                str = await Get.toNamed('/third');
              },
              child: Text('Go to Third Page'),
            ),
          ],
        ));
  }
}

class Second extends StatelessWidget {
  final id = Get.parameters['id'];
  final name = Get.parameters['name'];
  final Person p = Get.arguments;
  Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GetX Demo'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('scond screen'),
              Text(p.name),
              Text(id ?? "fd"),
              Text(name ?? "fd"),
              ElevatedButton(
                onPressed: () {
                  Get.offNamed('/second/secondChild');
                },
                child: Text('Go to SecondChild Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('back'),
              ),
            ],
          ),
        ));
  }
}

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GetX Demo'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('third screen '),
              ElevatedButton(
                onPressed: () {
                  Get.back(result: "hello world");
                },
                child: Text('Close'),
              )
            ],
          ),
        ));
  }
}

class SecondChild extends StatelessWidget {
  const SecondChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GetX Demo'),
        ),
        body: Center(
          child: Text('SecondChild'),
        ));
  }
}
