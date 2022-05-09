

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../services/auth_service.dart';

class ItemDispatchController extends GetxController{

  static ItemDispatchController get i => Get.find();
  //final GlobalKey<FormFieldBuilder> key = GlobalKey<FormBuilderState>();

  // final List<String> _suggestions = <String>[
  //   'Alligator',
  //   'Buffalo',
  //   'Chicken',
  //   'Dog',
  //   'Eagle',
  //   'Frog'
  // ].obs;
  final List<String> names = <String>['Aby', 'Aish', 'Ayan', 'Ben', 'Bob', 'Charlie', 'Cook', 'Carline'].obs;
  final List<int> msgCount = <int>[2, 0, 10, 6, 52, 4, 0, 2].obs;
  final List<ItemDispatchModel> itemList = <ItemDispatchModel>[].obs;
  final List<ItemDispatchModel> searchItemList = <ItemDispatchModel>[].obs;

  var controllerDestino = TextEditingController();

  var nameInput = ''.obs;
  var itemName = ''.obs;
  var itemAvQty = '0'.obs;
  var itemQty = ''.obs;

  var userNAme = ''.obs;
  var userRole = ''.obs;
  var selectedItem = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userNAme.value = Get.find<AuthService>().currentUser.value.data!.user!.username!.toString();
    userRole.value = Get.find<AuthService>().currentUser.value.data!.role_info![0].role_name!;


  }

  void addItemToList(){

    var item = ItemDispatchModel(itemName.value, itemAvQty.value, itemQty.value);
    itemList.insert(0, item);
    print("itemList: "+itemList[0].name);

    names.insert(0,nameInput.value);
    msgCount.insert(0, 0);
    //itemAvQty.value = "";
  }


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  onSearchTextChanged(String text) async {
    searchItemList.clear();
    if (text.isEmpty) {
     // setState(() {});
      return;
    }

    searchItemList.forEach((appointmentData) {
      if (appointmentData.name!.toLowerCase().contains(text.toLowerCase()))
        searchItemList.add(appointmentData);
    });


  }

}

class ItemDispatchModel {
  var name = "";
  var availqty = "";
  var qty = "";

  ItemDispatchModel(this.name, this.availqty, this.qty);
}