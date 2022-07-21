

import 'package:brac_arna/app/modules/item_dispatch/controllers/item_dispatch_controller.dart';
import 'package:brac_arna/app/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../../../models/drug_list_response.dart';


class ItemDispatchView extends GetView<ItemDispatchController>{
  final _size = Get.size;

  @override
  Widget build(BuildContext context) {
    Get.find<ItemDispatchController>();
    double width;
    double height;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    TextEditingController fieldTextEditingController;
    // TextEditingController _controller = TextEditingController();
    // _controller.text = "0";
    // final List<String> _suggestions = [
    //   'Alligator',
    //   'Buffalo',
    //   'Chicken',
    //   'Dog',
    //   'Eagle',
    //   'Frog'
    // ];

    // Initial Selected Value
    String dropdownvalue = 'Item 1';

    // List of items in our dropdown menu
    var items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];


    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(60,55),
          child:  AppBar(
            backgroundColor: Color(0xff03A1E0),
              elevation: 0,
              centerTitle: true,
              //title: Text('Item Dispatch')

            title: Stack(alignment: Alignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Dispatch'),),
                Container(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.account_circle_sharp),
                )
              ],
            ),

          ),
        ),
        body:Container(
          margin: EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SizedBox(
                  height: 5,
                ),

                Stack(
                  children: <Widget>[
                    Align(alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(0),
                        // decoration: BoxDecoration(
                        //   border:Border.all(color: Colors.blueAccent) ,
                        //   borderRadius: BorderRadius.all(Radius.circular(20)),
                        // ),

                        child: Stack(
                          children: <Widget>[
                            Align(alignment: Alignment.centerLeft,
                              child:  Obx(() =>
                                  Text(
                                    "PATIENT SL NO: "+controller.pSerialN0.value,
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal,fontSize: 12),
                                  ),
                              ),

                            ),
                            Align(alignment: Alignment.centerRight,
                                child:
                                //Obx(() =>
                                    Text(
                                      "DATE: "+Utils.getCurrentDate(),
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal,fontSize: 12),
                                    ),
                                //),

                            ),

                          ],
                        ),


                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: controller.etSkillScore1Key.value,
                  child: Column(
                    children: <Widget>[
                      DropdownSearch<String>(
                       // key: controller.etSkillScore1Key.value,
                        //mode of dropdown
                        mode: Mode.DIALOG,
                        //to show search box
                        showSearchBox: true,
                        //selectedItem: true,
                        //list of dropdown items
                        //items: controller.itemlist,
                        items: controller.drugList?.map((item) => item.name!).toList(),
                        label: "Item name",
                        onChanged: (value) {
                          controller.selected_spinner_item.value = value.toString();
                          controller.itemName.value = value.toString();
                          print('medname : '+controller.itemName.value);
                          controller.controllerAvailableQty.value.text = '300';
                        },
                        //show selected item
                        selectedItem:  controller.selected_spinner_item.value,

                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        children: [
                          Expanded(child: TextField(
                            readOnly: true,
                            controller: controller.controllerAvailableQty.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Available qty',
                              hintText: 'Available qty',
                            ),
                          ), flex: 1,),

                          SizedBox(
                            width: 20,
                          ),

                          Expanded(child: TextField(
                            keyboardType: TextInputType.number,
                            controller: controller.dispatchQtyController.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Dispatch qty',
                              hintText: '0',
                            ),
                          ), flex: 1,)

                        ],
                      ),


                      Container(
                        margin: EdgeInsets.only(top: 20),
                        alignment: Alignment.topRight,
                        child: RaisedButton(
                          padding: EdgeInsets.only(top: 13,bottom: 13,left: 35,right: 35),
                          color: Color(0xff03A1E0),
                          child: Text('Add',style: TextStyle(color: Colors.white),),
                          onPressed: () {
                            //FocusScope.of(context).unfocus();
                            //controller.etSkillScore1Key.value.currentState!.reset();
                            //FocusManager.instance.primaryFocus?.unfocus();
                            controller.itemQty.value = int.parse(controller.dispatchQtyController.value.text);
                            if (controller.itemName.value.isEmpty) {
                              _showToast(context,'Enter medicine item name!');
                            }else if(controller.itemQty.value == 0){
                              _showToast(context,'Enter dispatch quantity!');
                            }else{
                              controller.selected_spinner_item.value = "Select item";
                              controller.addItemToList();
                              controller.dispatchQtyController.value.text = "0";
                              controller.itemName.value = "";

                            }
                            FocusScope.of(context).unfocus();
                            //controller.etSkillScore1Key.value.currentState!.dispose();
                          },

                        ),
                      ),
                    ],
                  ),
                ),
             //Obx(() =>

            // ),



                SizedBox(
                  height: 20,
                ),
                // Container(
                //   color: Colors.grey,
                //   height: 1,
                //   width: Get.width,
                // ),
                SizedBox(
                  height: 10,
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                //   crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                //   children: <Widget>[
                //     // new Flexible(child: Container(
                //     //   //height: 50,
                //     //   //width: 140,
                //     //   child: TextFieldWidgetSmall(
                //     //     labelText: "A.Qty",
                //     //     hintText: "",
                //     //     initialValue: controller.itemAvQty.value,
                //     //     keyboardType: TextInputType.number,
                //     //     //editController: controller.controllerDestino,
                //     //     onChanged: (input) {
                //     //        controller.itemAvQty.value = input;
                //     //     },
                //     //     // limit: 255,
                //     //     // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                //     //     // iconData: Icons.person,
                //     //     isFirst: true,
                //     //     isLast: false,
                //     //   ),
                //     // ), flex: 1,),
                //     new Flexible(
                //       child: Container(
                //         //width: 140,
                //         child: Padding(
                //           padding: const EdgeInsets.all(5.0),
                //           child: Center(
                //             child: Container(
                //               //width: 60.0,
                //               foregroundDecoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(5.0),
                //                 border: Border.all(
                //                   color: Colors.blueAccent,
                //                   //width: 2.0,
                //                 ),
                //               ),
                //               child: Row(
                //                 children: <Widget>[
                //
                //                   Expanded(
                //                     flex: 1,
                //                     child: TextFormField(
                //                       textAlign: TextAlign.center,
                //                       decoration: InputDecoration(
                //                         contentPadding: EdgeInsets.all(8.0),
                //                         border:InputBorder.none,
                //                         // OutlineInputBorder(
                //                         //   borderRadius: BorderRadius.circular(5.0),
                //                         // ),
                //                       ),
                //                       controller: controller.controllerQty.value,
                //                       keyboardType: TextInputType.numberWithOptions(
                //                         decimal: false,
                //                         signed: true,
                //                       ),
                //                       //onChanged: ,
                //                       style: TextStyle(color: Colors.black,fontSize: 20),
                //                     ),
                //                   ),
                //                   Container(
                //                     //height: 58.0,
                //                     child: Column(
                //                       crossAxisAlignment: CrossAxisAlignment.center,
                //                       mainAxisAlignment: MainAxisAlignment.center,
                //                       children: <Widget>[
                //                         Container(
                //                           decoration: BoxDecoration(
                //                             border: Border(
                //                               bottom: BorderSide(
                //                                 width: 0.5,
                //                               ),
                //                             ),
                //                           ),
                //                           child: InkWell(
                //                             child: Icon(
                //                               Icons.arrow_drop_up,
                //                               size: 28.0,
                //                             ),
                //                             onTap: () {
                //                               int currentValue = int.parse(controller.controllerQty.value.text);
                //                               controller.itemQty.value = currentValue.toString();
                //                               //setState(() {
                //                               currentValue++;
                //                               controller.controllerQty.value.text = (currentValue)
                //                                   .toString(); // incrementing value
                //                               //});
                //                             },
                //                           ),
                //                         ),
                //                         InkWell(
                //                           child: Icon(
                //                             Icons.arrow_drop_down,
                //                             size: 28.0,
                //                           ),
                //                           onTap: () {
                //                             int currentValue = int.parse(controller.controllerQty.value.text);
                //                             controller.itemQty.value = currentValue.toString();
                //                             //setState(() {
                //                             print("Setting state");
                //                             currentValue--;
                //                             controller.controllerQty.value.text =
                //                                 (currentValue > 0 ? currentValue : 0)
                //                                     .toString(); // decrementing value
                //                             //});
                //                           },
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ), flex: 1,),
                //     SizedBox(
                //       width: 20,
                //     ),
                //     new Flexible(child:
                //     Column(
                //       children: [
                //         // SizedBox(
                //         //   height: 20,
                //         // ),
                //         Container(
                //           //height: 45,
                //           child:  RaisedButton(
                //             color: Colors.blueAccent,
                //             child: Text('Add',style: TextStyle(color: Colors.white),),
                //             onPressed: () {
                //               controller.itemQty.value = controller.controllerQty.value.text;
                //
                //               if (controller.itemName.value.isEmpty) {
                //                 //_showDialog(context,"Enter medicine name!");
                //                 _showToast(context,'Enter medicine name!');
                //
                //               }else if(controller.itemQty.value == "0"){
                //                 //_showDialog(context,"Enter medicine quantity!");
                //                 _showToast(context,'Enter medicine quantity!');
                //               }else{
                //                 controller.addItemToList();
                //                 controller.controllerQty.value.text = "0";
                //                 controller.itemName.value = "";
                //               }
                //
                //             },
                //
                //           ),
                //         ),
                //
                //       ],
                //     ),
                //       flex: 1,),
                //   ],
                // ),


                Obx(() {
                  if(controller.itemList.length>0){
                    return Container(
                      //height: 200,
                      //width: Get.width-24,

                      // decoration: BoxDecoration(
                      //     color: Color(0xffFFF4DE),
                      //     borderRadius: BorderRadius.all(Radius.circular(10))
                      // ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         // Text('Top 10 Consumed Medicine'),
                          SizedBox( height:10),
                          Row(
                            children: <Widget>[
                              Expanded(child:  Text("SL",style: TextStyle(color: Color(0xff03A1E0),fontSize: 12),), flex: 1,),
                              Expanded(child:  Text("ITEM DESCRIPTION",style: TextStyle(color: Color(0xff03A1E0),fontSize: 12),), flex: 7,),
                              Expanded(child:  Text("QTY",style: TextStyle(color: Color(0xff03A1E0),fontSize: 12),), flex: 2,),
                            ],
                          ),

                        ],
                      ),

                    );


                  }else{
                    return SizedBox(
                      height: 0.0,
                    );
                  }

                }),

                 SizedBox(
                    height: 0,
                  ),



                // list
                Expanded(
                    child: Obx(() => ListView.builder(
                        padding: const EdgeInsets.all(5),
                        //itemCount: controller.itemList.length,
                        itemCount: controller.itemList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var sl = index+1;
                          return Column(
                            children: [
                              SizedBox( height:10),
                              Row(
                                children: <Widget>[
                                  Expanded(child:  Text(""+sl.toString(),style: TextStyle(color: Colors.grey,fontSize: 12),), flex: 1,),
                                  Expanded(child:  Text(""+controller.itemList[index].medicine_name,style: TextStyle(color: Colors.grey,fontSize: 12),), flex: 7,),
                                  Expanded(child:  Text(""+controller.itemList[index].medicine_qty.toString(),style: TextStyle(color: Colors.black,fontSize: 12),), flex: 1,),
                                  Expanded(child:  GestureDetector(
                                      onTap: () {
                                        controller.itemList.removeAt(index);
                                      },
                                      child:Container(
                                        padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                                        margin: EdgeInsets.only(left: 1,top: 7),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          // border: Border.all(
                                          //   color: Colors.blueAccent,
                                          // ),
                                          //borderRadius: BorderRadius.all(Radius.circular(2))
                                        ),

                                        child: Center(
                                          child: Icon(Icons.remove_circle_outline,color: Colors.red,
                                            size: 15,),
                                        ),)

                                  ), flex: 1,),
                                ],
                              ),
                            ],

                          );
                        }
                    )
                    )
                ),

                SizedBox(
                  height: 0,
                ),

                Obx(() {
                  if(controller.itemList.length>0){
                    return
                      GestureDetector(
                        onTap: () {

                          // controller.submit_dispatch(context);
                          //
                          // controller.itemList.forEach((element) {
                          //   controller.insert_item_dispatch_ToLocalDB(element);
                          // });
                          // controller.insert_patient_serialToLocalDB();
                          // controller.itemList.clear();
                          // _showToast(context,'Item dispatch stored Successfully');
                          _showDialog(context);
                        },
                       child: Stack(
                      children: <Widget>[
                        Align(alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: Get.width,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color(0xff03A1E0),
                            //border:Border.all(color: Colors.blueAccent) ,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Text("Submit", style: TextStyle(color: Colors.white),),
                        ),
                      ),

                  ],
                  )

                      );
                  }else{
                    return SizedBox(
                      height: 0.0,
                    );
                  }

                }),


              ]
          ),
        ),
        
        
    );
  }
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Submit Medicine",style: TextStyle(color: Color(0xff03A1E0)),),
          content: Container(
            alignment: Alignment.center,
            height: Get.width/2.5,
            child: Column(

              children: [
                Container(
                  color: Colors.grey,
                  height: 1.0,
                ),
                SizedBox(height: 50,),
                Text("Are you sure you want to dispatch your medicine?"),
              ],
            ),
          ),

          actions: <Widget>[
            new FlatButton(
              child: new Text("Cancel",style: TextStyle(color: Color(0xff03A1E0)),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              color: Color(0xff03A1E0),
              child: new Text("Yes,Submit",style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).pop();
                controller.submit_dispatch(context);

                controller.itemList.forEach((element) {
                  controller.insert_item_dispatch_ToLocalDB(element);
                });
                controller.insert_patient_serialToLocalDB();
                controller.itemList.clear();
               // _showToast(context,'Item dispatch stored Successfully');
              },
            ),
          ],
        );
      },
    );
  }
  void _showToast(BuildContext context , String s) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content:  Text(''+s),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void showSubmitDialoge(BuildContext context){
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(context)
            .modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext,
            Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height -  80,
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: const Color(0xFF1BC0C5),
                  )
                ],
              ),
            ),
          );
        });
  }


}

