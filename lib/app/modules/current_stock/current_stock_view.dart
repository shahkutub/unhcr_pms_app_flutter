

import 'package:brac_arna/app/modules/consumption_tally/controllers/consumption_tally_controller.dart';
import 'package:brac_arna/app/modules/current_stock/current_stock_controller.dart';
import 'package:brac_arna/common/AppConstant.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:intl/intl.dart';


class CurrentStockView extends GetView<CurrentStockController>{
  final _size = Get.size;
  String date = "";
  DateTime selectedDate = DateTime.now();
  var txt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Get.find<CurrentStockController>();
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
                  child: Text(AppConstant.pageName),),
                // Container(
                //   alignment: Alignment.centerRight,
                //   child: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //
                //               Obx(() => Text(""+controller.userNAme.value,
                //                   style: TextStyle(color: Colors.white,fontSize: 12),
                //                   textAlign:TextAlign.center,
                //                 ),
                //               ),
                //
                //               Obx(
                //                     () => Text(""+controller.userRole.value,
                //                   style: TextStyle(color: Colors.white,fontSize: 12),
                //                   textAlign:TextAlign.center,
                //                 ),
                //               ),
                //
                //
                //             ],
                //           ),
                // )
              ],
            ),

          ),
        ),
      //resizeToAvoidBottomInset: true,
        body:Container(
          margin: EdgeInsets.all(10),
          // child: Container(
          //   //height: 200,
          //   //width: Get.width-24,
          //   padding: EdgeInsets.all(12),
          //   margin: EdgeInsets.all(12),
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
                    Expanded(child:  Text("SL",style: TextStyle(color: Colors.blueAccent,fontSize: 12),), flex: 1,),
                    Expanded(child:  Text("ITEM",style: TextStyle(color: Colors.blueAccent,fontSize: 12),), flex: 5,),
                    Expanded(child:  Text("QTY",style: TextStyle(color: Colors.blueAccent,fontSize: 12),), flex: 2,),
                  ],
                ),

          Obx(() =>
                Expanded(child: ListView.builder(
                    itemCount: controller.drugList.length,
                    //primary: false,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      var sl = index+1;
                      return Column(
                        children: [
                          SizedBox( height:10),
                          Row(
                            children: <Widget>[
                              Expanded(child:  Text(""+sl.toString(),style: TextStyle(color: Colors.black,fontSize: 12),), flex: 1,),
                              Expanded(child:  Text(""+controller.drugList[index].name.toString(),style: TextStyle(color: Colors.black,fontSize: 12),), flex: 5,),
                              Expanded(child:  Text("300",style: TextStyle(color: Colors.black,fontSize: 12),), flex: 2,),
                            ],
                          ),
                        ],

                      );
                    }),),)

                // Container(
                //   height: Get.height-150,
                //   ),


              ],
            ),

          //),

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

