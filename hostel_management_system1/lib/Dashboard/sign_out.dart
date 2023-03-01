import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LogOut extends StatefulWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    Future<void> LogOut() async {
      await _auth.signOut();
    }
    return const Placeholder();
  }
}
