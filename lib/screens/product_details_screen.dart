import 'package:flutter/material.dart';
import 'package:testing/model/item_list_model.dart';
import 'package:testing/services/item_list_services.dart';
class ProductDetailsScreen extends StatefulWidget {
  final Products product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context)
  print("product_list_log:: ${product.images}");
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.product.title} Products details"),
      ),

      body: Padding(
          padding: EdgeInsets.all(10),
         child: Container(
           height: double.infinity,
           width: double.infinity,
           padding: EdgeInsets.all(10),
           decoration: BoxDecoration(
               border: Border.all(width: 1,color: Colors.black),
               borderRadius: BorderRadius.circular(20),
               boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 5,spreadRadius: -5)]
           ),
           child: Column(
             children: [
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Description: ",style: TextStyle(fontWeight: FontWeight.bold),),
                   Expanded(child: Text("${widget.product.description}"))
                 ],
               ),
               Divider(),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Price: ",style: TextStyle(fontWeight: FontWeight.bold),),
                   Expanded(child: Text("${widget.product.price}"))
                 ],
               ),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Discount: ",style: TextStyle(fontWeight: FontWeight.bold),),
                   Expanded(child: Text("${widget.product.discountPercentage}%"))
                 ],
               ),
               Divider(),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Category: ",style: TextStyle(fontWeight: FontWeight.bold),),
                   Expanded(child: Text("${widget.product.category}"))
                 ],
               ),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Tags: ",style: TextStyle(fontWeight: FontWeight.bold),),
                   Expanded(child: Text("${widget.product.tags?.join(' ,')} "))
                 ],
               ),
               Divider(),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Rating: ",style: TextStyle(fontWeight: FontWeight.bold),),
                   Expanded(child: Text("${widget.product.rating}"))
                 ],
               ),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Images: ",style: TextStyle(fontWeight: FontWeight.bold),),
                   Container(
                     height: 200,
                     width: 200,
                     child: Image.network("${widget.product.images}"),
                   )
                 ],
               ),

             ],
           ),
         ),
      ),

    );
}
}
