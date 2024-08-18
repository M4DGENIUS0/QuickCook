import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hive/hive.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/Services/API_Services.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/Login_Provider.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/Provider_Bottom_NavBar.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/Provider_Theme.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/firebase_provider/TempAccount.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/firebase_provider/uploadDatatoServer.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/gridSwitch.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/home_provider.dart';
import 'package:ingredient_cooker/features/presentation/state%20management/setting_Provider.dart';
import 'package:ingredient_cooker/features/presentation/widgets/Nav_bar.dart';
import 'package:ingredient_cooker/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';


const apiKey = 'AIzaSyDz-SMX93r8XSbjsDmYF0GU3PLxN4zsAAE';
void main() async {
  final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  await signinwithTemporaryAcc();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
        ChangeNotifierProvider(create: (context) => UploadDataServer(),),
        ChangeNotifierProvider(create: (context) => GridSwitch(),),
        ChangeNotifierProvider(create: (BuildContext context) => APIService(),),
        ChangeNotifierProvider(
          create: (BuildContext context) => Login_Screen_Provider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Theme_Mode(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Nav_Pov(),
        ),
        ChangeNotifierProvider(create: (BuildContext context) => Setting_Prov())
      ],
      child: Builder(
        builder: (BuildContext context) {
          final ThemeChange = Provider.of<Theme_Mode>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Cooking App',
            themeMode: ThemeChange.themeData,
            darkTheme: ThemeData(
              bottomNavigationBarTheme:
                  BottomNavigationBarThemeData(backgroundColor: Colors.black),
              brightness: Brightness.dark,
              appBarTheme: AppBarTheme(
                  actionsIconTheme: IconThemeData(color: Colors.white)),
            ),
            theme: ThemeData(
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(12, 154, 97, 1),
                        textStyle: TextStyle(
                            color: Colors.white, fontFamily: 'Comfortaa'))),
                useMaterial3: true,
                bottomNavigationBarTheme:
                    BottomNavigationBarThemeData(backgroundColor: Colors.white),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                    actionsIconTheme: IconThemeData(color: Colors.black),
                    backgroundColor: Colors.white)),
            home: const Nav_Bar(),
          );
        }
      ),
    );
  }
}
