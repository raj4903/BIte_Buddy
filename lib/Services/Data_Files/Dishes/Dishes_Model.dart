class Dish_Model {
  final int id;
  final String Restro_name;
  final String Dishes_Name;
  final String Dishes_Type;
  final String Dishes_Price;
  final String Available;
  final int Dishes_Rating;
  final String Dishes_Description;
  final String Dishes_Preparation_Time;
  final String Dishes_Main_Image;
  final String Is_Best_Seller;

  Dish_Model({
    required this.id,
    required this.Restro_name,
    required this.Dishes_Name,
    required this.Dishes_Type,
    required this.Dishes_Price,
    required this.Available,
    required this.Dishes_Rating,
    required this.Dishes_Description,
    required this.Dishes_Preparation_Time,
    required this.Dishes_Main_Image,
    required this.Is_Best_Seller,
  });

  // Factory method to create a Dish_Model object from JSON
  factory Dish_Model.fromJson(Map<String, dynamic> json) {
    return Dish_Model(
      id: json['id'],
      Restro_name: json['Dish_Restro_Name'],
      Dishes_Name: json['Dishes_Name'],
      Dishes_Type: json['Dishes_Type'],
      Dishes_Price: json['Dishes_Price'],
      Available: json['Available'],
      Dishes_Rating: json['Dishes_Rating'],
      Dishes_Description: json['Dishes_Description'],
      Dishes_Preparation_Time: json['Dishes_Preparation_Time'],
      Dishes_Main_Image: json['Dishes_Main_Image'],
      Is_Best_Seller: json['Is_Best_Seller'],
    );
  }
}
