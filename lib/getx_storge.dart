import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AgeController extends GetxController {
  var age = 0.val('age'); // Initialize Value with key 'age'

  // Method to increment the age
  void incrementAge() {
    age.val += 1;
    update();
  }

  // Method to get the current age
  int getCurrentAge() {
    return age.val;
  }
}

void main() async {
  await GetStorage.init(); // Initialize GetStorage
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AgeScreen(),
    );
  }
}

class AgeScreen extends StatelessWidget {
  final AgeController ageController = Get.put(AgeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Age Controller Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              ageController.incrementAge();
            },
            child: Text('text'),
          ),
          <AgeController>(
            builder: (controller) => Text('Age: ${ageController.age.val}'),
          )
        ],
      ),
    );
  }
}
