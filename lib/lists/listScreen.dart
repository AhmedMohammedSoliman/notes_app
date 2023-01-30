import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/addNoteScreen/addBottomSheet.dart';
import 'package:notes_app/lists/listItem.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import '../firebase/firebase_funs.dart';
import 'listModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListScreen extends StatefulWidget{

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<NoteModel> notesList = [];

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {

    getNotesFromFireBase();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                CalendarTimeline(
                  initialDate: selectedDate,
                  firstDate: DateTime.now().subtract(Duration(days: 365)),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                  onDateSelected: (date) {
                    selectedDate = date ;
                    setState((){});
                  },
                  leftMargin: 20,
                  shrink: true,
                  showYears: true,
                  monthColor: Colors.blue,
                  dayColor: Colors.white,
                  activeDayColor: Colors.white,
                  activeBackgroundDayColor: Colors.red,
                  dotsColor: Colors.white,
                  locale: 'en_ISO',
                ) ,
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: notesList.length == 0 ? Center(
                    child: Text(AppLocalizations.of(context)!.there_is_no_note_yet, style: TextStyle(
                      color: Colors.white
                    ),),
                  ) :
                  ListView.separated(
                    separatorBuilder: (context , index ) => SizedBox(height: 10,),
                    itemBuilder: (context , index) => ListItem(textTitle: notesList[index].title,
                      textDescription: notesList[index].descreption,
                      note: notesList[index],
                    ) ,
                    itemCount: notesList.length,),
                ),
                SizedBox(height: 15,),

                FloatingActionButton(
                  onPressed: (){
                    showAddSheet(context);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white , width: 3)
                ),
                  child: Icon(Icons.add),
                ) ,

              ],
            ),
          ),
        ),
      ),
    );
  }

  void showAddSheet (BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (context) => AddBottomSheet()) ;
  }

  void getNotesFromFireBase ()async{
    QuerySnapshot<NoteModel> collection = await getCollectionFromFireBase().get();
    notesList = collection.docs.map((e) => e.data()).toList();
   notesList =  notesList.where((note){
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(note.date);
      if (selectedDate.month == dateTime.month && selectedDate.day == dateTime.day &&
      selectedDate.year == dateTime.year){
        return true;
      }
      return false ;
    }).toList();
   notesList.sort((NoteModel note1 , NoteModel note2){
     return note1.date.compareTo(note2.date);
   });
    setState((){});

  }
}