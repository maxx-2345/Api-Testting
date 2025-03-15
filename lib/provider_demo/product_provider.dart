import 'package:flutter/foundation.dart';
import '../model/item_list_model.dart';
import '../services/item_list_services.dart';
//provider class : will extends with keyword "ChangeNotifier"
class ProductProvider with ChangeNotifier {
  //api call repo/service class
  final ItemListServices _apiService = ItemListServices();

  //model class
  itemListModel? _itemModel;

  //state change: sucesss: loads data, error: return error msg
  bool _isLoading = false;
  String _error = '';

  /// Getter for model class
  itemListModel? get itemModel => _itemModel;

  /// Getter for fetch product list
  List<Products> get products => _itemModel?.products ?? [];

  bool get isLoading => _isLoading;
  String get error => _error;

  // api call has done: now u have data
  Future<void> fetchProducts() async {
    _isLoading = true;
    _error = '';
    notifyListeners();//will update changes to provider

    try {
      _itemModel = await _apiService.fetchListItem();
      //data has been saved to model class
      _isLoading = false;
      ///will notify once provider got list of products
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      ///will notify once provider got error while processing list
      notifyListeners();
    }
  }
}
