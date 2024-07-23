import 'package:ar_book/core/local_data.dart';
import 'package:ar_book/main.dart';
import 'package:ar_book/models/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectLanguages extends StatefulWidget {
  const SelectLanguages({Key? key}) : super(key: key);

  @override
  _SelectLanguagesState createState() => _SelectLanguagesState();
}

class _SelectLanguagesState extends State<SelectLanguages> {
  List<Lang> lang = LocalData.languages;

  var currentLang = 0;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setPrefsLang() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString("lang", lang[currentLang].id);
  }

  void checkCurrentLang() async {
    final SharedPreferences prefs = await _prefs;
    final String? currentLangCode = prefs.getString('lang');
    if (currentLangCode != null) {
      setState(() {
        currentLang =
            lang.indexWhere((element) => element.id == currentLangCode);
      });
    }
  }

  @override
  void initState() {
    checkCurrentLang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.only(
                  right: 22,
                ),
                height: 50,
                color: Theme.of(context).colorScheme.primary,
                child: Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/back.svg',
                        width: 20,
                        height: 20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Spacer(),
                  ],
                )),
            ListView.builder(
                shrinkWrap: true,
                itemCount: lang.length,
                itemBuilder: (BuildContext context, int index) {
                  return RadioListTile(
                    activeColor: Colors.blue,
                    title: Text(
                      lang[index].name,
                      style: TextStyle(fontFamily: lang[index].font).copyWith(
                        // fontFamily: FlutterI18n.translate(context, 'font'),
                      ),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    value: index,
                    groupValue: currentLang,
                    selectedTileColor: Colors.red,
                    onChanged: (int? value) {
                      setState(() {
                        currentLang = value!;
                      });
                      // late Locale locale;
                      if (lang[currentLang].scriptCode != '') {
                         MyApp.setLocale(context, Locale.fromSubtags(
                            languageCode: lang[currentLang].languageCode,
                            scriptCode: lang[currentLang].scriptCode));
                        FlutterI18n.refresh(context, Locale.fromSubtags(
                            languageCode: lang[currentLang].languageCode,
                            scriptCode: lang[currentLang].scriptCode));
                      } else {
                        MyApp.setLocale(context, Locale(lang[currentLang].languageCode));
                        FlutterI18n.refresh(context, Locale(lang[currentLang].languageCode));
                      }
                      // MyApp.setLocale(context, locale);
                      // FlutterI18n.refresh(context, locale);
                      setPrefsLang();
                      print(lang[currentLang].id);
                      Navigator.pop(context);
                    },
                  );
                }),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
