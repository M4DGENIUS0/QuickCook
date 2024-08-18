import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ingredient_cooker/features/presentation/pages/Auth_Pages/profile/Profile_Image.dart';
import 'package:ingredient_cooker/features/presentation/pages/Auth_Pages/profile/profile%20tabs/Settings.dart';
import 'package:ingredient_cooker/features/presentation/pages/Auth_Pages/profile/profile%20tabs/setting/theme_dialog.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/Provider_Theme.dart';
import 'package:ingredient_cooker/features/presentation/widgets/profile_tab.dart';
import 'package:provider/provider.dart';

class Profile_Dashboard extends StatefulWidget {
  const Profile_Dashboard({super.key});

  @override
  State<Profile_Dashboard> createState() => _Profile_DashboardState();
}

class _Profile_DashboardState extends State<Profile_Dashboard> {
  @override
  Widget build(BuildContext context) {
    final ThemeChange = Provider.of<Theme_Mode>(context);
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  ThemeChange.ChangeIcon;
                  dialog(context);
                },
                icon: (ThemeChange.click = false)
                    ? Icon(
                        HeroIcons.sun,
                      )
                    : Icon(
                        HeroIcons.moon,
                      ))
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              HeroIcons.arrow_left,
            ),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            InkWell(
              autofocus: false,
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              radius: 30,
              onTap: () {
                // var snackBar = SnackBar(
                //   content: Text('Feature not added yet!'),
                // );

                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const Profile_Image(),
                    ));
              },
              onLongPress: () {
                var snackBar = const SnackBar(
                  content: Text('Edit Image'),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: SizedBox(
                height: 120,
                width: 120,
                child: Hero(
                  tag: 'profile',
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: CustomPaint(
                          painter: paints(),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/me.jpg"),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                            backgroundColor: Color.fromRGBO(12, 154, 97, 1),
                            child: Icon(
                              Icons.edit_rounded,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Ahmad Nasir",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'Comfortaa'),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "an7539661@gmail.com",
              style: TextStyle(
                  color: Colors.grey, fontSize: 10, fontFamily: 'Comfortaa'),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 220,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(12, 154, 97, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: const Text(
                  "Edit Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Comfortaa',
                      fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Profile_Tab(
                icon: HeroIcons.rocket_launch,
                Title: 'Documentation',
                ontap: () {},
                textcolors: Colors.grey),
            Profile_Tab(
              icon: Icons.settings,
              Title: "Setting",
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Settings(),
                    ));
              },
              textcolors: Colors.grey,
            ),
            Profile_Tab(
                icon: AntDesign.question_circle_fill,
                Title: 'Help & Support',
                ontap: () {},
                textcolors: Colors.grey),
            Profile_Tab(
                icon: Icons.person_add_alt_1_rounded,
                Title: 'Invite a Friend',
                ontap: () {},
                textcolors: Colors.grey),
            Profile_Tab(
                icon: AntDesign.logout_outline,
                Title: 'Log Out',
                ontap: () {},
                textcolors: Colors.grey)
          ],
        ),
      ),
    );
  }
}

class paints extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.black.withOpacity(0.01);
    var position = const Offset(0, 60);
    canvas.drawCircle(position, 70.0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
