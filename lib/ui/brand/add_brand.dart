import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:group_button/group_button.dart';
import 'package:image_picker/image_picker.dart';

import '../../style/MyCard.dart';
import '../../utils/constants.dart';
import '../../utils/pickers.dart';
import '../../utils/validation.dart';
import '../widgets/button_with_icon.dart';
import '../widgets/title_view.dart';

class AddBrand extends StatefulWidget {
  const AddBrand({Key? key}) : super(key: key);

  @override
  _AddBrandState createState() => _AddBrandState();
}

class _AddBrandState extends State<AddBrand> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  XFile? image;
  String? img64;
  Uint8List? bytes;

  @override
  Widget build(BuildContext context) {
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
              child: bytes == null ? const Icon(
                Icons.add_photo_alternate,
                color: Colors.grey,
                size: 100,
              ) : Image.memory(bytes!),
            ),
            onTap: getImage
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            controller: _nameController,
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
            controller: _emailController,
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
            controller: _phoneController,
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
              onChanged: print,
            ),
          ),
          const SizedBox(height: defaultPadding),
          ButtonWithIcon(title: tr("addUser"),color: Colors.greenAccent,onClock: () {},iconData: Icons.add_business_sharp,isLoading: false,),
        ],
      ),
    );
  }



  getImage() async {
    bytes = await pickImage();
    setState(() {});
  }

}


