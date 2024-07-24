/*
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_demo/route/routes.dart';

class AppStateController extends GetxController {
  // Define the storage key
  final String _storageKey = 'appState';

  // Define an observable for app state
  Rx<AppState> _appState = AppState(
    isGuest: null, // Default value
    navigationState: Routes.onboarding,
    user: null,
  ).obs;

  // Load app state from storage
  void loadAppState() {
    final box = GetStorage();
    final json = box.read(_storageKey);
    if (json != null) {
      _appState.value = AppState.fromJson(json);
    }
  }

  // Save app state to storage
  void saveAppState() {
    final box = GetStorage();
    box.write(_storageKey, _appState.value.toJson());
  }

  // Method to go to the login screen
  void goLoginScreen() {
    Get.offNamed(Routes.login);
    _appState.update((state) {
      state?.navigationState = Routes.login;
      saveAppState(); // Save the state after update
    });
  }

  // Method to go to the home screen
  void goHomeScreenAsUser() {
    Get.toNamed(Routes.home);

    _appState.update((state) {
      state?.navigationState = Routes.home;
      saveAppState(); // Save the state after update
    });
    setUser(User(name: "Ali", id: "1", token: 'ds'));
  }

  void goHomeScreenAsGuest() {
    Get.toNamed(Routes.home);
    _appState.update((state) {
      state?.navigationState = Routes.home;
      saveAppState(); // Save the state after update
    });
    setGuest();
  }

  // Method to set user information
  void setUser(User user) {
    _appState.update((state) {
      state?.isGuest = false;
      state?.user = user;
      saveAppState(); // Save the state after update
    });
  }

  // Method to set guest status
  void setGuest() {
    _appState.update((state) {
      state?.isGuest = true;
      state?.user = null;
      saveAppState(); // Save the state after update
    });
  }

  // Getter for initial route
  String getInitialRoute() {
    return _appState.value.navigationState;
  }

  // Getter for user
  User? getUser() {
    return _appState.value.user;
  }

  // Getter for guest status
  bool? isGuest() {
    return _appState.value.isGuest;
  }
}

class User {
  final String name;
  final String id;
  final String token;

  User({
    required this.name,
    required this.id,
    required this.token,
  });

  // Convert User instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'token': token,
    };
  }

  // Create User instance from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      id: json['id'] as String,
      token: json['token'] as String,
    );
  }
}

class AppState {
  bool? isGuest;
  String navigationState; // To indicate if the user is at home or login
  User? user;

  AppState({
    this.isGuest,
    required this.navigationState,
    this.user,
  });

  // Convert AppState instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'isGuest': isGuest,
      'navigationState': navigationState,
      'user': user?.toJson(),
    };
  }

  // Create AppState instance from JSON
  factory AppState.fromJson(Map<String, dynamic> json) {
    return AppState(
      isGuest: json['isGuest'] as bool,
      navigationState: json['navigationState'] as String,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }
}
*/
