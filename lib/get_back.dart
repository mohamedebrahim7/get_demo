import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ScreenA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen A')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Navigate to ScreenB and wait for the result
            Get.toNamed('/second/John');

            // Use the returned data from ScreenB
          },
          child: Text('Go to Screen B'),
        ),
      ),
    );
  }
}

class ScreenB extends StatelessWidget {
  final String? s = Get.parameters['user'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen B')),
      body: Center(
        child: Column(
          children: [
            Text(s.toString()),
            ElevatedButton(
              onPressed: () {
                // Return data to ScreenA and pop ScreenB off the stack
                Get.back(result: 'Hello from Screen B');
              },
              child: Text('Return to Screen A with Data'),
            ),
            ElevatedButton(
              onPressed: () {
                // Return data to ScreenA and pop ScreenB off the stack
                Get.snackbar("title", "message");
              },
              child: Text('snackbar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Return data to ScreenA and pop ScreenB off the stack
                Get.defaultDialog(
                    onConfirm: () => print("Ok"),
                    middleText: "Dialog made in 3 lines of code");
              },
              child: Text('snackbar'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routingCallback: (value) {
        value?.current == '/second/John';
        print("popopopopo");
      },
      title: 'GetX Routing Example',
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => ScreenA()),
        GetPage(name: '/second/:user', page: () => ScreenB()),
      ],
    );
  }
}
