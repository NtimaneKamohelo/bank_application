//import 'package:bank_application/screens/constantwidgets/textFieldsconstant.dart';
import 'dart:ffi';

import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  double textSize = 12;
  double hintTextSize = 12;

  //Hide the password
  bool obscureTextController = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text(
          'REGISTER',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: [
                    //-First Name
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'FIRSTNAME',
                        labelStyle: TextStyle(
                          fontSize: textSize,
                          color: Colors.black26,
                        ),
                        hintText: 'FIRSTNAME',
                        hintStyle: TextStyle(
                          fontSize: hintTextSize,
                          color: Colors.black12,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),

                    //Last Name
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'LASTNAME',
                        labelStyle: TextStyle(
                          fontSize: textSize,
                          color: Colors.black26,
                        ),
                        hintText: 'LASTNAME',
                        hintStyle: TextStyle(
                          fontSize: hintTextSize,
                          color: Colors.black12,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),

                    //-Email address
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                          fontSize: textSize,
                          color: Colors.black26,
                        ),
                        hintText: 'EMAIL',
                        hintStyle: TextStyle(
                          fontSize: hintTextSize,
                          color: Colors.black12,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),

                    //-Email address
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'CELL NUMBER',
                        labelStyle: TextStyle(
                          fontSize: textSize,
                          color: Colors.black26,
                        ),
                        hintText: 'CELLNUMBER',
                        hintStyle: TextStyle(
                          fontSize: hintTextSize,
                          color: Colors.black12,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),

                    //-PASSWORD
                    TextField(
                      //hide the password
                      obscureText: obscureTextController,
                      decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                          fontSize: textSize,
                          color: Colors.black26,
                        ),
                        hintText: 'PASSWORD',
                        hintStyle: TextStyle(
                          fontSize: hintTextSize,
                          color: Colors.black12,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Colors.blueGrey,
                        ),
                        //obscure entered password
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscureTextController = !obscureTextController;
                            });
                          },
                          child: obscureTextController
                              ? Icon(Icons.visibility_off_outlined)
                              : Icon(Icons.visibility_outlined),
                        ),

                        /*suffixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.blueGrey,
                        ),*/
                      ),
                    ),
                    const SizedBox(height: 16.0),

                    //-CONFIRM PASSWORD
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'CONFIRM PASSWORD',
                        labelStyle: TextStyle(
                          fontSize: textSize,
                          color: Colors.black26,
                        ),
                        hintText: 'CONFIRM PASSWORD',
                        hintStyle: TextStyle(
                          fontSize: hintTextSize,
                          color: Colors.black12,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Colors.blueGrey,
                        ),
                        suffixIcon: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
