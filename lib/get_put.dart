/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print('MyController initialized');
  }

  var count = 0.obs;

  void increment() {
    count++;
  }
}

class MyBinding extends Bindings {
  @override
  void dependencies() {
    // Register the controller immediately
    // Get.put<MyController>(MyController(), permanent: true);
    Get.lazyPut(() => MyController(), fenix: true);
    print('MyBinding dependencies registered');
  }
}

void main() {
  runApp(GetMaterialApp(
    initialBinding: ,
    initialRoute: '/home',
    getPages: [
      GetPage(name: '/home', page: () => Home()),
      GetPage(
        name: '/a',
        page: () => ScreenA(),
        binding: MyBinding(), // Apply the binding here
      ),
      GetPage(
        name: '/b',
        page: () => ScreenB(),
        binding:
            MyBinding(), // Apply the same binding or a different one if needed
      ),
    ],
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    print("home is build");
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Get.toNamed('/a');
          },
          child: Text('Go to Screen A'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.toNamed('/b');
          },
          child: Text('Go to Screen B'),
        ),
      ],
    );
  }
}

class ScreenA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('ScreenA built');

    final MyController controller = Get.find<MyController>();

    return Scaffold(
      appBar: AppBar(title: Text('Screen A')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() => Text('Count: ${controller.count}',
                style: TextStyle(fontSize: 24))),
            ElevatedButton(
              onPressed: controller.increment,
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('ScreenB built');

    final MyController controller = Get.find<MyController>();

    return Scaffold(
      appBar: AppBar(title: Text('Screen B')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() => Text('Count: ${controller.count}',
                style: TextStyle(fontSize: 24))),
            ElevatedButton(
              onPressed: controller.increment,
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
*/
