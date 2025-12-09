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

  void set setId(int id) {
    this._carID = id;
  }

  void set setName(String name) {
    this._carName = name;
  }

  void set setType(String type) {
    this._carType = type;
  }

  void set setPrice(double price) {
    this._carPrice = price;
    _calculateTotalPrice();
  }

  int? get getId {
    return _carID;
  }

  String? get getName {
    return _carName;
  }

  String? get getType {
    return _carType;
  }

  double? get getPrice {
    return _carPrice;
  }

  double get getDiscount {
    return _discount;
  }

  double? get getTotalPrice {
    return _totalPrice;
  }

  void getCarInfo() {
    print(" Car Info ");
    print("Car ID : $_carID");
    print("Car Name : $_carName");
    print("Car Type : $_carType");
    print("Car Price : $_carPrice");
    print("Discount : ${_discount * 100}%");
    print("Total Price : $_totalPrice \n");
  }
}

void main() {
  
  Car car1 = Car(1, "Toyota", "Sedan", 25000);
  Car car2 = Car(2, "Ford", "Sport", 45000);

  print("\n Before Update ");
  car1.getCarInfo();
  car2.getCarInfo();

  car1.setPrice = 23000;
  car1.setName = "Toyota 2022";

  car2.setType = "Muscle Car";
  car2.setPrice = 42000;

  print("\n After Update ");
  car1.getCarInfo();
  car2.getCarInfo();
}
