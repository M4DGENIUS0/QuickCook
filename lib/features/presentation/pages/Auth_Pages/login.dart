// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:ingredient_cooker/features/presentation/pages/Auth_Pages/forgot_passwd.dart';
import 'package:ingredient_cooker/features/presentation/pages/Auth_Pages/sign_up.dart';
import 'package:ingredient_cooker/features/presentation/pages/utils/assets.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/Login_Provider.dart';
import 'package:provider/provider.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  bool loading = false;
  final double _height = 55;
  final double _width = 250;
  final TextEditingController _Email = TextEditingController();
  final TextEditingController _Passwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Login_Pov = Provider.of<Login_Screen_Provider>(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Stack(children: [
          Container(
            height: 750,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      assets.bg,
                    ),
                    fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
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
                        height: 350,
                        width: 300,
                      ),
                      const Positioned(
                        top: 30,
                        left: 30,
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "LOGIN\n",
                            style: TextStyle(
                                fontFamily: 'Comfortaa', fontSize: 22),
                          ),
                          TextSpan(
                            text:
                                "Nice to Meet You Again\nLet's Cook Together!",
                            style: TextStyle(
                                fontFamily: 'Comfortaa', fontSize: 14),
                          )
                        ])),
                      ),

                      Positioned(
                        top: 140,
                        left: 20,
                        right: 20,
                        child: SizedBox(
                            height: _height,
                            width: _width,
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
                              controller: _Email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.email_rounded,
                                  size: 30,
                                ),
                                hintText: "Email",
                                hintStyle: const TextStyle(
                                  fontFamily: 'Comfortaa',
                                ),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(12, 154, 97, 1))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(12, 154, 97, 1))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(12, 154, 97, 1))),
                              ),
                            )),
                      ),

                      // Password here
                      Positioned(
                        top: 210,
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
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.fingerprint_rounded),
                                suffixIcon: IconButton(
                                    onPressed: () => Login_Pov.passwordicon(),
                                    icon: Icon(Login_Pov.PasswordVisible
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
                                        color: Color.fromRGBO(12, 154, 97, 1))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(12, 154, 97, 1))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(12, 154, 97, 1))),
                              )),
                        ),
                      ),
                      Positioned(
                        top: 265,
                        right: 20,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 500),
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        const forgot_Password(),
                                  ));
                            },
                            child: const Hero(
                              tag: 'click me',
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    fontFamily: 'Comfortaa',
                                    color: Color(0xFF0C9A61),
                                    fontSize: 11),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(12, 154, 97, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: loading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Let Cook",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Comfortaa',
                                fontSize: 15),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 110,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "New here! ",
                      style: TextStyle(fontSize: 15),
                    ),
                    InkWell(
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(12, 154, 97, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Sign_up()));
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: -30,
            top: 40,
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(assets.D2),
            ),
          ),
        ]),
      ),
    ));
  }
}
