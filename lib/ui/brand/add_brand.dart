import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:admin_panel/model/brand.dart';
import 'package:admin_panel/mvvvm/brand/add_brand_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:group_button/group_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../bloc/authentication/authentication_bloc.dart';
import '../../bloc/authentication/authentication_event.dart';
import '../../mvvvm/brand/brand_view_model.dart';
import '../../style/MyCard.dart';
import '../../utils/constants.dart';
import '../../utils/dialogs.dart';
import '../../utils/pickers.dart';
import '../../utils/validation.dart';
import '../widgets/button_with_icon.dart';
import '../widgets/title_view.dart';
import 'brand_screen.dart';

class AddBrand extends StatefulWidget {
  const AddBrand({Key? key}) : super(key: key);


  @override
  _AddBrandState createState() => _AddBrandState();
}

class _AddBrandState extends State<AddBrand> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  AddBrandViewModel? _addBrandViewModel;

  @override
  Widget build(BuildContext context) {

    _addBrandViewModel = AddBrandViewModel();

    return ChangeNotifierProvider(
        create: (context) => _addBrandViewModel,
        child: Consumer<AddBrandViewModel>(
          builder: (context, model, child) {
            if (model.errorMessage != '') {
              showErrorToast(model.errorMessage);
              if (model.errorMessage == tr('Unauthenticated')) {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              }
            }

            if (model.successfulMessage != '') {
              // Navigator.pop(context);
              showSuccesToast(model.successfulMessage);
              _addBrandViewModel!.resetBrandData();
            }


            return Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TitleView(title: tr('addBrand'),),
                  GestureDetector(
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        padding: const EdgeInsets.all(smallPadding),
                        decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).primaryColor)
                        ),
                        child: _addBrandViewModel!.bytes == null ? const Icon(
                          Icons.add_photo_alternate,
                          color: Colors.grey,
                          size: 100,
                        ) : Image.memory(_addBrandViewModel!.bytes!),
                      ),
                      onTap: getImage
                  ),
                  const SizedBox(height: defaultPadding),
                  TextFormField(
                    controller: _addBrandViewModel!.nameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    // style: TextStyle(
                    //   color: Colors.black,
                    //   fontFamily: 'OpenSans',
                    // ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.business,
                        color: Theme.of(context).primaryColor,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: tr('name'),
                    ),
                    validator: (value) => isValidNameUser(value!)
                        ? null
                        : tr('invalid_name'),
                  ),
                  const SizedBox(height: defaultPadding),
                  TextFormField(
                    controller: _addBrandViewModel!.emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    // style: TextStyle(
                    //   color: Colors.black,
                    //   fontFamily: 'OpenSans',
                    // ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Theme.of(context).primaryColor,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: tr('email'),
                    ),
                    validator: (value) => isValidEmail(value!)
                        ? null
                        : tr('invalid_email'),
                  ),
                  const SizedBox(height: defaultPadding),
                  TextFormField(
                    controller: _addBrandViewModel!.phoneController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    // style: TextStyle(
                    //   color: Colors.black,
                    //   fontFamily: 'OpenSans',
                    // ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Theme.of(context).primaryColor,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: tr('phone'),
                    ),
                    validator: (value) => isValidPhone(value!)
                        ? null
                        : tr('invalid_phone'),
                  ),
                  const SizedBox(height: defaultPadding),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                    ),
                    padding: const EdgeInsets.only(left: smallPadding,right: smallPadding),
                    child: DropDown(
                      isExpanded: true,
                      showUnderline: false,
                      items: [ tr('cafe'), tr('restaurant'),tr('cafe_and_restaurant')],
                      hint: Text(tr('select_business_type')),
                      icon: Icon(
                        Icons.expand_more,
                        color: Theme.of(context).primaryColor,
                      ),
                      onChanged: (data) {
                        if(data == tr('cafe')){
                          _addBrandViewModel!.brandType = "Cafe";
                        }else if(data == tr('restaurant')){
                          _addBrandViewModel!.brandType = "Restaurant";
                        }else if(data == tr('cafe_and_restaurant')){
                          _addBrandViewModel!.brandType = "Restaurant & Cafe";
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  ButtonWithIcon(title: tr("addBrand"),color: Colors.greenAccent,onClock: onFormSubmitted,iconData: Icons.add_business_sharp,isLoading: _addBrandViewModel!.isLoading,),
                ],
              ),
            );
          },
        ));


  }



  getImage() async {
    _addBrandViewModel!.bytes = await pickImage();
    setState(() {});
  }

  onFormSubmitted() {
    if (_formKey.currentState!.validate()) {
      if(_addBrandViewModel!.brandType == null){
        showErrorToast(tr('you_have_to_select_brand_type'));
      }else{
        _addBrandViewModel!.addBrand(brandRequest: Brand(
          name: _addBrandViewModel!.nameController.text,
          type: _addBrandViewModel!.brandType
        ));
      }
    }
  }

}


