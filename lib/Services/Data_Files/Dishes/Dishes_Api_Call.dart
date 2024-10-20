import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Dishes_Model.dart';

class Dish_Api_Call {
  // Method to call the API and fetch the restaurant data
  Future<List<Dish_Model>> fetchDish() async {
    try {
      print("Data Loading <❤️❤️❤️❤️❤️❤️>");
      final response = await http.get(Uri.parse('http://192.168.1.137:8000/api/v1/dish/'));

      // Check if the response is successful
      if (response.statusCode == 200) {
        print("Data Loaded <💕💕💕💕💕💕>");
        // Decode the response with utf8
        var decodedResponse = utf8.decode(response.bodyBytes);
        // Parse the JSON data
        List<dynamic> jsonData = json.decode(decodedResponse);
        print(jsonData);
        // Convert the JSON data into a list of Dish_Model objects
        return jsonData.map((json) => Dish_Model.fromJson(json)).toList();
      } else {
        print("Error: ${response.statusCode} <--------->");
        // If the server returns an error, throw an exception
        throw Exception('Failed to load restaurant data');
      }
    } catch (e) {
      print("Exception: $e <--------->");
      throw Exception('Failed to load Dish data');
    }
  }
}
