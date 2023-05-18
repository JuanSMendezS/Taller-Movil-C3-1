import 'package:actividad_c3_1/database/transacciones.dart';
import 'package:flutter/material.dart';

class Crudproductos extends StatefulWidget {
  const Crudproductos({super.key});

  @override
  State<Crudproductos> createState() => _CrudproductosState();
}

class _CrudproductosState extends State<Crudproductos> {
  TextEditingController cNombre = TextEditingController();
  TextEditingController cPrecio = TextEditingController();
  TextEditingController cReferencia = TextEditingController();

  int respuesta = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(),
              child: Container(
                color: const Color(0xff3b5999).withOpacity(0.85),
                padding: const EdgeInsets.only(top: 90, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: const TextSpan(
                            text: "My ",
                            style: TextStyle(
                                fontSize: 25,
                                letterSpacing: 2,
                                color: Colors.yellow),
                            children: [
                          TextSpan(
                              text: "App",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow))
                        ])),
                    const Text(
                      "Registro de productos",
                      style: TextStyle(letterSpacing: 1, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 380,
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 5)
                  ]),
              child: Column(
                children: [
                  cajaTexto(
                      "Digite nombre producto", Icons.shopping_cart, cNombre),
                  cajaTexto("Digite precio", Icons.price_change, cPrecio),
                  cajaTexto(
                      "Digite referencia", Icons.description, cReferencia),
                  btnRegistrar(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget cajaTexto(String hint, IconData ic, TextEditingController nomCnt) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: nomCnt,
        decoration: InputDecoration(
            prefixIcon: Icon(
              ic,
              color: Colors.grey,
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: hint),
      ),
    );
  }

  Widget btnRegistrar() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          registrar();
        },
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        child: const Text("Registrar"),
      ),
    );
  }

  void registrar() async {
    respuesta = await Transaction.regProductos(
        cNombre.text, int.parse(cPrecio.text), cReferencia.text);
    cNombre.text = "";
    cPrecio.text = "";
    cReferencia.text = "";
    mostrarAlerta();
  }

  mostrarAlerta() {
    Widget okBoton = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text("Aceptar"));

    AlertDialog alerta = AlertDialog(
      title: const Text("Notificación"),
      content: const Text("Se ha registrado un producto"),
      actions: [
        okBoton,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alerta;
        });
  }
}
