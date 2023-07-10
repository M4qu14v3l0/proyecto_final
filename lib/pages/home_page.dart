import 'package:flutter/material.dart';
import 'package:proyecto_final/pages/orders_page.dart';
import 'package:proyecto_final/pages/products_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://www.seekpng.com/png/detail/339-3392184_home-icons-blue-home-icon-blue-png.png"),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          offset: const Offset(10, 10),
                          blurRadius: 12),
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Teamfy",
              ),
              const SizedBox(
                width: 160,
                child: Divider(),
              ),
              ItemComponentWidget(
                title: "Mis productos",
                toPage: Products(),
              ),
              ItemComponentWidget(
                title: "Pedidos",
                toPage: Orders(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemComponentWidget extends StatelessWidget {
  String title;
  Widget toPage;

  ItemComponentWidget({required this.title, required this.toPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.3),
                offset: const Offset(5, 5),
                blurRadius: 12)
          ]),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => toPage),
          );
        },
        leading: const Icon(
          Icons.check_circle_outline,
          color: Colors.blue,
        ),
        title: Text(
          title,
        ),
        subtitle: Text(
          "Ir al detalle de $title",
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.blue,
        ),
      ),
    );
  }
}
