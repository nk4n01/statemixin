import 'package:get/get.dart';
import 'package:state_mixin_ex/controllers/photos_controller.dart';

class PhotosBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PhotosController());
  }
}
