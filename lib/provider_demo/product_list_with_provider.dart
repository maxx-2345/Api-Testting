import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/item_list_model.dart';
import '../screens/product_details_screen.dart';
import 'product_provider.dart';

// ChangeNotifier: provides changes to its listner: will listen changes
// ChangeNotifierProvider: will provide instance of changeListner that something has changed
//now call Consumer to show UI with fetched data using Consumer
//Consumer<ProviderClassName> which u want to access through provider
//Consumer<ProviderClassName> builder(context: build method, provider: changeNotifier object, child: widget
class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    /// Fetch products when the screen initialize/loads
    Future(() =>
    // Provider.of<$providerClassName$>(context,listen: false).<$method name which will call list$>
    Provider.of<ProductProvider>(context, listen: false).fetchProducts()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Consumer<ProductProvider>(
        /// provider: object, UI object
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (provider.error.isNotEmpty) {
            return Center(child: Text('Error: ${provider.error}'));
          }

          if (provider.products.isEmpty) {
            return Center(child: Text('No products found'));
          }

          return ListView.builder(
            itemCount: provider.products.length,
            itemBuilder: (context, index) {
              final value = provider.products[index];
              return Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductDetailsScreen(product: value!)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 5,spreadRadius: -5)]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Title: ",style: TextStyle(fontWeight: FontWeight.bold),),
                              Expanded(child: Text('${value?.title}',overflow: TextOverflow.ellipsis, maxLines: 2,)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Description: ",style: TextStyle(fontWeight: FontWeight.bold),),
                              Expanded(child: Text('${value?.description}',overflow: TextOverflow.ellipsis,maxLines: 1,)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Price: ",style: TextStyle(fontWeight: FontWeight.bold),),
                              Expanded(child: Text('${value?.price}'))
                            ],
                          ),
                          Row(
                            children: [
                              Text("Category: ",style: TextStyle(fontWeight: FontWeight.bold),),
                              Expanded(child: Text('${value?.category}'))
                            ],
                          ),
                          Row(
                            children: [
                              Text("Tags: ",style: TextStyle(fontWeight: FontWeight.bold),),
                              // Expanded(child: Text(value?.tags?.join(" , ") ?? "No Tags"))
                            ],
                          ),
                          Row(
                            children: [
                              Text("Ratings: ",style: TextStyle(fontWeight: FontWeight.bold),),
                              // Expanded(child: Text('${value?.rating}/5'))
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
