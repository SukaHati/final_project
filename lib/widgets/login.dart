import 'package:final_project/widgets/register.dart';
import 'package:flutter/material.dart';
import 'package:final_project/widgets/home.dart';

class LoginPage extends StatelessWidget {
  final userEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page")
      ),
      body: Column(
        children: [
          TextField(decoration: InputDecoration(hintText: "username/email"), controller: userEditingController,),
          TextField(decoration: InputDecoration(hintText: "password"), controller: passwordEditingController, obscureText: true,),
          SizedBox(height: 8),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
          }, child: Text("Login")),
          SizedBox(height: 10),
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
          }, child: Text("No account? Register Now!"))
        ],
      ),
    );
  }
}
