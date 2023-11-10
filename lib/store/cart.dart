import 'package:flutter/material.dart';

class Carts extends StatefulWidget {
  const Carts({super.key});

  @override
  State<Carts> createState() => _CartState();
}

class _CartState extends State<Carts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text("My Cart"),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [productCard()],
                )
              ],
            ),
          ),
        ));
  }

  Card productCard() {
    return Card(
      color: Colors.white,
      child: Container(
          height: 120,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://futonland.com/common/images/products/large/JOIN_Truffle_8.jpg",
                    width: 100,
                    fit: BoxFit.fitWidth,
                  )),
              const SizedBox(
                width: 5,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 190,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Stylist soft chair"),
                        Icon(
                          Icons.favorite_outline_sharp,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Medium and soft",
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "₵ 250",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          )),
    );
  }
}
