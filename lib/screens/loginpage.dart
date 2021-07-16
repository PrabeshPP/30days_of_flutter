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
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changed = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset("assets/images/log.png", fit: BoxFit.contain),
              SizedBox(
                height: 30,
              ),
              Text(
                "Welcome ${name != "" ? name + "!" : name}",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "username cannot be empty";
                        }

                        return null;
                      },
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password cannot be empty";
                        } else if (value.length < 6) {
                          return "password length should be at least six";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(changed ? 50 : 8),
                        child: InkWell(
                          onTap: () => moveToHome(context),
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
                          ),
                        )),
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
