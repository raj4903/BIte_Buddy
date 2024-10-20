class Restaurant {
  final int id;
  final String name;
  final String location;
  final String type;
  final int rating;
  final String time;
  final String description;
  final String imageUrl;

  Restaurant({
    required this.id,
    required this.name,
    required this.location,
    required this.type,
    required this.rating,
    required this.time,
    required this.description,
    required this.imageUrl,
  });

  // Factory method to create a Restaurant object from JSON
  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['Restro_id'],
      name: json['Restro_Name'],
      location: json['Location'],
      type: json['Restro_Type'],
      rating: json['Restro_Rating'],
      time: json['Restro_Time'],
      description: json['Restro_Description'],
      imageUrl: json['Restro_Main_Image'],
    );
  }
}
