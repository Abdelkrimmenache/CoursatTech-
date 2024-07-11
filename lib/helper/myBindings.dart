
import 'package:corsatech_app/core/viewModel/auth_ViewModel.dart';
import 'package:corsatech_app/core/viewModel/controller_View_Model.dart';
import 'package:corsatech_app/core/viewModel/home_ViewMedel.dart';
import 'package:corsatech_app/core/viewModel/profile_ViewModel.dart';
import 'package:corsatech_app/helper/localStorgeData.dart';
import 'package:get/get.dart';

class myBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => controllerViewModel()) ; 
    Get.lazyPut(() => authViewModel()) ; 
    Get.lazyPut(() => homeViewModel()) ; 
    Get.lazyPut(() => LocalStorgageData()) ; 
    Get.lazyPut(() => profileViewModel()) ; 
  }

 

}