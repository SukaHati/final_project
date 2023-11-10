import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final usernameEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page")
      ),
      body: Column(
        children: [
          TextField(decoration: InputDecoration(hintText: "username"), controller: usernameEditingController,),
          TextField(decoration: InputDecoration(hintText: "password"), controller: passwordEditingController, obscureText: true,),
          SizedBox(height: 8,),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("Register"))
        ],
      ),
    );
  }
}
