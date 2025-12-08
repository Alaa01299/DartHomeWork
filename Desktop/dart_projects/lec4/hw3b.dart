class Car {
  int? _carID;
  String? _carName;
  String? _carType;
  double? _carPrice;
  final double _discount = 0.15;
  double? _totalPrice;

  Car(int id, String name, String type, double price) {
    _carID = id;
    _carName = name;
    _carType = type;
    _carPrice = price;
    _calculateTotalPrice();
  }

  void _calculateTotalPrice() {
    if (_carPrice != null) {
      _totalPrice = _carPrice! - (_carPrice! * _discount);
    }
  }

  void setId(int id) {
    _carID = id;
  }

  void setName(String name) {
    _carName = name;
  }

  void setType(String type) {
    _carType = type;
  }

  void setPrice(double price) {
    _carPrice = price;
    _calculateTotalPrice();
  }

  int? getId() => _carID;

  String? getName() => _carName;

  String? getType() => _carType;

  double? getPrice() => _carPrice;

  double getDiscount() => _discount;

  double? getTotalPrice() => _totalPrice;

  void printCarInfo() {
    print(" Car Info ");
    print("Car ID : $_carID");
    print("Car Name : $_carName");
    print("Car Type : $_carType");
    print("Car Price : $_carPrice");
    print("Discount : ${_discount * 100}%");
    print("Total Price : $_totalPrice\n");
  }
}

void main() {

  Car car1 = Car(1, "Toyota", "Sedan", 25000);
  Car car2 = Car(2, "Ford", "Sport", 45000);

  print("\n old info ");
  car1.printCarInfo();
  car2.printCarInfo();

  car1.setPrice(23000);
  car1.setName("Toyota 2022");

  car2.setType("Muscle Car");
  car2.setPrice(42000);

  print("\n new info ");
  car1.printCarInfo();
  car2.printCarInfo();
}
