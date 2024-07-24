import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  int count = 0;

  void increment() {
    count++;
    update(); // Triggers  to rebuild
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX State Management',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home screen ')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(CounterScreen());
              },
              child: Text('go screen '),
            ),
            ElevatedButton(
              onPressed: () {
                controller.count = 5;
                controller.update();
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize the controll    final CounterController controller = Get.put(CounterController());er using Get.put() so it can be accessed globally
    final CounterController controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(title: Text('Simple State Management')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            <CounterController>(
              autoRemove: false,
              builder: (controller) {
                return Column(
                  children: [
                    Text('Count: ${controller.count}'),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: controller.increment,
                      child: Text('Increment'),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
