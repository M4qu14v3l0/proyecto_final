import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_final/ui/widgets/justorders_widget.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List orders = [];

  initState() {
    super.initState();
    getDataProducts();
  }

  getDataProducts() async {
    Uri _uri = Uri.parse(
        'https://teamapi.bladimirchipana.repl.co/pedidos?_id=64a1d621645788d804c4d575');
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      print("EXITOSOOOOOOOOOOOOO");
      setState(() {});

      orders = data;
    }
  }

  @override
  Widget build(BuildContext context) {
    getDataProducts();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text("Mis ordenes"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                GridView.count(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 60,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.80,
                  children: orders
                      .map((e) => Justorders_widget(
                            productName: e["nombre_producto"],
                            productDescription: e["estado"],
                            productImage: e["imagen_producto"],
                          ))
                      .toList(),
                )
              ],
            ),
          )),
    );
  }
}
