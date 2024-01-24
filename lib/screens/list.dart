import 'package:flutter/material.dart';
import 'package:bytebank/screens/form.dart';
import 'package:bytebank/models/vehicle.dart';

class VehiclesList extends StatefulWidget {
  final List<Vehicle> _vehicles = [];

  @override
  State<StatefulWidget> createState() {
    return VehiclesListState();
  }
}

class VehiclesListState extends State<VehiclesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista - Veículos'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: widget._vehicles.length,
        itemBuilder: (context, index) {
          final vehicle = widget._vehicles[index];
          return VehicleCard(vehicle);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormVehicle();
              },
            ),
          );
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.time_to_leave),
      ),
    );
  }
}

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleCard(this.vehicle);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 239, 239, 239),
      child: ListTile(
        leading: const Icon(Icons.time_to_leave, color: Colors.black),
        title: Text('${vehicle.brand} ${vehicle.model} ${vehicle.year}'),
        subtitle: Text(vehicle.engine),
      ),
    );
  }
}
