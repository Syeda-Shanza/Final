import 'package:flutter/material.dart';
class StudentsList extends StatefulWidget {
  const StudentsList({super.key});

  @override
  State<StudentsList> createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          title: Text('App Development (Physical)',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Color(0xff3B5998),
        ),
        body: ListView.builder(
            itemCount: 15, // Replace with the actual number of contacts
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 2.0,
                  color: Color(0xff3B5998),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(8.0),
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage('',),
                    ),
                    trailing: Text('grouped or ungrouped',style: TextStyle(color: Colors.white),),
                    title: Text('Student Name',style: TextStyle(color: Colors.white),),
                    subtitle: Text('Project Name',style: TextStyle(color: Colors.white),),
                    onTap: () {
                      // Implement chat screen navigation
                    },
                  ),
                ),
              );
            },
            ),
        );
    }
}
