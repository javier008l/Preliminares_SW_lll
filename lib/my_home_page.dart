import 'package:crud/editar_contacto.dart';
import 'package:crud/mensaje_respuesta.dart';
import 'package:crud/registrar_contacto.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String _tittle;
  MyHomePage(this._tittle);
  @override
  State<StatefulWidget> createState() => _MyHomePAge();
}

class _MyHomePAge extends State<MyHomePage> {
  List<Contacto> contactos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._tittle),
      ),
      body: ListView.builder(
        itemCount: contactos.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ModificarContacto(contactos[index])))
                  .then((nuevoContacto) {
                if (nuevoContacto != null) {
                  setState(() {
                    contactos.removeAt(index);

                    contactos.insert(index, nuevoContacto);

                    mensajeRespuesta(
                        context, nuevoContacto.name + " a sido modificado");
                  });
                }
              });
            },
            onLongPress: () {
              eliminarContacto(context, contactos[index]);
            },
            title: Text(contactos[index].name + "" + contactos[index].surname),
            subtitle: Text(contactos[index].phone),
            leading: CircleAvatar(
              child: Text(contactos[index].name.substring(0, 1)),
            ),
            trailing: const Icon(
              Icons.call,
              color: Colors.red,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (_) => RegistrarContacto()))
              .then((nuevoContacto) {
            if (nuevoContacto != null) {
              setState(() {
                contactos.add(nuevoContacto);
                mensajeRespuesta(
                    context, nuevoContacto.name + " Ha sido guardado");
              });
            }
          });
        },
        tooltip: "Agregar Contacto",
        child: const Icon(Icons.add),
      ),
    );
  }
  eliminarContacto(BuildContext context, Contacto contacto) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Eliminar Contacto"),
              content: Text("Esta seguro de eliminar a " + contacto.name),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      contactos.remove(contacto);
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ));
  }
}

class Contacto {
  var name;
  var surname;
  var phone;

  Contacto({this.name, this.surname, this.phone});
}
