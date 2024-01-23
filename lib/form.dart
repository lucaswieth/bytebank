import 'package:flutter/material.dart';
import 'vehicle.dart';
import 'cards.dart';
//form

class FormVehicle extends StatelessWidget {
  final TextEditingController _ctrlYearField = TextEditingController();
  final TextEditingController _ctrlBrandField = TextEditingController();
  final TextEditingController _ctrlModelField = TextEditingController();
  final TextEditingController _ctrlEngineField = TextEditingController();

  FormVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário - Veículo'),
        backgroundColor: Colors.orange,
      ),
      body: Builder(builder: (context) {
        return Center(
          child: SizedBox(
            width: 500,
            child: Column(children: [
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
                onPressed: () {
                  saveVehicle(context);
                },
              ),
            ]),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return VehiclesList();
          }));
          future.then((vehicle) {
            debugPrint('then future');
            debugPrint('$vehicle');
          });
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.list_alt_rounded),
      ),
    );
  }

  void saveVehicle(BuildContext context) {
    try {
      final int year = int.parse(_ctrlYearField.text);
      final String brand = _ctrlBrandField.text;
      final String model = _ctrlModelField.text;
      final String engine = _ctrlEngineField.text;

      final newVehicle = Vehicle(year, brand, model, engine);
      debugPrint(newVehicle.brand);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Veículo cadastrado'),
        backgroundColor: Colors.orange,
      ));

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return VehiclesList();
          },
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Não foi possível cadastrar o veículo'),
        backgroundColor: Colors.red,
      ));
    }
  }
}

class FormItem extends StatelessWidget {
  final TextEditingController controllerItem;
  final String? labelItem;
  final String? hintItem;
  final IconData? iconItem;

  //FormItem({super.key, required TextEditingController controllerItem});

  FormItem(
      {required this.controllerItem,
      this.labelItem,
      this.hintItem,
      this.iconItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: controllerItem,
        decoration: InputDecoration(
          icon: Icon(iconItem),
          labelText: labelItem,
          hintText: hintItem,
        ),
      ),
    );
  }
}
