import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/product_list.dart';
import 'package:ecommerce_app/respository/components/product_container.dart';
import 'package:ecommerce_app/respository/components/route_names.dart';
import 'package:ecommerce_app/utils/fav_provider.dart';
import 'package:ecommerce_app/view/home/product_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowProducts extends StatefulWidget {
  const ShowProducts({super.key});

  @override
  State<ShowProducts> createState() => _ShowProductsState();
}

class _ShowProductsState extends State<ShowProducts> {
  final db2 = FirebaseFirestore.instance.collection('Favourites');
  final id = FirebaseAuth.instance.currentUser!.uid.toString();

  @override
  Widget build(BuildContext context) {
    final favprovider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xfff7f7f9),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, RouteNames.navbarscreen);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: const Text('All Products'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: GridView.count(
          mainAxisSpacing: 15,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            ShowProductContainer(
                subtitle: ProductList().itemlist[0]['productname'],
                imagelink: ProductList().itemlist[0]['productimage'],
                price: r'$' + ProductList().itemlist[0]['productprice'],
                id: ProductList().itemlist[0]['productId'],
                quantity: 0,
                fav: IconButton(
                    onPressed: () async {
                      if (favprovider.items
                          .contains(ProductList().itemlist[0]['productId'])) {
                        favprovider
                            .remove(ProductList().itemlist[0]['productId']);

                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[0]['productId'])
                            .delete();
                      } else {
                        favprovider.add(ProductList().itemlist[0]['productId']);
                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[0]['productId'])
                            .set({
                          'product id':
                              ProductList().itemlist[0]['productId'].toString(),
                          'name': ProductList()
                              .itemlist[0]['productname']
                              .toString(),
                          'subtitle':
                              ProductList().itemlist[0]['title'].toString(),
                          'image':
                              ProductList().itemlist[0]['imagelink'].toString(),
                          'price': ProductList()
                              .itemlist[0]['productprice']
                              .toString(),
                        });
                      }
                    },
                    icon: Icon(
                      favprovider.items
                              .contains(ProductList().itemlist[0]['productId'])
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.red,
                    )),
                onclick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProductDetails(
                              title: ProductList().itemlist[0]['productname'],
                              price: ProductList().itemlist[0]['productprice'],
                              productid: ProductList().itemlist[0]['productId'],
                              unitprice: ProductList().itemlist[0]['unitprice'],
                              image: ProductList()
                                  .itemlist[0]['imagelink']
                                  .toString())));
                }),
            ShowProductContainer(
                subtitle: ProductList().itemlist[1]['productname'],
                imagelink: ProductList().itemlist[1]['productimage'],
                price: r'$' + ProductList().itemlist[1]['productprice'],
                id: ProductList().itemlist[1]['productId'],
                quantity: 0,
                fav: IconButton(
                    onPressed: () async {
                      if (favprovider.items
                          .contains(ProductList().itemlist[1]['productId'])) {
                        favprovider
                            .remove(ProductList().itemlist[1]['productId']);

                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[1]['productId'])
                            .delete();
                      } else {
                        favprovider.add(ProductList().itemlist[1]['productId']);
                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[1]['productId'])
                            .set({
                          'product id':
                              ProductList().itemlist[1]['productId'].toString(),
                          'name': ProductList()
                              .itemlist[1]['productname']
                              .toString(),
                          'subtitle':
                              ProductList().itemlist[1]['title'].toString(),
                          'image':
                              ProductList().itemlist[1]['imagelink'].toString(),
                          'price': ProductList()
                              .itemlist[0]['productprice']
                              .toString(),
                        });
                      }
                    },
                    icon: Icon(
                      favprovider.items
                              .contains(ProductList().itemlist[1]['productId'])
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.red,
                    )),
                onclick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProductDetails(
                              title: ProductList().itemlist[1]['productname'],
                              price: ProductList().itemlist[1]['productprice'],
                              productid: ProductList().itemlist[1]['productId'],
                              unitprice: ProductList().itemlist[1]['unitprice'],
                              image: ProductList()
                                  .itemlist[1]['imagelink']
                                  .toString())));
                }),
            ShowProductContainer(
                subtitle: ProductList().itemlist[2]['productname'],
                imagelink: ProductList().itemlist[2]['productimage'],
                price: r'$' + ProductList().itemlist[2]['productprice'],
                id: ProductList().itemlist[2]['productId'],
                quantity: 0,
                fav: IconButton(
                    onPressed: () async {
                      if (favprovider.items
                          .contains(ProductList().itemlist[2]['productId'])) {
                        favprovider
                            .remove(ProductList().itemlist[2]['productId']);

                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[2]['productId'])
                            .delete();
                      } else {
                        favprovider.add(ProductList().itemlist[2]['productId']);
                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[2]['productId'])
                            .set({
                          'product id':
                              ProductList().itemlist[2]['productId'].toString(),
                          'name': ProductList()
                              .itemlist[2]['productname']
                              .toString(),
                          'subtitle':
                              ProductList().itemlist[2]['title'].toString(),
                          'image':
                              ProductList().itemlist[2]['imagelink'].toString(),
                          'price': ProductList()
                              .itemlist[2]['productprice']
                              .toString(),
                        });
                      }
                    },
                    icon: Icon(
                      favprovider.items
                              .contains(ProductList().itemlist[2]['productId'])
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.red,
                    )),
                onclick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProductDetails(
                              title: ProductList().itemlist[2]['productname'],
                              price: ProductList().itemlist[2]['productprice'],
                              productid: ProductList().itemlist[2]['productId'],
                              unitprice: ProductList().itemlist[2]['unitprice'],
                              image: ProductList()
                                  .itemlist[2]['imagelink']
                                  .toString())));
                }),
            ShowProductContainer(
                subtitle: ProductList().itemlist[3]['productname'],
                imagelink: ProductList().itemlist[3]['productimage'],
                price: r'$' + ProductList().itemlist[3]['productprice'],
                id: ProductList().itemlist[3]['productId'],
                quantity: 0,
                fav: IconButton(
                    onPressed: () async {
                      if (favprovider.items
                          .contains(ProductList().itemlist[3]['productId'])) {
                        favprovider
                            .remove(ProductList().itemlist[3]['productId']);

                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[3]['productId'])
                            .delete();
                      } else {
                        favprovider.add(ProductList().itemlist[3]['productId']);
                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[3]['productId'])
                            .set({
                          'product id':
                              ProductList().itemlist[3]['productId'].toString(),
                          'name': ProductList()
                              .itemlist[3]['productname']
                              .toString(),
                          'subtitle':
                              ProductList().itemlist[3]['title'].toString(),
                          'image':
                              ProductList().itemlist[3]['imagelink'].toString(),
                          'price': ProductList()
                              .itemlist[3]['productprice']
                              .toString(),
                        });
                      }
                    },
                    icon: Icon(
                      favprovider.items
                              .contains(ProductList().itemlist[3]['productId'])
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.red,
                    )),
                onclick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProductDetails(
                              title: ProductList().itemlist[3]['productname'],
                              price: ProductList().itemlist[3]['productprice'],
                              productid: ProductList().itemlist[3]['productId'],
                              unitprice: ProductList().itemlist[3]['unitprice'],
                              image: ProductList()
                                  .itemlist[3]['imagelink']
                                  .toString())));
                }),
            ShowProductContainer(
                subtitle: ProductList().itemlist[4]['productname'],
                imagelink: ProductList().itemlist[4]['productimage'],
                price: r'$' + ProductList().itemlist[4]['productprice'],
                id: ProductList().itemlist[4]['productId'],
                quantity: 1,
                fav: IconButton(
                    onPressed: () async {
                      if (favprovider.items
                          .contains(ProductList().itemlist[4]['productId'])) {
                        favprovider
                            .remove(ProductList().itemlist[4]['productId']);

                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[4]['productId'])
                            .delete();
                      } else {
                        favprovider.add(ProductList().itemlist[4]['productId']);
                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[4]['productId'])
                            .set({
                          'product id':
                              ProductList().itemlist[4]['productId'].toString(),
                          'name': ProductList()
                              .itemlist[4]['productname']
                              .toString(),
                          'subtitle':
                              ProductList().itemlist[4]['title'].toString(),
                          'image':
                              ProductList().itemlist[4]['imagelink'].toString(),
                          'price': ProductList()
                              .itemlist[0]['productprice']
                              .toString(),
                        });
                      }
                    },
                    icon: Icon(
                      favprovider.items
                              .contains(ProductList().itemlist[4]['productId'])
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.red,
                    )),
                onclick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProductDetails(
                              title: ProductList().itemlist[4]['productname'],
                              price: ProductList().itemlist[4]['productprice'],
                              productid: ProductList().itemlist[4]['productId'],
                              unitprice: ProductList().itemlist[4]['unitprice'],
                              image: ProductList()
                                  .itemlist[4]['imagelink']
                                  .toString())));
                }),
            ShowProductContainer(
                subtitle: ProductList().itemlist[5]['productname'],
                imagelink: ProductList().itemlist[5]['productimage'],
                price: r'$' + ProductList().itemlist[5]['productprice'],
                id: ProductList().itemlist[5]['productId'],
                quantity: 0,
                fav: IconButton(
                    onPressed: () async {
                      if (favprovider.items
                          .contains(ProductList().itemlist[5]['productId'])) {
                        favprovider
                            .remove(ProductList().itemlist[5]['productId']);

                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[5]['productId'])
                            .delete();
                      } else {
                        favprovider.add(ProductList().itemlist[5]['productId']);
                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[5]['productId'])
                            .set({
                          'product id':
                              ProductList().itemlist[5]['productId'].toString(),
                          'name': ProductList()
                              .itemlist[5]['productname']
                              .toString(),
                          'subtitle':
                              ProductList().itemlist[5]['title'].toString(),
                          'image':
                              ProductList().itemlist[5]['imagelink'].toString(),
                          'price': ProductList()
                              .itemlist[5]['productprice']
                              .toString(),
                        });
                      }
                    },
                    icon: Icon(
                      favprovider.items
                              .contains(ProductList().itemlist[5]['productId'])
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.red,
                    )),
                onclick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProductDetails(
                              title: ProductList().itemlist[5]['productname'],
                              price: ProductList().itemlist[5]['productprice'],
                              productid: ProductList().itemlist[5]['productId'],
                              unitprice: ProductList().itemlist[5]['unitprice'],
                              image: ProductList()
                                  .itemlist[5]['imagelink']
                                  .toString())));
                }),
            ShowProductContainer(
                subtitle: ProductList().itemlist[6]['productname'],
                imagelink: ProductList().itemlist[6]['productimage'],
                price: r'$' + ProductList().itemlist[6]['productprice'],
                id: ProductList().itemlist[6]['productId'],
                quantity: 0,
                fav: IconButton(
                    onPressed: () async {
                      if (favprovider.items
                          .contains(ProductList().itemlist[6]['productId'])) {
                        favprovider
                            .remove(ProductList().itemlist[6]['productId']);

                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[6]['productId'])
                            .delete();
                      } else {
                        favprovider.add(ProductList().itemlist[6]['productId']);
                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[6]['productId'])
                            .set({
                          'product id':
                              ProductList().itemlist[6]['productId'].toString(),
                          'name': ProductList()
                              .itemlist[6]['productname']
                              .toString(),
                          'subtitle':
                              ProductList().itemlist[6]['title'].toString(),
                          'image':
                              ProductList().itemlist[6]['imagelink'].toString(),
                          'price': ProductList()
                              .itemlist[6]['productprice']
                              .toString(),
                        });
                      }
                    },
                    icon: Icon(
                      favprovider.items
                              .contains(ProductList().itemlist[6]['productId'])
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.red,
                    )),
                onclick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProductDetails(
                              title: ProductList().itemlist[6]['productname'],
                              price: ProductList().itemlist[6]['productprice'],
                              productid: ProductList().itemlist[6]['productId'],
                              unitprice: ProductList().itemlist[6]['unitprice'],
                              image: ProductList()
                                  .itemlist[6]['imagelink']
                                  .toString())));
                }),
            ShowProductContainer(
                subtitle: ProductList().itemlist[7]['productname'],
                imagelink: ProductList().itemlist[7]['productimage'],
                price: r'$' + ProductList().itemlist[7]['productprice'],
                id: ProductList().itemlist[7]['productId'],
                quantity: 0,
                fav: IconButton(
                    onPressed: () async {
                      if (favprovider.items
                          .contains(ProductList().itemlist[7]['productId'])) {
                        favprovider
                            .remove(ProductList().itemlist[7]['productId']);

                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[7]['productId'])
                            .delete();
                      } else {
                        favprovider.add(ProductList().itemlist[7]['productId']);
                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[7]['productId'])
                            .set({
                          'product id':
                              ProductList().itemlist[7]['productId'].toString(),
                          'name': ProductList()
                              .itemlist[7]['productname']
                              .toString(),
                          'subtitle':
                              ProductList().itemlist[7]['title'].toString(),
                          'image':
                              ProductList().itemlist[7]['imagelink'].toString(),
                          'price': ProductList()
                              .itemlist[7]['productprice']
                              .toString(),
                        });
                      }
                    },
                    icon: Icon(
                      favprovider.items
                              .contains(ProductList().itemlist[7]['productId'])
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.red,
                    )),
                onclick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProductDetails(
                              title: ProductList().itemlist[7]['productname'],
                              price: ProductList().itemlist[7]['productprice'],
                              productid: ProductList().itemlist[7]['productId'],
                              unitprice: ProductList().itemlist[7]['unitprice'],
                              image: ProductList()
                                  .itemlist[7]['imagelink']
                                  .toString())));
                }),
            ShowProductContainer(
                subtitle: ProductList().itemlist[8]['productname'],
                imagelink: ProductList().itemlist[8]['productimage'],
                price: r'$' + ProductList().itemlist[8]['productprice'],
                id: ProductList().itemlist[8]['productId'],
                quantity: 0,
                fav: IconButton(
                    onPressed: () async {
                      if (favprovider.items
                          .contains(ProductList().itemlist[8]['productId'])) {
                        favprovider
                            .remove(ProductList().itemlist[8]['productId']);

                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[8]['productId'])
                            .delete();
                      } else {
                        favprovider.add(ProductList().itemlist[8]['productId']);
                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[8]['productId'])
                            .set({
                          'product id':
                              ProductList().itemlist[8]['productId'].toString(),
                          'name': ProductList()
                              .itemlist[8]['productname']
                              .toString(),
                          'subtitle':
                              ProductList().itemlist[8]['title'].toString(),
                          'image':
                              ProductList().itemlist[8]['imagelink'].toString(),
                          'price': ProductList()
                              .itemlist[8]['productprice']
                              .toString(),
                        });
                      }
                    },
                    icon: Icon(
                      favprovider.items
                              .contains(ProductList().itemlist[8]['productId'])
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.red,
                    )),
                onclick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProductDetails(
                              title: ProductList().itemlist[8]['productname'],
                              price: ProductList().itemlist[8]['productprice'],
                              productid: ProductList().itemlist[8]['productId'],
                              unitprice: ProductList().itemlist[8]['unitprice'],
                              image: ProductList()
                                  .itemlist[8]['imagelink']
                                  .toString())));
                }),
            ShowProductContainer(
                subtitle: ProductList().itemlist[9]['productname'],
                imagelink: ProductList().itemlist[9]['productimage'],
                price: r'$' + ProductList().itemlist[9]['productprice'],
                id: ProductList().itemlist[9]['productId'],
                quantity: 0,
                fav: IconButton(
                    onPressed: () async {
                      if (favprovider.items
                          .contains(ProductList().itemlist[9]['productId'])) {
                        favprovider
                            .remove(ProductList().itemlist[9]['productId']);

                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[9]['productId'])
                            .delete();
                      } else {
                        favprovider.add(ProductList().itemlist[9]['productId']);
                        db2
                            .doc(id)
                            .collection('items')
                            .doc(ProductList().itemlist[9]['productId'])
                            .set({
                          'product id':
                              ProductList().itemlist[9]['productId'].toString(),
                          'name': ProductList()
                              .itemlist[9]['productname']
                              .toString(),
                          'subtitle':
                              ProductList().itemlist[9]['title'].toString(),
                          'image':
                              ProductList().itemlist[9]['imagelink'].toString(),
                          'price': ProductList()
                              .itemlist[9]['productprice']
                              .toString(),
                        });
                      }
                    },
                    icon: Icon(
                      favprovider.items
                              .contains(ProductList().itemlist[9]['productId'])
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.red,
                    )),
                onclick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProductDetails(
                              title: ProductList().itemlist[9]['productname'],
                              price: ProductList().itemlist[9]['productprice'],
                              productid: ProductList().itemlist[9]['productId'],
                              unitprice: ProductList().itemlist[9]['unitprice'],
                              image: ProductList()
                                  .itemlist[9]['imagelink']
                                  .toString())));
                }),
          ],
        ),
      ),
    );
  }
}
