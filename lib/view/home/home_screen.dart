import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/product_list.dart';
import 'package:ecommerce_app/respository/app_bar.dart';
import 'package:ecommerce_app/respository/components/app_styles.dart';
import 'package:ecommerce_app/respository/components/product_container.dart';
import 'package:ecommerce_app/respository/components/route_names.dart';
import 'package:ecommerce_app/utils/fav_provider.dart';
import 'package:ecommerce_app/view/home/product_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PersistentShoppingCart cart = PersistentShoppingCart();
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    final db2 = FirebaseFirestore.instance.collection('Favourites');
    final id = FirebaseAuth.instance.currentUser!.uid.toString();
    // var scaffoldKey = GlobalKey<ScaffoldState>();

    final favprovider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      // key: scaffoldKey,

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBarComp(
          color: const Color(0xfff7f7f9),
          apptitle: 'Explore',
          appleading: IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Image(image: AssetImage('images/bar.png'))),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: cart.showCartItemCountWidget(
                  cartItemCountWidgetBuilder: ((int itemCount) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.cartscreen);
                  },
                  child: Badge(
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
                  ),
                );
              })),
            ),
            const SizedBox(
              width: 30,
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xffF7F7F9),

      ///drawer and nav bar end
      body: Padding(
        padding: EdgeInsets.only(
          left: screenwidth * 0.05,
          right: screenwidth * 0.05,

          //  right: screenwidth * 0.04,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenheight * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 245,
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xff6A6A6A),
                          ),
                          hintText: 'Looking for shoes',
                          hintStyle: TextStyling.hinttext,
                          filled: true,
                          fillColor: const Color(0xffffffff),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                  SizedBox(width: screenwidth * 0.035),
                  InkWell(
                    onTap: () {
                      GoogleSignIn().signOut().then((value) {
                        Navigator.pushNamed(context, RouteNames.screenTwo);
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff0D6EFD),
                      ),
                      child: Image.asset('images/sliders.png'),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: screenheight * 0.03,
              ),
              const Text(
                'Select Category',
                style: TextStyle(
                    fontFamily: 'Raleway-SemiBold',
                    color: Colors.black,
                    fontSize: 16),
              ),
              SizedBox(
                height: screenheight * 0.03,
              ),
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 95,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(12))),
                    child: const Center(
                        child: Text(
                      'All Shoes',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.black),
                    )),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    height: 48,
                    width: 95,
                    decoration: const BoxDecoration(
                        color: AppColor.backgroundColor,
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(12))),
                    child: const Center(
                        child: Text(
                      'Outdoor',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.white),
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 48,
                    width: 95,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(12))),
                    child: const Center(
                        child: Text(
                      'Tennis',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.black),
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: screenheight * 0.03,
              ),
              Row(
                children: [
                  const Text(
                    'Popular Shoes',
                    style: TextStyle(
                        fontFamily: 'Raleway-SemiBold',
                        color: Colors.black,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: screenwidth * 0.35,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.productsScreen);
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                          fontFamily: 'Raleway-SemiBold',
                          color: AppColor.backgroundColor,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ProductDetails(
                                  title: ProductList().itemlist[0]
                                      ['productname'],
                                  price: ProductList().itemlist[0]
                                      ['productprice'],
                                  productid: ProductList().itemlist[0]
                                      ['productId'],
                                  unitprice: ProductList().itemlist[0]
                                      ['unitprice'],
                                  image: ProductList()
                                      .itemlist[0]['imagelink']
                                      .toString())));
                    },
                    child: ProductContainer(
                      fav: IconButton(
                          onPressed: () async {
                            if (favprovider.items.contains(
                                ProductList().itemlist[0]['productId'])) {
                              favprovider.remove(
                                  ProductList().itemlist[0]['productId']);
                              db2
                                  .doc(id)
                                  .collection('items')
                                  .doc(ProductList().itemlist[0]['productId'])
                                  .delete();
                            } else {
                              favprovider
                                  .add(ProductList().itemlist[0]['productId']);
                              db2
                                  .doc(id)
                                  .collection('items')
                                  .doc(ProductList().itemlist[0]['productId'])
                                  .set({
                                'product id': ProductList()
                                    .itemlist[0]['productId']
                                    .toString(),
                                'name': ProductList()
                                    .itemlist[0]['productname']
                                    .toString(),
                                'subtitle': ProductList()
                                    .itemlist[0]['title']
                                    .toString(),
                                'image': ProductList()
                                    .itemlist[0]['imagelink']
                                    .toString(),
                                'price': ProductList()
                                    .itemlist[0]['productprice']
                                    .toString(),
                              });
                            }
                          },
                          icon: Icon(
                            favprovider.items.contains(
                                    ProductList().itemlist[0]['productId'])
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: Colors.red,
                          )),
                      id: '1',
                      subtitle: ProductList().itemlist[0]['productname'],
                      imagelink: ProductList().itemlist[0]['productimage'],
                      price: r'$' + ProductList().itemlist[0]['productprice'],
                      quantity: 0,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  //product 2
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ProductDetails(
                                  title: ProductList().itemlist[1]
                                      ['productname'],
                                  price: ProductList().itemlist[1]
                                      ['productprice'],
                                  productid: ProductList().itemlist[1]
                                      ['productId'],
                                  unitprice: ProductList().itemlist[1]
                                      ['unitprice'],
                                  image: ProductList()
                                      .itemlist[1]['imagelink']
                                      .toString())));
                    },
                    child: ProductContainer(
                      fav: IconButton(
                          onPressed: () async {
                            if (favprovider.items.contains(
                                ProductList().itemlist[1]['productId'])) {
                              favprovider.remove(
                                  ProductList().itemlist[1]['productId']);

                              db2
                                  .doc(id)
                                  .collection('items')
                                  .doc(ProductList().itemlist[1]['productId'])
                                  .delete();
                            } else {
                              db2
                                  .doc(id)
                                  .collection('items')
                                  .doc(ProductList().itemlist[1]['productId'])
                                  .set({
                                'product id': ProductList()
                                    .itemlist[1]['productId']
                                    .toString(),
                                'name': ProductList()
                                    .itemlist[1]['productname']
                                    .toString(),
                                'subtitle': ProductList()
                                    .itemlist[1]['title']
                                    .toString(),
                                'image': ProductList()
                                    .itemlist[1]['imagelink']
                                    .toString(),
                                'price': ProductList()
                                    .itemlist[1]['productprice']
                                    .toString(),
                              });
                              favprovider
                                  .add(ProductList().itemlist[1]['productId']);
                            }
                          },
                          icon: Icon(
                            favprovider.items.contains(
                                    ProductList().itemlist[1]['productId'])
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: Colors.red,
                          )),
                      id: '1',
                      subtitle: ProductList().itemlist[1]['productname'],
                      imagelink: ProductList().itemlist[1]['productimage'],
                      price: r'$' + ProductList().itemlist[1]['productprice'],
                      quantity: 0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'New Arrivals',
                    style: TextStyle(
                        fontFamily: 'Raleway-SemiBold',
                        color: Colors.black,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: screenwidth * 0.38,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.productsScreen);
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          color: AppColor.backgroundColor,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
              Container(
                height: screenheight * 0.14,
                width: screenwidth * 0.85,
                decoration: const BoxDecoration(color: Colors.white),
                child: const Padding(
                  padding: EdgeInsets.only(top: 10, left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Summer Sale',
                                style: TextStyle(
                                    fontFamily: 'Raleway-SemiBold',
                                    color: Colors.black,
                                    fontSize: 12),
                              ),
                              Text(
                                '15%  OFF',
                                style: TextStyle(
                                    fontFamily: 'Poppins-Medium',
                                    color: Color(0xff674DC5),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Image(
                            image: AssetImage(
                              'images/products/shoe3.png',
                            ),
                            height: 70,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),

      //
    );
  }
}
// appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(80),
      //   child: AppBar(
      //     actions: [
      //       Padding(
      //         padding: const EdgeInsets.only(top: 20),
      //         child: Badge(
      //           child: Container(
      //             height: 52,
      //             width: 52,
      //             decoration: const BoxDecoration(
      //               shape: BoxShape.circle,
      //               color: Colors.white,
      //             ),
      //             child: Image.asset(
      //               'images/cart.png',
      //               color: Colors.black,
      //             ),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(
      //         width: 20,
      //       ),
      //     ],
      //     leading: Padding(
      //       padding: const EdgeInsets.only(top: 20),
      //       child: IconButton(
      //           onPressed: () => scaffoldKey.currentState!.openDrawer(),
      //           icon: const Image(image: AssetImage('images/bar.png'))),
      //     ),
      //     title: const Padding(
      //       padding: EdgeInsets.only(top: 20),
      //       child: Text(
      //         'Explore',
      //         style: TextStyling.headingstyle,
      //       ),
      //     ),
      //     centerTitle: true,
      //   ),
   
      // ),