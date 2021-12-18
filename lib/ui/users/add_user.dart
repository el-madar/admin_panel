import 'package:admin_panel/ui/widgets/button_with_icon.dart';
import 'package:admin_panel/ui/widgets/title_view.dart';
import 'package:admin_panel/utils/constants.dart';
import 'package:admin_panel/utils/validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  AddUser({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TitleView(title: tr('addUser'),),
          const SizedBox(height: defaultPadding,),
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
                Icons.person,
                color: Theme.of(context).primaryColor,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              labelText: tr('full_name'),
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
          ButtonWithIcon(title: tr("addUser"),color: Colors.greenAccent,onClock: () {},iconData: Icons.person_add_alt,isLoading: false,),
        ],
      ),
    );
  }
}
