import 'package:flutter/material.dart';

class DatePickerForTheForm extends StatelessWidget {
  const DatePickerForTheForm({super.key,required this.selectedDate,required this.dateController,required this.onDateSelected });
  final DateTime? selectedDate ;
  final TextEditingController dateController;
  final Function(DateTime?) onDateSelected;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
        controller: dateController,
        decoration: const InputDecoration(
            hintText: "select a date",
            border: OutlineInputBorder(),)
            ,
            readOnly: true,
            onTap: ()async{
              DateTime? pickedDate = await showDatePicker(
                context:context,
                initialDate: selectedDate ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100)
                 );
                 if(pickedDate!= null){
                  onDateSelected(pickedDate);
                 }
                },
            validator: (value){
              if(selectedDate==null){
                return "please select a date";
              }
              return null;
            },
    ) ;
  }
}   