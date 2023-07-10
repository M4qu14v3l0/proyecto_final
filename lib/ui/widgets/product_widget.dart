import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String productName;
  final String productDescription;
  final String productImage;

  ProductWidget({
    required this.productName,
    required this.productDescription,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(
            productImage,
            fit: BoxFit.cover,
            height: 120,
            width: double.infinity,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  productName.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Precio: S/.${productDescription}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
