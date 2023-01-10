import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../lists/listModel.dart';


CollectionReference<NoteModel> getCollectionFromFireBase(){
  return FirebaseFirestore.instance.collection('note').withConverter<NoteModel>(
      fromFirestore: (snapshot, _) => NoteModel.fromJson(snapshot.data()!),
      toFirestore: (note, _) => note.toJson()
  );
}


Future<void> addNoteToFireBase (NoteModel note){
  var collection = getCollectionFromFireBase();
   var doc =  collection.doc();
   note.id = doc.id;
  return doc.set(note);
}

Future <void> deleteNoteFromFireBase (NoteModel note, BuildContext context)async{
 await getCollectionFromFireBase().doc(note.id).delete().timeout(Duration(milliseconds: 400) , onTimeout: (){
   showDialog(
       context: context,
       builder: (context)=> AlertDialog(
         content: ListTile(
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(30)
           ),
           leading: Text("Done !" , style: TextStyle(color: Colors.blue , fontSize: 25),),
           trailing: Icon(Icons.price_check_outlined , size: 30, color: Colors.blue,),
         ),
       )
   );
 });
}




