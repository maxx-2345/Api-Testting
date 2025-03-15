import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/model/item_list_model.dart';
import 'package:testing/services/item_list_services.dart';

import '../provider_demo/product_provider.dart';
class ProductDetailsScreen extends StatefulWidget {
  final Products product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();

  }
  @override
  Widget build(BuildContext context){
  print("product_list_log:: ${widget.product.images}");
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.product.title} Products details"),
      ),

      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (provider.error.isNotEmpty) {
            return Center(
              child: Text("${provider.error}"),
            );
          }
          return Padding(
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
              child: SingleChildScrollView(
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
                        // Expanded(child: Text("${widget.product.discountPercentage}%"))
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
                        // Expanded(child: Text("${widget.product.tags?.join(' ,')} "))
                      ],
                    ),
                    Divider(),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text("Rating: ",style: TextStyle(fontWeight: FontWeight.bold),),
                    //     Expanded(child: Text("${widget.product!.rating}"))
                    //   ],
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text("Images: ",style: TextStyle(fontWeight: FontWeight.bold, ),)),
                        Container(
                          height: 500,
                          child: ListView.builder(
                              itemCount: widget.product.images?.length,
                              itemBuilder: (context,index){
                                final value= widget.product.images![index];
                                print("hhh: ${value}");
                                return Image.network(value);

                                //   return CachedNetworkImage(
                                //     imageUrl: value,
                                //     ///what is placeholder: until u r network successfully return image path, show progress bar/loading bar
                                //
                                //     placeholder: (context, url) => SizedBox(
                                //       height: 50,
                                //         width: 50,
                                //         child: CircularProgressIndicator()),
                                //     ///it will execute if error found
                                //
                                //     errorWidget: (context, url, error) => Icon(Icons.error),
                                //   );

                              }),
                        ),
                        ///use CacheNetworkImage lib
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        // child:Padding(
        //     padding: EdgeInsets.all(10),
        //    child: Container(
        //      height: double.infinity,
        //      width: double.infinity,
        //      padding: EdgeInsets.all(10),
        //      decoration: BoxDecoration(
        //          border: Border.all(width: 1,color: Colors.black),
        //          borderRadius: BorderRadius.circular(20),
        //          boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 5,spreadRadius: -5)]
        //      ),
        //      child: SingleChildScrollView(
        //        child: Column(
        //          children: [
        //            Row(
        //              crossAxisAlignment: CrossAxisAlignment.start,
        //              children: [
        //                Text("Description: ",style: TextStyle(fontWeight: FontWeight.bold),),
        //                Expanded(child: Text("${widget.product.description}"))
        //              ],
        //            ),
        //            Divider(),
        //            Row(
        //              crossAxisAlignment: CrossAxisAlignment.start,
        //              children: [
        //                Text("Price: ",style: TextStyle(fontWeight: FontWeight.bold),),
        //                Expanded(child: Text("${widget.product.price}"))
        //              ],
        //            ),
        //            Row(
        //              crossAxisAlignment: CrossAxisAlignment.start,
        //              children: [
        //                Text("Discount: ",style: TextStyle(fontWeight: FontWeight.bold),),
        //                // Expanded(child: Text("${widget.product.discountPercentage}%"))
        //              ],
        //            ),
        //            Divider(),
        //            Row(
        //              crossAxisAlignment: CrossAxisAlignment.start,
        //              children: [
        //                Text("Category: ",style: TextStyle(fontWeight: FontWeight.bold),),
        //                Expanded(child: Text("${widget.product.category}"))
        //              ],
        //            ),
        //            Row(
        //              crossAxisAlignment: CrossAxisAlignment.start,
        //              children: [
        //                Text("Tags: ",style: TextStyle(fontWeight: FontWeight.bold),),
        //                // Expanded(child: Text("${widget.product.tags?.join(' ,')} "))
        //              ],
        //            ),
        //            Divider(),
        //            Row(
        //              crossAxisAlignment: CrossAxisAlignment.start,
        //              children: [
        //                Text("Rating: ",style: TextStyle(fontWeight: FontWeight.bold),),
        //                Expanded(child: Text("${widget.product.rating}"))
        //              ],
        //            ),
        //            Column(
        //              crossAxisAlignment: CrossAxisAlignment.start,
        //
        //              children: [
        //                Align(
        //                  alignment: Alignment.topLeft,
        //                    child: Text("Images: ",style: TextStyle(fontWeight: FontWeight.bold, ),)),
        //                Container(
        //                  height: 500,
        //                  child: ListView.builder(
        //                    itemCount: widget.product.images?.length,
        //                      itemBuilder: (context,index){
        //                      final value= widget.product.images![index];
        //                      print("hhh: ${value}");
        //                      return Image.network(value);
        //
        //                      //   return CachedNetworkImage(
        //                      //     imageUrl: value,
        //                      //     ///what is placeholder: until u r network successfully return image path, show progress bar/loading bar
        //                      //
        //                      //     placeholder: (context, url) => SizedBox(
        //                      //       height: 50,
        //                      //         width: 50,
        //                      //         child: CircularProgressIndicator()),
        //                      //     ///it will execute if error found
        //                      //
        //                      //     errorWidget: (context, url, error) => Icon(Icons.error),
        //                      //   );
        //
        //                      }),
        //                ),
        //                ///use CacheNetworkImage lib
        //              ],
        //            ),
        //          ],
        //        ),
        //      ),
        //    ),
        // ),
      ),

    );
}
}
