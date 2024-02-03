import 'package:flutter/material.dart';
import 'package:kioski/src/presentation/home/product.dart';
import 'package:kioski/src/presentation/home/productpage.dart';
import 'package:provider/provider.dart';

import 'cartpage.dart';



class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}


class _ProductListPageState extends State<ProductListPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Product List"),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, size: 20),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
              )
            ],
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;
              final screenHeight = constraints.maxHeight;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.05),
                      child: Text(
                        "Product",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 10.0,
                        mainAxisExtent: screenWidth > 600 ? 400 : 320,
                      ),
                      itemCount: value.products.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            value.getCurIndex(index);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductPage(
                                  product: value.products[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: screenWidth * 0.3,
                            height: screenHeight * 0.40,
                            padding: EdgeInsets.only(
                              top: screenWidth * 0.02,
                              left: screenWidth * 0.02,
                              right: screenWidth * 0.02,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(0, 4),
                                  blurRadius: 25,
                                )
                              ],
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          width: screenWidth * 0.3,
                                          height: screenHeight * 0.26,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/images/Screenshot20240130at6311.png",
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.25),
                                                offset: Offset(0, 4),
                                                blurRadius: 25,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Overlay text
                                    Positioned(
                                      bottom: screenWidth * 0.01,
                                      left: screenWidth * 0.03,
                                      child: Container(
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                            bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8),
                                          ),
                                          color:
                                              Color.fromRGBO(215, 215, 215, 1),
                                        ),
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "4.3 ",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: screenWidth * 0.02,
                                                ),
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: screenWidth * 0.02,
                                              )
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.02, top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value.products[index].name,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenWidth * 0.02,
                                        ),
                                      ),
                                      Text(
                                        value.products[index].description,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenWidth * 0.02,
                                        ),
                                      ),
                                      Text(
                                        'Price: \$${value.products[index].price}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenWidth * 0.02,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                    // Text below the image
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
