import 'package:flutter/material.dart';
import 'package:nerds_project/database/remote_database.dart';
import 'package:nerds_project/models/product.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.04),
                  borderRadius: const BorderRadius.all(Radius.circular(16))),
              child: TextFormField(
                // controller: search,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: "Search for your products"),
                onChanged: (value) {},
              ),
            ),
          ),
          SizedBox(
            height: 600,
            child: FutureBuilder(future: DatabaseMethods().fetchProducts(),
             builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Network Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No products available'));
              } else {
                final products = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: products!.length,
                  itemBuilder: (context, index){
                    return productCard(products[index]);
                  });
              }}
             ),
          )
          ],
        )
      ),
    );
  }

  Card productCard(Product product) {
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
                    product.image ?? '',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(product.name ?? ''),
                        const Icon(
                          Icons.favorite_outline_sharp,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    // width: 80,
                    child: Text(
                      product.subDescription ?? '', overflow: TextOverflow.clip,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    product.price ?? '',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          )),
    );
  }

}