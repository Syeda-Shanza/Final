// import 'package:flutter/material.dart';
//
// class UserDetailsScreen extends StatefulWidget {
//   const UserDetailsScreen({super.key});
//
//   @override
//   State<UserDetailsScreen> createState() => _UserDetailsScreenState();
// }
//
// class _UserDetailsScreenState extends State<UserDetailsScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _nameController = TextEditingController();
//   final _userTitleController = TextEditingController();
//   final phoneController = TextEditingController();
//   final urlController = TextEditingController();
//   final descriptionController = TextEditingController();
//   final cvController = TextEditingController();
//   final groupMembersController = TextEditingController();
//   final linkedinUrlController = TextEditingController();
//   final screenshotsController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.only(top: 50),
//         child: SingleChildScrollView(
//           child: Center(
//             child: Container(
//               padding: EdgeInsets.all(20.0),
//               decoration: BoxDecoration(
//                 shape: BoxShape.rectangle,
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16.0),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black,
//                     offset: Offset(0, 10),
//                     blurRadius: 10.0,
//                   ),
//                 ],
//               ),
//               child: Form(
//                 key: _formKey,
//
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Name'),
//                       controller: _nameController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Enter Name here';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'User Title'),
//                       controller: _userTitleController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Enter Title here';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Email'),
//                       controller: _emailController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Enter Email here';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Phone No'),
//                       controller: phoneController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Enter Phone no here';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Project URL'),
//                       controller: urlController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Enter Project URL here';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Project Description'),
//                       controller: descriptionController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Enter Description here';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'CV'),
//                       controller: _nameController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Upload CV';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Name'),
//                       controller: _nameController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Enter Name here';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Group Members'),
//                       controller: groupMembersController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Enter Members name';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Linkedin'),
//                       controller: linkedinUrlController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Enter Linkedin URL here';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 20,),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Screenshots'),
//                       controller: screenshotsController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Enter Project Screenshots here';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Add your submit button logic here
//                         Navigator.of(context).pop(); // Close the dialog
//                       },
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF003366)),
//                       ),
//                       child: Text(
//                         'Submit',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                         FirebaseFirestore firebaseFirestore =
//                     FirebaseFirestore.instance;
//                     await firebaseFirestore
//                         .collection('users')
//                         .doc(userCredentials.user!.uid)
//                         .set({
//                       'name': _nameController.text.trim(),
//                       'mobile': _mobileController.text.trim(),
//                       'email': _emailController.text.trim(),
//                       'created on': DateTime.now()
//                           .microsecondsSinceEpoch,
//                       'photo': null,
//                     });
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
