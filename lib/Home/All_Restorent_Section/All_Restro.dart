// Restaurant UI
import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../Extra_Stuff/ShimmerLoading.dart';
import '../../Services/Data_Files/Restrorent/Restaurant.dart';
import '../../Services/Data_Files/Restrorent/Restro_Api_Call.dart';
import 'Specific_Restro/Specific_Restro.dart';

class Restro_UI extends StatefulWidget {
  const Restro_UI({super.key});

  @override
  State<Restro_UI> createState() => _Restro_UIState();
}

class _Restro_UIState extends State<Restro_UI> {
  late Future<List<Restaurant>> futureRestaurants;

  @override
  void initState() {
    Timer(
      const Duration(seconds: 5),
      () {},
    );
    super.initState();
    futureRestaurants = Restro_Api_Call().fetchRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    var _MediaQuerry = MediaQuery.of(context);
    return FutureBuilder<List<Restaurant>>(
      future: futureRestaurants,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ShimmerCard();
        } else if (snapshot.hasData) {
          final restaurants = snapshot.data!;
          print(restaurants);

          return SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 1.0,
                        width: 70.0,
                        color: Colors.black38,
                      ),
                    ),
                    const Text(
                      "All Restaurants",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Metro-Light",
                          fontWeight: FontWeight.w900,
                          color: Colors.black38),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 1.0,
                        width: 70.0,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
              ),
              ...restaurants.map((restaurant) {
                print("Image ->  ${restaurant.imageUrl}");
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: SpecificRestro(
                                Restro_Name: restaurant.name,
                                Restro_Type: restaurant.type,
                                Restro_time: restaurant.time,
                                Restro_Rating: restaurant.rating,
                              )));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.network(restaurant.imageUrl),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 0, left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: _MediaQuerry.size.width * 0.7,
                                  child: Text(
                                    restaurant.name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize:
                                            _MediaQuerry.size.width * 0.07,
                                        fontFamily: "Metro-black"),
                                  ),
                                ),
                                Container(
                                  height: _MediaQuerry.size.width * 0.07,
                                  width: _MediaQuerry.size.width * 0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: const Color.fromARGB(255, 62, 108, 57),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "4.9 ★",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              _MediaQuerry.size.width * 0.04,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Metro-Light"),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              restaurant.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Metro-Light",
                                  fontSize: _MediaQuerry.size.width * 0.04),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: DottedBorder(
                              dashPattern: [4],
                              color: Colors.grey,
                              customPath: (size) {
                                return Path()
                                  ..moveTo(0, 0)
                                  ..lineTo(size.width, 0);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset("assets/images/dis.png",
                                            width:
                                                _MediaQuerry.size.width * 0.08),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        const Text(
                                          "Extra 10% off",
                                          style: TextStyle(
                                              fontFamily: "Metro-Light",
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 5),
                                      child: Container(
                                        child: const Text("┃"),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                            "assets/images/discount.png",
                                            width:
                                                _MediaQuerry.size.width * 0.08),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        const Text(
                                          "10% off upto ₹40",
                                          style: TextStyle(
                                              fontFamily: "Metro-Light",
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ]),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return const Center(child: Text('No data found'));
      },
    );
  }
}
