// import 'package:flutter/material.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';
// import 'package:ingredient_cooker/features/presentation/state%20management/firebase_provider/uploadDatatoServer.dart';
// import 'package:provider/provider.dart';

// class Gemini {
//   Future returnResponse(BuildContext context) async {
//     final responses = Provider.of<UploadDataServer>(context);

//     const apiKey = 'AIzaSyDz-SMX93r8XSbjsDmYF0GU3PLxN4zsAAE';
//     final model = GenerativeModel(
//       model: 'gemini-1.5-flash-latest',
//       apiKey: apiKey,
//     );

//     final prompt =
//         'the user have selected ${responses.getData()} for time ${value_here} for people ${homeprov.valchange} make pakistani recipe.';
//     final content = [Content.text(prompt)];
//     final response = await model.generateContent(content);

//     print(response.text);
//   }
// }
