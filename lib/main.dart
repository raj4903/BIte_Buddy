import 'package:bite_buddy/Home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'Extra_Stuff/SplashScreen.dart';
import 'Home/All_Restorent_Section/Specific_Restro/Specific_Restro.dart';
void main(){
  return runApp(const bite_buddy());
}

class bite_buddy extends StatelessWidget {
  const bite_buddy({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        colorSchemeSeed: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      title: "Bite Buddy",
      home: const Splashscreen(),
    );
  }
}
