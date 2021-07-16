import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = " ";
  bool changed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/log.png", fit: BoxFit.contain),
            SizedBox(
              height: 50,
            ),
            Text(
              "Welcome ${name != "" ? name + "!" : name}",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Column(
                children: [
                  TextFormField(
                    cursorColor: Colors.lightBlue,
                    decoration: InputDecoration(
                      labelText: "UserName",
                      hintText: "Enter Username",
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                        ),
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter Password",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide())),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        changed = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 50,
                      width: changed ? 50 : 120,
                      alignment: Alignment.center,
                      child: changed
                          ? Icon(
                              Icons.done,
                              color: Colors.pink,
                              size: 30,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius:
                              BorderRadius.circular(changed ? 50 : 8)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
