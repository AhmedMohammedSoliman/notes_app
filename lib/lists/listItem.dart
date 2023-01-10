import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes_app/firebase/firebase_funs.dart';
import 'package:notes_app/updateNote/updateNote.dart';
import 'listModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ListItem extends StatefulWidget{

  String textTitle ;
  String textDescription ;
  NoteModel  note ;

  ListItem ({required this.textTitle , required this.textDescription , required this.note});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        extentRatio: 0.3,
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: (context){
              deleteNoteFromFireBase(widget.note , context);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: AppLocalizations.of(context)!.delete,
            autoClose: false,
          )],
      ) ,
      endActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: (context){
            Navigator.pushNamed(context, UpdateNote.routeName ,
            arguments : {
              "title" : widget.textTitle,
              "descreption" : widget.textDescription,
              "note" : widget.note ,
            });
            },
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: AppLocalizations.of(context)!.update,
          )

        ],
      ),

      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
          children: [
            Text("${widget.textTitle}" , style: TextStyle(color: Colors.black , fontSize: 20 ,
                fontWeight: FontWeight.bold),) ,
            Text("${widget.textDescription}" , style: TextStyle(color: Colors.black , fontSize: 18 ,
                fontWeight: FontWeight.w500),) ,
          ],
        )
      ),

    );
  }
}