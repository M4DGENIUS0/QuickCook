import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class OTP_Verify extends StatelessWidget {
  const OTP_Verify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
        title: Text('Verify Your Email'),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover)),
        child: SafeArea(
          child: Stack(children: [
            Center(
              child: Container(
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
                              offset: Offset(0, 3),
                            )
                          ]),
                      height: 450,
                      width: 300,
                    ),
                    Positioned(
                      top: 1,
                      right: 30,
                      left: 30,
                      child: Hero(
                        tag: 'click me',
                        child: SizedBox(
                            height: 200,
                            width: 200,
                            child: Lottie.asset('assets/animation/otp.json')),
                      ),
                    ),
                    Positioned(
                      top: 100 * 2,
                      right: 30,
                      left: 30,
                      child: Text(
                        "Enter 4 Digit OTP Sent to\n  a*******61@gmail.com",
                        style: TextStyle(
                          fontFamily: 'Comfortaa',
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100 * 2.5,
                      right: 10,
                      left: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              onSaved: (pin1) {},
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: TextStyle(
                                  fontFamily: 'Comfortaa', fontSize: 15),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '0',
                                fillColor: Colors.grey,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(12, 154, 97, 1))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(12, 154, 97, 1))),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              onSaved: (pin2) {},
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: TextStyle(
                                  fontFamily: 'Comfortaa', fontSize: 15),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '0',
                                fillColor: Colors.grey,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(12, 154, 97, 1))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(12, 154, 97, 1))),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              onSaved: (pin3) {},
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: TextStyle(
                                  fontFamily: 'Comfortaa', fontSize: 15),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '0',
                                fillColor: Colors.grey,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(12, 154, 97, 1))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(12, 154, 97, 1))),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              onSaved: (pin4) {},
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: TextStyle(
                                  fontFamily: 'Comfortaa', fontSize: 15),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '0',
                                fillColor: Colors.grey,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(12, 154, 97, 1))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(12, 154, 97, 1))),
                              ),
                            ),
                          ),
                        ],
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
                          onPressed: () {},
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Comfortaa',
                                fontSize: 15),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(12, 154, 97, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
