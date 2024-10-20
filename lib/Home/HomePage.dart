import 'package:bite_buddy/Home/Dishes_Section.dart';
import 'package:bite_buddy/Home/Head_Section.dart';
import 'package:flutter/material.dart';

import 'All_Restorent_Section/All_Restro.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var _MediaQuerry = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: _MediaQuerry.size.height * 0.13,
        title:  const Head(),
        leading: null,
      ),
      /*
      * We Break Our Home Page Into Some Section
      *
      * 1. Head_Section
      * 2. Dishes_Section
      * 3. All Restaurant Section
      * */
      body: const SingleChildScrollView(
       child: Column(
         children: [
           DishesSection(),
           Restro_UI()

         ],
       ),
      )
    );
  }
}