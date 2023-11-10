import 'package:flutter/material.dart';
import 'package:nerds_project/database/remote_database.dart';
import 'package:nerds_project/models/product.dart';
import 'package:nerds_project/screens/details_screen.dart';

class StoreHome extends StatefulWidget {
  const StoreHome({super.key});

  @override
  State<StoreHome> createState() => _StoreHomeState();
}

class _StoreHomeState extends State<StoreHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(toolbarHeight: 0,),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 40, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text(
                      "Enjoy 50% Off Sales",
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurpleAccent),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_active))
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
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
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: DatabaseMethods().fetchProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Network Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No products available'));
                  } else {
                    final products = snapshot.data;
                    return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GridView.builder(
                          itemCount: products!.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  mainAxisExtent: 180,
                                  childAspectRatio: 2),
                          itemBuilder: (context, index) {
                            return InkWell(
                              splashColor: Colors.purpleAccent,
                              onTap: () {
                                Route route = MaterialPageRoute(
                                    builder: (_) => DetailsScreeen(
                                          product: products[index],
                                          index: index,
                                        ));
                                Navigator.push(context, route);
                              },
                              //45
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      products[index].image ?? '',
                                      fit: BoxFit.cover,
                                      height: 180,
                                    ),
                                  ),
                                  Positioned(
                                      right: 0,
                                      left: 0,
                                      bottom: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 5.0, left: 5, right: 5),
                                        child: Card(
                                          elevation: 0,
                                          color: Colors.deepPurpleAccent
                                              .withOpacity(0.7),
                                          child: Container(
                                              width: 120,
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    products[index].name ?? "",
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    products[index]
                                                            .subDescription ??
                                                        '',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          "₵ ${products[index].price}",
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                          )),
                                                      const Row(
                                                        children: [
                                                          Icon(
                                                            Icons.arrow_drop_up,
                                                            color: Colors.white,
                                                          ),
                                                          Text(
                                                            "(4.9)",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Icon(
                                                        Icons.add_circle_sharp,
                                                        color: Colors.white,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )),
                                        ),
                                      )),
                                  const Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.favorite_outline_sharp,
                                          color: Colors.white,
                                        ),
                                      ))
                                ],
                              ),
                            );
                          },
                        ));
                  }
                },
              ),
            ),
          ],
        ));
  }
}
