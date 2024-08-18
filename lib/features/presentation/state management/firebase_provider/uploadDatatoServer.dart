import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UploadDataServer with ChangeNotifier {
  final databaseRef = FirebaseDatabase.instance.ref();

  // Add data to FirebaseDatabase
  Future<void> uploadData(String content, String category, String key) async {
    try {
      final user = FirebaseAuth.instance.currentUser?.uid;
      if (user == null) {
        throw FirebaseAuthException(
          code: 'no-signed-in-user',
          message: 'No user is currently signed in.',
        );
      }

      final uploadRef = databaseRef.child('$user/Ingredients/$category/$key');
      await uploadRef.set(content);
      print('Upload successful');
    } catch (e) {
      print('Error: $e');
    }
    notifyListeners();
  }

  // Delete data from FirebaseDatabase
  Future<void> removeData(String category, String key) async {
    try {
      final user = FirebaseAuth.instance.currentUser?.uid;
      if (user == null) {
        throw FirebaseAuthException(
          code: 'no-signed-in-user',
          message: 'No user is currently signed in.',
        );
      }

      final deleteRef = databaseRef.child('$user/Ingredients/$category/$key');
      await deleteRef.remove();
      print('Remove successful');
    } catch (e) {
      print('Error: $e');
    }
    notifyListeners();
  }

  // Check if data exists in FirebaseDatabase
  Future<bool> containsData(String category, String key) async {
    try {
      final user = FirebaseAuth.instance.currentUser?.uid;
      if (user == null) {
        throw FirebaseAuthException(
          code: 'no-signed-in-user',
          message: 'No user is currently signed in.',
        );
      }

      final dataRef = databaseRef.child('$user/Ingredients/$category/$key');
      final snapshot = await dataRef.get();

      return snapshot.exists;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  // Get data from FirebaseDatabase
  Future<DataSnapshot?> getData(String category) async {
    try {
      final user = FirebaseAuth.instance.currentUser?.uid;
      if (user == null) {
        throw FirebaseAuthException(
          code: 'no-signed-in-user',
          message: 'No user is currently signed in.',
        );
      }

      final dataRef = databaseRef.child('$user/Ingredients/$category/');
      final snapshot = await dataRef.get();

      print('Data retrieval successful');
      return snapshot;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

Future<dynamic> fetchDataAndPrint(String location) async {
  try {
    final data = await getData(location);
    if (data != null) {
      // Access data from the DataSnapshot
      final value = data.value; // This will be a Map or a List depending on your data structure
      return value; // Now you'll return the actual data
    } else {
      print('No data found');
      // Consider returning a specific value or throwing an exception if appropriate
      return null; // Or throw an exception
    }
  } catch (e) {
    print('Error fetching data: $e');
    // Consider returning a specific value or throwing an exception if appropriate
    return null; // Or throw an exception
  }
}
Future<String> fetch(String location) async {
  final user = FirebaseAuth.instance.currentUser?.uid;
  if (user == null) {
    throw FirebaseAuthException(
      code: 'no-signed-in-user',
      message: 'No user is currently signed in.',
    );
  }

  final ref = databaseRef.child('$user/Ingredients/$location/');
  final snapshot = await ref.get();

  // Ensure that you're getting the value properly
  if (snapshot.exists) {
    return snapshot.value.toString();
  } else {
    return 'No data found';
  }
}


  // Future<int> getLengthFromDatabase(String path) async {
  //   final ref = databaseRef.child(path);
  //   final snapshot = await ref.once();
  //   final data = snapshot.snapshot.value as Map<dynamic, dynamic>;
  //   return data.length;
  // }
Future<int> getLengthFromDatabase(String path) async {
  final ref = databaseRef.child(path);
  final snapshot = await ref.once();
  return snapshot.snapshot.children.length;
}
  // bool isSelected(String index) {
  //   return _selectedIndex.contains(index);
  // }
}
