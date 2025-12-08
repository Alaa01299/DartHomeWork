import 'dart:io';

class Car {
  String brand;
  int year;
  bool isElectric;
  double price;
  int passengerCount;

  Car({
    required this.brand,
    required this.year,
    required this.isElectric,
    required this.price,
    required this.passengerCount,
  });

  void checkElectric() {
    if (isElectric) {
      print("$brand is an electric.");
    } else {
      print("$brand is not an electric.");
    }
  }

  void checkYear() {
    if (year >= 2020) {
      print("$brand is a modern.");
    } else {
      print("$brand is an old.");
    }
  }

  double calculateMaintenanceCost() {
    double cost = (2025 - year) * 50;
    if (isElectric) cost -= 100;
    return cost < 0 ? 0 : cost;
  }

  void getCarInfo() {
    print(" Car Info ");
    print("Brand: $brand");
    print("Year: $year");
    print("Electric: $isElectric");
    print("Price: ${price}");
    print("Passenger Capacity: $passengerCount");
    print("Maintenance Cost: ${calculateMaintenanceCost()}\n");
  }
}

void main() {
  Car car1 = Car(
    brand: "Tesla Model 3",
    year: 2022,
    isElectric: true,
    price: 35000,
    passengerCount: 5,
  );


  print("Enter car brand: ");
  String brand = stdin.readLineSync()!;

  print("Enter car year: ");
  int year = int.parse(stdin.readLineSync()!);

  print("Is the car electric? (yes/no): ");
  String electricInput = stdin.readLineSync()!;
  bool isElectric = electricInput.toLowerCase() == "yes";

  print("Enter car price: ");
  double price = double.parse(stdin.readLineSync()!);

  print("Enter passenger capacity: ");
  int count = int.parse(stdin.readLineSync()!);

  Car car2 = Car( brand: brand, year: year, isElectric: isElectric, price: price, passengerCount: count,);

  print("\n Car 1 Data ");
  car1.getCarInfo();

  print("\n Car 2 Data ");
  car2.getCarInfo();
}
