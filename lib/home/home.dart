import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/home/drawer.dart';
import 'package:notes_app/provider/myProvider.dart';
import 'package:notes_app/setting/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../lists/listScreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String title = "News App";
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedItem == HomeDrawer.list? AppLocalizations.of(context)!.note_list :
            AppLocalizations.of(context)!.settings, style: Theme.of(context).textTheme.headline1),
      ),
      drawer: Drawer(
        child: HomeDrawer(onDrawerIntemClick: onClickDigit),
      ),
      body: selectedItem == HomeDrawer.list ? ListScreen():
        SettingScreen(selectedValue: provider.appLanguage=="en" ? "English" : "Arabic" ,
        selectedItemTheme: provider.appMode == ThemeData.light() ? "Light" : "Dark"),
    );
  }

  int selectedItem = HomeDrawer.list ;

  void onClickDigit (int selectedIndex){

    selectedItem = selectedIndex ;
    Navigator.pop(context);
    setState((){});
    }
}
