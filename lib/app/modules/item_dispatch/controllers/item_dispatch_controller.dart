

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ItemDispatchController extends GetxController{

  final List<String> names = <String>['Aby', 'Aish', 'Ayan', 'Ben', 'Bob', 'Charlie', 'Cook', 'Carline'].obs;
  final List<int> msgCount = <int>[2, 0, 10, 6, 52, 4, 0, 2].obs;

  var nameInput = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void addItemToList(){

      names.insert(0,nameInput.value);
      msgCount.insert(0, 0);

  }


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }


}