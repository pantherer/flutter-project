import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management_system1/auth_form.dart';
import 'package:hostel_management_system1/auth_screen.dart';
import 'package:hostel_management_system1/landing_page.dart';
class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late var name = TextEditingController();
  late var useremail = TextEditingController();

  final _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  User? currentuser = FirebaseAuth.instance.currentUser;

  Future<void> LogOut() async {
    await _auth.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (_) => AuthScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // StreamBuilder(
        //   stream: users.snapshots(),
        //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        //     if(!snapshot.hasData){
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //     return ListView(
        //       children: snapshot.data!.docs.map(document){
        //         return container(
        //         child: Center(child:Text(document['text'])),
        //         );
        //     }).toList(),
        //   }
        // ),
        StreamBuilder<DocumentSnapshot>(
          stream: users.doc(currentuser?.uid).snapshots(),
            builder: (ctx,streamSnapshot){
              if(streamSnapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              }
              // print(name);
              return Column(
                children: [
                  // name=streamSnapshot.data!['username'],
                  // useremail = streamSnapshot.data!['email'],
                  Center(
                    child: TextFormField(
                    key: ValueKey(name),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "sagar vai",
                      ),
                    ),
                  ),
                  Center(
                    child: TextFormField(
                      key: ValueKey(useremail),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "sagar1@gmail.com",
                      ),
                    ),
                  ),
                ],
              );

            }
        ),

        ElevatedButton(
            onPressed: (){},
            child: Text("Update")),
        ElevatedButton(
            onPressed: LogOut,
            child: Text("LogOut")),


      ],
    );
  }
}
