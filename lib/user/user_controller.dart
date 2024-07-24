import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  User? _user = User();

  bool get isUser => _user != null;

  User? get user => _user;

  // Method to update the user information
  void updateUser(User newUser) {
    _user = newUser;
    GetStorage().write('user', _user!.toJson()); // Save updated user to storage
    update(); // Notify listeners about the change
  }

  // Method to load user from storage
  void loadUser() {
    final storedUserJson = GetStorage().read('user');
    if (storedUserJson != null) {
      _user = User.fromJson(storedUserJson);
      update(); // Notify listeners about the change
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  // Method to clear user information
  void clearUser() {
    _user = null; // Reset to an empty User object
    GetStorage().remove('user'); // Remove from storage
    update(); // Notify listeners about the change
  }
}

class User {
  String name;
  String id;
  String token;

  User({this.name = '', this.id = '', this.token = ''});

  // Convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'token': token,
    };
  }

  // Create User object from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      id: json['id'] ?? '',
      token: json['token'] ?? '',
    );
  }

  @override
  String toString() {
    return 'User(name: $name, id: $id, token: $token)';
  }
}

///sepration here

/*

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  // Use Rx<User?> for reactive state
  final _user = Rx<User?>(User());

  // Getter to check if user is not null
  bool get isUser => _user.value != null;

  // Getter to access the user object
  User? get user => _user.value;

  // Method to update the user information
  void updateUser(User newUser) {
    _user.value = newUser;
    GetStorage()
        .write('user', newUser.toJson()); // Save updated user to storage
  }

  // Method to load user from storage
  void loadUser() {
    final storedUserJson = GetStorage().read('user');
    if (storedUserJson != null) {
      _user.value = User.fromJson(storedUserJson);
    }
  }

  // Method to clear user information
  void clearUser() {
    _user.value = null; // Reset to an empty User object
    GetStorage().remove('user'); // Remove from storage
  }
}

class User {
  String name;
  String id;
  String token;

  User({this.name = '', this.id = '', this.token = ''});

  // Convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'token': token,
    };
  }

  // Create User object from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      id: json['id'] ?? '',
      token: json['token'] ?? '',
    );
  }

  @override
  String toString() {
    return 'User(name: $name, id: $id, token: $token)';
  }
}
*/
