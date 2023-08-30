import 'package:ar_book/core/local_data.dart';
import 'package:ar_book/screens/list_menu/commponent/list_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListMenuScreen extends StatefulWidget {
  const ListMenuScreen({Key? key}) : super(key: key);

  @override
  State<ListMenuScreen> createState() => _ListMenuScreenState();
}

class _ListMenuScreenState extends State<ListMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: ListView(
        children: <Widget>[
          OrientationBuilder(builder: (context, orientation) {
            return GridView.builder(
              itemCount: LocalData.categories.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                // crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                childAspectRatio: 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20, maxCrossAxisExtent: 320,
              ),
              //
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListBookScreen(
                                  title: LocalData.categories[index].ten,
                                  filter: {
                                    'category':
                                        LocalData.categories[index].filter
                                  })));
                },
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(LocalData.categories[index].anh)),
                      // color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        FlutterI18n.translate(
                            context, LocalData.categories[index].ten),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: FlutterI18n.translate(context, 'font'),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
