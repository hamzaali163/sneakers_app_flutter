import 'package:ecommerce_app/respository/components/app_styles.dart';
import 'package:ecommerce_app/respository/components/round_button.dart';
import 'package:ecommerce_app/respository/components/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  PersistentShoppingCart cart = PersistentShoppingCart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f9),
      appBar: AppBar(
        backgroundColor: const Color(0xfff7f7f9),
        title: const Text('My Cart'),
        titleTextStyle: TextStyling.apptitle,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, RouteNames.navbarscreen);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: cart.showCartItemCountWidget(
                cartItemCountWidgetBuilder: ((int itemCount) {
              return Badge(
                label: Text(itemCount.toString()),
                child: Container(
                  height: 52,
                  width: 52,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    'images/cart.png',
                    color: Colors.black,
                  ),
                ),
              );
            })),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            children: [
              Expanded(
                child: cart.showCartItems(
                    cartTileWidget: ({required data}) {
                      return Card(
                          child: Slidable(
                        startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            extentRatio: 0.2,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: AppColor.backgroundColor),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          cart.incrementCartItemQuantity(
                                              data.productId);
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        data.quantity.toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          cart.decrementCartItemQuantity(
                                              data.productId);
                                        },
                                        child: const Icon(
                                          Icons.minimize,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ]),
                        endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            extentRatio: 0.3,
                            children: [
                              SlidableAction(
                                flex: 1,
                                onPressed: (context) {
                                  cart.removeFromCart(data.productId);
                                },
                                backgroundColor: const Color(0xffFF1900),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              )
                            ]),
                        child: Container(
                          height: 104,
                          width: double.infinity,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 25,
                              ),
                              Image(
                                image: AssetImage(
                                    data.productThumbnail.toString()),
                                height: 50,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.productName,
                                    style: const TextStyle(
                                        fontFamily: 'Raleway-Medium',
                                        fontSize: 16,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      const Text(r'$'),
                                      Text(
                                        data.unitPrice.toString(),
                                        style: const TextStyle(
                                            fontFamily: 'Poppins Medium',
                                            fontSize: 16,
                                            color: Colors.black),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ));
                    },
                    showEmptyCartMsgWidget: Center(
                      child: Image.asset(
                        'images/emptycart.png',
                      ),
                    )),
              ),
              cart.showTotalAmountWidget(
                cartTotalAmountWidgetBuilder: (totalAmount) => Visibility(
                  visible: totalAmount == 0.0 ? false : true,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      color: Colors.white,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 30, right: 8, left: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Subtotal',
                                  style: TextStyle(
                                      fontFamily: 'Raleway-SemiBold',
                                      color: Color(0xff707B81),
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.47,
                                ),
                                Text(
                                  r'$' + cart.calculateTotalPrice().toString(),
                                  style: const TextStyle(
                                      fontFamily: 'Poppins-Medium',
                                      color: Color(0xff1A2530),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Discount',
                                  style: TextStyle(
                                    fontFamily: 'Raleway-SemiBold',
                                    color: Color(0xff707B81),
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                ),
                                const Text(
                                  '0',
                                  style: TextStyle(
                                      fontFamily: 'Poppins-Medium',
                                      color: Color(0xff1A2530),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Total Cost',
                                  style: TextStyle(
                                      fontFamily: 'Poppins-Medium',
                                      color: Color(0xff1A2530),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.42,
                                ),
                                Text(
                                  r'$' + cart.calculateTotalPrice().toString(),
                                  style: const TextStyle(
                                      fontFamily: 'Poppins-Medium',
                                      color: Color(0xff1A2530),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            RoundButtonTwo(
                                onpress: () {
                                  Navigator.pushNamed(
                                      context, RouteNames.checkOutScreen);
                                },
                                title: 'Check Out')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
