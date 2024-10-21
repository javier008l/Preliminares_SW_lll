import 'package:crud/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:crud/text_box.dart';
import 'package:flutter/services.dart';

class ModificarContacto extends StatefulWidget{
  final Contacto _contacto;
  ModificarContacto(this._contacto);
  @override
  State<StatefulWidget> createState() => _ModificarContacto();

}

class _ModificarContacto extends State<ModificarContacto>{
  late TextEditingController controllerName;
  late TextEditingController controllerSurname;
  late TextEditingController controllerPhone;

  @override
  void initState() {
    Contacto c = widget._contacto;
    controllerName = TextEditingController(text: c.name);
    controllerSurname = TextEditingController(text: c.surname);
    controllerPhone = TextEditingController(text: c.phone);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text("Modificar contacto"),
    ),

    body: ListView(
      children: [
          TextBox(controllerName, "Nombre"),
          TextBox(controllerSurname, "Apellido"),
          TextBox(controllerPhone, "Telefono",
            keyboardType: TextInputType.number, // Teclado numérico
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly]
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
        ]
    ),
    );
  }

}