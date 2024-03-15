import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({super.key});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff3B5998),
        body: Center(
            child: Container(
              width: 390,
              height: 880,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                          'https://media.licdn.com/dms/image/C4E03AQHVnTD2UDZ4wg/profile-displayphoto-shrink_800_800/0/1661858821047?e=1715212800&v=beta&t=tZDq8zb4DlMxNY3FX9JYdYn9_4qRwobATdJ4fO3tf34'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Kainat Batool',
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                    Text(
                        'Software Engineer| UI/UX Designer| \n             Wordpress Developer'),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Decoders',
                            style:
                            TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(Color(0xff3B5998)),
                            ),
                            onPressed: () {},
                            child: Text(
                              'view Project',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 370.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff3B5998), // Set the border color here
                          width: 4.0, // Set the border width here
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Decoders is a versatile mobile app designed to unite students from four distinct courses from both online and physical batches: Mobile App Development, Data Analytics, Cloud Computing, and E-commerce. This centralized platform serves as a comprehensive hub where students can effortlessly create detailed profiles, sharing their projects, GitHub links, CVs, course experiences, and remarks. Beyond individual profiles, Decoders encourages collaborative learning by providing students with a space to submit and showcase their latest projects, fostering knowledge exchange and inspiration across  diverse domains. The app facilitates cross-course collaboration, allowing learners to engage with a vibrant  community spanning Mobile App Development, Data Analytics, Cloud Computing, and E-commerce programs. Reviews and feedback features empower both students and instructors to contribute valuable insights, enhancing the  overall learning experience. With a user-friendly interface and detailed course overviews tailored to physical and online batches'),
                          )),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Screenshots',
                      style:
                      TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 20,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Image.asset('assets/1.jpg',
                            width: 150,
                            height: 200,
                          ),
                          Image.asset('assets/2.jpg',
                            width: 150,
                            height: 200,
                          ),
                          Image.asset('assets/3.jpg',
                            width: 150,
                            height: 200,
                          ),
                          Image.asset('assets/4.jpg',
                            width: 150,
                            height: 200,
                          ),
                          Image.asset('assets/5.jpg',
                            width: 150,
                            height: 200,
                          ),
                          Image.asset('assets/6.jpg',
                            width: 150,
                            height: 200,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Group By',
                      style:
                      TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
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
                          trailing: TextButton(onPressed: (){},child: Text('View Profile',style: TextStyle(color: Colors.white),)),
                          title: Text('Student Name',style: TextStyle(color: Colors.white),),
                          onTap: () {
                            // Implement chat screen navigation
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
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
                          trailing: TextButton(onPressed: (){},child: Text('View Profile',style: TextStyle(color: Colors.white),)),
                          title: Text('Student Name',style: TextStyle(color: Colors.white),),
                          onTap: () {
                            // Implement chat screen navigation
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Socials',
                      style:
                      TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        elevation: 2.0,
                        color: Color(0xff3B5998),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(8.0),
                          leading: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.SSfKl_2LR-Hte2wcuCWo5AHaHa?rs=1&pid=ImgDetMain',),
                          ),
                          trailing: TextButton(onPressed: (){},child:Icon(Icons.link,color: Colors.white,),),
                          title: Text('View Resume',style: TextStyle(color: Colors.white),),
                          onTap: () {
                            // Implement chat screen navigation
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        elevation: 2.0,
                        color: Color(0xff3B5998),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(8.0),
                          leading: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.g2N0g_-wSQGmWjQ6lpGA3gAAAA?w=384&h=384&rs=1&pid=ImgDetMain',),
                          ),
                          trailing: TextButton(onPressed: (){},child:Icon(Icons.link,color: Colors.white,),),
                          title: Text('Lets Connect',style: TextStyle(color: Colors.white),),
                          onTap: () {
                            // Implement chat screen navigation
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        elevation: 2.0,
                        color: Color(0xff3B5998),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(8.0),
                          leading: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage('https://img.freepik.com/premium-vector/mail-icon-closed-envelope-blue-circle-message-symbol-vector-illustration-eps-10-stock-image_756957-2113.jpg',),
                          ),
                          title: Text('kainatbatool009@gmail.com',style: TextStyle(color: Colors.white),),
                          onTap: () {
                            // Implement chat screen navigation
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        elevation: 2.0,
                        color: Color(0xff3B5998),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(8.0),
                          leading: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage('https://media.istockphoto.com/id/1255936969/vector/telephone-receiver-phone-pictogram-icon-isolated-on-a-white-background.jpg?s=612x612&w=0&k=20&c=rRLWVvkxtmpfs1oVhsYm5zalbP2xRm7wY245uDh3haw=',),
                          ),
                          title: Text('03350655554',style: TextStyle(color: Colors.white),),
                          onTap: () {
                            // Implement chat screen navigation
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ),
        );
    }
}
