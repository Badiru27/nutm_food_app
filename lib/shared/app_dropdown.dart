import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nutm_food_app/themes/app_theme.dart';
import 'package:nutm_food_app/util/formatter.dart';

class AppDropDown extends StatelessWidget {
  final List<String> items;
  final String label;
  final bool showIcon;
  final String? value;
  final String name;
  final Function(String?) onChanged;
  final Function(String?) onSaved;
  final Function()? onReset;
  final String? Function(String?)? validator;

  const AppDropDown({
    Key? key,
    required this.items,
    required this.label,
    this.showIcon = false,
    this.value,
    required this.name,
    required this.onChanged,
    required this.onSaved,
    this.onReset,
    this.validator,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<String>(
     alignment: Alignment.centerLeft,
      name: name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      onSaved: onSaved,
      onReset: onReset,
      validator: validator,
      style: AppTheme.textTheme.bodyText1,
      dropdownColor: AppTheme.grey,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTheme.textTheme.bodyText1,
      ),
      items: items
          .map((item) => DropdownMenuItem(

                value: item,

                child: Text(item.capitalize(),),
              ))
          .toList(),
    );
  }
}
