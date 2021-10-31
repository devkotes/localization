import 'package:flutter/material.dart';
import 'package:podcoder_localization/localization/localization_conts.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
      ),
      body: Container(
        child: Text(getTranslated(context, 'about')),
      ),
    );
  }
}
