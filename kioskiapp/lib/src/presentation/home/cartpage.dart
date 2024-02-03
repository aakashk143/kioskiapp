import 'package:flutter/material.dart';
import 'package:kioski/src/presentation/home/cart.dart';
import 'package:kioski/src/presentation/home/product.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          List<Product> cartItems = cartProvider.cart.items;
          if (cartItems.isEmpty) {
            return Center(
              child: Text('Your cart is empty.'),
            );
          }
          double total = 0.0;
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30, top: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cart',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Inter',
                            fontSize: 70,
                            letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 236, 136, 1),
                          borderRadius: BorderRadius.all(
                            Radius.elliptical(130, 130),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '2',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: 50,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 1080,
                  height: 1880,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    color: Color.fromRGBO(255, 190, 219, 1),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            Product product = cartItems[index];
                            total += product.price;

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 220,
                                      height: 280,
                                      margin: EdgeInsets.only(right: 20),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              384.7924499511719),
                                          topRight: Radius.circular(
                                              384.7924499511719),
                                          bottomLeft: Radius.circular(
                                              384.7924499511719),
                                          bottomRight: Radius.circular(
                                              384.7924499511719),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/images/Screenshot20240130at6311.png",
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                            Color.fromRGBO(0, 0, 0, 0.25),
                                            offset: Offset(0, 4),
                                            blurRadius: 25,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartItems[index].name,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 40),
                                        ),
                                        Text(
                                          cartItems[index].description,
                                          style: TextStyle(
                                              color:
                                              Color.fromRGBO(85, 85, 85, 1),
                                              fontSize: 30),
                                        ),
                                        Text(
                                          cartItems[index]
                                              .price
                                              .toStringAsFixed(2),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 40),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 236, 136, 1),
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(130, 130)),
                                  ),
                                  child: Center(
                                      child: Text(
                                        "1 x",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 48),
                                      )),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      Container(
                        width: 900,
                        height: 400,
                        margin: EdgeInsets.only(bottom: 40),
                        padding: EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(54),
                            topRight: Radius.circular(54),
                            bottomLeft: Radius.circular(54),
                            bottomRight: Radius.circular(54),
                          ),
                          color: Color.fromRGBO(255, 236, 136, 1),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total Amount',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 64,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Rs. 1270',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 64,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                                ],
                              ),
                              Container(
                                height: 400,
                                width: 350,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(54),
                                    topRight: Radius.circular(54),
                                    bottomLeft: Radius.circular(54),
                                    bottomRight: Radius.circular(54),
                                  ),
                                  color: Color.fromRGBO(237, 129, 177, 1),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 900,
                        height: 230,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(54),
                            topRight: Radius.circular(54),
                            bottomLeft: Radius.circular(54),
                            bottomRight: Radius.circular(54),
                          ),
                          color: Color.fromRGBO(237, 129, 177, 1),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Make Payment',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 64,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                              Container(
                                width: 200,
                                height: 120,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(53.68254852294922),
                                    topRight:
                                    Radius.circular(53.68254852294922),
                                    bottomLeft:
                                    Radius.circular(53.68254852294922),
                                    bottomRight:
                                    Radius.circular(53.68254852294922),
                                  ),
                                  color: Color.fromRGBO(255, 236, 136, 1),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 50,
                                        color: Colors.black,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 50,
                                        color: Colors.black,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 50,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}