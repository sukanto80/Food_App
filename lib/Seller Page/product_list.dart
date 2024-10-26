import 'package:flutter/material.dart';


class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Lal Shak Vaji',
      imageUrl: 'assets/lal_shakVaji.png',
      price: 30,
      originalPrice:60,
      discount: '50% off',
    ),
    Product(
      name: 'Loitta Shukti Vorta ',
      imageUrl: 'assets/shutki_vorta.png',
      price:60,
      originalPrice: 100,
      discount: '73% off',
    ),
    Product(
      name: 'Chicken Curry',
      imageUrl: 'assets/chicken_curry.png',
      price: 80,
      originalPrice: 120,
      discount: '30% off',
    ),
    Product(
      name: 'Dim Vuna',
      imageUrl: 'assets/dim_vuna.png',
      price: 20,
      originalPrice: 20,
      discount: '0% off',
    ),
    Product(
      name: 'Shada Bhaat',
      imageUrl: 'assets/shada_bhat.png',
      price: 20,
      originalPrice: 20,
      discount: '0% off',
    ),
    Product(
      name: 'Ilish Vaja',
      imageUrl: 'assets/vaja_ilish.png',
      price: 80,
      originalPrice: 100,
      discount: '30% off',
    ),
    Product(
      name: 'Beef Curry',
      imageUrl: 'assets/curry_beef.png',
      price: 120,
      originalPrice: 240,
      discount: '50% off',
    ),
    Product(
      name: 'Shada Atar Ruti',
      imageUrl: 'assets/shada_ruti.png',
      price: 10,
      originalPrice: 10,
      discount: '0% off',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YOUR PRODUCT LIST',  style: TextStyle(color: Colors.white, fontSize: 18),),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {
              // Handle sort action
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Handle filter action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ),
    );
  }
}


class Product {
  final String name;
  final String imageUrl;
  final int price;
  final int originalPrice;
  final String discount;


  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.originalPrice,
    required this.discount,
  });
}


class ProductCard extends StatelessWidget {
  final Product product;


  const ProductCard({required this.product});


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            product.imageUrl,
            fit: BoxFit.cover,
            height: 150,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '\$${product.price}',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Text(
                  '\$${product.originalPrice}',
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  product.discount,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
