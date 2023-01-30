import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/lists/listModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../firebase/firebase_funs.dart';

class UpdateNote extends StatefulWidget {

static const String routeName = "update";

  @override
  State<UpdateNote> createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {
  var formKey = GlobalKey<FormState>();

  String updateTitle = "";

  String updateDescription = "";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as Map;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            margin: EdgeInsets.symmetric(horizontal: 40),
            height: 600,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(AppLocalizations.of(context)!.update_note,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                            onChanged: (text) {
                              updateTitle = text;
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              labelText: "${args["title"]}",
                              suffixIcon: Icon(Icons.title),
                            ),
                            validator: (text) {
                              if (text == null || text
                                  .trim()
                                  .isEmpty) {
                                return AppLocalizations.of(context)!.required;
                              } else {
                                return null;
                              }
                            }
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                            onChanged: (text) {
                              updateDescription = text;
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              labelText: "${args["descreption"]}",
                              suffixIcon: Icon(Icons.title),
                            ),
                            validator: (text) {
                              if (text == null || text
                                  .trim()
                                  .isEmpty) {
                                return AppLocalizations.of(context)!.required;
                              } else {
                                return null;
                              }
                            }
                        ),
                      ],
                    )),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    onPressed: () {
                     if (formKey.currentState?.validate() == true){
                       updateNoteFromFireBase(args["note"]);
                     }
                    },
                    child: Text(
                      AppLocalizations.of(context)!.update, style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20),),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future <void> updateNoteFromFireBase(NoteModel noteModel) async {
    await getCollectionFromFireBase().doc(noteModel.id).update({
      'title': updateTitle,
      'description': updateDescription
    }).timeout(Duration(milliseconds: 400) , onTimeout: (){
      Navigator.pop(context);
      showDialog(context: context,
          builder: (content) => AlertDialog(
            content: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              ),
              leading: Text(AppLocalizations.of(context)!.done , style: TextStyle(color: Colors.blue , fontSize: 25),),
              trailing: Icon(Icons.price_check_outlined , size: 30, color: Colors.blue,),
            ),
          ));
    });
  }
}