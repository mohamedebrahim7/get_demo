/*
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controller
class CounterController extends GetxController {
  var count = 0.obs; // Reactive variable
  int anotherCount = 0; // Non-reactive variable

  void increment() {
    count.value++; // Automatically updates UI for reactive variable
  }

  void incrementAnotherCount() {
    anotherCount++;
    update(); // Manually triggers UI update for non-reactive variable
  }
}

// Main Application
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Example',
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Obx for reactive variable
            Obx(() {
              log("🟢🟢🟢 obx rebuild 🟢🟢🟢");

              return Text('Reactive Count: ${count.value}');
            }),
            SizedBox(height: 20),
            // GetX for combining reactive and non-reactive variables
            <CounterController>(
              builder: (controller) {
                log("🟢🟢🟢  rebuild 🟢🟢🟢");

                return Text('Non-Reactive Count: ${controller.anotherCount}');
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.increment,
              child: Text('Increment Reactive Count'),
            ),
            ElevatedButton(
              onPressed: controller.incrementAnotherCount,
              child: Text('Increment Non-Reactive Count'),
            ),
          ],
        ),
      ),
    );
  }
}
*/
