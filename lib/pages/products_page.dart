import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_final/ui/widgets/product_widget.dart';

class Products extends StatefulWidget {
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List products = [];

  initState() {
    super.initState();
    getDataProducts();
  }

  getDataProducts() async {
    Uri _uri = Uri.parse(
        'https://teamapi.bladimirchipana.repl.co/userpr?_id=64a1d621645788d804c4d575');
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      setState(() {});
      products = data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text("Mis productos"),
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
                  children: products
                      .map((e) => ProductWidget(
                          productName: e["nombre"],
                          productDescription: e["precio"],
                          productImage: e["imagen"]))
                      .toList(),
                )
              ],
            ),
          )),
    );
  }
}
