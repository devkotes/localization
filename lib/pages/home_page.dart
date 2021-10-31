import 'package:flutter/material.dart';
import 'package:podcoder_localization/classes/language.dart';
import 'package:podcoder_localization/localization/localization_conts.dart';
import 'package:podcoder_localization/main.dart';
import 'package:podcoder_localization/routes/router_names.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  void _changeLanguage(Language language) async {
    Locale _temp = await setLocale(language.languageCode);
    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownButton(
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              items: Language.languageList()
                  .map((lang) => DropdownMenuItem(
                        value: lang,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(lang.flag),
                            Text(
                              lang.name,
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
              onChanged: (Language language) {
                _changeLanguage(language);
              },
            ),
          )
        ],
      ),
      drawer: _drawerList(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: _mainForm(context),
      ),
    );
  }

  Widget _mainForm(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            child: Center(
              child: Text(
                getTranslated(context, 'personal_information'),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          TextFormField(
            validator: (val) {
              if (val.isEmpty) {
                return getTranslated(context, 'required_field');
              }
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: getTranslated(context, 'name'),
                hintText: getTranslated(context, 'name_hint')),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (val) {
              if (val.isEmpty) {
                return getTranslated(context, 'required_field');
              }
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: getTranslated(context, 'email'),
                hintText: getTranslated(context, 'email_hint')),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Select ' + getTranslated(context, 'date_of_birth'),
            ),
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year),
                  lastDate: DateTime(DateTime.now().year + 20));
            },
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {
              if (_key.currentState.validate()) {
                _showSuccessDialog();
              }
            },
            height: 50,
            shape: StadiumBorder(),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                getTranslated(context, 'submit_info'),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerList() {
    TextStyle _textStyle = TextStyle(
      color: Colors.white,
      fontSize: 24,
    );

    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(
              height: 100,
              child: CircleAvatar(),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              getTranslated(context, 'about_us'),
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              getTranslated(context, 'settings'),
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, settingsRoute);
            },
          )
        ],
      ),
    );
  }
}
