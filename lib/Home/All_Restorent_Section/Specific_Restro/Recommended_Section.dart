import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../../Extra_Stuff/ShimmerLoading.dart';
import '../../../Services/Data_Files/Dishes/Dishes_Api_Call.dart';
import '../../../Services/Data_Files/Dishes/Dishes_Model.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'Recomended_Section_Bottom.dart';
class Recommended_Section extends StatefulWidget {
  var Restrorent_Name;


  Recommended_Section({super.key, required this.Restrorent_Name,});

  @override
  State<Recommended_Section> createState() => _Recommended_SectionState();
}

class _Recommended_SectionState extends State<Recommended_Section> {
  late Future<List<Dish_Model>> DishModel;

  @override
  void initState() {
    super.initState();

    DishModel = Dish_Api_Call().fetchDish();
  }

  @override
  Widget build(BuildContext context) {
    var _MediaQuerry = MediaQuery.of(context);
    return FutureBuilder(
        future: DishModel,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ShimmerCard();
          } else if (snapshot.hasData) {
            final Dish = snapshot.data!;
            print(Dish);
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Recommended For You",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ...Dish.map((X) {
                    if (widget.Restrorent_Name == X.Restro_name) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: _MediaQuerry.size.width * 1,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              X.Dishes_Type == "Veg"
                                                  ? Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      width: _MediaQuerry
                                                              .size.width *
                                                          0.06,
                                                      child: Image.asset(
                                                        "assets/images/Veg.png",
                                                      ),
                                                    )
                                                  : Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      width: _MediaQuerry
                                                              .size.width *
                                                          0.06,
                                                      child: Image.asset(
                                                          "assets/images/Non_Veg.png"),
                                                    ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              X.Is_Best_Seller == "no"
                                                  ? Container()
                                                  : Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: _MediaQuerry
                                                              .size.height *
                                                          0.03,
                                                      width: _MediaQuerry
                                                              .size.width *
                                                          0.2,
                                                      decoration: BoxDecoration(
                                                          color: const Color
                                                              .fromARGB(255,
                                                              209, 165, 0),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: const Text(
                                                        "BestSeller",
                                                        style: TextStyle(
                                                          color:
                                                              Colors.white,
                                                          fontFamily:
                                                              "Metro-Light",
                                                          fontWeight:
                                                              FontWeight
                                                                  .w900,
                                                        ),
                                                      ),
                                                    ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width: _MediaQuerry.size.width *
                                                0.5,
                                            child: Text(
                                              X.Dishes_Name,
                                              maxLines: 1,
                                              overflow:
                                                  TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontFamily: "Metro-light",
                                                  fontWeight:
                                                      FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration:
                                                    const BoxDecoration(
                                                        color:
                                                            Color.fromARGB(
                                                                255,
                                                                253,
                                                                250,
                                                                226)),
                                                alignment: Alignment.center,
                                                width: _MediaQuerry
                                                        .size.width *
                                                    0.25,
                                                child: const Text("⭐⭐⭐⭐⭐"),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "${X.Dishes_Rating.toString()} Rating",
                                                style: const TextStyle(
                                                    fontFamily:
                                                        "Metro-Light",
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            X.Dishes_Price,
                                            style: const TextStyle(
                                                fontFamily: "Metro-Light",
                                                fontWeight:
                                                    FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width: _MediaQuerry.size.width *
                                                0.5,
                                            child: Text(
                                              X.Dishes_Description,
                                              maxLines: 5,
                                              overflow: TextOverflow.clip,
                                              style: const TextStyle(
                                                  fontFamily: "Metro-Light",
                                                  fontWeight:
                                                      FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: _MediaQuerry
                                                          .size.width *
                                                      0.05,
                                                  child: InkWell(
                                                    child: Image.asset(
                                                        "assets/images/wishlist.png"),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text(
                                                  "Add To Collection",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "Metro-Light",
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        child: SizedBox(
                                          height: _MediaQuerry.size.height *
                                              0.2,
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10),
                                                child: Image.network(
                                                  X.Dishes_Main_Image,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Positioned(
                                                bottom: _MediaQuerry
                                                        .size.height *
                                                    0.01,
                                                // adjust the position as needed
                                                left: 10,
                                                // adjust the position as needed
                                                child: ElevatedButton(
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                    foregroundColor:
                                                        Colors.green,
                                                    backgroundColor:
                                                        const Color
                                                            .fromARGB(255,
                                                            175, 255, 169),
                                                    minimumSize: const Size(
                                                        100,
                                                        30), // text color
                                                  ),
                                                  child: const Row(
                                                    children: [
                                                      Text(
                                                        "ADD",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontFamily:
                                                              "Metro-vold",
                                                        ),
                                                      ),
                                                      SizedBox(width: 2),
                                                      Icon(Icons.add)
                                                    ],
                                                  ),
                                                  onPressed: () {
                                                    // add your button press logic here
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 30),
                                      child: DottedBorder(
                                        dashPattern: const [4],
                                        color: Colors.grey,
                                        customPath: (size) {
                                          return Path()
                                            ..moveTo(0, 0)
                                            ..lineTo(size.width, 0);
                                        },
                                        child: Container(
                                          width: double.infinity,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  }),
                  const Recomended_Section_Bottom()
                ],
              ),
            );
          } else {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
        });
  }
}
