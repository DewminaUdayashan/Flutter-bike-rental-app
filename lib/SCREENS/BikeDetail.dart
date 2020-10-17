import 'package:bike_rent/DATA/Keys.dart';
import 'package:bike_rent/MODEL/Bike.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BikeDetail extends StatefulWidget {
  final Bike bike;
  final int index;

  const BikeDetail({Key key, this.bike, this.index}) : super(key: key);

  @override
  _BikeDetailState createState() => _BikeDetailState();
}

class _BikeDetailState extends State<BikeDetail> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Column(
        children: [
          SizedBox(
            height: 55,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(AntDesign.arrowleft, color: Colors.white)),
                Text('Jhone Doe',
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: 'nunito',
                      color: Colors.white,
                    )),
                Icon(Icons.person, color: Colors.white),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Hero(
            tag: widget.index,
            child: Image.asset(
              widget.bike.image,
              width: width,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.bike.name,
            style: TextStyle(
              fontSize: 32,
              fontFamily: 'nunito',
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: height * 0.3,
            width: width,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                specCardEngine(
                  height: height,
                  width: width,
                  title: 'Engine',
                  child: widget.bike.engine,
                ),
                specCardTopSpeed(
                  height: height,
                  width: width,
                  title: 'Top Speed',
                  topSpeed: widget.bike.topSpeed,
                ),
                specCardMileage(
                    height: height,
                    width: width,
                    title: 'Mileage',
                    mileage: widget.bike.mileageForChart,
                    mileageText: widget.bike.mileage),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Text(
            'Book Now',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        icon: Icon(
          Ionicons.ios_add,
          size: 40,
        ),
        onPressed: () {},
      ),
    );
  }

  Widget specCardEngine({height, width, title, child}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        height: height * 0.3,
        width: width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(25, 26, 45, 1),
              Color.fromRGBO(100, 170, 100, 1),
              Color.fromRGBO(0, 113, 231, 1),
            ],
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'nunito',
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.blue[900].withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  child,
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'nunito',
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget specCardTopSpeed({
    height,
    width,
    title,
    topSpeed,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        height: height * 0.3,
        width: width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(25, 26, 45, 1),
              Color.fromRGBO(0, 113, 231, 1),
            ],
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'nunito',
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: AnimatedCircularChart(
                holeRadius: 30,
                key: Keys.chartKey1,
                size: Size(200, 200),
                initialChartData: <CircularStackEntry>[
                  new CircularStackEntry(
                    <CircularSegmentEntry>[
                      new CircularSegmentEntry(
                        topSpeed / 2,
                        Colors.blue[400],
                        rankKey: 'completed',
                      ),
                      new CircularSegmentEntry(
                        200,
                        Colors.blueGrey[600],
                        rankKey: 'remaining',
                      ),
                    ],
                    rankKey: 'progress',
                  ),
                ],
                chartType: CircularChartType.Radial,
                percentageValues: true,
                holeLabel: '$topSpeed Kmpl',
                duration: Duration(seconds: 1),
                labelStyle: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget specCardMileage({
    height,
    width,
    title,
    mileage,
    mileageText,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        height: height * 0.3,
        width: width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(25, 26, 45, 1),
              Color.fromRGBO(0, 113, 231, 1),
            ],
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'nunito',
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: AnimatedCircularChart(
                holeRadius: 30,
                key: Keys.chartKey2,
                size: Size(200, 200),
                initialChartData: <CircularStackEntry>[
                  new CircularStackEntry(
                    <CircularSegmentEntry>[
                      new CircularSegmentEntry(
                        mileage / 2,
                        Colors.blue[400],
                        rankKey: 'completed',
                      ),
                      new CircularSegmentEntry(
                        100,
                        Colors.blueGrey[600],
                        rankKey: 'remaining',
                      ),
                    ],
                    rankKey: 'progress',
                  ),
                ],
                chartType: CircularChartType.Radial,
                percentageValues: true,
                holeLabel: mileageText,
                duration: Duration(seconds: 1),
                labelStyle: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
