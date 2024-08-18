import 'package:firebase_auth/firebase_auth.dart';

Future<void> signinwithTemporaryAcc() async{
  try {
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    print('Signed in with temporary account: ${userCredential.user?.uid}');
  } catch (e) {
    print('Error: ${e}');
  }
}