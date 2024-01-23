class Vehicle {
  final int year;
  final String brand;
  final String model;
  final String engine;

  Vehicle(this.year, this.brand, this.model, this.engine);

  @override
  String toString() {
    return '$brand $model $engine $year';
  }
}
