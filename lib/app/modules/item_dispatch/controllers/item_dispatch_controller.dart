

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../database_helper/offline_database_helper.dart';
import '../../../models/drug_list_response.dart';
import '../../../repositories/information_repository.dart';
import '../../../routes/app_pages.dart';
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
   List<Country> countryOptions = <Country>[
    Country(name: 'Allopurinol (Tablet 250)', size: 30370000),
    Country(name: 'BCG (vaccine) ', size: 44579000),
    Country(name: 'Chlorambucil (Tablet 250)', size: 8600000),
    Country(name: 'Doxycycline (Tablet 250)', size: 110879),
    Country(name: 'Doxycycline (Tablet 250)', size: 9984670),
    Country(name: 'Folic acid (Tablet 250)', size: 42916),
    Country(name: 'Gliclazide (Tablet 250)', size: 10180000),
    Country(name: 'Glyceryl trinitrate (Tablet 250)', size: 3287263),
    Country(name: 'North America', size: 24709000),
    Country(name: 'South America', size: 17840000),
  ].obs;

  final List areaList = [
    {"name": "Block 1", "id": "124612615"},
    {"name": "Block 2", "id": "124612615"},
    {"name": "Block 3", "id": "124612615"},
    {"name": "PECHS block 1", "id": "124612615"},
    {"name": "PECHS block 2", "id": "124612615"},
    {"name": "PECHS block 3", "id": "124612615"},
    {"name": "PECHS block 4", "id": "124612615"},
    {"name": "PECHS block 5", "id": "124612615"},
    {"name": "PECHS block 6", "id": "124612615"},
    {"name": "PECHS block 7", "id": "12461265"},
    {"name": "PECHS block 8", "id": "12461215"},
    {"name": "PECHS block 9", "id": "12461615"},
    {"name": "PECHS block 0", "id": "12462615"},
    {"name": "PECHS block 89", "id": "12612615"},
    {"name": "PECHS block 88", "id": "1261265"},
    {"name": "PECHS block 87", "id": "14612615"},
  ];
  final List<String> names = <String>['Allopurinol (Tablet 250)', 'BCG (vaccine) ', 'Chlorambucil (Tablet 250)', 'Doxycycline (Tablet 250)', 'Ergometrine (Injection)', 'Folic acid (Tablet 250)', 'Gliclazide (Tablet 250)', 'Glyceryl trinitrate (Tablet 250)'].obs;
  final List<int> msgCount = <int>[2, 0, 10, 6, 52, 4, 0, 2].obs;
  final List<ItemDispatchModel> itemList = <ItemDispatchModel>[].obs;
  final List<ItemDispatchModel> searchItemList = <ItemDispatchModel>[].obs;

  var controllerQty = TextEditingController().obs;
  var controllerItemName = TextEditingController().obs;


  var nameInput = ''.obs;
  var itemName = ''.obs;
  var itemAvQty = '0'.obs;
  var itemQty = ''.obs;

  var userNAme = ''.obs;
  var userRole = ''.obs;
  var selectedItem = ''.obs;
  var pSerialN0 = '0'.obs;
  var itemSize = 0.obs;
  final dbHelper = DatabaseHelper.instance;
  final druglistResonse = DrugListResponse().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controllerQty.value.text = "0";
    userNAme.value = Get.find<AuthService>().currentUser.value.data!.users!.username!.toString();
    userRole.value = Get.find<AuthService>().currentUser.value.data!.roles![0].role_name!;
    //insert_patient_serialToLocalDB();

     getPSerialNo();
    get_drug_list();


  }

  Future<void> getPSerialNo() async {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    print(formattedDate);
    await dbHelper.deleteSerial(formattedDate);

    var localdataSize = await dbHelper.getAllPatientSerial();
    itemSize.value = localdataSize.length;
    print('localdataSize: ${localdataSize.length}');
    pSerialN0.value = '${localdataSize.length + 1}';
  }

  // insert serial
  Future<void> insert_patient_serialToLocalDB() async {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    print(formattedDate);

    Map<String, dynamic> row = {
      DatabaseHelper.date: formattedDate
    };
    await dbHelper.insert_patient_serial(row);
    var localdataSize = await dbHelper.getAllPatientSerial();
    print('localdataSize: ${localdataSize.length}');
    getPSerialNo();
    //await dbHelper.deleteSerial(formattedDate);

    //await dbHelper.insert_patient_serial(row);
    // var localdataSize2 = await dbHelper.getAllPatientSerial();
    // print('localdataSize: ${localdataSize2.length}');

    // var localdataSize = await dbHelper.queryAllRecords();
    // print('localdataSize: ${localdataSize.length}');
    // for (var i = 0; i < localdataSize.length; i++) {
    //   Map<String, dynamic> map = localdataSize[i];
    //   var name = map['name'];
    //   print("name: "+name);
    //   // var id = map['id'];
    // }


  }

  // insert serial
  Future<void> insert_item_dispatch_ToLocalDB() async {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    print(formattedDate);

    Map<String, dynamic> row = {
      DatabaseHelper.date: formattedDate,
      DatabaseHelper.serial: pSerialN0.value,
      DatabaseHelper.medicine_name: itemName.value,
      DatabaseHelper.quantity: itemAvQty.value
    };
    await dbHelper.insert_item_dispatch(row);
    var localdataSize = await dbHelper.get_tem_dispatch();
    print('localdataitemSize: ${localdataSize.length}');
    //getPSerialNo();
    //await dbHelper.deleteSerial(formattedDate);

    //await dbHelper.insert_patient_serial(row);
    // var localdataSize2 = await dbHelper.getAllPatientSerial();
    // print('localdataSize: ${localdataSize2.length}');

    // var localdataSize = await dbHelper.queryAllRecords();
    // print('localdataSize: ${localdataSize.length}');
    // for (var i = 0; i < localdataSize.length; i++) {
    //   Map<String, dynamic> map = localdataSize[i];
    //   var name = map['name'];
    //   print("name: "+name);
    //   // var id = map['id'];
    // }


  }

  void addItemToList(){

    var item = ItemDispatchModel('','',itemName.value, itemAvQty.value, itemQty.value);
    itemList.insert(0, item);
    print("itemList: "+itemList[0].name);

    names.insert(0,nameInput.value);
    msgCount.insert(0, 0);
    //itemAvQty.value = "";
  }


  get_drug_list() async {
    InformationRepository().get_drug_list().then((resp) {
      druglistResonse.value = resp;
      if(druglistResonse.value == null){
        print(druglistResonse.value);
       // Get.toNamed(Routes.LOGIN);
      }


    });
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
  var serial_no = "";
  var date = "";
  var name = "";
  var availqty = "";
  var qty = "";

  ItemDispatchModel(
      this.serial_no, this.date, this.name, this.availqty, this.qty);
}

class Country {

  const Country({
    required this.name,
    required this.size,
  });

  final String name;
  final int size;

  @override
  String toString() {
    return '$name ($size)';
  }
}