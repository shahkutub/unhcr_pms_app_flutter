import 'package:brac_arna/app/routes/app_pages.dart';
import 'package:brac_arna/common/ui.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../services/auth_service.dart';
import '../controllers/after_login_controller.dart';
import '../controllers/login_controller.dart';

class AfterLoginView extends GetView<after_login_controller> {
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       backgroundColor: Color(0xff683091),
  //       body: Center(
  //
  //         child: Column(
  //           children: <Widget>[
  //             //
  //             // SizedBox(
  //             //   height: 50,
  //             // ),
  //
  //             Stack(
  //               children: [
  //                 Container(
  //                     height: 400,
  //                     // decoration: BoxDecoration(
  //                     //     image: DecorationImage(
  //                     //   image: AssetImage(
  //                     //     'assets/images/background1.png',
  //                     //   ),
  //                     //   fit: BoxFit.fill,
  //                     // )),
  //                     child: Image(
  //                       image: AssetImage(
  //                         'assets/images/background1.png',
  //                       ),
  //                       fit: BoxFit.fill,
  //                       //color: Color(0xffec008c),
  //                       color: Colors.white,
  //
  //                     )
  //
  //                   // Stack(
  //                   //   children: <Widget>[
  //                   //     Positioned(
  //                   //       left: 30,
  //                   //       width: 80,
  //                   //       height: 200,
  //                   //       child: Container(
  //                   //         decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/light-1.png'))),
  //                   //       ),
  //                   //     ),
  //                   //     Positioned(
  //                   //       left: 140,
  //                   //       width: 80,
  //                   //       height: 150,
  //                   //       child: Container(
  //                   //         decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/light-2.png'))),
  //                   //       ),
  //                   //     ),
  //                   //     Positioned(
  //                   //       right: 40,
  //                   //       top: 40,
  //                   //       width: 80,
  //                   //       height: 150,
  //                   //       child: Container(
  //                   //         decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/clock.png'))),
  //                   //       ),
  //                   //     ),
  //                   //     Positioned(
  //                   //       child: Container(
  //                   //         margin: EdgeInsets.only(top: 50),
  //                   //         child: Center(
  //                   //           child: Text(
  //                   //             "Login",
  //                   //             style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
  //                   //           ),
  //                   //         ),
  //                   //       ),
  //                   //     )
  //                   //   ],
  //                   // ),
  //                 ),
  //                 Positioned(
  //                   bottom: 100,
  //                   left: 0,
  //                   right: 0,
  //                   child: Container(
  //                     margin: EdgeInsets.only(top: 50),
  //                     child: Center(
  //                       child: Column(
  //                         children: [
  //                           SizedBox(
  //                             height: 10,
  //                           ),
  //                           Center(
  //                             child: Text(
  //                               'কারিগরি ও মাদ্রাসা শিক্ষা বিভাগ',
  //                               style: TextStyle(
  //                                 fontSize: 24,
  //                                 color: Colors.black,
  //                               ),
  //                             ),
  //                           ),
  //                           Center(
  //                             child: Text(
  //                               'শিক্ষা মন্ত্রণালয়',
  //                               style: TextStyle(
  //                                 fontSize: 20,
  //                                 color: Colors.black,
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Positioned(
  //                   bottom: 180,
  //                   left: 0,
  //                   right: 0,
  //                   child: Container(
  //                     height: 130,
  //                     width: 130,
  //                     margin: EdgeInsets.only(top: 10),
  //                     child: Center(
  //                       child: Image(
  //                         image: AssetImage(
  //                           'assets/images/govlogo.png',
  //                         ),
  //                         fit: BoxFit.fill,
  //                         // color: Color(0xffec008c),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 // SizedBox(
  //                 //   height: 10,
  //                 // ),
  //
  //               ],
  //             ),
  //
  //
  //
  //
  //             Padding(
  //               padding: const EdgeInsets.all(10.0),
  //               child: Container(
  //                 width: Get.size.width,
  //                 decoration: Ui.getBoxDecoration(color:  Color(0xff683091) , radius: 5),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Column(
  //                       mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
  //                       crossAxisAlignment: CrossAxisAlignment.center,//Center Column contents horizontally,
  //
  //                       children: [
  //                         Container(
  //                           //margin: EdgeInsets.all(20),
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
  //                             crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
  //
  //                             children: [
  //                               GestureDetector(
  //                                 onTap: () {
  //                                   Get.toNamed(Routes.GENERAL_SEARCH);
  //                                   //Get.offAllNamed(Routes.PROVIDED_DATA_LIST);
  //                                   // if (controller.loginFormKey.currentState!.validate()) {
  //                                   //    controller.login();
  //                                   // }
  //                                 },
  //                                 child: Container(
  //                                   height: 80,
  //                                   width: 150,
  //                                   //padding: EdgeInsets.all(20),
  //                                   margin: EdgeInsets.all(10),
  //                                   decoration: BoxDecoration(
  //                                       borderRadius: BorderRadius.circular(10),
  //                                       gradient: LinearGradient(colors: [
  //                                         //Color(0xffec008c),
  //                                         Colors.green,
  //                                         //Colors.pinkAccent.shade100
  //                                         Colors.green
  //                                         // Color.fromRGBO(143, 148, 251, 1),
  //                                         // Color.fromRGBO(143, 148, 251, .6),
  //                                       ])),
  //                                   child: Center(
  //                                     child: Text(
  //                                       "অনুসন্ধান",
  //                                       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //                               GestureDetector(
  //                                 onTap: () {
  //                                   Get.toNamed(Routes.INFORMATION_FORM);
  //                                   //Get.offAllNamed(Routes.PROVIDED_DATA_LIST);
  //                                   // if (controller.loginFormKey.currentState!.validate()) {
  //                                   //   controller.login();
  //                                   // }
  //                                 },
  //                                 child: Container(
  //                                   height: 80,
  //                                   width: 150,
  //                                   //padding: EdgeInsets.all(20),
  //                                   margin: EdgeInsets.all(10),
  //                                   decoration: BoxDecoration(
  //                                       borderRadius: BorderRadius.circular(10),
  //                                       gradient: LinearGradient(colors: [
  //                                         //Color(0xffec008c),
  //                                         Colors.green,
  //                                         //Colors.pinkAccent.shade100
  //                                         Colors.green
  //                                         // Color.fromRGBO(143, 148, 251, 1),
  //                                         // Color.fromRGBO(143, 148, 251, .6),
  //                                       ])),
  //                                   child: Center(
  //                                     child: Text(
  //                                       "শিক্ষা প্রতিষ্ঠান \nপরিদর্শন",
  //                                       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                         Center(
  //                           child: Container(
  //                             child: Row(
  //                               mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
  //                               crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
  //                               children: [
  //                                 GestureDetector(
  //                                   onTap: () {
  //                                     Get.toNamed(Routes.PROVIDED_DATA_LIST);
  //                                     //Get.offAllNamed(Routes.PROVIDED_DATA_LIST);
  //                                     // if (controller.loginFormKey.currentState!.validate()) {
  //                                     //   controller.login();
  //                                     // }
  //                                   },
  //                                   child: Container(
  //                                     height: 80,
  //                                     width: 150,
  //                                     //padding:  EdgeInsets.all(20),
  //                                     margin: EdgeInsets.all(10),
  //                                     decoration: BoxDecoration(
  //                                         borderRadius: BorderRadius.circular(10),
  //                                         gradient: LinearGradient(colors: [
  //                                           //Color(0xffec008c),
  //                                           Colors.green,
  //                                           //Colors.pinkAccent.shade100
  //                                           Colors.green
  //                                           // Color.fromRGBO(143, 148, 251, 1),
  //                                           // Color.fromRGBO(143, 148, 251, .6),
  //                                         ])),
  //                                     child: Center(
  //                                       child: Text(
  //                                         "শিক্ষা প্রতিষ্ঠান \nপরিদর্শন তালিকা",
  //                                         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 GestureDetector(
  //                                   onTap: () {
  //                                     Get.find<AuthService>().removeCurrentUser();
  //                                     Get.toNamed(Routes.LOGIN);
  //                                     // Get.toNamed(Routes.GEO_LOCATION);
  //                                     //Get.offAllNamed(Routes.PROVIDED_DATA_LIST);
  //                                     // if (controller.loginFormKey.currentState!.validate()) {
  //                                     //   controller.login();
  //                                     // }
  //                                   },
  //                                   child: Container(
  //                                     height: 80,
  //                                     width: 150,
  //                                     //padding: EdgeInsets.all(20),
  //                                     margin: EdgeInsets.all(10),
  //                                     decoration: BoxDecoration(
  //                                         borderRadius: BorderRadius.circular(10),
  //                                         gradient: LinearGradient(colors: [
  //                                           //Color(0xffec008c),
  //                                           Colors.green,
  //                                           //Colors.pinkAccent.shade100
  //                                           Colors.green
  //                                           // Color.fromRGBO(143, 148, 251, 1),
  //                                           // Color.fromRGBO(143, 148, 251, .6),
  //                                         ])),
  //                                     child: Center(
  //                                       child: Text(
  //                                         "লগ আউট",
  //                                         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 // GestureDetector(
  //                                 //   onTap: () {
  //                                 //     if(controller.isLocationEnable.value == false ){
  //                                 //       controller.enableLocation();
  //                                 //     }else if( controller.isLocationPermission.value == false){
  //                                 //       controller.getLocationPermission();
  //                                 //     }else{
  //                                 //       Get.toNamed(Routes.GEO_LOCATION);
  //                                 //     }
  //                                 //
  //                                 //   },
  //                                 //   child: Container(
  //                                 //     height: 80,
  //                                 //     width: 150,
  //                                 //     //padding: EdgeInsets.all(20),
  //                                 //     margin: EdgeInsets.all(10),
  //                                 //     decoration: BoxDecoration(
  //                                 //         borderRadius: BorderRadius.circular(10),
  //                                 //         gradient: LinearGradient(colors: [
  //                                 //           //Color(0xffec008c),
  //                                 //           Colors.green,
  //                                 //           //Colors.pinkAccent.shade100
  //                                 //           Colors.green
  //                                 //           // Color.fromRGBO(143, 148, 251, 1),
  //                                 //           // Color.fromRGBO(143, 148, 251, .6),
  //                                 //         ])),
  //                                 //     child: Center(
  //                                 //       child: Text(
  //                                 //         "দুরত্ব পরিমাপ",
  //                                 //         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),
  //                                 //       ),
  //                                 //     ),
  //                                 //   ),
  //                                 // ),
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                         // Center(
  //                         //   child: Container(
  //                         //     child: Row(
  //                         //       mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
  //                         //       crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
  //                         //       children: [
  //                         //         GestureDetector(
  //                         //           onTap: () {
  //                         //             Get.find<AuthService>().removeCurrentUser();
  //                         //             Get.toNamed(Routes.LOGIN);
  //                         //             // Get.toNamed(Routes.GEO_LOCATION);
  //                         //             //Get.offAllNamed(Routes.PROVIDED_DATA_LIST);
  //                         //             // if (controller.loginFormKey.currentState!.validate()) {
  //                         //             //   controller.login();
  //                         //             // }
  //                         //           },
  //                         //           child: Container(
  //                         //             height: 80,
  //                         //             width: 150,
  //                         //             //padding: EdgeInsets.all(20),
  //                         //             margin: EdgeInsets.all(10),
  //                         //             decoration: BoxDecoration(
  //                         //                 borderRadius: BorderRadius.circular(10),
  //                         //                 gradient: LinearGradient(colors: [
  //                         //                   //Color(0xffec008c),
  //                         //                   Colors.green,
  //                         //                   //Colors.pinkAccent.shade100
  //                         //                   Colors.green
  //                         //                   // Color.fromRGBO(143, 148, 251, 1),
  //                         //                   // Color.fromRGBO(143, 148, 251, .6),
  //                         //                 ])),
  //                         //             child: Center(
  //                         //               child: Text(
  //                         //                 "লগ আউট",
  //                         //                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),
  //                         //               ),
  //                         //             ),
  //                         //           ),
  //                         //         ),
  //                         //
  //                         //       ],
  //                         //     ),
  //                         //   ),
  //                         // ),
  //                       ],
  //
  //                     ),
  //
  //                   ],
  //                 ),
  //               ),
  //             ),
  //
  //
  //           ],
  //         ),
  //       ));
  // }

  String mainProfilePic = "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  String otherProfilePic = "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/368-mj-2516-02.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=9f3d0ad657bbca1c0f2db36ad7deb323";

  //.. Switching Profile using multiple Accounts

  /*void switchUser(){
    String backupString = mainProfilePic;
    this.setState(() {
      mainProfilePic = otherProfilePic;
      otherProfilePic = backupString;
    });
  }*/
  final GlobalKey<ScaffoldState> _drawerscaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold( //first scaffold
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
              children: [
                Container(
                  //margin: EdgeInsets.only(left:20,top: 20),
                  height: 50,
                  width: 50,
                  child:CircleAvatar(
                    radius: 48, // Image radius
                    backgroundImage: NetworkImage('imageUrl'),
                  ) ,
                ),

                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Obx(
                          () => Text(""+controller.userNAme.value,
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



              ],
            ),
            backgroundColor: Colors.blueAccent,

          ),

          bottomNavigationBar: BottomAppBar(
            color: Colors.blueAccent,
            child: Container(
              //height: 50,
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Text(
                    "Developed & Maintenance By :",style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "  Nanosoft",style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          body:Scaffold(
            //second scaffold
            //   key:_drawerscaffoldkey, //set gobal key defined above
            //   drawer:  Drawer(
            //       child:  ListView(
            //         children: <Widget>[
            //           // UserAccountsDrawerHeader(
            //           //   accountName: Text("John Doe"),
            //           //   accountEmail: Text("johndoe@email.com"),
            //             // currentAccountPicture: GestureDetector(
            //             //     child: CircleAvatar(
            //             //       backgroundImage: NetworkImage(mainProfilePic),
            //             //     ),
            //             //     onTap: () => print("Current User")
            //             // ),
            //
            //             //.. This line of code provides the usage of multiple accounts
            //             /* otherAccountsPictures: <Widget>[
            //     GestureDetector(
            //       onTap: ()=> switchUser(),
            //       child: CircleAvatar(
            //         backgroundImage: NetworkImage(otherProfilePic)
            //       ),
            //     ),
            //   ], */
            //
            //             // decoration: BoxDecoration(
            //             //   image: DecorationImage(
            //             //       fit: BoxFit.fill,
            //             //       image: NetworkImage("https://png.pngtree.com/thumb_back/fh260/background/20190828/pngtree-dark-vector-abstract-background-image_302715.jpg")
            //             //   ),
            //             // ),
            //          // ),
            //           SizedBox(
            //             height: 30,
            //           ),
            //           ListTile(
            //               title: Text("Home Page",
            //                 style: TextStyle(color: Colors.black,fontSize: 17),
            //               ),
            //               trailing: Icon(Icons.menu,
            //                 color: Colors.purple,
            //               ),
            //               onTap: () {
            //                 Navigator.of(context).pop();
            //                 // Navigator.of(context).push(new MaterialPageRoute(builder:
            //                 //     (BuildContext context) => OtherPage("Home Page"),
            //                 // ));
            //               }
            //           ),
            //
            //
            //
            //           ListTile(
            //               title: Text("Consumption Tally"),
            //               trailing: Icon(Icons.security),
            //               onTap: () {
            //                 Navigator.of(context).pop();
            //                 // Navigator.of(context).push(new MaterialPageRoute(builder:
            //                 //     (BuildContext context) => OtherPage("Settings Page"),
            //                 // ));
            //               }
            //           ),
            //           ListTile(
            //               title: Text("Internal Request",
            //                 style: TextStyle(color: Colors.black,fontSize: 17),),
            //               trailing: Icon(Icons.report,color: Colors.blueAccent,),
            //               onTap: () {
            //                 Navigator.of(context).pop();
            //                 // Navigator.of(context).push(new MaterialPageRoute(builder:
            //                 //     (BuildContext context) => OtherPage("Settings Page"),
            //                 // ));
            //               }
            //           ),
            //
            //
            //
            //           ListTile(
            //               title: Text("Stock Loss"),
            //               trailing: Icon(Icons.security),
            //               onTap: () {
            //                 Navigator.of(context).pop();
            //                 // Navigator.of(context).push(new MaterialPageRoute(builder:
            //                 //     (BuildContext context) => OtherPage("Settings Page"),
            //                 // ));
            //               }
            //           ),
            //
            //           ListTile(
            //               title: Text("Report"),
            //               trailing: Icon(Icons.security),
            //               onTap: () {
            //                 Navigator.of(context).pop();
            //                 // Navigator.of(context).push(new MaterialPageRoute(builder:
            //                 //     (BuildContext context) => OtherPage("Settings Page"),
            //                 // ));
            //               }
            //           ),
            //
            //           ListTile(
            //               title: Text("Sync",
            //                 style: TextStyle(color: Colors.black,fontSize: 17),
            //                 //textAlign:TextAlign.center,
            //               ),
            //               trailing: Icon(Icons.sync,
            //                 color: Colors.pink,
            //               ),
            //               onTap: () {
            //                 Navigator.of(context).pop();
            //                 // Navigator.of(context).push(new MaterialPageRoute(builder:
            //                 //     (BuildContext context) => OtherPage("About Page"),
            //                 // ));
            //               }
            //           ),
            //
            //           Divider(thickness: 1.0,),
            //           ListTile(
            //             title: Text("Log Out"),
            //             trailing: Icon(Icons.logout),
            //             //onTap: () => Navigator.of(context).pop(),
            //             onTap: (){
            //               Get.find<AuthService>().removeCurrentUser();
            //               Get.toNamed(Routes.LOGIN);
            //             },
            //
            //
            //           ),
            //         ],
            //       )
            //   ),
            // body: SingleChildScrollView(
            //     child: Container(
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           SizedBox(
            //             height: 30,
            //           ),
            //
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               Card(
            //                   margin: EdgeInsets.only(top: 30),
            //                   elevation: 5,
            //                   child:Container(
            //                     height: 110,
            //                     width: 180,
            //                     //padding: EdgeInsets.all(10),
            //                     decoration: BoxDecoration(
            //                       color: Colors.green,
            //                       border: Border.all(color: Colors.green),
            //                       borderRadius: BorderRadius.all(
            //                           Radius.circular(8.0) //                 <--- border radius here
            //                       ),
            //                     ),
            //                     child: Column(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       crossAxisAlignment: CrossAxisAlignment.center,
            //                       children: [
            //
            //                         Text("200",
            //                           style: TextStyle(color: Colors.white,fontSize: 25),
            //                           textAlign:TextAlign.center,
            //                         ),
            //                         SizedBox(
            //                           height: 15,
            //                         ),
            //                         Text("Today Serve",
            //                           style: TextStyle(color: Colors.white,fontSize: 17),
            //                           textAlign:TextAlign.center,
            //                         ),
            //                       ],
            //                     ),
            //                   )
            //               ),
            //               SizedBox(
            //                 width: 15,
            //               ),
            //               Card(
            //                   margin: EdgeInsets.only(top: 30),
            //                   elevation: 5,
            //                   child:Container(
            //                     height: 110,
            //                     width: 180,
            //                     //padding: EdgeInsets.all(10),
            //                     decoration: BoxDecoration(
            //                       color: Colors.red,
            //                       border: Border.all(color: Colors.red),
            //                       borderRadius: BorderRadius.all(
            //                           Radius.circular(8.0) //                 <--- border radius here
            //                       ),
            //                     ),
            //                     child: Column(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       crossAxisAlignment: CrossAxisAlignment.center,
            //                       children: [
            //
            //                         Text("20",
            //                           style: TextStyle(color: Colors.white,fontSize: 25),
            //                           textAlign:TextAlign.center,
            //                         ),
            //
            //                         SizedBox(
            //                           height: 15,
            //                         ),
            //
            //                         Text("Expiry Medicine",
            //                           style: TextStyle(color: Colors.white,fontSize: 17),
            //                           textAlign:TextAlign.center,
            //                         ),
            //
            //                       ],
            //                     ),
            //                   )
            //               ),
            //             ],
            //           ),
            //
            //           SizedBox(
            //             height: 30,
            //           ),
            //
            //           AspectRatio(
            //             aspectRatio: 1.7,
            //             child: Card(
            //               elevation: 0,
            //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            //               color: const Color(0xff2c4260),
            //               child: const _BarChart(),
            //             ),
            //           ),
            //
            //           Text("Weakly Consumption",
            //             style: TextStyle(color: Colors.black,fontSize: 17),
            //             textAlign:TextAlign.center,
            //           ),
            //
            //
            //         ],
            //
            //
            //       ),
            //     ),)

            body:Center(
              child: SingleChildScrollView(
                reverse: true,
                child:Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      // Container(
                      //   //height: 70,
                      //   padding: EdgeInsets.all(10),
                      //   //margin: EdgeInsets.all(3),
                      //   decoration: BoxDecoration(
                      //     color: Colors.blueAccent,
                      //     //border: Border.all(color: Colors.white),
                      //     borderRadius: BorderRadius.all(
                      //         Radius.circular(0.0) //                 <--- border radius here
                      //     ),
                      //   ),
                      //   child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                      //       crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      //     children: [
                      //       Container(
                      //         margin: EdgeInsets.only(left:20,top: 20),
                      //         height: 50,
                      //         width: 50,
                      //         child:CircleAvatar(
                      //           radius: 48, // Image radius
                      //           backgroundImage: NetworkImage('imageUrl'),
                      //         ) ,
                      //       ),
                      //
                      //       SizedBox(
                      //        width: 10,
                      //       ),
                      //       Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //          children: [
                      //            SizedBox(
                      //              height: 10,
                      //            ),
                      //            Text("Test User",
                      //              style: TextStyle(color: Colors.white,fontSize: 12),
                      //              textAlign:TextAlign.center,
                      //            ),
                      //
                      //            Text("Admin",
                      //              style: TextStyle(color: Colors.white,fontSize: 12),
                      //              textAlign:TextAlign.center,
                      //            ),
                      //          ],
                      //       ),
                      //
                      //
                      //
                      //     ],
                      //   ),
                      // ),

                      Container(
                        //padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          //color: Colors.green,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(
                              Radius.circular(0.0) //                 <--- border radius here
                          ),
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Card(
                            //   elevation: 0,
                            //   child:
                              GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.ITEM_DISPATCH);
                                  },
                                  child: Container(
                                    height: 75,
                                    width: 115,
                                    //padding: EdgeInsets.all(10),
                                    // decoration: BoxDecoration(
                                    //   //color: Colors.green,
                                    //   border: Border.all(color: Colors.red),
                                    //   borderRadius: BorderRadius.all(
                                    //       Radius.circular(8.0) //                 <--- border radius here
                                    //   ),
                                    // ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Icon(Icons.add_circle_outline,color: Colors.pink,),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Item Dispatch",
                                          style: TextStyle(color: Colors.black,fontSize: 10),
                                          textAlign:TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            //),

                            SizedBox(
                              width: 5,
                            ),
                            // Card(
                            //     elevation: 0,
                            //
                            //   child:
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.CONSUMPTION_TALLY);
                                },
                                child:Container(
                                  height: 75,
                                  width: 115,
                                  //padding: EdgeInsets.all(10),
                                  // decoration: BoxDecoration(
                                  //   //color: Colors.green,
                                  //   border: Border.all(color: Colors.red),
                                  //   borderRadius: BorderRadius.all(
                                  //       Radius.circular(8.0) //                 <--- border radius here
                                  //   ),
                                  // ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.security,color: Colors.pink,),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Consumption Tally",
                                        style: TextStyle(color: Colors.black,fontSize: 10),
                                        textAlign:TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )
                              ),

                            //),

                            SizedBox(
                              width: 5,
                            ),
                            // Card(
                            //     elevation: 0,
                              //child:
                              GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.INTERNAL_REQUEST);
                                  },
                                  child:Container(
                                    height: 75,
                                    width: 110,
                                    //padding: EdgeInsets.all(10),
                                    // decoration: BoxDecoration(
                                    //   //color: Colors.green,
                                    //   border: Border.all(color: Colors.red),
                                    //   borderRadius: BorderRadius.all(
                                    //       Radius.circular(8.0) //                 <--- border radius here
                                    //   ),
                                    // ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Icon(Icons.request_quote_outlined,color: Colors.pink,),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Internal Request",
                                          style: TextStyle(color: Colors.black,fontSize: 10),
                                          textAlign:TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  )
                              ),

                           // ),
                            // SizedBox(
                            //   width: 5,
                            // ),
                            // Card(
                            //     elevation: 0,
                            //     child:Container(
                            //       height: 75,
                            //       width: 110,
                            //       //padding: EdgeInsets.all(10),
                            //       // decoration: BoxDecoration(
                            //       //   //color: Colors.green,
                            //       //   border: Border.all(color: Colors.red),
                            //       //   borderRadius: BorderRadius.all(
                            //       //       Radius.circular(8.0) //                 <--- border radius here
                            //       //   ),
                            //       // ),
                            //       child: Column(
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         crossAxisAlignment: CrossAxisAlignment.center,
                            //         children: [
                            //
                            //           Icon(Icons.security,color: Colors.pink,),
                            //           SizedBox(
                            //             height: 5,
                            //           ),
                            //           Text("Stock Loss",
                            //             style: TextStyle(color: Colors.black,fontSize: 12),
                            //             textAlign:TextAlign.center,
                            //           ),
                            //         ],
                            //       ),
                            //     )
                            // ),

                          ],
                        ),
                      ),

                      SizedBox(
                        height: 0,
                      ),

                      Container(
                        //padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          //color: Colors.green,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(
                              Radius.circular(0.0) //                 <--- border radius here
                          ),
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Card(
                            //     elevation: 0,
                            //     child:
                            GestureDetector(
                                onTap: () {
                                  //print("Container was tapped");
                                  // Get.find<AuthService>().removeCurrentUser();
                                  // Get.toNamed(Routes.LOGIN);
                                },
                                child: Container(
                                  height: 75,
                                  width: 110,
                                  //padding: EdgeInsets.all(10),
                                  // decoration: BoxDecoration(
                                  //   //color: Colors.green,
                                  //   border: Border.all(color: Colors.red),
                                  //   borderRadius: BorderRadius.all(
                                  //       Radius.circular(8.0) //                 <--- border radius here
                                  //   ),
                                  // ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      Icon(Icons.report,color: Colors.pink,),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Report",
                                        style: TextStyle(color: Colors.black,fontSize: 10),
                                        textAlign:TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )
                            ),

                           // ),
                            SizedBox(
                              width: 5,
                            ),
                            // Card(
                            //     elevation: 0,
                            //     child:
                            GestureDetector(
                                onTap: () {
                                  controller.showCircle.value = true;
                                  controller.get_drug_list();
                                  //print("Container was tapped");
                                  // Get.find<AuthService>().removeCurrentUser();
                                  // Get.toNamed(Routes.LOGIN);
                                },
                                child: Container(
                                  height: 75,
                                  width: 110,
                                  //padding: EdgeInsets.all(10),
                                  // decoration: BoxDecoration(
                                  //   //color: Colors.green,
                                  //   border: Border.all(color: Colors.red),
                                  //   borderRadius: BorderRadius.all(
                                  //       Radius.circular(8.0) //                 <--- border radius here
                                  //   ),
                                  // ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      Icon(Icons.sync,color: Colors.pink,),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Sync",
                                        style: TextStyle(color: Colors.black,fontSize: 10),
                                        textAlign:TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )
                            ),

                            //),
                            SizedBox(
                              width: 5,
                            ),
                            // Card(
                            //   elevation: 0,
                            //   child:

                              GestureDetector(
                                  onTap: () {
                                    //print("Container was tapped");
                                    Get.find<AuthService>().removeCurrentUser();
                                    Get.toNamed(Routes.LOGIN);
                                  },
                                  child: Container(
                                    height: 75,
                                    width: 110,
                                    //padding: EdgeInsets.all(10),
                                    // decoration: BoxDecoration(
                                    //   //color: Colors.green,
                                    //   border: Border.all(color: Colors.red),
                                    //   borderRadius: BorderRadius.all(
                                    //       Radius.circular(8.0) //                 <--- border radius here
                                    //   ),
                                    // ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Icon(Icons.logout,color: Colors.pink,),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Log Out",
                                          style: TextStyle(color: Colors.black,fontSize: 10),
                                          textAlign:TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            //),

                          ],
                        ),
                      ),
                      Obx(() =>
                          Visibility(
                              visible: controller.showCircle.value,
                              child: CircularProgressIndicator(),
                            ),
                      ),


                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                              margin: EdgeInsets.only(top: 5),
                              elevation: 5,
                              child:Container(
                                height: 100,
                                width: 180,
                                //padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8.0) //                 <--- border radius here
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Text("200",
                                      style: TextStyle(color: Colors.white,fontSize: 25),
                                      textAlign:TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text("Today Serve",
                                      style: TextStyle(color: Colors.white,fontSize: 17),
                                      textAlign:TextAlign.center,
                                    ),
                                  ],
                                ),
                              )
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Card(
                              margin: EdgeInsets.only(top: 5),
                              elevation: 5,
                              child:Container(
                                height: 100,
                                width: 180,
                                //padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  border: Border.all(color: Colors.red),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8.0) //                 <--- border radius here
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Text("20",
                                      style: TextStyle(color: Colors.white,fontSize: 25),
                                      textAlign:TextAlign.center,
                                    ),

                                    SizedBox(
                                      height: 15,
                                    ),

                                    Text("Expiry Medicine",
                                      style: TextStyle(color: Colors.white,fontSize: 17),
                                      textAlign:TextAlign.center,
                                    ),

                                  ],
                                ),
                              )
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      AspectRatio(
                        aspectRatio: 1.7,
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          color: const Color(0xff2c4260),
                          child: const _BarChart(),
                        ),
                      ),

                      Text("Weekly Consumption",
                        style: TextStyle(color: Colors.black,fontSize: 12),
                        textAlign:TextAlign.center,
                      ),

                    ],

                  ),
                ) ,
              ),
            ),

          )

      );
    }
  }


