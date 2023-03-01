
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hostel_management_system1/Dashboard/main_page.dart';

import 'home_page.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn);
  final Future<void> Function(
      String email,
      String password,
      String username,
      bool isLogin,
      ) submitFn;
  // const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin=false;
  var _userEmail='';
  var _userName='';
  var _userPassword='';
  void _trySubmit() async {
    final isValid= _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if(isValid){
      _formKey.currentState!.save();
      try{

        await widget.submitFn(
          _userEmail.trim(),
          _userPassword.trim(),
          _userName.trim(),
          _isLogin
        );
      }catch(e){
        print(e);
        ScaffoldMessenger.of(context).
        showSnackBar(SnackBar(content: Text(e.toString())));
        return;
      }

    } else{
      _isLogin=false;
    }
    if(_isLogin){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>MainPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (value){
                      if(value == null || value.isEmpty || !value.contains('@')){
                        return'please enter a valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email address",
                    ),
                    onSaved:(value){
                      _userEmail=value!;
                    },
                  ),
                  if(!_isLogin)
                    TextFormField(
                      key: ValueKey('username'),
                      validator: (value){
                        if (value == null || value.isEmpty || value.length<4){
                          return'username must be at least 4 character long';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Username"
                      ),
                      onSaved:(value){
                        _userName=value!;
                      },
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value){
                      if(value == null || value.isEmpty||value.length<8){
                        return "password must be at least 8 character long";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                    obscureText:true,
                    onSaved:(value){
                      _userPassword=value!;
                    },
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                      onPressed: _trySubmit,
                      child: Text(_isLogin? 'login':'SignUp')),
                  TextButton(
                      onPressed: (
                          ){
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(_isLogin? "Create new account":"I already have an account"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
