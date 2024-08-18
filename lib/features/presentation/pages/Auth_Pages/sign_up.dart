// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:ingredient_cooker/features/presentation/pages/Auth_Pages/login.dart';
import 'package:ingredient_cooker/features/presentation/pages/utils/assets.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final double _height = 55;
  final double _width = 250;
  final TextEditingController _Email = TextEditingController();
  final TextEditingController _Passwd = TextEditingController();

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
                    fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: Stack(
                    // mainAxisAlignment: MainAxisAlignment.center,
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
                        height: 400,
                        width: 300,
                      ),
                      const Positioned(
                        top: 30,
                        left: 30,
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "SIGN UP\n",
                            style: TextStyle(
                                fontFamily: 'Comfortaa', fontSize: 22),
                          ),
                          TextSpan(
                            text: "Nice to Meet You\nLet's Cook!",
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
                                return null;
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

                      // Confirm password here
                      Positioned(
                        top: 280,
                        left: 20,
                        right: 20,
                        child: SizedBox(
                          height: _height,
                          width: _width,
                          child: TextFormField(
                              style: const TextStyle(
                                  fontFamily: 'Comfortaa', fontSize: 13),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                  prefixIcon:
                                      const Icon(Icons.fingerprint_rounded),
                                  suffixIcon: IconButton(
                                      onPressed: _toggle,
                                      icon: Icon(_passwordVisible
                                          ? Icons.visibility_off_rounded
                                          : Icons.remove_red_eye_rounded)),
                                  hintText: "Confirm Password",
                                  hintStyle: const TextStyle(
                                    fontFamily: 'Comfortaa',
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(12, 154, 97, 1))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(12, 154, 97, 1))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(12, 154, 97, 1))),
                                  fillColor: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(12, 154, 97, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: const Text(
                      "Lets Explore!",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Comfortaa',
                          fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have Account! ",
                      style: TextStyle(fontSize: 15),
                    ),
                    InkWell(
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(12, 154, 97, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login_Screen()));
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: -30,
            top: 50,
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(assets.D1),
            ),
          ),
        ]),
      ),
    ));
  }
}
