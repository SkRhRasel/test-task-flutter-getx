import 'package:get/get.dart';
import 'package:test_task_flutter_getx/ui/features/bottom_navigation/explore/explore_controller.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExploreController());
  }
}
