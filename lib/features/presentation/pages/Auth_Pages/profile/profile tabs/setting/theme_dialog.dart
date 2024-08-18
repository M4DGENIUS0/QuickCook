import 'package:flutter/material.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/Provider_Theme.dart';
import 'package:provider/provider.dart';

dialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: Text("Theme Edit"),
    titleTextStyle: TextStyle(
      fontFamily: 'Comfortaa',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    actions: [
      Consumer<Theme_Mode>(
        builder: (BuildContext context, Theme_Mode value, Widget? child) {
          return TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: Color.fromRGBO(12, 154, 97, 1)),
            onPressed: () {
              value.ChangeIcon;
              Navigator.of(context).pop();
            },
            child: Text(
              'OK',
              style: TextStyle(
                  fontFamily: 'Comfortaa', fontSize: 13, color: Colors.white),
            ),
          );
        },
      ),
      TextButton(
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: Color.fromRGBO(12, 154, 97, 1)),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          'Cancel',
          style: TextStyle(
              fontFamily: 'Comfortaa', fontSize: 13, color: Colors.white),
        ),
      ),
    ],
    content: SizedBox(
      height: 170,
      child: Consumer<Theme_Mode>(
        builder: (BuildContext context, Theme_Mode value, Widget? child) {
          return Column(
            children: [
              RadioListTile<ThemeMode>(
                  activeColor: Color.fromRGBO(12, 154, 97, 1),
                  title: Text(
                    'Light',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 13,
                    ),
                  ),
                  value: ThemeMode.light,
                  groupValue: value.themeData,
                  onChanged: value.setTheme),
              RadioListTile<ThemeMode>(
                  activeColor: Color.fromRGBO(12, 154, 97, 1),
                  title: Text(
                    'Dark',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 13,
                    ),
                  ),
                  value: ThemeMode.dark,
                  groupValue: value.themeData,
                  onChanged: value.setTheme),
              RadioListTile<ThemeMode>(
                  activeColor: Color.fromRGBO(12, 154, 97, 1),
                  title: Text(
                    'System Theme',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 13,
                    ),
                  ),
                  value: ThemeMode.system,
                  groupValue: value.themeData,
                  onChanged: value.setTheme),
            ],
          );
        },
      ),
    ),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
