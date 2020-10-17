import 'package:bike_rent/MODEL/Bike.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopChoiceCard extends StatelessWidget {
  final Bike bike;

  const TopChoiceCard({Key key, this.bike}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        height: height * 0.15,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Image.asset(
              bike.image,
              width: 160,
              fit: BoxFit.fitWidth,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                Text(
                  bike.name,
                  style: TextStyle(fontSize: 20, fontFamily: 'nunito'),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.deepOrangeAccent,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.deepOrangeAccent,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.deepOrangeAccent,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.deepOrangeAccent,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text('More Details'),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      FontAwesomeIcons.arrowRight,
                      size: 10,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
