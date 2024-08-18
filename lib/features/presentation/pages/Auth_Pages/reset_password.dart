// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Reset_Password extends StatefulWidget {
  const Reset_Password({super.key});

  @override
  State<Reset_Password> createState() => _Reset_PasswordState();
}

class _Reset_PasswordState extends State<Reset_Password> {
  final double _height = 55;
  final double _width = 250;
  final TextEditingController _Passwd = TextEditingController();
  final TextEditingController _ConfirmPasswd = TextEditingController();

  // Password Visible and non visible
  bool _passwordVisible = false;
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
      _passwordVisible = !_passwordVisible;
    });
  }

  // initial state of password
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          elevation: 0,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(children: [
              Container(
                height: 750,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/bg.jpg',
                        ),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurStyle: BlurStyle.outer,
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  )
                                ]),
                            height: 500,
                            width: 300,
                          ),
                          Positioned(
                            top: 10,
                            right: 30,
                            left: 30,
                            child: SizedBox(
                                height: 150,
                                width: 150,
                                child: Lottie.asset(
                                    'assets/animation/reset.json')),
                          ),
                          const Positioned(
                              top: 100 * 1.7,
                              left: 30,
                              child: Text(
                                'Your Password must be different\n from previously used password',
                                style: TextStyle(
                                    fontFamily: 'Comfortaa', fontSize: 14),
                              )),

                          // Password here
                          Positioned(
                            top: 100 * 2.5,
                            left: 20,
                            right: 20,
                            child: SizedBox(
                              width: _width,
                              height: _height,
                              child: TextFormField(
                                  style: const TextStyle(
                                      fontFamily: 'Comfortaa', fontSize: 13),
                                  controller: _Passwd,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    prefixIcon:
                                        const Icon(Icons.fingerprint_rounded),
                                    suffixIcon: IconButton(
                                        onPressed: () => _toggle(),
                                        icon: Icon(_passwordVisible
                                            ? Icons.visibility_off_rounded
                                            : Icons.remove_red_eye_rounded)),
                                    hintText: "Password",
                                    hintStyle: const TextStyle(
                                      fontFamily: 'Comfortaa',
                                    ),
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                12, 154, 97, 1))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                12, 154, 97, 1))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                12, 154, 97, 1))),
                                  )),
                            ),
                          ),

                          // Confirm Password here
                          Positioned(
                            top: 100 * 3.1,
                            left: 20,
                            right: 20,
                            child: SizedBox(
                              width: _width,
                              height: _height,
                              child: TextFormField(
                                  style: const TextStyle(
                                      fontFamily: 'Comfortaa', fontSize: 13),
                                  controller: _ConfirmPasswd,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.fingerprint_rounded),
                                    suffixIcon: IconButton(
                                        onPressed: () => _toggle(),
                                        icon: Icon(_passwordVisible
                                            ? Icons.visibility_off_rounded
                                            : Icons.remove_red_eye_rounded)),
                                    hintText: "Confirm Password",
                                    hintStyle: const TextStyle(
                                      fontFamily: 'Comfortaa',
                                    ),
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                12, 154, 97, 1))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                12, 154, 97, 1))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                12, 154, 97, 1))),
                                  )),
                            ),
                          ),
                          Positioned(
                            top: 100 * 3.9,
                            right: 20,
                            left: 20,
                            child: SizedBox(
                              width: 200,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(12, 154, 97, 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                child: const Text(
                                  "Reset Password",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Comfortaa',
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
