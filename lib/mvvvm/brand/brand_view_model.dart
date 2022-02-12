import 'dart:typed_data';

import 'package:admin_panel/model/brand.dart';
import 'package:admin_panel/resources/repository.dart';
import 'package:admin_panel/utils/custom_exception.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BrandViewModel  with ChangeNotifier {

  BrandViewModel() {
    getBrands();
  }

  List<Brand> _brandsList = [];

  bool _isLoading = false;
  late String _errorMessages = '';

  late String _successfulMessage = '';

  String get successfulMessage => _successfulMessage;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessages;
  List<Brand> get brandsList => _brandsList;


  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  String? brandType;
  Uint8List? bytes;

  void resetBrandData(){
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    brandType = null;
    bytes = null;
    notifyListeners();
  }

  void setLoading(val){
    _isLoading = val;
    notifyListeners();
  }

  void setErrorMessages(val){
    _errorMessages = val;
    notifyListeners();
  }

  void setSuccessfulMessages(val){
    _successfulMessage = val;
    notifyListeners();
  }

  void resetMessages(){
    _errorMessages = '';
    _successfulMessage = '';
    notifyListeners();
  }



  void getBrands() async {
    setLoading(true);
    resetMessages();
    try {
      _brandsList = await Repository().getBrands();


    } on MyException catch (e) {
      setErrorMessages(e.messages.join('\n'));
    } catch (e) {
      setErrorMessages(e.toString());
    }
    setLoading(false);
  }

  Future addBrand({required Brand brandRequest}) async {
    setLoading(true);
    resetMessages();
    try {

      Brand brand = await Repository().addBrand(
        brandRequest: brandRequest,
      );
      setSuccessfulMessages(tr('add_brand_done'));

    } on MyException catch (e) {
      // join convert last to String Add Add String sam \n  or other , -
      setErrorMessages(e.messages.join('\n'));
    } catch (e) {
      setErrorMessages(e.toString());
    }
    setLoading(false);
  }
}
