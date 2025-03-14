import 'package:cached_network_image/cached_network_image.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data")
          // title: Text("${widget.product.title} Products details"),
          ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: Text("${widget.product.title}"))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: Text("${widget.product.description}"))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: Text("${widget.product.price}"))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Discount: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: Text("${widget.product.discountPercentage}%"))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Brand: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: Text("${widget.product.brand}"))
              ],
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: widget.product.images?.length,
                  itemBuilder: (context, index) {
                    final value = widget.product.images![index];
                    print("HH: $value");

                    return Image.network(
                      value,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null, // Show progress percentage if available
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                            child: Text("Failed to load image",
                                style: TextStyle(color: Colors.red)));
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
