import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hostel_management_system1/Dashboard/my_page.dart';
import 'auth_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class AuthScreen extends StatefulWidget {
  // const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  bool isLogin=true;

  Future<void> _submitAuthForm(
      String email,
      String password,
      String username,
      bool islogin,
      ) async{
    UserCredential userCredential;
    try {
      print(islogin);
      if (islogin) {
        userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyPage()));
      } else {
        userCredential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("registration successfull"),
              backgroundColor: Colors.green,));

        final data = {"username": username, "email": email,"password":password};

        users.add(data).then((documentSnapshot) =>
            print("Added Data with ID: ${documentSnapshot.id}"));
      }

    } on PlatformException catch(err){
      String? message = "An error occurred, please check your credentials";
      if(err.message!=null){
        message = err.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message!),
            backgroundColor: Colors.red,
          )
      );
    }catch(err){
      print(err);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("error login! check your credentials"),
            backgroundColor: Colors.red,
          )
      );
      rethrow;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body:AuthForm(_submitAuthForm ),
    );
  }
}


