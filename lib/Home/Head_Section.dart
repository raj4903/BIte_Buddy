/*
* In Side Head Section We Have Some Section
* 1. Live Location User Name etc.
* 2. Explore Section Which Have a Offer
* 3. Recommendation Section
*
*/
import 'package:flutter/material.dart';

class Head extends StatefulWidget {
  const Head({super.key});

  @override
  State<Head> createState() => _HeadState();
}

class _HeadState extends State<Head> {
  @override
  Widget build(BuildContext context) {
    var _MediaQuerry = MediaQuery.of(context);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: _MediaQuerry.size.height * 0.025,
                  child: Image.asset("assets/images/Location_1.png"),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: _MediaQuerry.size.width * 0.5,
                  child: const Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    "Home ,Seelampur, Delhi 110053, New Seelapur",
                    style: TextStyle(
                      color: Colors.green
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            const InkWell(
              child: CircleAvatar(),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          // height: _MediaQuerry.size.height *0.05,
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    "assets/images/search.png",
                    height: _MediaQuerry.size.height * 0.01,
                    width: _MediaQuerry.size.width * 0.01,
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    padding: EdgeInsets.all(4),
                    width: _MediaQuerry.size.width * 0.05,
                    height: _MediaQuerry.size.height * 0.01,
                    decoration: const BoxDecoration(
                        border: Border(left: BorderSide(color: Colors.black))),
                    child: Image.asset(
                      "assets/images/voice.png",
                      height: _MediaQuerry.size.height * 0.1,
                      width: _MediaQuerry.size.width * 0.1,
                    ),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide()),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11))),
          ),
        ),

      ],
    );
  }
}
