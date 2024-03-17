import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'auth/login_view.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  DocumentSnapshot? userSnapshot;
  File? choosenImage;
  bool showLocalImage = false;

  pickImageFrom(ImageSource imageSource) async {
    XFile? xFile = await ImagePicker().pickImage(source: imageSource);
    if (xFile == null) return;
    setState(() {
      choosenImage = File(xFile.path);
      showLocalImage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff3B5998),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              children: [
                Text(
                  userSnapshot?['name'] ?? '', // Accessing name with null check
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 220),
                Icon(Icons.logout, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data?.docs;
          if (docs == null || docs.isEmpty) {
            return Center(child: Text('No user data available'));
          }

          final userSnapshot = docs.first;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(''),
                      // backgroundImage: showLocalImage
                      //     ? FileImage(choosenImage!)
                      //     : (userSnapshot!['photo'] == null
                      //     ? null
                      //     : NetworkImage(userSnapshot!['photo']!))
                    ),
                    Positioned(
                      right: -20,
                      bottom: -20,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () async {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading: Icon(Icons.camera_alt),
                                      title: Text('From Camera'),
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        pickImageFrom(ImageSource.camera);
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.photo),
                                      title: Text('From Gallery'),
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        pickImageFrom(ImageSource.gallery);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            size: 30,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '${userSnapshot['name'] ?? ''}',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
              Text('Flutter Dev'),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 10, right: 10, bottom: 10),
                child: Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 500,
                        width: 400,
                        decoration: BoxDecoration(
                            color: Color(0xff3B5998),
                            borderRadius: BorderRadius.circular(30)),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ListTile(
                                tileColor: Colors.white,
                                title: Text('Mobile Number',
                                    style: TextStyle(color: Colors.white)),
                                subtitle: Text('${userSnapshot['mobile']}',
                                    style: TextStyle(color: Colors.white)),
                                leading: Icon(Icons.phone, color: Colors.white),
                              ),
                              ListTile(
                                tileColor: Colors.white,
                                title: Text('Email',
                                    style: TextStyle(color: Colors.white)),
                                subtitle: Text('${userSnapshot['email']}',
                                    style: TextStyle(color: Colors.white)),
                                leading: Icon(Icons.mail, color: Colors.white),
                              ),
                              ListTile(
                                tileColor: Colors.white,
                                title: Text('Group By',
                                    style: TextStyle(color: Colors.white)),
                                subtitle: Text('Kainat Batool,Shanza Batool',
                                    style: TextStyle(color: Colors.white)),
                                leading: Icon(Icons.group, color: Colors.white),
                              ),
                              ListTile(
                                tileColor: Colors.white,
                                title: Text('Project',
                                    style: TextStyle(color: Colors.white)),
                                subtitle: Text('Github Link',
                                    style: TextStyle(color: Colors.white)),
                                leading: Icon(Icons.link, color: Colors.white),
                              ),
                              ListTile(
                                tileColor: Colors.white,
                                title: Text('Screenshots',
                                    style: TextStyle(color: Colors.white)),
                                subtitle: Text('Sample pics',
                                    style: TextStyle(color: Colors.white)),
                                leading: Icon(Icons.photo, color: Colors.white),
                              ),
                              ListTile(
                                tileColor: Colors.white,
                                title: Text('Joined On',
                                    style: TextStyle(color: Colors.white)),
                                subtitle: Text('${userSnapshot['created on']}',
                                    style: TextStyle(color: Colors.white)),
                                leading: Icon(Icons.star_rounded,
                                    color: Colors.white),
                              ),
                              ListTile(
                                onTap: () {
                                  showDialog(
                                    barrierDismissible: true,
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Confirm'),
                                        content: Text(
                                          'Are you sure do you want to logout',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('No')),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                FirebaseAuth.instance.signOut();
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                LoginView()));
                                              },
                                              child: Text('Yes')),
                                        ],
                                      );
                                    },
                                  );
                                },
                                tileColor: Colors.white,
                                title: Text('Logout',
                                    style: TextStyle(color: Colors.white)),
                                subtitle: Text('↪',
                                    style: TextStyle(color: Colors.white)),
                                leading:
                                    Icon(Icons.logout, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
