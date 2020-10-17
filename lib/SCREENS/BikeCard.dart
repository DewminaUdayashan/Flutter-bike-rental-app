import 'package:bike_rent/MODEL/Bike.dart';
import 'package:bike_rent/SCREENS/BikeDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BikeCard extends StatelessWidget {
  final Bike bike;
  final int index;

  const BikeCard({Key key, this.bike, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => BikeDetail(
              bike: bike,
              index: index,
            ),
          ),
        ),
        child: Container(
          width: width * 0.7,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: height * 0.3,
                  width: width * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(25, 26, 45, 1),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        bike.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'quaab',
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 45,
                child: Container(
                  width: width * 0.5,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      'Book Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'nunito'),
                    ),
                  ),
                ),
              ),
              Hero(
                tag: index,
                child: Image.asset(
                  bike.image,
                  height: height * 0.3,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
