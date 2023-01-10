import 'package:flutter/material.dart';
import 'package:notes_app/lists/listModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../firebase/firebase_funs.dart';

class AddBottomSheet extends StatefulWidget{

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {

  String title = "" ;
  String descreption = "" ;

  var formKey = GlobalKey<FormState>();
  DateTime textDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Form (
        key:formKey ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              onChanged: (text){
                title = text ;
                setState((){});
              },
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.enter_title ,
                suffixIcon: Icon(Icons.title)
              ),
              validator: (text){
                if (text== null || text.trim().isEmpty){
                  return "Please this is required" ;
                }else {
                  return null ;
                }
              },
            ),
            TextFormField(
              onChanged: (text){
                descreption = text ;
                setState((){});
              },
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.enter_descr ,
                  suffixIcon: Icon(Icons.description)
              ),
              validator: (text){
                if (text== null || text.trim().isEmpty){
                  return AppLocalizations.of(context)!.required ;
                }else {
                  return null ;
                }
              },
            ),

            InkWell(
              onTap: (){
                showCalender(context);
              },
              child: Text("${textDate.day} / ${textDate.month} / ${textDate.year}" , style: TextStyle(color: Colors.grey , fontSize: 20 , fontWeight:
              FontWeight.bold),),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                  onPressed: (){
                  addNote();
                  },
                  child: Text(AppLocalizations.of(context)!.add , style: TextStyle(fontWeight: FontWeight.bold ,
                  fontSize: 20),) ,
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder()
              ),),
            )

          ],
        ),
      ),
    );
  }

  void addNote (){
    NoteModel note = NoteModel(title: title, descreption: descreption, date: textDate.millisecondsSinceEpoch);
    if (formKey.currentState?.validate() == true){
        addNoteToFireBase(note).timeout(Duration(milliseconds: 400) , onTimeout: (){
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  leading: Text(AppLocalizations.of(context)!.done, style: TextStyle(color: Colors.blue , fontSize: 25),),
                  trailing: Icon(Icons.price_check_outlined , size: 30, color: Colors.blue,),
                ),
              ));
        }
        );
        print("done!");

    }
  }


  void showCalender (BuildContext context)async {
    var choosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (choosenDate != null){
      textDate = choosenDate ;
      setState((){});
    }
  }
}