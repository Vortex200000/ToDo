import 'package:flutter/material.dart';
import 'package:todo/Styles/Mythemes.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0 , vertical: 20),
          child: Text('Languages' , style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14 , fontWeight: FontWeight.bold),),
        ),
        
        InkWell(
          onTap: () => ShowlanguageBottomSheet(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*.08,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Text(
                      'Language',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Spacer()
                    ,
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Mythemes.brimaryColour),

                  color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0 , vertical: 20),
          child: Text('Mode' , style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14 , fontWeight: FontWeight.bold),),
        ),

        InkWell(
          onTap: () => ShowThemeBottomSheet(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*.08,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Text(
                      'Light',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Spacer()
                    ,
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Mythemes.brimaryColour),

                  color: Colors.white),
            ),
          ),
        ),
        
      ],
    );
  }

  ShowlanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(


        );
      },
    );
  }

  ShowThemeBottomSheet(){
    showModalBottomSheet(context: context, builder: (context){
      return Container(

      );
    });
  }
}
