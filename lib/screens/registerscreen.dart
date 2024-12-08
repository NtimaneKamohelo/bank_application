import 'dart:convert';

import 'package:bank_application/screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  double textSize = 12;
  double hintTextSize = 12;
  //Hide the password
  bool obscureTextController = true;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cellNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  //connect the page to the database
  Future<void> register() async {
    //Matching password
    if (passwordController.text != confirmPasswordController.text) {
      //Show error message if passwords do not match
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    if (firstNameController.text != "" || lastNameController.text != "" || idNumberController.text != "" || emailController != "" || cellNumberController.text != "" || passwordController.text != "")
    {
      try{
        String uri = "http://127.0.0.1/php_api/insert_record.php";
        var res = await http.post(Uri.parse(uri), body: {
          'fistName': firstNameController.text,
          'lastName': lastNameController.text,
          'idNumber': idNumberController.text,
          'email': emailController.text,
          'cellNumber': cellNumberController.text,
          'password': passwordController.text,
        });

        var response = jsonDecode(res.body);
        if (response["success"] == "true") {  
          print("record inserted");
        }
        else {
          print("Some issues");
        }
      }
      catch(e) {
        print(e);
      }
    }
    else {
      print("Please fill all fields");
    }

    /**final response = await http.post(
      Uri.parse('http://127.0.0.1:3000/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'fistName': firstNameController.text,
        'lastName': lastNameController.text,
        'idNumber': idNumberController.text,
        'email': emailController.text,
        'cellNumber': cellNumberController.text,
        'password': passwordController.text,
      }),
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['Success']) {
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Account registered successful')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${response.statusCode}')),
      );
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        centerTitle: true,
        title: const Text(
          'REGISTER',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                        controller: firstNameController,
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
                        controller: lastNameController,
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

                      //-ID NUMBER
                      TextField(
                        controller: idNumberController,
                        decoration: InputDecoration(
                          labelText: 'ID NUMBER',
                          labelStyle: TextStyle(
                            fontSize: textSize,
                            color: Colors.black26,
                          ),
                          hintText: 'ID NUMBER',
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

                      //-Email address
                      TextField(
                        controller: emailController,
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

                      //-cell number
                      TextField(
                        controller: cellNumberController,
                        decoration: InputDecoration(
                          labelText: 'CELL NUMBER',
                          labelStyle: TextStyle(
                            fontSize: textSize,
                            color: Colors.black26,
                          ),
                          hintText: 'CELL NUMBER',
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
                        controller: passwordController,
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
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      //-CONFIRM PASSWORD
                      TextField(
                        controller: confirmPasswordController,
                        obscureText: obscureTextController,
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
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      //Register button
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[200]),
                          onPressed: register,
                          child: const Text(
                            'REGISTER',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      //Do you have an Account?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Do you have an account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Loginscreen(),
                                  ));
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
