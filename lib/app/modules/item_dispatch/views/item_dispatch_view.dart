

import 'package:brac_arna/app/modules/item_dispatch/controllers/item_dispatch_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../global_widgets/dropdown_widget_small.dart';
import '../../global_widgets/text_field_widget_small.dart';

class ItemDispatchView extends GetView<ItemDispatchController>{
  final _size = Get.size;

  @override
  Widget build(BuildContext context) {
    Get.find<ItemDispatchController>();


    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(60,55),
          child:  AppBar(
              backgroundColor: Colors.blueAccent,
              elevation: 0,
              centerTitle: true,
              title: Text('Item Dispatch')
          ),
        ),
        body:Column(
            children: <Widget>[

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,

                  children: [
                    Container(
                      width: 180,
                      child: dropdown_widget_small(
                        labelText: "Item",
                        hintText: "Item",
                        initialValue: '',

                        //data: controller.places.value.area!.map((item) => item.divisionName!).toList().where((country) => controller.victimD.add(country.toString())).toList(),
                        // data: controller.allDivDisTana!.value.division_list?.map((item) => item.name!).toList(),
                        // iconData: Icons.phone_android,
                        // onChanged: (input) {
                        //
                        //   // controller.victimDivisionName.value =input;
                        //   for (var item in controller.allDivDisTana.value.division_list!) {
                        //     if (item.name == input) {
                        //       controller.victimDivision.value = item.id.toString();
                        //       //controller.districtList.add(item);
                        //     }
                        //   }
                        //   // controller.fetchJoke();
                        //   controller.placeLoaded.value = false;
                        //   controller.getInsPectionListDivision();
                        //
                        //   //controller.getAldivDis();
                        //   print('divisionId: ${controller.victimDivision.value}');
                        //   //print('district: ${controller.districtList[0].name}');
                        //   controller.districtList.clear();
                        //   for (var itemd in controller.allDivDisTana.value.district_list!) {
                        //     //print('divisionId: ${controller.victimDivision.value}');
                        //     if (itemd.division_id.toString() == controller.victimDivision.value.toString().trim()) {
                        //       print('divisionIddd: ${controller.victimDivision.value}');
                        //       //controller.victimDivision.value = item.id.toString();
                        //       controller.districtList.add(itemd);
                        //
                        //     }
                        //   }
                        //   //print('district: ${controller.districtList[0].name}');
                        // },
                        // isFirst: true,
                        // isLast: false,
                      ),
                    ),
                    Container(
                      width: 180,
                      child: TextFieldWidgetSmall(
                        labelText: 'input',
                        hintText: "",
                        initialValue: '',
                        onChanged: (input) {
                          // controller.totalFemaleStudent.value = input as int;
                          controller.nameInput.value = input;
                          print('nameInput: ${controller.nameInput.value}');
                        },
                        keyboardType: TextInputType.number,
                        // limit: 255,
                        // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                        //iconData: Icons.phone_android,
                        isFirst: true,
                        isLast: false,
                      ),
                    ),

                  ],
                ),

              ),

               Padding(
                      padding: EdgeInsets.all(20),
                      child: TextFieldWidgetSmall(
                        labelText: 'input',
                        hintText: "",
                        initialValue: '',
                        onChanged: (input) {
                          // controller.totalFemaleStudent.value = input as int;
                          controller.nameInput.value = input;
                          print('nameInput: ${controller.nameInput.value}');
                        },
                        keyboardType: TextInputType.number,
                        // limit: 255,
                        // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                        //iconData: Icons.phone_android,
                        isFirst: true,
                        isLast: false,
                      ),
                    ),


              RaisedButton(
                child: Text('Add'),
                onPressed: () {
                  controller.addItemToList();
                },
              ),
              Expanded(
                  child: Obx(() => ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: controller.names.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),
                          color: controller.msgCount[index]>=10? Colors.blue[400]:
                          controller.msgCount[index]>3? Colors.blue[100]: Colors.grey,
                          child: Center(
                              child: Text('${controller.names[index]} (${controller.msgCount[index]})',
                                style: TextStyle(fontSize: 18),
                              )
                          ),
                        );
                      }
                  )
              )
              )

            ]
        )
    );
  }

}