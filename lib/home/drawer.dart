import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
 static const int list = 0 ;
 static const int settings = 1 ;
 Function onDrawerIntemClick ;
 HomeDrawer({required this.onDrawerIntemClick});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30))
          ),
          height: 300,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image(image: AssetImage("assets/images/logo.jpg") , width: double.infinity,
              fit: BoxFit.cover,) ,
              Positioned(
                bottom: 30,
                  child: Text(AppLocalizations.of(context)!.notes_drawer , style: Theme.of(context).textTheme.headline1,))
            ],
          ),
        ) ,
        SizedBox(height: 15,),
        InkWell(
          onTap: (){
            onDrawerIntemClick(HomeDrawer.list);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row (
              children: [
                Icon(Icons.list , size: 30,) ,
                SizedBox(width: 15,),
                Text(AppLocalizations.of(context)!.note_list, style: TextStyle(color: Colors.black , fontSize: 25),)
              ],
            ),
          ),
        ),
        SizedBox(height: 20,),
        InkWell(
          onTap: (){
              onDrawerIntemClick(HomeDrawer.settings);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row (
              children: [
                Icon(Icons.settings , size: 30,) ,
                SizedBox(width: 15,),
                Text(AppLocalizations.of(context)!.settings, style: TextStyle(color: Colors.black , fontSize: 25),) ,
              ],
            ),
          ),
        ),
        SizedBox(height: 20,),
        InkWell(
          onTap: ()async{
            Navigator.pop(context);
           await Share.share("Hellow World");
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row (
              children: [
                Icon(Icons.share , size: 30,) ,
                SizedBox(width: 15,),
                Text(AppLocalizations.of(context)!.share , style: TextStyle(color: Colors.black , fontSize: 25),) ,
              ],
            ),
          ),
        ),

      ],
    );
  }
}
