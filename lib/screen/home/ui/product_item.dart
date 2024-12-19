import 'package:flutter/material.dart';
import 'package:test2/model/product_list.dart';
class ProductItem extends StatelessWidget{
  final Products product;
  const ProductItem({required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Image.network(
            product.thumbnail?? "",
            width: 150,
            height: 120,
          ),
          Text(product.title??""),
          Text("${product.price??0}"),
          FloatingActionButton(
            child: Icon(Icons.add_shopping_cart),
            onPressed: (){},
          )
        ],
      ),
    );
  }
}