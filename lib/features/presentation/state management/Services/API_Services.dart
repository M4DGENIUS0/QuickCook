import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIService with ChangeNotifier{
  List<dynamic> data = [];
  List get _data =>data;
  Future<void> callAPI(String name) async {
  String apiUrl = "https://ingredients-api-production.up.railway.app$name";
  
    try{
    final response = await http.get(Uri.parse(apiUrl));
    if(response.statusCode == 200 || response.statusCode == 201){
      data  = json.decode(response.body);
      notifyListeners();
    }
    else{
      print('Error fetching data: ${response.statusCode}');
    }
    }
    catch(e){
        print('Error fetching data: $e');
    }
    
  }
}