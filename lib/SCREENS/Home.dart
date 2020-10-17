import 'package:bike_rent/DATA/List.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'BikeCard.dart';
import 'Topchoice.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(AntDesign.menufold, color: Colors.black),
                  Icon(AntDesign.search1, color: Colors.black),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 25),
              child: Text(
                'Pick Your Bike',
                style: TextStyle(
                    fontSize: 35, fontFamily: 'nunito', color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: height * 0.5,
              width: width,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: BikeList.bike.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => BikeCard(
                  bike: BikeList.bike[index],
                  index: index,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Text(
                    'Top Picks',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'nunito',
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(FontAwesomeIcons.star),
                ],
              ),
            ),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: BikeList.bike.length,
                itemBuilder: (context, index) => TopChoiceCard(
                  bike: BikeList.bike[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
