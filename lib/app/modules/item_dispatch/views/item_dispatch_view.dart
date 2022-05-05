

import 'package:brac_arna/app/modules/global_widgets/dropdown_widget_menu.dart';
import 'package:brac_arna/app/modules/global_widgets/text_field_widget.dart';
import 'package:brac_arna/app/modules/item_dispatch/controllers/item_dispatch_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../global_widgets/dropdown_widget.dart';
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
                child: DropDownWidgetMenu(
                  labelText: "Item",
                  hintText: "Select Item",
                  initialValue: '',
                  iconData: Icons.phone_android,
                 // data: controller.thanaList?.map((item) => item.name!).toList(),
                  onChanged: (input) {
                    // for (var item in controller.thanaList) {
                    //   if (item.name == input) {
                    //     controller.instituteUpazila.value = item.id!.toString();
                    //     controller.inspectionData.value.thana_id = item.id;
                    //   }
                    // }
                    // // controller.getLocationData();
                    // print('upazila: ${controller.instituteUpazila.value}');
                  },
                  isFirst: true,
                  isLast: false,
                ),

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                children: [
                  Container(
                    width: 140,
                    child: TextFieldWidgetSmall(
                      labelText: "A.Qty",
                      hintText: "",
                      initialValue: '',
                      onChanged: (input) {
                        // controller.victimAddress = input;
                      },
                      // limit: 255,
                      // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                      // iconData: Icons.person,
                      isFirst: true,
                      isLast: false,
                    ),
                  ),

                  Container(
                    width: 140,
                    child: TextFieldWidgetSmall(
                      labelText: "Qty",
                      hintText: "",
                      initialValue: '',
                      onChanged: (input) {
                        // controller.victimAddress = input;
                      },
                      // limit: 255,
                      // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                      // iconData: Icons.person,
                      isFirst: true,
                      isLast: false,
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(
                        height: 22,
                      ),
                      RaisedButton(
                        color: Colors.blueAccent,
                          child: Text('Add',style: TextStyle(color: Colors.white),),
                          onPressed: () {
                            controller.addItemToList();
                          },

                      ),
                    ],
                  ),


                ],
              ),



              Container(
                padding:  EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // height: 50,
                        width: 160,
                        margin: EdgeInsets.all(2),
                        // color: controller.msgCount[index]>=10? Colors.blue[400]:
                        // controller.msgCount[index]>3? Colors.blue[100]: Colors.grey,
                        child: Center(
                            child: Text('Name',
                              style: TextStyle(fontSize: 18),
                            )
                        ),
                      ),
                      Container(
                        // height: 50,
                        width: 100,
                        margin: EdgeInsets.all(2),
                        // color: controller.msgCount[index]>=10? Colors.blue[400]:
                        // controller.msgCount[index]>3? Colors.blue[100]: Colors.grey,
                        child: Center(
                            child: Text('A.Qty',
                              style: TextStyle(fontSize: 18),
                            )
                        ),
                      ),
                      Container(
                        // height: 50,
                        width: 100,
                        margin: EdgeInsets.all(2),
                        // color: controller.msgCount[index]>=10? Colors.blue[400]:
                        // controller.msgCount[index]>3? Colors.blue[100]: Colors.grey,
                        child: Center(
                            child: Text('Qty',
                              style: TextStyle(fontSize: 18),
                            )
                        ),
                      ),
                    ],
                  ),
              ),

              // RaisedButton(
              //   child: Text('Add'),
              //   onPressed: () {
              //     controller.addItemToList();
              //   },
              // ),
              Expanded(
                  child: Obx(() => ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: controller.names.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                             // height: 50,
                              width: 160,
                              margin: EdgeInsets.all(2),
                              color: controller.msgCount[index]>=10? Colors.blue[400]:
                              controller.msgCount[index]>3? Colors.blue[100]: Colors.grey,
                              child: Center(
                                  child: Text('${controller.names[index]} (${controller.msgCount[index]})',
                                    style: TextStyle(fontSize: 18),
                                  )
                              ),
                            ),
                            Container(
                             // height: 50,
                              width: 100,
                              margin: EdgeInsets.all(2),
                              color: controller.msgCount[index]>=10? Colors.blue[400]:
                              controller.msgCount[index]>3? Colors.blue[100]: Colors.grey,
                              child: Center(
                                  child: Text('${controller.names[index]} (${controller.msgCount[index]})',
                                    style: TextStyle(fontSize: 18),
                                  )
                              ),
                            ),
                            Container(
                              // height: 50,
                              width: 100,
                              margin: EdgeInsets.all(2),
                              color: controller.msgCount[index]>=10? Colors.blue[400]:
                              controller.msgCount[index]>3? Colors.blue[100]: Colors.grey,
                              child: Center(
                                  child: Text('${controller.names[index]} (${controller.msgCount[index]})',
                                    style: TextStyle(fontSize: 18),
                                  )
                              ),
                            ),
                          ],
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