/*
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class User {
  final String name;
  final int age;

  User({required this.name, required this.age});
}

class UserController extends GetxController with StateMixin<User> {
  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

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

  void fetchUserData() async {
    // Set the state to loading
    change(null, status: RxStatus.loading());

    try {
      // Simulate a network call or data fetching
      await Future.delayed(Duration(seconds: 3));

      throw "er";
      // Simulate successful data fetching
      final user = User(name: 'John Doe', age: 30);
      // Update the state with the fetched user data
      change(user, status: RxStatus.success());
    } catch (e) {
      // Handle errors and update the state accordingly
      change(null,
          status: RxStatus.error('ana ele 3mlt el error da nehahahae3a'));
    }
  }

  void fetchUserData1() async {
    // Set the state to loading
    change(null, status: RxStatus.loading());

    try {
      // Simulate a network call or data fetching
      await Future.delayed(Duration(seconds: 3));

      // Simulate successful data fetching
      final user = User(name: 'John Doe', age: 30);
      // Update the state with the fetched user data
      change(user, status: RxStatus.success());
    } catch (e) {
      // Handle errors and update the state accordingly
      change(null,
          status: RxStatus.error('ana ele 3mlt el error da nehahahae3a'));
    }
  }
}

class UserScreen extends GetView<UserController> {
  final controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Data')),
      body: controller.obx(
        (state) {
          log("🟡🟡🟡 main widget rebuild 🟡🟡🟡");

          return Center(
              child: Column(children: [
            Obx(() {
              log('🟢 Counter1 rebuild');
              return Text('Counter1: ${controller.counter1}');
            }),
            Obx(() {
              log('🟢🟢 Counter2 rebuild');
              return Text('Counter2: ${controller.counter2}');
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
            Text('Name: ${state!.name}, Age: ${state.age}')
          ]));
        },
        onLoading: Center(child: CircularProgressIndicator()),
        onEmpty: Text('No data found'),
        onError: (error) => Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.fetchUserData1();
                },
                child: Text('Retry'),
              ),
              Text(error ?? 'Unknown error'),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    home: UserScreen(),
  ));
}
*/
