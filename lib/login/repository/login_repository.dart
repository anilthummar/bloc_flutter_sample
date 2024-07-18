
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/login_request_model.dart';
import '../model/login_response_model.dart';


// Key Points:
// The LoginRepository class handles the login API call.
// The login method:
// Constructs a LoginRequestModel with the provided username and password.
// Sends a POST request to the login API.
// Checks the response status code:
// If 200, parses the response body to a LoginResponseModel.
// If not 200 or if the response is null, returns an empty LoginResponseModel.
// Catches any exceptions and throws them to be handled by the caller.


/// Repository class for handling login API calls
class LoginRepository {


  /// Valid login
  // "username": "emilys",
  // "password": "emilyspass",
  /// Method to perform login using username and password
  Future<LoginResponseModel> login(String userName, String password) async {
    const String baseUrl = 'https://dummyjson.com/auth/login';

    // Creating a LoginRequestModel object with the provided username and password
    LoginRequestModel loginRequestModel = LoginRequestModel(
      username: userName,
      password: password,
    );

      // Making a POST request to the login API with the request model encoded as JSON
      http.Response response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(loginRequestModel.toJson()),
      );

      // print("response_statusCode:${response.statusCode}");
      // Check if the response is not null and has a status code of 200 (OK)
      if (response != null) {
        if (response.statusCode == 200) {
          // If the status code is 200, parse the response body and return a LoginResponseModel
          var resp = response.body;
          return LoginResponseModel.fromJson(jsonDecode(resp));
        } else if (response.statusCode == 400) {
          // If the status code is not 200, return an empty LoginResponseModel
          // return LoginResponseModel();
          // throw Exception("Invalid credentials");
          print("response_statusCode:${jsonDecode(response.body)}");
          return LoginResponseModel();
        }else{
          throw Exception("Invalid credentials");
        }
      } else {
        // If the response is null, return an empty LoginResponseModel
        // return LoginResponseModel();
        throw Exception("Data not found");
      }

  }
}
