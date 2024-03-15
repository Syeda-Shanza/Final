// import 'package:decoders/view/home_view.dart';
// import 'package:flutter/material.dart';
//
// class SelectionScreen extends StatefulWidget {
//   const SelectionScreen({super.key});
//
//   @override
//   State<SelectionScreen> createState() => _SelectionScreenState();
// }
//
// class _SelectionScreenState extends State<SelectionScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff3B5998),
//       body: Center(
//         child: Container(
//           width: 390,
//           height: 880,
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(40)),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => HomeView()),
//                   );
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: Color(0xff3B5998),
//                   ),
//                   width: 250,
//                   height: 100,
//                   padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
//                   child: Text(
//                     "Physical",
//                     style: TextStyle(color: Colors.white, fontSize: 30),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => HomeView()),
//                   );
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: Color(0xff3B5998),
//                   ),
//                   width: 250,
//                   height: 100,
//                   padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
//                   child: Text(
//                     "Online",
//                     style: TextStyle(color: Colors.white, fontSize: 30),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
