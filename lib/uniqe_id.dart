import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  // Internal state variables as observables
  var _counter1 = 0.obs;
  var _counter2 = 0.obs;

  // Getter methods
  int get counter1 => _counter1.value;
  int get counter2 => _counter2.value;

  // Method to increment counter1
  void incrementCounter1() {
    _counter1++;
  }

  // Method to increment counter2
  void incrementCounter2() {
    _counter2++;
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Instantiate the controller
    final CounterController controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(title: Text('Obx Performance Test')),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Obx(() {
              log('🟢 Counter1 rebuild');
              return Text('Counter1: ${controller.counter1}');
            }),
            Obx(() {
              log('🟢🟢 Counter2 rebuild');
              return Text('Counter2: ${controller.counter2}');
            }),
            Obx(() {
              log('🟢🟢🟢 Counter 1 and 2 rebuild');
              return Column(
                children: [
                  Text('Counter1: ${controller.counter1}'),
                  Text('Counter2: ${controller.counter2}'),
                ],
              );
            }),
            ElevatedButton(
              onPressed: () {
                controller.incrementCounter1();
              },
              child: Text('Increment Counter1'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.incrementCounter2();
              },
              child: Text('Increment Counter2'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    home: CounterScreen(),
  ));
}
