import 'package:bytebank/screens/list.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/components/form_item.dart';
import 'package:bytebank/models/vehicle.dart';

class VehicleForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VehicleFormState();
  }
}

class VehicleFormState extends State<VehicleForm> {
  final TextEditingController _ctrlYearField = TextEditingController();
  final TextEditingController _ctrlBrandField = TextEditingController();
  final TextEditingController _ctrlModelField = TextEditingController();
  final TextEditingController _ctrlEngineField = TextEditingController();

  void _createNewVehicle(BuildContext context) {
    final int? year = int.tryParse(_ctrlYearField.text);
    final String brand = _ctrlBrandField.text;
    final String model = _ctrlModelField.text;
    final String engine = _ctrlEngineField.text;

    if (year != null && brand != '' && model != '' && engine != '') {
      final Vehicle vehicle = Vehicle(year, brand, model, engine);

      /*ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veículo cadastrado'),
          backgroundColor: Colors.orange,
        ),
      );*/

      Navigator.pop(context, vehicle);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Não foi possível cadastrar o veículo.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário - Veículo'),
        backgroundColor: Colors.orange,
      ),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: 500,
                child: Column(
                  children: [
                    FormItem(
                      controllerItem: _ctrlYearField,
                      labelItem: 'Ano-modelo',
                      hintItem: '2022',
                      iconItem: Icons.timelapse,
                    ),
                    FormItem(
                      controllerItem: _ctrlBrandField,
                      labelItem: 'Montadora',
                      hintItem: 'Fiat',
                      iconItem: Icons.public,
                    ),
                    FormItem(
                      controllerItem: _ctrlModelField,
                      labelItem: 'Modelo',
                      hintItem: 'Argo',
                      iconItem: Icons.time_to_leave,
                    ),
                    FormItem(
                      controllerItem: _ctrlEngineField,
                      labelItem: 'Motor',
                      hintItem: '1.3 16V Firefly',
                      iconItem: Icons.gas_meter,
                    ),
                    ElevatedButton(
                      child: const Text('Confirmar'),
                      onPressed: () => _createNewVehicle(context),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return VehiclesList();
          }));
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.list_alt_rounded),
      ),
    );
  }
}
