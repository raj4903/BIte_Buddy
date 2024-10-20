import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../Extra_Stuff/ShimmerLoading.dart';
import '../../../Services/Data_Files/Dishes/Dishes_Api_Call.dart';
import '../../../Services/Data_Files/Dishes/Dishes_Model.dart';
import '../../../Services/Data_Files/Restrorent/Restaurant.dart';
import '../../../Services/Data_Files/Restrorent/Restro_Api_Call.dart';
import 'Recommended_Section.dart';
class SpecificRestro extends StatefulWidget {
  var Restro_Name, Restro_Type, Restro_time, Restro_Rating;

  SpecificRestro(
      {super.key,
      required this.Restro_Name,
      required this.Restro_Type,
      required this.Restro_time,
      required this.Restro_Rating});
  @override
  State<SpecificRestro> createState() => _SpecificRestroState();
}
class _SpecificRestroState extends State<SpecificRestro> {
  late Future<List<Dish_Model>> DishModel;
  var Menu_Token = false;

  @override
  void initState() {
    super.initState();
    DishModel = Dish_Api_Call().fetchDish();
  }

  @override
  Widget build(BuildContext context) {
    var _MediaQuerry = MediaQuery.of(context);
    return Scaffold(

      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            SizedBox(
              width: _MediaQuerry.size.width * 0.05,
              child: InkWell(
                child: Image.asset("assets/images/group.png"),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: _MediaQuerry.size.width * 0.05,
              child: InkWell(
                child: Image.asset("assets/images/wishlist.png"),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: _MediaQuerry.size.width * 0.05,
              child: InkWell(
                onTap: () => setState(() {
                  Menu_Token = true;
                }),
                child: Image.asset("assets/images/dots.png"),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: DishModel,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ShimmerCard();
          } else if (snapshot.hasData) {
            final Dish = snapshot.data!;
            print(Dish);
            return Stack(
              children: [
                SingleChildScrollView(
                  physics: Menu_Token
                      ? const NeverScrollableScrollPhysics()
                      : const ScrollPhysics(),
                  child: Column(
                    children: [
                      /* -------------------------------- This Contain PureVeg and Order under 4Km -------------------------------- */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: widget.Restro_Type == "Veg"
                                ? const PureVegLogo()
                                : widget.Restro_Type == "Non-Veg"
                                    ? const NonVegLogo()
                                    : const BothLogo(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: _MediaQuerry.size.width * 0.4,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromARGB(66, 80, 80, 80),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                "For Order Under 4 Km",
                                style: TextStyle(
                                    fontFamily: "Metro-Light",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: _MediaQuerry.size.width * 0.5,
                                  child: Text(
                                    widget.Restro_Name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontFamily: "Metro-black",
                                        fontSize: 50,
                                        color: Color.fromARGB(226, 44, 44, 44)),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/images/time-left.png",
                                        width: _MediaQuerry.size.width * 0.05),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(widget.Restro_time)
                                  ],
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  height: _MediaQuerry.size.width * 0.09,
                                  width: _MediaQuerry.size.width * 0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                        const Color.fromARGB(255, 62, 108, 57),
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
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "${widget.Restro_Rating.toString()} Rating",
                                      style: const TextStyle(
                                          fontFamily: "Metro-Light",
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(1),
                                      child: DottedBorder(
                                        dashPattern: const [4],
                                        color: Colors.grey,
                                        customPath: (size) {
                                          return Path()
                                            ..moveTo(0, 0)
                                            ..lineTo(size.width, 0);
                                        },
                                        child: Container(
                                          width: _MediaQuerry.size.width * 0.2,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          /* This is Recommended Section */
                          Recommended_Section(
                            Restrorent_Name: widget.Restro_Name,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Menu_Token
                    ? Positioned(
                        top: 200,
                        child: Column(
                          children: [
                            InkWell(
                              child: Container(
                                width: 60,
                                height: 60,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(100, 100, 100, 100),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Image.asset(
                                  "assets/images/close.png",
                                  width: 20,
                                ),
                              ),
                              onTap: () => setState(() {
                                Menu_Token = false;
                              }),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: _MediaQuerry.size.width * 1,
                              height: _MediaQuerry.size.height * 1,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                  color: Color.fromARGB(255, 221, 221, 221)),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.Restro_Name,
                                      style: const TextStyle(
                                          fontFamily: "Metro-bold",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      padding: const EdgeInsets.only(top: 30, left: 10,right: 10),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                      ),
                                      width: double.infinity,
                                      height: _MediaQuerry.size.height * 0.9,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/wishlist.png",
                                                width: 25,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                "Add To Collection",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/i.png",
                                                width: 25,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                "See More About This restaurant",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/share.png",
                                                width: 25,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                "Share This restaurant",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/invisible.png",
                                                width: 25,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                "Hide This restaurant",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                "assets/images/chat.png",
                                                width: 25,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Report fraud or bad practices",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  SizedBox(
                                                    width: _MediaQuerry
                                                            .size.width *
                                                        0.75,
                                                    child: Text(
                                                        "menu items, prices, photos and descriptions are set directly by the restaurant case you see any incorrect informaton, please report it to us"),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .then(delay: 00.ms)
                        .slide(begin: Offset(0, 1), end: Offset(0, 0))
                    : Container()
              ],
            );
          } else {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
        },
      ),
    );
  }
}

/* -------------------------------- Conditional_Display -------------------------------- */

/* -------------------------------- Pure Veg -------------------------------- */
class PureVegLogo extends StatefulWidget {
  const PureVegLogo({super.key});

  @override
  State<PureVegLogo> createState() => _PureVegLogoState();
}

class _PureVegLogoState extends State<PureVegLogo> {
  late Future<List<Restaurant>> futureRestaurants;

  @override
  void initState() {
    super.initState();
    futureRestaurants = Restro_Api_Call().fetchRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    var _MediaQuerry = MediaQuery.of(context);
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
            stops: [0, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0x1400FF26), Color(0xFFFFFFFF)]),
      ),
      child: SizedBox(
        width: _MediaQuerry.size.width * 0.25,
        child: Row(
          children: [
            SizedBox(
              width: _MediaQuerry.size.width * 0.05,
              child: InkWell(
                child: Image.asset("assets/images/leaf.png"),
              ),
            ),
            const SizedBox(width: 5),
            const Text(
              "Pure Veg",
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

/* -------------------------------- Non Veg -------------------------------- */

class NonVegLogo extends StatefulWidget {
  const NonVegLogo({super.key});

  @override
  State<NonVegLogo> createState() => _NonVegLogoState();
}

class _NonVegLogoState extends State<NonVegLogo> {
  late Future<List<Restaurant>> futureRestaurants;

  @override
  void initState() {
    super.initState();
    futureRestaurants = Restro_Api_Call().fetchRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    var _MediaQuerry = MediaQuery.of(context);
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
            stops: [0, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0x14FF0000), Color(0xFFFFFFFF)]),
      ),
      child: SizedBox(
        width: _MediaQuerry.size.width * 0.25,
        child: Row(
          children: [
            SizedBox(
              width: _MediaQuerry.size.width * 0.05,
              child: InkWell(
                child: Image.asset("assets/images/leaf.png"),
              ),
            ),
            const SizedBox(width: 5),
            const Text(
              "Non Veg",
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

/* -------------------------------- Both -------------------------------- */

class BothLogo extends StatefulWidget {
  const BothLogo({super.key});

  @override
  State<BothLogo> createState() => _BothLogoState();
}

class _BothLogoState extends State<BothLogo> {
  late Future<List<Restaurant>> futureRestaurants;

  @override
  void initState() {
    super.initState();
    futureRestaurants = Restro_Api_Call().fetchRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    var _MediaQuerry = MediaQuery.of(context);
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
            stops: [0, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0x89FD6D3F), Color(0xFFFFFFFF)]),
      ),
      child: SizedBox(
        width: _MediaQuerry.size.width * 0.25,
        child: Row(
          children: [
            SizedBox(
              width: _MediaQuerry.size.width * 0.05,
              child: InkWell(
                child: Image.asset("assets/images/leaf.png"),
              ),
            ),
            const SizedBox(width: 5),
            const Text(
              "Both Veg",
              style: TextStyle(
                  color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

/* -------------------------------- Recommended Section --------------------------------*/
