//import 'package:bank_application/screens/constantwidgets/textFieldsconstant.dart';
import 'package:bank_application/screens/registerscreen.dart';
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
        backgroundColor: Colors.blue[200],
        centerTitle: true,
        title: const Text(
          'SIGN IN',
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
                    //-username either email or cellnumber
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'USERNAME',
                        labelStyle: TextStyle(
                          fontSize: textSize,
                          color: Colors.black26,
                        ),
                        hintText: 'USERNAME',
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
                      ),
                    ),
                    const SizedBox(height: 16.0),

                    const SizedBox(
                      height: 20,
                    ),

                    //Register button
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[200]),
                        onPressed: () {},
                        child: const Text(
                          'SIGN IN',
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
                        Text('Do not have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ));
                          },
                          child: Text(
                            "Register",
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
    );
  }
}
