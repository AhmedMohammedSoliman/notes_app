import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/provider/myProvider.dart';
import 'package:provider/provider.dart';
class SettingScreen extends StatefulWidget{
  String selectedValue ;
  String selectedItemTheme ;

  SettingScreen({required this.selectedValue , required this.selectedItemTheme});
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  List<String> items = [
    "English" ,
    "Arabic"
  ];
  List <String> themeItems = [
    "Light" ,
    "Dark"
  ];




  @override
  Widget build(BuildContext context) {

   var provider = Provider.of<MyProvider>(context);

   return  SafeArea(
     child: Scaffold(
       body: Column(
         children: [
           Container(
             width: double.infinity,
             margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
             child: CustomDropdownButton2(
               dropdownWidth: 300,
               buttonDecoration: BoxDecoration(
                   color: Colors.white ,
                   borderRadius: BorderRadius.circular(30)
               ),
               hint: 'Select Item',
               dropdownItems: items,
               value: widget.selectedValue,
               onChanged: (value) {
                 setState(() {
                   widget.selectedValue = value!;
                   widget.selectedValue == "English" ? provider.changeLanguage("en") :
                       provider.changeLanguage("ar");
                 });
               },
             ),
           ),
           SizedBox(height: 20,),
           Container(
             width: double.infinity,
             margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
             child: CustomDropdownButton2(
               dropdownWidth: 300,
               buttonDecoration: BoxDecoration(
                   color: Colors.white ,
                   borderRadius: BorderRadius.circular(30)
               ),
               hint: 'Select Item',
               dropdownItems: themeItems,
               value: widget.selectedItemTheme,
               onChanged: (value) {
                 setState(() {
                   widget.selectedItemTheme = value!;
                   widget.selectedItemTheme == "Light" ? provider.changeMode(ThemeData.light()) :
                       ThemeData.dark();
                 });
               },
             ),
           ),
         ],
       )
     ),
   );
  }
}
