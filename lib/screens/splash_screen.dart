// // ignore_for_file: prefer_const_constructors

// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
// import 'home_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Color.fromARGB(255, 52, 79, 161),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 52, 79, 161),
//         elevation: 0,
//         // title: Text(
//         //   "To-do",
//         //   style: TextStyle(
//         //       fontSize: 17,
//         //       color: Color.fromARGB(255, 120, 148, 226),
//         //       fontWeight: FontWeight.bold),
//         // ),
//         // centerTitle: true,
//         leading: IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.menu_rounded,
//               size: 25,
//               color: Color.fromARGB(255, 120, 148, 226),
//             )),
//         actions: [
//           IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.search_rounded,
//                 size: 25,
//                 color: Color.fromARGB(255, 120, 148, 226),
//               )),
//           IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.notifications_none_rounded,
//                 size: 25,
//                 color: Color.fromARGB(255, 120, 148, 226),
//               )),
//         ],
//       ),
//       body: Stack(children: [
//         ListView(
//           children: [
//             Container(
//               margin: EdgeInsets.only(left: width * 0.05, top: height * 0.03),
//               child: Text(
//                 "My Tasks",
//                 style: TextStyle(
//                     fontSize: 30,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(height: height * 0.04),
//             Container(
//               margin: EdgeInsets.only(
//                   left: width * 0.05,
//                   right: width * 0.05,
//                   bottom: height * 0.02),
//               // height: height * 0.08,
//               // width: width,
//               child: ListTile(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 tileColor: Color.fromARGB(255, 4, 26, 85),
//                 contentPadding: EdgeInsets.only(left: width * 0.04),
//                 leading: Icon(
//                   Icons.circle_outlined,
//                   size: 25,
//                   color: Color.fromARGB(255, 234, 5, 255),
//                 ),
//                 title: Text(
//                   "My today task ",
//                   style: TextStyle(
//                       // decorationColor: Color.fromARGB(255, 234, 5, 255),
//                       // decoration: TextDecoration.lineThrough,
//                       // decorationStyle: TextDecorationStyle.double,
//                       color: Color.fromARGB(255, 125, 137, 167),
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Text(
//                   "01-22-2022 ",
//                   style: TextStyle(
//                       decoration: TextDecoration.lineThrough,
//                       color: Color.fromARGB(255, 125, 137, 167),
//                       // fontSize: 15,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 trailing: IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.arrow_forward_ios_rounded,
//                       size: 25,
//                       color: Color.fromARGB(255, 234, 5, 255),
//                     )),
//               ),
//             ),
//           ],
//         ),
//         // Expanded(child: Center()),
//         Container(
//           margin: EdgeInsets.only(right: width * 0.05, bottom: height * 0.05),
//           alignment: Alignment.bottomRight,
//           child: FloatingActionButton(
//             elevation: 0,
//             onPressed: () {
//               showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text(
//                         "Add Task",
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold),
//                       ),
//                       backgroundColor: Color.fromARGB(255, 52, 79, 161),
//                       // scrollable: true,
//                       content: Container(
//                         height: height * 0.25,
//                         child: Column(
//                           children: [
//                             TextFormField(
//                               keyboardType: TextInputType.text,
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16),
//                               decoration: InputDecoration(
//                                   labelText: "Tittle",
//                                   labelStyle: TextStyle(
//                                       color:
//                                           Color.fromARGB(255, 120, 148, 226)),
//                                   enabledBorder: UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                           width: 1,
//                                           color: Color.fromARGB(
//                                               255, 120, 148, 226))),
//                                   focusedBorder: UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                           width: 1,
//                                           color: Color.fromARGB(
//                                               255, 120, 148, 226)))),
//                             ),
//                             TextFormField(
//                               keyboardType: TextInputType.text,
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16),
//                               decoration: InputDecoration(
//                                   labelText: "Description",
//                                   labelStyle: TextStyle(
//                                       color:
//                                           Color.fromARGB(255, 120, 148, 226)),
//                                   enabledBorder: UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                           width: 1,
//                                           color: Color.fromARGB(
//                                               255, 120, 148, 226))),
//                                   focusedBorder: UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                           width: 1,
//                                           color: Color.fromARGB(
//                                               255, 120, 148, 226)))),
//                             ),
//                             TextFormField(
//                               keyboardType: TextInputType.none,
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                               decoration: InputDecoration(
//                                   suffixIcon: Icon(
//                                     Icons.calendar_today_rounded,
//                                     size: 25,
//                                     color: Color.fromARGB(255, 120, 148, 226),
//                                   ),
//                                   hintText: "Select Date",
//                                   hintStyle: TextStyle(
//                                       color:
//                                           Color.fromARGB(255, 120, 148, 226)),
//                                   enabledBorder: UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                           width: 1,
//                                           color: Color.fromARGB(
//                                               255, 120, 148, 226))),
//                                   focusedBorder: UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                           width: 1,
//                                           color: Color.fromARGB(
//                                               255, 120, 148, 226)))),
//                             ),
//                           ],
//                         ),
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () {},
//                           child: Text(
//                             "Cancel",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: () {},
//                           child: Text(
//                             "Submit",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     );
//                   });
//             },
//             backgroundColor: Color.fromARGB(255, 234, 5, 255),
//             tooltip: "add task",
//             child: Icon(
//               Icons.add,
//               size: 30,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }
// // FloatingActionButton(
// //             onPressed: () {},
// //             backgroundColor: Color.fromARGB(255, 234, 5, 255),

// //             tooltip: "add task",
// //             child: Icon(
// //               Icons.add,
// //               size: 30,
// //               color: Colors.white,
// //             ),
// //           ),
