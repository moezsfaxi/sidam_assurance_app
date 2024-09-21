import 'package:flutter/material.dart';

class DropDownMenuForm extends StatelessWidget {
  const DropDownMenuForm({super.key,
  required this.selectedValue,
  required this.items,
  required this.onChanged});

  final String? selectedValue;
  final List<String> items ;
  final Function(String?) onChanged;




  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        decoration: const InputDecoration(
          hintText: "select an option",
          border: OutlineInputBorder()
        ),
        items: items.map((String value){
          return DropdownMenuItem<String>(value: value, child: Text(value));}).toList(),
        onChanged: onChanged,
        validator: (value){
          if(value==null|| value.isEmpty){
              return 'please select an option';
          }
          return null;
      
        },
        
        
        
        ),
    );
  }
}        