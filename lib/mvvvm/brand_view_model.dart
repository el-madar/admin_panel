import 'package:admin_panel/model/brand.dart';
import 'package:admin_panel/resources/repository.dart';
import 'package:admin_panel/utils/custom_exception.dart';
import 'package:flutter/material.dart';

class BrandViewModel  with ChangeNotifier {
  List<Brand> _brandsList = [];

  bool _isLoading = false;
  late String _errorMessages = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessages;
  List<Brand> get brandsList => _brandsList;

  void setLoading(val){
    _isLoading = val;
    notifyListeners();
  }

  void setMessages(val){
    _errorMessages = val;
    notifyListeners();
  }

  void resetMessages(){
    _errorMessages = '';
    notifyListeners();
  }

  BrandViewModel() {
    getBrands();
  }

  void getBrands() async {
    setLoading(true);
    resetMessages();
    try {
      _brandsList = await Repository().getBrands();


    } on MyException catch (e) {
      setMessages(e.messages.join('\n'));
    } catch (e) {
      setMessages(e.toString());
    }
    setLoading(false);
  }

}
