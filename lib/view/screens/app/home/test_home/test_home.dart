import 'package:flutter/material.dart';
import 'package:xpress_app/view/screens/app/home/test_home/test_home_modil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductsGridView extends StatefulWidget {
  @override
  _ProductsGridViewState createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  // List<Product> products = [];

  // Future<void> fetchProducts() async {
  //   final response = await http.get(Uri.parse('https://sallah.hexacit.com/api/getProductsByCategoryId/1'));
  //   if (response.statusCode == 200) {
  //     final jsonData = json.decode(response.body);
  //     List<Product> fetchedProducts = [];
  //     for (var productData in jsonData['products']) {
  //       fetchedProducts.add(Product.fromJson(productData));
  //     }
  //     setState(() {
  //       products = fetchedProducts;
  //     });
  //   } else {
  //     throw Exception('Failed to fetch products');
  //   }
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   fetchProducts();
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 20),
      itemCount: 2,
      itemBuilder: (context, index) {
        // final item = myCartData[index];
        // final product = item['product'];
        return Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 75,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xff1ABCBC),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(14),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Quantity',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        // product['order'].toString(),
                        '55',
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 78),
                  width: 100,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image(

                    // image: NetworkImage(product['image']),
                    image: AssetImage(''),
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 11,
            ),
            Text(
              // product['name'],
              'name',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                // '${product['price'].toString()}\$/k',
                '55.2\$/k',

                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xff959894),
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

