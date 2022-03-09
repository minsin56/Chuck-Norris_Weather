import 'package:dafaq_is_the_weather/Screens/WeatherAppMainPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    // TODO: implement createState
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage>
{
  bool UseDarkMode = false;
  @override
  Widget build(BuildContext context)
  {
    return WeatherApp(child:
        FutureBuilder<SharedPreferences>(future: SharedPreferences.getInstance(),builder: (CTX,Snapshot)
        {
          if(Snapshot.hasData)
          {
            SharedPreferences? Prefs = Snapshot.data;

            if (Prefs != null)
            {
              if (Prefs.containsKey("DarkMode"))
              {
                UseDarkMode = Prefs.getBool("UseDarkMode") ?? false;

              }

              return
                SettingsList(
                  sections: [
                    SettingsSection(
                      title: Text('Common'),
                      tiles: <SettingsTile>[
                        SettingsTile.switchTile(
                          onToggle: (value)
                          {
                            setState(()
                            {
                              UseDarkMode = value;
                              Prefs.setBool("UseDarkMode", value);
                            });
                          },
                          initialValue: UseDarkMode,
                          leading: Icon(Icons.format_paint),
                          title: Text('Enable Dark Mode')
                          ,
                        ),
                      ],
                    ),
                  ],
                );
            }
          }

          return Text("Loading");
        })
    );
  }
}