class _BarChart extends StatelessWidget {
  const _BarChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
    enabled: false,
    touchTooltipData: BarTouchTooltipData(
      tooltipBgColor: Colors.transparent,
      tooltipPadding: const EdgeInsets.all(0),
      tooltipMargin: 8,
      getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
          ) {
        return BarTooltipItem(
          rod.toY.round().toString(),
          const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    ),
  );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Sun';
        break;
      case 1:
        text = 'Mon';
        break;
      case 2:
        text = 'Twe';
        break;
      case 3:
        text = 'Wed';
        break;
      case 4:
        text = 'Thu';
        break;
      case 5:
        text = 'Fri';
        break;
      case 6:
        text = 'Sat';
        break;
      default:
        text = '';
        break;
    }
    return Center(child: Text(text, style: style));
  }

  FlTitlesData get titlesData => FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTitlesWidget: getTitles,
      ),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    rightTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
  );

  FlBorderData get borderData => FlBorderData(
    show: false,
  );

  final _barsGradient = const LinearGradient(
    colors: [
      Colors.lightBlueAccent,
      Colors.greenAccent,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  List<BarChartGroupData> get barGroups => [
    BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(
          toY: 8,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(
          toY: 10,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(
          toY: 14,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(
          toY: 15,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 4,
      barRods: [
        BarChartRodData(
          toY: 13,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 5,
      barRods: [
        BarChartRodData(
          toY: 10,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),

    BarChartGroupData(
      x: 6,
      barRods: [
        BarChartRodData(
          toY: 8,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
  ];


}