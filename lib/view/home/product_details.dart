import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/product_list.dart';
import 'package:ecommerce_app/respository/components/app_styles.dart';
import 'package:ecommerce_app/respository/components/route_names.dart';
import 'package:ecommerce_app/utils/fav_provider.dart';
import 'package:ecommerce_app/utils/general_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final String unitprice;
  final String productid;

  ProductDetails(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.unitprice,
      required this.productid});
  final db2 = FirebaseFirestore.instance.collection('Favourites');
  final id = FirebaseAuth.instance.currentUser!.uid.toString();
  final PersistentShoppingCart cart = PersistentShoppingCart();

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    final favprovider = Provider.of<FavouriteProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xfff7f7f9),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, RouteNames.navbarscreen);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        backgroundColor: const Color(0xfff7f7f9),
        title: const Text(
          'Sneakers Shop',
          style: TextStyle(fontFamily: 'Raleway-SemiBold', fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: screenwidth * 0.06,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: const TextStyle(fontFamily: 'Raleway-Bold', fontSize: 26),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Mens Shoes',
              style: TextStyle(color: Color(0xff707b81), fontFamily: 'Poppins'),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              r'$' + price,
              style:
                  const TextStyle(fontFamily: 'Poppins-Medium', fontSize: 26),
            ),
            SizedBox(
              height: screenheight * 0.05,
            ),
            Center(
              child: Image(
                image: AssetImage(image),
                height: screenheight * 0.18,
                width: screenwidth * 0.7,
              ),
            ),
            SizedBox(
              height: screenheight * 0.05,
            ),
            const Text(
              'The Max Air 270 unit delivers unrivaled, all-day\r comfort. The sleek, running-inspired design\r roots you to everything Nike........',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Color(0xff707B81)),
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffD9D9D9)),
                    child: IconButton(
                        onPressed: () async {
                          if (favprovider.items.contains(productid)) {
                            favprovider.remove(productid);

                            db2
                                .doc(id)
                                .collection('items')
                                .doc(productid)
                                .delete();
                          } else {
                            favprovider.add(productid);
                            db2.doc(id).collection('items').doc(productid).set({
                              'product id': ProductList()
                                  .itemlist[0]['productId']
                                  .toString(),
                              'name': title,
                              'subtitle': 'Best Seller',
                              'image': image,
                              'price': price,
                            });
                          }
                        },
                        icon: Icon(
                          favprovider.items.contains(productid)
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: Colors.red,
                        )),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      cart
                          .addToCart(PersistentShoppingCartItem(
                              productThumbnail: image,
                              productId: productid,
                              productName: title,
                              unitPrice: double.parse(unitprice),
                              quantity: 1))
                          .then((value) => {
                                GeneralUtils().showsuccessflushbar(
                                    'Product added to cart', context)
                              });
                    },
                    child: Container(
                      height: 50,
                      width: 208,
                      decoration: BoxDecoration(
                          color: AppColor.backgroundColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('images/cart.png'),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('Add To Cart',
                              style: TextStyle(
                                  fontFamily: 'Raleway-SemiBold',
                                  color: Colors.white,
                                  fontSize: 14))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
