

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ItemDispatchController extends GetxController{

  static ItemDispatchController get i => Get.find();
  //final GlobalKey<FormFieldBuilder> key = GlobalKey<FormBuilderState>();


  final List<String> names = <String>['Aby', 'Aish', 'Ayan', 'Ben', 'Bob', 'Charlie', 'Cook', 'Carline'].obs;
  final List<int> msgCount = <int>[2, 0, 10, 6, 52, 4, 0, 2].obs;
  final List<ItemDispatchModel> itemList = <ItemDispatchModel>[].obs;

  var controllerDestino = TextEditingController();

  var nameInput = ''.obs;
  var itemName = ''.obs;
  var itemAvQty = '0'.obs;
  var itemQty = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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


}

class ItemDispatchModel {
  var name = "";
  var availqty = "";
  var qty = "";

  ItemDispatchModel(this.name, this.availqty, this.qty);
}