import 'package:flutter/material.dart';

class Recomended_Section_Bottom extends StatefulWidget {
  const Recomended_Section_Bottom({super.key});

  @override
  State<Recomended_Section_Bottom> createState() => _Recomended_Section_BottomState();
}

class _Recomended_Section_BottomState extends State<Recomended_Section_Bottom> {
  @override
  Widget build(BuildContext context) {
    var _MediaQuerry = MediaQuery.of(context);
    return Container(
      width: _MediaQuerry.size.width * 1,
      child: Image.asset("assets/images/bottombanner.png"),
    );
  }
}