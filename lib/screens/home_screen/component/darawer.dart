import 'package:ar_book/screens/home_screen/component/draw/language.dart';
import 'package:ar_book/screens/home_screen/component/draw/security_screen.dart';
import 'package:ar_book/screens/home_screen/component/draw/terms_of_use.dart';
import 'package:ar_book/styles/colors.dart';
import 'package:ar_book/styles/custom_size.dart';
import 'package:ar_book/styles/images/images.dart';
import 'package:ar_book/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationDrawer extends ConsumerStatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  ConsumerState<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends ConsumerState<NavigationDrawer> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: CustomColors.green006338.withOpacity(0.2),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: getHeight(context) * 0.2,
              child: DrawerHeader(
                // decoration: BoxDecoration(
                //   // color: CustomColors.green006338.withOpacity(0.1),
                // ),
                child: Center(
                  child: Images.imageAssets(
                    Images.img_logo,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 0.4,
              color: CustomColors.white,
            ),

            const SizedBox(height: 27),
            Container(
              color: CustomColors.white,
              child: ListTile(
                leading: Text(
                  FlutterI18n.translate(context, 'home'),
                  style: TxtStyle.Noto18w600.copyWith(
                    color: CustomColors.green006338,
                  ),
                ),
                subtitle: null,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),

            const SizedBox(height: 16),
            // Container(
            //   color: CustomColors.white,
            //   child: ListTile(
            //     leading: Text(
            //       FlutterI18n.translate(context, 'termsOfuse'),
            //       style: TxtStyle.Noto18w600.copyWith(
            //         color: CustomColors.green006338,
            //       ),
            //     ),
            //     subtitle: null,
            //     onTap: () {
            //       Navigator.pop(context);
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const TermsOfUseScreen(),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            // const SizedBox(height: 16),
            // Container(
            //   color: CustomColors.white,
            //   child: ListTile(
            //     leading: Text(
            //       FlutterI18n.translate(context, 'security'),
            //       style: TxtStyle.Noto18w600.copyWith(
            //         color: CustomColors.green006338,
            //       ),
            //     ),
            //     subtitle: null,
            //     onTap: () {
            //       Navigator.pop(context);
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const SecurityScreen(),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            // const SizedBox(height: 16),
            Container(
              color: CustomColors.white,
              child: ListTile(
                leading: Text(
                  FlutterI18n.translate(context, 'user.language'),
                  style: TxtStyle.Noto18w600.copyWith(
                    color: CustomColors.green006338,
                  ),
                ),
                subtitle: null,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectLanguages(),
                    ),
                  );
                },
              ),
            ),

            // _buildListTitleNoSub(
            //   title: 'L10n.of(context).msgap023',
            //   onTab: () {
            //     Navigator.pop(context);
            //     // Navigator.push(
            //     //   context,
            //     //   MaterialPageRoute(
            //     //     builder: (context) => const IntroductScreen(),
            //     //   ),
            //     // );
            //   },
            // ),
          ],
        ),
        //       _buildListTitleNoSub(
        //         title: L10n.of(context).msgap065,
        //         onTab: () {
        //           Navigator.pop(context);
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => const TermsOfUseScreen()),
        //           );
        //         },
        //       ),
        //       _buildListTitleNoSub(
        //         title: L10n.of(context).msgap066,
        //         onTab: () {
        //           Navigator.pop(context);
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => const SecurityScreen()),
        //           );
        //         },
        //       ),
        //       _buildListTitleNoSub(
        //         title: L10n.of(context).msgap067,
        //         onTab: () {
        //           Navigator.pop(context);
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => const FeedbackScreen()),
        //           );
        //         },
        //       ),
        //       SizedBox(height: getHeight(context) * 0.2),
        //       Divider(
        //         thickness: 0.4,
        //         color: CustomColors.red861E00.withOpacity(0.4),
        //       ),
        //       _buildListTitle(
        //         title: L10n.of(context).msgap021,
        //         subTitle: !ref.watch(appStateNotifier).isLanguage
        //             ? L10n.of(context).msgap022
        //             : L10n.of(context).msgap034,
        //         onTab: () {
        //           Navigator.pop(context);
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => const LanguageScreen(),
        //             ),
        //           );
        //         },
        //       ),
        //       const SizedBox(height: 60),
        //     ],
        //   ),
      ),
    );
  }

  // Widget _buildListTitle({
  //   String? title,
  //   String? subTitle,
  //   VoidCallback? onTab,
  // }) {
  //   return ListTile(
  //     minVerticalPadding: 8,
  //     title: Text(
  //       title ?? '',
  //       style: TxtStyle.Noto18w600.copyWith(
  //         color: CustomColors.red861E00,
  //         fontSize: 16,
  //         height: 1.3,
  //       ),
  //     ),
  //     trailing: Images.imageAssets(
  //       Images.iconArrowRight,
  //       fit: BoxFit.scaleDown,
  //       color: CustomColors.red861E00,
  //       height: 18,
  //       width: 18,
  //     ),
  //     subtitle: Text(
  //       subTitle ?? '',
  //       style: TxtStyle.League14w300.copyWith(
  //         color: CustomColors.red861E00,
  //       ),
  //     ),
  //     onTap: onTab,
  //   );
  // }

  Widget _buildListTitleNoSub({
    String? title,
    VoidCallback? onTab,
  }) {
    return ListTile(
      minVerticalPadding: 8,
      title: Text(
        title ?? '',
        style: TxtStyle.Noto18w600.copyWith(
          color: CustomColors.red861E00,
          height: 1.3,
        ),
      ),
      trailing: Images.imageAssets(
        Images.ic_book,
        fit: BoxFit.scaleDown,
        color: CustomColors.red861E00,
        height: 18,
        width: 18,
      ),
      subtitle: null,
      onTap: onTab,
    );
  }
}
