import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/setting_Provider.dart';
import 'package:ingredient_cooker/features/presentation/widgets/profile_tab.dart';
import 'package:provider/provider.dart';
import 'package:slide_popup_dialog_null_safety/slide_popup_dialog.dart'
    as slideDialog;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // Pop up dialog
  void _showDialog() {
    slideDialog.showSlideDialog(
      pillColor: const Color.fromRGBO(12, 154, 97, 1),
      context: context,
      child: const Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }

  Future _displaybottomsheet(BuildContext context) {
    final setting_provider = Provider.of<Setting_Prov>(context, listen: false);
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, Provider) {
              return Container(
                width: 400,
                height: 800,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CustomPaint(
                      painter: line(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Reset Password",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: setting_provider.ObsecureText,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: setting_provider.toggle,
                                icon: Icon(setting_provider.Passwd
                                    ? Icons.visibility_off_rounded
                                    : Icons.remove_red_eye_rounded)),
                            labelText: "Current Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: 300,
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: setting_provider.ObsecureText,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: setting_provider.toggle,
                                  icon: Icon(setting_provider.Passwd
                                      ? Icons.visibility_off_rounded
                                      : Icons.remove_red_eye_rounded)),
                              labelText: "New Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: 300,
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: setting_provider.ObsecureText,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: setting_provider.toggle,
                                  icon: Icon(setting_provider.Passwd
                                      ? Icons.visibility_off_rounded
                                      : Icons.remove_red_eye_rounded)),
                              labelText: "Re-Type Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(12, 154, 97, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {},
                            child: const Text(
                              "Request Password Reset",
                              style: TextStyle(color: Colors.white),
                            )))
                  ],
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: Center(
          child: Column(
            children: [
              Profile_Tab(
                icon: Icons.lock_outline_rounded,
                Title: 'Change Password',
                ontap: () => _displaybottomsheet(context),
                textcolors: Colors.grey,
              ),
              Profile_Tab(
                  icon: Icons.language_rounded,
                  Title: 'Language',
                  ontap: () {},
                  textcolors: Colors.grey),
            ],
          ),
        ));
  }
}

class line extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromRGBO(12, 154, 97, 1)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    var start = const Offset(-20.0, 0);
    var end = const Offset(20.0, 0);
    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
