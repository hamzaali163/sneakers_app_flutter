import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/respository/app_bar.dart';
import 'package:ecommerce_app/respository/components/product_container.dart';
import 'package:ecommerce_app/respository/components/route_names.dart';
import 'package:ecommerce_app/view/home/product_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final id = FirebaseAuth.instance.currentUser!.uid.toString();
  final firebase = FirebaseFirestore.instance
      .collection("Favourites")
      .doc(FirebaseAuth.instance.currentUser!.uid.toString());

  PersistentShoppingCart cart = PersistentShoppingCart();
  final db2 = FirebaseFirestore.instance.collection('Favourites');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF7F7F9),
        appBar: AppBarComp(
          apptitle: 'Favourites',
          appleading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.navbarscreen);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
              )),
        ),
        body: StreamBuilder(
            stream: firebase.collection('items').snapshots(),
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.purple,
                ));
              } else if (snapshot.hasError) {
                const Center(
                  child: Text("Error Occured"),
                );
              }

              return Padding(
                padding: const EdgeInsets.only(
                  top: 37,
                  left: 12,
                  right: 12,
                ),
                child: GridView.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: List.generate(snapshot.data!.size, (index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ProductDetails(
                                      title: snapshot.data!.docs[index]['name'],
                                      price: snapshot.data!.docs[index]
                                          ['price'],
                                      productid: snapshot.data!.docs[index]
                                          ['product id'],
                                      unitprice: snapshot
                                          .data!.docs[index]['price']
                                          .toString(),
                                      image: snapshot.data!.docs[index]
                                          ['image'],
                                    )));
                      },
                      child: CartContainer(
                        price: r'$' +
                            snapshot.data!.docs[index]['price'].toString(),
                        subtitle: snapshot.data!.docs[index]['name'].toString(),
                        title: snapshot.data!.docs[index]['subtitle'],
                        imagelink:
                            AssetImage(snapshot.data!.docs[index]['image']),
                      ),
                    );
                  }),
                ),
              );
            }));
  }
}
