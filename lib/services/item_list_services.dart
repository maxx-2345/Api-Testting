import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testing/model/item_list_model.dart';

class ItemListServices{
  Future<itemListModel> fetchListItem() async{
    final url = Uri.parse("https://dummyjson.com/products");
    final response = await http.get(url);

    if(response.statusCode == 200){
     return itemListModel.fromJson(json.decode(response.body));
    } else{
      throw("Failed to load data");
    }
  }
}