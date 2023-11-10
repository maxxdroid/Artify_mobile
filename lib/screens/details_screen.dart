import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:nerds_project/models/product.dart';

class DetailsScreeen extends StatefulWidget {

  final Product product;

  final int index;

  const DetailsScreeen({super.key, required this.product, required this.index});

  @override
  State<DetailsScreeen> createState() => _DetailsScreeenState();
}

class _DetailsScreeenState extends State<DetailsScreeen> {

  Product? product;
  int index = 0;

  @override
  void initState() {
    product = widget.product;
    index = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Details",
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.grey),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.grey,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child:  SizedBox(
                    height: 300,
                    // width: 250,
                    child: ModelViewer(
                      src: productModels[index],
                      autoRotate: true,
                    ),
                  ),
                ),
                // SizedBox(
                //   width: width * 0.8,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(20),
                //           child: Image.network(
                //         "https://th.bing.com/th/id/OIP.YXP2XhbIzXRhFUzp4uFmgAHaHa?pid=ImgDet&rs=1",
                //         width: 70,
                //         height: 70,
                //         fit: BoxFit.fill,
                //       )),
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(20),
                //           child: Image.network(
                //         "https://s24990.pcdn.co/wp-content/uploads/2018/05/Baseball-Bat-Murder-27.jpg",
                //         width: 70,
                //         height: 70,
                // \        fit: BoxFit.fill,
                //       )),
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(20),
                //           child: Image.network(
                //         "https://th.bing.com/th/id/OIP.YXP2XhbIzXRhFUzp4uFmgAHaHa?pid=ImgDet&rs=1",
                //         width: 70,
                //         height: 70,
                //         fit: BoxFit.fill,
                //       )),
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(20),
                //           child: Image.network(
                //         "https://s24990.pcdn.co/wp-content/uploads/2018/05/Baseball-Bat-Murder-27.jpg",
                //         width: 70,
                //         height: 70,
                //         fit: BoxFit.fill,
                //       )),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    product!.subDescription ?? '',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                      product!.description ?? ""),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            product!.price ?? "₵300",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.remove_circle_outline,
                              color: Colors.grey,
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.add_box_outlined,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star),
                          SizedBox(
                            width: 5,
                          ),
                          Text("150 reviews"),
                        ],
                      ),
                      Container(
                        // color: Colors.grey,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.3),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Sold 0"),
                        ),
                      ),
                      Container(
                        // color: Colors.grey,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.3),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "In Stock",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 0, right: 0, bottom: 20),
                          height: height * 0.1,
                          width: width * 0.4,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.deepPurple,
                                backgroundColor: Colors.deepPurpleAccent),
                            child: const Text(
                              "Add to cart",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 0, right: 0, bottom: 20),
                          height: height * 0.1,
                          width: width * 0.4,
                          child: ElevatedButton(
                            onPressed: () {
                              print("..........${product!.image3d }");
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.deepPurple,
                                backgroundColor: Colors.deepPurpleAccent),
                            child: const Text(
                              "Buy now",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
