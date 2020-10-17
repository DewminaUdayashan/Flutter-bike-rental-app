import 'package:bike_rent/MODEL/Bike.dart';

class BikeList {
  static List<Bike> bike = [
    Bike(
        name: 'Gixxer SF 155',
        engine: '154CC',
        mileage: '45-55Kmpl',
        mileageForChart: 50,
        power: 14.8,
        topSpeed: 127.0,
        rental: '1500',
        image: 'assets/bikes/gixxer.png'),
    Bike(
        name: 'Pulsar RS200',
        engine: '199CC',
        mileage: '35Kmpl',
        mileageForChart: 35,
        power: 24,
        rental: '2000',
        topSpeed: 140.0,
        image: 'assets/bikes/rs.png'),
    Bike(
        name: 'KTM Rc200',
        engine: '199CC',
        power: 24,
        mileage: '35Kmpl',
        mileageForChart: 35,
        rental: '2000',
        topSpeed: 145.0,
        image: 'assets/bikes/ktm.png'),
    Bike(
        name: 'FZ',
        engine: '149CC',
        mileage: '50-55Kmpl',
        mileageForChart: 55,
        power: 12.2,
        rental: '1300',
        topSpeed: 120.0,
        image: 'assets/bikes/fz.png'),
    Bike(
        name: 'Pulsar NS200',
        engine: '199CC',
        mileage: '35Kmpl',
        mileageForChart: 35,
        power: 24,
        rental: '2000',
        topSpeed: 140.0,
        image: 'assets/bikes/ns.png'),
  ];
}
