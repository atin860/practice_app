import 'package:get/get.dart';
import 'package:practice_app/controller/controller.dart';

/// A binding class for the LoginOrSignupScreen.
///
/// This class ensures that the LoginOrSignupController is created when the
/// LoginOrSignupScreen is first loaded.
class AllBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}

class Put {}
