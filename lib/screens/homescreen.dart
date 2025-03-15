import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testing/screens/product_details_screen.dart';
import 'package:testing/services/item_list_services.dart';

import '../model/item_list_model.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {


  final ItemListServices itemServices = ItemListServices();
  itemListModel? _itemList;
  bool _isLoading = false;

  // cart edit 1 - initialize list
  List<bool> cartStatus = [];
  void _getList() async {
    setState(() {
      _isLoading = true;
    });
    if(_isLoading){
      CircularProgressIndicator();
    }

    try{
      final itemList = await itemServices.fetchListItem();
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
        });
      });
    setState(() {
      _itemList = itemList;
      print("itemList_log::${_itemList?.products?[0].title}");

      //cart edit 2- generate list and pick specific index and initialize all products with false so it shows yellow button
      cartStatus = List.generate(_itemList!.products!.length, (index)=> false);
      _isLoading = false;
    });
    } catch(e){
      print("Error Occurring: $e");
   setState(() {
     _isLoading = false;
   });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dummy Api"),
      ),
  body: _itemList == null ?
  Center(child: Text("Press Get List Button")) :
  Padding(
      padding: EdgeInsets.all(20),
       child: Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
           border: Border.all(width: 1,color: Colors.white),
         ),
         height: double.infinity,
         width: double.infinity,
         child: ListView.builder(
           itemCount: _itemList?.products?.length,
             itemBuilder: (context,index){
             final value= _itemList?.products![index];
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

                     // cart edit 3- toggle button
                     (value?.stock ?? 0) > 0 ? GestureDetector(
                       onTap: () {
                         setState(() {
                           cartStatus[index] = !cartStatus[index]; // Toggle status
                         });
                       },
                       child: Container(
                         padding: EdgeInsets.symmetric(
                             vertical: 10, horizontal: 20),
                         decoration: BoxDecoration(
                           color: cartStatus[index]
                               ? Colors.green
                               : Colors.yellow,
                           borderRadius: BorderRadius.circular(20),
                         ),
                         child: Center(
                           child: Text(
                             cartStatus[index]
                                 ? "Added to Cart"
                                 : "Add to Cart",
                             style: TextStyle(color: Colors.black),
                           ),
                         ),
                       ),
                     ) : Container(
                       decoration: BoxDecoration(
                         color: Colors.grey,
                         border: Border.all(width: 0.5,color: Colors.black),
                         borderRadius: BorderRadius.circular(20),
                       ),
                       child: Center(
                         child: Padding(
                           padding: const EdgeInsets.all(5.0),
                           child: Text("Out of Stock"),
                         ),
                       ),
                     )

                     ],
                       ),
                     ),
                   ),
                 ),
               );
             }),
       ),
  ),
   floatingActionButton: FloatingActionButton(
       onPressed: _getList,
     child: Text("Get List"),
   ),
    );
  }
}
