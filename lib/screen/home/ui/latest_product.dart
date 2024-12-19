import 'package:flutter/material.dart';
import 'package:test2/model/product_list.dart';
import 'package:dio/dio.dart';
import 'package:test2/screen/home/ui/product_item.dart';
class LatestProduct extends StatefulWidget{
  const LatestProduct({Key? key}) : super(key: key);

  @override
  _LatestProductState createState()=> _LatestProductState();
}
class _LatestProductState extends State<LatestProduct>{
  late List<Products> data = [];

  Future<void> _fetchProducts() async {
    try{
      const url = "https://dummyjson.com/products?limit=12";
      Response rs = await Dio().get(url);
      // convert to Model object
      ProductList pl =  ProductList.fromJson(rs.data);
      setState(() {
        data = pl.products??[];
      });
    }catch(e){

    }
  }

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Latest Products"),
        Container(
          height: 280,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index){
                return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ProductItem(product: data[index])
                );
              }
          ),
        )
      ],
    );
  }
}