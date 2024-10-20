import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Restaurant.dart';

class Restro_Api_Call {
  // Method to call the API and fetch the restaurant data
  Future<List<Restaurant>> fetchRestaurants() async {
    try {
      print("Data Loading <******>");
      final response = await http.get(Uri.parse('http://192.168.1.137:8000/api/v1/restro/'));

      // Check if the response is successful
      if (response.statusCode == 200) {
        print("Data Loaded <--------->");
        // Decode the response with utf8
        var decodedResponse = utf8.decode(response.bodyBytes);
        // Parse the JSON data
        List<dynamic> jsonData = json.decode(decodedResponse);
        print(jsonData);
        // Convert the JSON data into a list of Restaurant objects
        return jsonData.map((json) => Restaurant.fromJson(json)).toList();
      } else {
        print("Error: ${response.statusCode} <--------->");
        // If the server returns an error, throw an exception
        throw Exception('Failed to load restaurant data');
      }
    } catch (e) {
      print("Exception: $e <--------->");
      throw Exception('Failed to load restaurant data');
    }
  }
}
