import 'package:ar_book/styles/colors.dart';
import 'package:ar_book/styles/images/images.dart';
import 'package:ar_book/styles/style.dart';
import 'package:flutter/material.dart';

class DataBlankWidget extends StatelessWidget {
  const DataBlankWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 70),
          SizedBox(
            child: Images.imageAssets(
              'assets/images/ic_empty_default.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Chưa có dữ liệu',
            textAlign: TextAlign.center,
            style: TxtStyle.League18w500.copyWith(
              fontStyle: FontStyle.normal,
              color: CustomColors.black1E1E1E,
            ),
          ),
        ],
      ),
    );
  }
}
