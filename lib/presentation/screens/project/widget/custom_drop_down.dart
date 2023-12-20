// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    this.onChange,
    this.item,
    required this.hintText,
    this.radius = 10.0,
  }) : super(key: key);

  final void Function(Object?)? onChange;
  final List<DropdownMenuItem<Object>>? item;
  final String hintText;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: (val) {
        if (val == null) {
          return 'Please Choose ProjectTyp';
        }
        return null;
      },
      items: item,
      onChanged: onChange,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        // labelStyle:
        //     const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        border: outlineBorder(),
        enabledBorder: outlineBorder(),
        errorBorder: outlineBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.8),
        width: 1,
      ),
    );
  }
}
