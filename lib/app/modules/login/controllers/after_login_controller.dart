import 'dart:async';

import 'package:brac_arna/app/database_helper/offline_database_helper.dart';
import 'package:brac_arna/app/models/drug_list_response.dart';
import 'package:brac_arna/app/models/user_model.dart';
import 'package:brac_arna/app/repositories/auth_repository.dart';
import 'package:brac_arna/app/repositories/information_repository.dart';
import 'package:brac_arna/app/routes/app_pages.dart';
import 'package:brac_arna/app/utils.dart';
import 'package:brac_arna/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../services/auth_service.dart';

class after_login_controller extends GetxController {
  //TODO: Implement LoginController

  final Rx<UserModel> userData = UserModel().obs;
  Rx<TextEditingController> userNameController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  final loading = false.obs;
  var latitude = 'Getting Latitude..'.obs;
  var longitude = 'Getting Longitude..'.obs;
  var address = 'Getting Address..'.obs;
  late StreamSubscription<Position> streamSubscription;
  late GlobalKey<FormState> loginFormKey;

  var isLocationEnable = false.obs;
  var isLocationPermission = false.obs;

  var userNAme = ''.obs;
  var userRole = ''.obs;
  var showCircle = false.obs;
  final dbHelper = DatabaseHelper.instance;
  final druglistResonse = DrugListResponse().obs;

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void onInit() {
    navigatorKey: navigatorKey;
    userNAme.value = Get.find<AuthService>().currentUser.value.data!.users!.username!.toString();
    userRole.value = Get.find<AuthService>().currentUser.value.data!.roles![0].role_name!;

    //get_drug_list();
    //getLocationPermission();
    //AuthRepository().allProd();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void login() async {
    // userData.value.fullName = userNameController.value.text;
    // userData.value.password = passwordController.value.text;
    Get.focusScope!.unfocus();

    Ui.customLoaderDialogWithMessage();
    AuthRepository().userLogin(userData.value).then((response) {
      print(response);

      if(response != null){
        //String? loginData = Get.find<AuthService>().currentUser.value.api_info!.original!.access_token;
        Get.offAllNamed(Routes.AFTER_LOGIN);
        //Get.offAllNamed(Routes.HOME);
        // Get.find<RootController>().changePageOutRoot(0);
        Get.showSnackbar(Ui.SuccessSnackBar(message: 'Successfully logged in'.tr, title: 'Success'.tr));
      }
      // if (response == 'Unauthorised') {
      //   Get.back();
      //   Get.showSnackbar(Ui.ErrorSnackBar(message: "Credentials doesn't match".tr, title: "Error".tr));
      // } else {
      //   Get.offAllNamed(Routes.INFORMATION_FORM);
      //   //Get.offAllNamed(Routes.HOME);
      //   // Get.find<RootController>().changePageOutRoot(0);
      //   Get.showSnackbar(Ui.SuccessSnackBar(message: 'Successfully logged in'.tr, title: 'Success'.tr));
      // }
    });
  }

  getLocationPermission() async {

      LocationPermission permission;
      permission = await Geolocator.checkPermission();



      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error('Location permissions are denied');
        }
      }else{
        isLocationPermission.value = true;
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }


  }

  enableLocation() async {
    bool serviceEnabled;

    //LocationPermission permission;
    // Check if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    isLocationEnable.value = serviceEnabled;
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

  }

  get_drug_list(BuildContext context) async {
    //Get.focusScope!.unfocus();

    //Ui.customLoaderDialogWithMessage();
    if(!await (Utils.checkConnection() as Future<bool>)){
      debugPrint('No internet connection');
      Get.showSnackbar(Ui.internetCheckSnackBar(message: 'No internet connection'));
    }else{
      showCircle.value = true;
      Ui.showLoaderDialog(context);
      // showDialog(
      //   context: context,
      //   barrierDismissible: false,
      //   builder: (_) => WillPopScope(
      //     onWillPop: () async => false,
      //     child: Center(
      //       child: SizedBox(
      //         width: 60,
      //         height: 60,
      //         child: CircularProgressIndicator(
      //           strokeWidth: 5,
      //         ),
      //       ),
      //     ),
      //   ),
      // );

      //await Future.delayed(Duration(seconds: 3));
      // Dismiss CircularProgressIndicator

      InformationRepository().get_drug_list().then((resp) async {
        druglistResonse.value = resp;
        if(druglistResonse.value != null){
          showCircle.value = false;
          print(druglistResonse.value.drug_info);
          // Get.toNamed(Routes.LOGIN);
          await dbHelper.deleteALlDrugs();
          druglistResonse.value.drug_info!.forEach((element) async {
            Map<String, dynamic> row = {
              DatabaseHelper.drug_name: ''+element.name.toString(),
              DatabaseHelper.drug_id: element.id,
              DatabaseHelper.drug_pstrength_name: ''+element.pstrength_name.toString(),
              DatabaseHelper.drug_pstrength_id: element.pstrength_id,
              DatabaseHelper.drug_generic_name: ''+element.generic_name.toString(),
              DatabaseHelper.drug_generic_id: element.generic_id,
              //DatabaseHelper.drug_stock: element.generic_id,
            };

            await dbHelper.insert_drug(row);
          });

          var localdataSize = await dbHelper.queryAllDrugRows();
          print('localdataDrugSize: ${localdataSize.length}');

          showCircle.value = false;

          Navigator.of(context).pop();
        }else{
          Navigator.of(context).pop();
          Get.toNamed(Routes.LOGIN);
        }
      });
    }


  }
}