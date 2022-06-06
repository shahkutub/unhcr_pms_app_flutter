

import 'package:brac_arna/app/modules/item_dispatch/controllers/item_dispatch_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';

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

                              Obx(() => Text(""+controller.userNAme.value,
                                  style: TextStyle(color: Colors.white,fontSize: 12),
                                  textAlign:TextAlign.center,
                                ),
                              ),

                              Obx(
                                    () => Text(""+controller.userRole.value,
                                  style: TextStyle(color: Colors.white,fontSize: 12),
                                  textAlign:TextAlign.center,
                                ),
                              ),


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
        body:Container(
          margin: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SizedBox(
                  height: 5,
                ),
                Text(
                  "Item Dispatch",
                  style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold,fontSize: 15),
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

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Serial no: ",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal,fontSize: 13),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Obx(() =>
                                Text(
                                  controller.pSerialN0.value,
                                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.normal,fontSize: 17),
                                ),
                            ),
                          ],
                        ),


                      ),
                    ),

                  ],
                ),

                SizedBox(
                  height: 0,
                ),

                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   //crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //
                //     Row(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Container(
                //           width: 130,
                //          padding: EdgeInsets.all(20),
                //           decoration: BoxDecoration(
                //             border: Border.all(
                //               color: Colors.blueAccent,
                //             ),
                //             shape: BoxShape.circle,
                //           ),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               Text(
                //                 "Serial no",
                //                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 13),
                //               ),
                //               SizedBox(
                //                 height: 10,
                //               ),
                //               Obx(() =>
                //                   Text(
                //                     controller.pSerialN0.value,
                //                     style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold,fontSize: 17),
                //                   ),
                //               ),
                //             ],
                //           ),
                //         ),
                //        // SizedBox(width: 5,),
                //         Container(
                //           width: 130,
                //           padding: EdgeInsets.only(top: 20,bottom: 20),
                //           decoration: BoxDecoration(
                //             border: Border.all(
                //               color: Colors.blueAccent,
                //             ),
                //             shape: BoxShape.circle,
                //           ),
                //           child:Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Column(
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 children: [
                //                   Text(
                //                     "Total",
                //                     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 13),
                //                   ),
                //                   SizedBox(
                //                     height: 10,
                //                   ),
                //                   Obx(() =>
                //                       Text(
                //                         controller.itemSize.value.toString(),
                //                         style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold,fontSize: 17),
                //                       ),
                //                   ),
                //                 ],
                //               ),
                //
                //             ],
                //           ),
                //
                //         ),
                //         Container(
                //           padding: EdgeInsets.all(10),
                //           decoration: BoxDecoration(
                //               border: Border.all(
                //                 color: Colors.blueAccent,
                //               ),
                //               borderRadius: BorderRadius.all(Radius.circular(20))
                //           ),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               Text(
                //                 "Show list",
                //                 style: TextStyle(color: Colors.teal, fontWeight: FontWeight.normal,fontSize: 13),
                //               ),
                //
                //             ],
                //           ),
                //         ),
                //
                //       ],
                //     ),
                //
                //
                //
                //   ],
                // ),



                SizedBox(
                  height: 5,
                ),
                // Text(
                //   "Medicine",
                //   style: TextStyle(color: Colors.red, fontWeight: FontWeight.normal,fontSize: 12),
                // ),
                Container(
                  //margin: EdgeInsets.only(top: 0,bottom: 0,right: 10,left: 10),
                  //padding: EdgeInsets.only(top: 0,bottom: 0,right: 10,left: 10),
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: Colors.blueAccent,
                  //     ),
                  //     borderRadius: BorderRadius.all(Radius.circular(5))
                  // ),
                  child:Stack(alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        //padding: EdgeInsets.only(top: 25,bottom: 25),
                        alignment: Alignment.centerLeft,
                        child: Autocomplete<DrugInfo>(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            return controller.drugList
                                .where((DrugInfo county) => county.name!.toLowerCase()
                                .startsWith(textEditingValue.text.toLowerCase())
                            )
                                .toList();
                          },
                          displayStringForOption: (DrugInfo option) => option.name!+" ("+option.generic_name.toString()+")",
                          fieldViewBuilder: (
                              BuildContext context,
                              TextEditingController fieldTextEditingController,
                              FocusNode fieldFocusNode,
                              VoidCallback onFieldSubmitted
                              ) {
                            return Column(

                              children: [
                                Row(
                            children: [
                            Flexible(
                              child: Container(
                                //padding: EdgeInsets.only(top: 25,bottom: 25),
                              //height:45,
                              //width: 100,
                              child: TextField(
                                controller: fieldTextEditingController,
                                focusNode: fieldFocusNode,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                  labelText: "Medicine",
                                    border: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.blueAccent)
                                    ),
                                  hintText: 'Input medicine',
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      fieldTextEditingController.clear();
                                      FocusManager.instance.primaryFocus?.unfocus();
                                    },
                                    icon: Icon(Icons.clear),
                                  ),

                                ),
                              ),
                            ),flex: 6,),

                            // Flexible(
                            // child:GestureDetector(
                            // onTap: (){
                            // fieldTextEditingController.clear();
                            // FocusManager.instance.primaryFocus?.unfocus();
                            // },
                            // child: Container(
                            // alignment: Alignment.centerRight,
                            // child: Icon(
                            // Icons.clear,
                            // color: Colors.black,
                            // ),
                            // )
                            // ),
                            // flex: 1,
                            // ),


                            ],
                            ),
                                SizedBox(
                                  height: 10,
                                ),
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
                                          padding: const EdgeInsets.all(0.0),
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
                                                        contentPadding: EdgeInsets.all(0.0),
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
                                                              size: 35.0,
                                                            ),
                                                            onTap: () {
                                                              int currentValue = int.parse(controller.controllerQty.value.text);
                                                              controller.itemQty.value = currentValue;
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
                                                            size: 35.0,
                                                          ),
                                                          onTap: () {
                                                            int currentValue = int.parse(controller.controllerQty.value.text);
                                                            controller.itemQty.value = currentValue;
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
                                              FocusManager.instance.primaryFocus?.unfocus();
                                              controller.itemQty.value =int.parse(controller.controllerQty.value.text);

                                              if (controller.itemName.value.isEmpty) {
                                                //_showDialog(context,"Enter medicine name!");
                                                _showToast(context,'Enter medicine name!');

                                              }else if(controller.itemQty.value == "0"){
                                                //_showDialog(context,"Enter medicine quantity!");
                                                _showToast(context,'Enter medicine quantity!');
                                              }else{
                                                controller.addItemToList();
                                                //controller.insert_item_dispatch_ToLocalDB();
                                                controller.controllerQty.value.text = "0";
                                                controller.itemName.value = "";
                                                fieldTextEditingController.clear();

                                              }

                                            },

                                          ),
                                        ),

                                      ],
                                    ),
                                      flex: 1,),
                                  ],
                                ),
                              ],
                            );



                            //   TextField(
                            //   controller: fieldTextEditingController,
                            //   focusNode: fieldFocusNode,
                            //   style: const TextStyle(fontWeight: FontWeight.bold),
                            // );
                          },

                          onSelected: (DrugInfo selection) {
                            controller.drugData.value = selection;
                            controller.itemName.value = selection.name!+" ("+selection.generic_name.toString()+")";
                            FocusManager.instance.primaryFocus?.unfocus();
                            print('Selected: ${selection.name}');
                          },

                          // optionsViewBuilder: (
                          //     BuildContext context,
                          //     AutocompleteOnSelected<Country> onSelected,
                          //     Iterable<Country> options
                          //     ) {
                          //   return Align(
                          //     alignment: Alignment.topLeft,
                          //     child: Material(
                          //       child: Container(
                          //         width: 300,
                          //         color: Colors.cyan,
                          //         child: ListView.builder(
                          //           padding: EdgeInsets.all(10.0),
                          //           itemCount: options.length,
                          //           itemBuilder: (BuildContext context, int index) {
                          //             final Country option = options.elementAt(index);
                          //
                          //             return GestureDetector(
                          //               onTap: () {
                          //                 onSelected(option);
                          //               },
                          //               child: ListTile(
                          //                 title: Text(option.name, style: const TextStyle(color: Colors.white)),
                          //               ),
                          //             );
                          //           },
                          //         ),
                          //       ),
                          //     ),
                          //   );
                          // },

                        )


                        // Autocomplete<String>(
                        //   optionsBuilder: (TextEditingValue value) {
                        //     // When the field is empty
                        //     if (value.text.isEmpty) {
                        //       return [];
                        //     }
                        //
                        //     // The logic to find out which ones should appear
                        //     return controller.names.where((suggestion) =>
                        //         suggestion.toLowerCase().contains(value.text.toLowerCase()));
                        //
                        //   },
                        //   onSelected: (value) {
                        //     controller.itemName.value = value;
                        //     // setState(() {
                        //     //   _selectedAnimal = value;
                        //     // });
                        //   },
                        //
                        //
                        // ),
                      ),
                      // GestureDetector(
                      //   onTap: (){
                      //     //controller.controllerItemName.value.clear();
                      //   },
                      //   child: Container(
                      //     alignment: Alignment.centerRight,
                      //     child: Icon(
                      //       Icons.clear,
                      //       color: Colors.black,
                      //     ),
                      //   )
                      // ),

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
                    return
                      Container(
                        //margin: EdgeInsets.only(top: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child:Container(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                decoration: BoxDecoration(
                                    color: Colors.teal,
                                    border: Border.all(
                                      color: Colors.blueAccent,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(2))
                                ),
                                // height: 50,
                                //width: 160,
                                // color: controller.msgCount[index]>=10? Colors.blue[400]:
                                // controller.msgCount[index]>3? Colors.blue[100]: Colors.grey,
                                child: Center(
                                    child: Text('Medicine Name',
                                      style: TextStyle(fontSize: 15,color: Colors.white),

                                    )
                                ),
                              ),flex: 6,
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
                                padding:  EdgeInsets.all(5),
                                margin: EdgeInsets.only(left: 1),
                                decoration: BoxDecoration(
                                    color: Colors.teal,
                                    border: Border.all(
                                      color: Colors.blueAccent,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(2))
                                ),
                                child: Center(
                                    child: Text('Qty',
                                      style: TextStyle(fontSize: 15,color: Colors.white),
                                    )
                                ),
                              ),flex: 2,
                            ),


                            Flexible(
                              child:Container(
                                padding:  EdgeInsets.all(5),
                                margin: EdgeInsets.only(left: 1),
                                decoration: BoxDecoration(
                                    color: Colors.teal,
                                    border: Border.all(
                                      color: Colors.blueAccent,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(2))
                                ),
                                child: Center(
                                    child: Text('Del',
                                      style: TextStyle(fontSize: 15,color: Colors.white),
                                    )
                                ),
                              ),flex: 1,
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

                // RaisedButton(
                //   child: Text('Add'),
                //   onPressed: () {
                //     controller.addItemToList();
                //   },
                // ),

                // list
                Expanded(
                    child: Obx(() => ListView.builder(
                        padding: const EdgeInsets.all(5),
                        //itemCount: controller.itemList.length,
                        itemCount: controller.itemList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Flexible(
                                child: Container(

                                  padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                                  // height: 50,
                                  //width: 160,
                                  margin: EdgeInsets.only(top: 7),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      // border: Border.all(
                                      //   color: Colors.blueAccent,
                                      // ),
                                      //borderRadius: BorderRadius.all(Radius.circular(2))
                                  ),
                                  child: Center(
                                      child: Text('${controller.itemList[index].medicine_name}'+'${controller.itemList[index].medicine_generic_name}',
                                        style: TextStyle(fontSize: 12),
                                        //textAlign: TextAlign.left,
                                      )
                                  ),
                                ), flex: 6,),

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
                                  padding: const EdgeInsets.fromLTRB(0, 7, 0,7),
                                  margin: EdgeInsets.only(left: 1,top: 7),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      // border: Border.all(
                                      //   color: Colors.blueAccent,
                                      // ),
                                     // borderRadius: BorderRadius.all(Radius.circular(2))
                                  ),
                                  child: Center(
                                      child: Text('${controller.itemList[index].medicine_qty}',
                                        style: TextStyle(fontSize: 12,),
                                        //textAlign: TextAlign.left,

                                      )
                                  ),
                                ),flex: 2,),

                              Flexible(
                                child: GestureDetector(
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
                                        child: Icon(Icons.cancel,color: Colors.red,
                                          size: 25,),
                                      ),)

                                ),flex: 1,
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

                          controller.submit_dispatch(context);

                          controller.itemList.forEach((element) {
                            controller.insert_item_dispatch_ToLocalDB(element);
                          });
                          controller.insert_patient_serialToLocalDB();
                          controller.itemList.clear();
                          _showToast(context,'Item dispatch stored Successfully');

                        },
                       child: Stack(
                      children: <Widget>[
                      Align(alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            border:Border.all(color: Colors.blueAccent) ,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
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
  void _showDialog(BuildContext context, String s) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Alert!!"),
          content: new Text(s),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
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
}

