

import 'package:brac_arna/app/modules/item_dispatch/controllers/item_dispatch_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';


class ItemDispatchView extends GetView<ItemDispatchController>{
  final _size = Get.size;

  @override
  Widget build(BuildContext context) {
    Get.find<ItemDispatchController>();
    double width;
    double height;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
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
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(60,55),
          child:  AppBar(
              backgroundColor: Colors.blueAccent,
              elevation: 0,
              centerTitle: true,
              //title: Text('Item Dispatch')

            title: Stack(alignment: Alignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('N-PMS'),),
                Container(
                  alignment: Alignment.centerRight,
                  child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              // Obx(() => Text(""+controller.userNAme.value,
                              //     style: TextStyle(color: Colors.white,fontSize: 12),
                              //     textAlign:TextAlign.center,
                              //   ),
                              // ),
                              //
                              // Obx(
                              //       () => Text(""+controller.userRole.value,
                              //     style: TextStyle(color: Colors.white,fontSize: 12),
                              //     textAlign:TextAlign.center,
                              //   ),
                              // ),


                            ],
                          ),
                )
              ],
            ),
          //   Row(
          //   // mainAxisAlignment: MainAxisAlignment.end, //Center Row contents horizontally,
          //   // crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
          //   children: [
          //     // Container(
          //     //   //margin: EdgeInsets.only(left:20,top: 20),
          //     //   height: 50,
          //     //   width: 50,
          //     //   child:CircleAvatar(
          //     //     radius: 48, // Image radius
          //     //     backgroundImage: NetworkImage('imageUrl'),
          //     //   ) ,
          //     // ),
          //
          //     // SizedBox(
          //     //   width: 10,
          //     // ),
          //
          //
          //     Align(
          //       alignment: Alignment.centerRight,
          //       child:Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //
          //           Obx(
          //                 () => Text(""+controller.userNAme.value,
          //               style: TextStyle(color: Colors.white,fontSize: 12),
          //               textAlign:TextAlign.center,
          //             ),
          //           ),
          //
          //           Obx(
          //                 () => Text(""+controller.userRole.value,
          //               style: TextStyle(color: Colors.white,fontSize: 12),
          //               textAlign:TextAlign.center,
          //             ),
          //           ),
          //
          //
          //         ],
          //       ),
          //     ),
          //
          //
          //   ],
          // ),
          ),
        ),
        body:Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(top: 0,bottom: 0,right: 10,left: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueAccent,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child:Stack(alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Autocomplete<String>(
                        optionsBuilder: (TextEditingValue value) {
                          // When the field is empty
                          if (value.text.isEmpty) {
                            return [];
                          }

                          // The logic to find out which ones should appear
                          return controller.names.where((suggestion) =>
                              suggestion.toLowerCase().contains(value.text.toLowerCase()));
                        },
                        onSelected: (value) {
                          controller.itemName.value = value;
                          // setState(() {
                          //   _selectedAnimal = value;
                          // });
                        },

                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.search),

                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //
                      //     Obx(() => Text(""+controller.userNAme.value,
                      //       style: TextStyle(color: Colors.white,fontSize: 12),
                      //       textAlign:TextAlign.center,
                      //     ),
                      //     ),
                      //
                      //     Obx(
                      //           () => Text(""+controller.userRole.value,
                      //         style: TextStyle(color: Colors.white,fontSize: 12),
                      //         textAlign:TextAlign.center,
                      //       ),
                      //     ),
                      //
                      //
                      //   ],
                      // ),
                    )
                  ],
                ),
              ),



             //  Container(
             //    margin: EdgeInsets.only(
             //        left: width * 0.05, right: width * 0.05, top: 10),
             //
             //    child: Card(
             //      elevation: 5,
             //      color: Colors.white,
             //      shape: RoundedRectangleBorder(
             //        borderRadius: BorderRadius.circular(5),
             //      ),
             //      child: Container(
             //        width: width * 1,
             //        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
             //        decoration: BoxDecoration(
             //            border: Border.all(color: Colors.blueAccent)
             //        ),
             //        child: Autocomplete<String>(
             //          optionsBuilder: (TextEditingValue value) {
             //            // When the field is empty
             //            if (value.text.isEmpty) {
             //              return [];
             //            }
             //
             //            // The logic to find out which ones should appear
             //            return controller.names.where((suggestion) =>
             //                suggestion.toLowerCase().contains(value.text.toLowerCase()));
             //          },
             //          onSelected: (value) {
             //            // setState(() {
             //            //   _selectedAnimal = value;
             //            // });
             //          },
             //
             //        ),
             //
             //        // TextField(
             //        //   textCapitalization: TextCapitalization.words,
             //        //   //onChanged: onSearchTextChanged,
             //        //   decoration: InputDecoration(
             //        //     hintText: 'Search Medicine', //getTranslated(context, searchMedicine_hint).toString(),
             //        //     hintStyle: TextStyle(
             //        //       fontSize: width * 0.04,
             //        //       color: Colors.blueAccent,
             //        //     ),
             //        //     suffixIcon: Padding(
             //        //       padding: const EdgeInsets.all(12),
             //        //       child: Icon(Icons.search_sharp, color: Colors.grey)
             //        //     ),
             //        //     border: InputBorder.none,
             //        //   ),
             //        // ),
             //      ),
             //    ),
             //  ),
             //
             // GFSearchBar(
             //     searchList: controller.names,
             //     searchQueryBuilder: (query, list) => list
             //         .where((item) {
             //       return item!.toString().toLowerCase().contains(query.toLowerCase());
             //     })
             //         .toList(),
             //     overlaySearchListItemBuilder: (dynamic item) => Container(
             //       padding: const EdgeInsets.all(8),
             //       child: Text(
             //         item,
             //         style: const TextStyle(fontSize: 18,color: Colors.black),
             //       ),
             //     ),
             //     onItemSelected: (dynamic item) {
             //       // setState(() {
             //       //   print('$item');
             //       // });
             //     }),



              Row(
                mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                children: <Widget>[
                  // new Flexible(child: Container(
                  //   //height: 50,
                  //   //width: 140,
                  //   child: TextFieldWidgetSmall(
                  //     labelText: "A.Qty",
                  //     hintText: "",
                  //     initialValue: controller.itemAvQty.value,
                  //     keyboardType: TextInputType.number,
                  //     //editController: controller.controllerDestino,
                  //     onChanged: (input) {
                  //        controller.itemAvQty.value = input;
                  //     },
                  //     // limit: 255,
                  //     // validator: (input) => input!.isEmpty ? "This field Shouldn't be empty".tr : null,
                  //     // iconData: Icons.person,
                  //     isFirst: true,
                  //     isLast: false,
                  //   ),
                  // ), flex: 1,),
                  new Flexible(
                    child: Container(
                    //width: 140,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: Container(
                          //width: 60.0,
                          foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.blueAccent,
                              //width: 2.0,
                            ),
                          ),
                          child: Row(
                            children: <Widget>[

                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8.0),
                                    border:InputBorder.none,
                                    // OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(5.0),
                                    // ),
                                  ),
                                  controller: controller.controllerQty.value,
                                  keyboardType: TextInputType.numberWithOptions(
                                    decimal: false,
                                    signed: true,
                                  ),
                                  //onChanged: ,
                                  style: TextStyle(color: Colors.black,fontSize: 20),
                                ),
                              ),
                              Container(
                                //height: 58.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 0.5,
                                          ),
                                        ),
                                      ),
                                      child: InkWell(
                                        child: Icon(
                                          Icons.arrow_drop_up,
                                          size: 28.0,
                                        ),
                                        onTap: () {
                                          int currentValue = int.parse(controller.controllerQty.value.text);
                                          controller.itemQty.value = currentValue.toString();
                                          //setState(() {
                                          currentValue++;
                                          controller.controllerQty.value.text = (currentValue)
                                              .toString(); // incrementing value
                                          //});
                                        },
                                      ),
                                    ),
                                    InkWell(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 28.0,
                                      ),
                                      onTap: () {
                                        int currentValue = int.parse(controller.controllerQty.value.text);
                                        controller.itemQty.value = currentValue.toString();
                                        //setState(() {
                                        print("Setting state");
                                        currentValue--;
                                        controller.controllerQty.value.text =
                                            (currentValue > 0 ? currentValue : 0)
                                                .toString(); // decrementing value
                                        //});
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ), flex: 1,),
                  SizedBox(
                    width: 20,
                  ),
                  new Flexible(child:
                      Column(
                        children: [
                          // SizedBox(
                          //   height: 20,
                          // ),
                          Container(
                            //height: 45,
                            child:  RaisedButton(
                              color: Colors.blueAccent,
                              child: Text('Add',style: TextStyle(color: Colors.white),),
                              onPressed: () {

                                controller.itemQty.value = controller.controllerQty.value.text;
                                controller.addItemToList();

                                //controller.controllerDestino.text = '';
                              },

                            ),
                          ),

                        ],
                      ),
                   flex: 1,),
                ],
              ),


              Container(
                padding:  EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child:Container(
                            // height: 50,
                            //width: 160,
                            margin: EdgeInsets.all(2),
                            // color: controller.msgCount[index]>=10? Colors.blue[400]:
                            // controller.msgCount[index]>3? Colors.blue[100]: Colors.grey,
                            child: Center(
                                child: Text('Name',
                                  style: TextStyle(fontSize: 18),
                                )
                            ),
                          ),flex: 1,
                      ),

                      // Flexible(
                      //   child:Container(
                      //     // height: 50,
                      //     //width: 160,
                      //     margin: EdgeInsets.all(2),
                      //     // color: controller.msgCount[index]>=10? Colors.blue[400]:
                      //     // controller.msgCount[index]>3? Colors.blue[100]: Colors.grey,
                      //     child: Center(
                      //         child: Text('A.Qty',
                      //           style: TextStyle(fontSize: 18),
                      //         )
                      //     ),
                      //   ),flex: 1,
                      // ),

                      Flexible(
                        child:Container(
                          // height: 50,
                          //width: 160,
                          margin: EdgeInsets.all(2),
                          // color: controller.msgCount[index]>=10? Colors.blue[400]:
                          // controller.msgCount[index]>3? Colors.blue[100]: Colors.grey,
                          child: Center(
                              child: Text('Qty',
                                style: TextStyle(fontSize: 18),
                              )
                          ),
                        ),flex: 1,
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
                      //itemCount: controller.itemList.length,
                      itemCount: controller.itemList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              // height: 50,
                              //width: 160,
                              margin: EdgeInsets.all(5),

                              // color: controller.msgCount[index]>=10? Colors.blue[400]:
                              // controller.msgCount[index]>3? Colors.blue[100]: Colors.grey,
                              child: Center(
                                  child: Text('${controller.itemList[index].name}',
                                    style: TextStyle(fontSize: 18),
                                  )
                              ),
                            ), flex: 1,),

                            // Flexible(
                            //   child: Container(
                            //     padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            //     // height: 50,
                            //    // width: 100,
                            //     margin: EdgeInsets.all(5),
                            //     // color: controller.msgCount[index]>=10? Colors.blue[400]:
                            //     // controller.msgCount[index]>3? Colors.blue[100]: Colors.grey,
                            //     child: Center(
                            //         child: Text('${controller.itemList[index].availqty}',
                            //           style: TextStyle(fontSize: 18),
                            //         )
                            //     ),
                            //   ), flex: 1,),

                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                 //height: 50,
                               // width: 100,
                                margin: EdgeInsets.all(5),
                                // color: controller.msgCount[index]>=10? Colors.blue[400]:
                                // controller.msgCount[index]>3? Colors.blue[100]: Colors.grey,
                                child: Center(
                                    child: Text('${controller.itemList[index].qty}',
                                      style: TextStyle(fontSize: 18),
                                    )
                                ),
                              ),flex: 1,),

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