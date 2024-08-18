import 'package:flutter/material.dart';
import 'package:ingredient_cooker/features/presentation/pages/Auth_Pages/opt_verify.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class forgot_Password extends StatelessWidget {
  const forgot_Password({super.key});

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: SizedBox(
          height: 350,
          width: 350,
          child: Lottie.asset('assets/animation/sent.json')),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover)),
        child: SafeArea(
          child: Stack(children: [
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
                    height: 450,
                    width: 300,
                  ),
                  Positioned(
                    top: -30,
                    right: 30,
                    left: 30,
                    child: Hero(
                      tag: 'click me',
                      child: SizedBox(
                          height: 250,
                          width: 250,
                          child: Lottie.asset('assets/animation/forgot.json')),
                    ),
                  ),
                  const Positioned(
                    top: 100 * 2,
                    right: 30,
                    left: 30,
                    child: Text(
                      "Please Enter a Email Address To\n  Recieve a Verification Code",
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100 * 2.5,
                    right: 20,
                    left: 20,
                    child: SizedBox(
                      height: 80,
                      // width: 200,
                      child: TextFormField(
                        validator: (value) {
                          bool emailValid = RegExp(
                                  r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                              .hasMatch(value!);
                          if (value.isEmpty) {
                            return "Enter Email Address";
                          }
                        },
                        style: const TextStyle(
                            fontFamily: 'Comfortaa', fontSize: 13),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_rounded,
                            size: 30,
                          ),
                          labelText: "Email",
                          labelStyle: const TextStyle(
                            fontFamily: 'Comfortaa',
                          ),
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(12, 154, 97, 1))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(12, 154, 97, 1))),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100 * 3.3,
                    right: 20,
                    left: 20,
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          showLoaderDialog(context);
                          Future.delayed(const Duration(seconds: 5), () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const OTP_Verify(),
                                ));
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(12, 154, 97, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        child: const Text(
                          "Send",
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
          ]),
        ),
      ),
    );
  }
}
