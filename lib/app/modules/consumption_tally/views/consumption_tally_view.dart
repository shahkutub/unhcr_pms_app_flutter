

import 'package:brac_arna/app/modules/consumption_tally/controllers/consumption_tally_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:intl/intl.dart';


class ConsumptionTallyView extends GetView<ConsumptionTallyController>{
  final _size = Get.size;
  String date = "";
  DateTime selectedDate = DateTime.now();
  var txt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Get.find<ConsumptionTallyController>();
    double width;
    double height;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    txt.text = "00-00-0000";
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
      //resizeToAvoidBottomInset: true,
        body:Container(
          margin: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    "Consumption Tally",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 15),),
                ),


          Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Flexible(
                child:DropdownSearch<String>(
                  //mode of dropdown
                  mode: Mode.MENU,
                  //to show search box
                  showSearchBox: true,
                  //showSelectedItem: true,
                  //list of dropdown items
                  items: [
                    "India",
                    "USA",
                    "Brazil",
                    "Canada",
                    "Australia",
                    "Singapore"
                  ],
                  label: "Partner",
                  onChanged: print,
                  //show selected item
                  selectedItem: "Select..",
                ),flex: 1,
              ),
              SizedBox(
                width: 2,
              ),
              Flexible(
                child:DropdownSearch<String>(
                  //mode of dropdown
                  mode: Mode.MENU,
                  //to show search box
                  showSearchBox: true,
                  //showSelectedItem: true,
                  //list of dropdown items
                  items: [
                    "India",
                    "USA",
                    "Brazil",
                    "Canada",
                    "Australia",
                    "Singapore"
                  ],
                  label: "Facility",
                  onChanged: print,
                  //show selected item
                  selectedItem: "Select..",
                ),flex: 1,
              ),
            ],
          ),
        ),

                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child:DropdownSearch<String>(
                          //mode of dropdown
                          mode: Mode.MENU,
                          //to show search box
                          showSearchBox: true,
                          //showSelectedItem: true,
                          //list of dropdown items
                          items: [
                            "India",
                            "USA",
                            "Brazil",
                            "Canada",
                            "Australia",
                            "Singapore"
                          ],
                          label: "Dispensary",
                          onChanged: print,
                          //show selected item
                          selectedItem: "Select..",
                        ),flex: 1,
                      ),

                      SizedBox(
                        width: 2,
                      ),

                      Flexible(
                        child:GestureDetector(
                          onTap: () { _selectDate(context);},
                          child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter Date Here',
                                hintText: '00-00-0000',
                              ),
                            autofocus: false,
                            enabled: false,
                            controller: txt,
                          ),
                        ),

                        flex: 1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height:10,
                ),
                Obx(() {
                  if(controller.itemList.length==0){
                    return
                      GestureDetector(
                        onTap: () {
                          controller.insert_patient_serialToLocalDB();
                          controller.itemList.clear();
                          _showToast(context,'Added Successfully');
                          // Get.offAllNamed(Routes.INFORMATION_FORM);
                          //Get.offAllNamed(Routes.PROVIDED_DATA_LIST);

                          //Get.offAllNamed(Routes.AFTER_LOGIN);

                          // if (controller.loginFormKey.currentState!.validate()) {
                          //   controller.login();
                          // }
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 140,right: 140),
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                //Color(0xffec008c),
                                Color(0xff1A62AE),
                                //Colors.pinkAccent.shade100
                                Color(0xff1A62AE)
                                // Color.fromRGBO(143, 148, 251, 1),
                                // Color.fromRGBO(143, 148, 251, .6),
                              ])),
                          child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                  }else{
                    return SizedBox(
                      height: 0.0,
                    );
                  }

                }),
                SizedBox(
                  height: 10,
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


                Obx(() {
                  if(controller.itemList.length>0){
                    return
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child:Container(
                                padding:  EdgeInsets.all(5),
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
                              ),flex: 4,
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


                // RaisedButton(
                //   child: Text('Add'),
                //   onPressed: () {
                //     controller.addItemToList();
                //   },
                // ),
                Expanded(
                    child: Obx(() => ListView.builder(
                        padding: const EdgeInsets.all(0),
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
                                  margin: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.blueAccent,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(2))
                                  ),
                                  child: Center(
                                      child: Text('${controller.itemList[index].name}',
                                        style: TextStyle(fontSize: 15),
                                        //textAlign: TextAlign.left,
                                      )
                                  ),
                                ), flex: 4,),

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
                                  margin: EdgeInsets.only(left: 1),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.blueAccent,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(2))
                                  ),
                                  child: Center(
                                      child: Text('${controller.itemList[index].qty}',
                                        style: TextStyle(fontSize: 15,),
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
                                      padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                                      margin: EdgeInsets.only(left: 1),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.blueAccent,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(2))
                                      ),

                                      child: Center(
                                        child: Icon(Icons.cancel,color: Colors.red,
                                          size: 20,),
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
                  height: 10,
                ),

                Obx(() {
                  if(controller.itemList.length>0){
                    return
                      GestureDetector(
                        onTap: () {
                          controller.insert_patient_serialToLocalDB();
                          controller.itemList.clear();
                          _showToast(context,'Added Successfully');
                          // Get.offAllNamed(Routes.INFORMATION_FORM);
                          //Get.offAllNamed(Routes.PROVIDED_DATA_LIST);

                          //Get.offAllNamed(Routes.AFTER_LOGIN);

                          // if (controller.loginFormKey.currentState!.validate()) {
                          //   controller.login();
                          // }
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 140,right: 140),
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                //Color(0xffec008c),
                                Color(0xff1A62AE),
                                //Colors.pinkAccent.shade100
                                Color(0xff1A62AE)
                                // Color.fromRGBO(143, 148, 251, 1),
                                // Color.fromRGBO(143, 148, 251, .6),
                              ])),
                          child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                  }else{
                    return SizedBox(
                      height: 0.0,
                    );
                  }

                }),


                SizedBox(
                  height: 10,
                ),

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

  void _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      //setState(() {
        selectedDate = selected;
   // var now = new DateTime.now();
    //var formatter = new DateFormat('yyyy-MM-dd');
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(selectedDate);
    print(formattedDate);
    txt.text = formattedDate.toString();
      //});
  }
}

