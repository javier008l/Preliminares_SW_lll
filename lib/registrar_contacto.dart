import 'package:crud/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:crud/text_box.dart';
import 'package:flutter/services.dart';

class RegistrarContacto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _registar_Contacto();
}

class _registar_Contacto extends State<RegistrarContacto> {
  late TextEditingController controllerName;
  late TextEditingController controllerSurname;
  late TextEditingController controllerPhone;

  @override
  void initState() {
    controllerName = TextEditingController();
    controllerSurname = TextEditingController();
    controllerPhone = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar Contacto"),
      ),
      body: ListView(
        children: [
          TextBox(controllerName, "Nombre"),
          TextBox(controllerSurname, "Apellido"),
          TextBox(
            controllerPhone,
            "Teléfono",
            keyboardType: TextInputType.number, // Teclado numérico
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ], // Solo permitir números
          ),
          ElevatedButton(
              onPressed: () {
                String name = controllerName.text;
                String surname = controllerSurname.text;
                String phone = controllerPhone.text;

                String fullName = "$name $surname";

                if (name.isNotEmpty && surname.isNotEmpty && phone.isNotEmpty) {
                  Navigator.pop(context,
                      Contacto(name: fullName, phone: phone));
                }
              },
              child: const Text("Guardar Contacto")),
        ],
      ),
    );
  }
}
