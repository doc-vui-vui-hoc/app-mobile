import 'package:ar_book/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingBookNew extends StatelessWidget {
  const LoadingBookNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Shimmer.fromColors(
        baseColor: CustomColors.blackC7C7C7,
        highlightColor: CustomColors.grayFAFAFA,
        enabled: true,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 90,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                          border: Border.all(
                              color: const Color(0xFFECECEC), width: 1),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 90,
                        height: 10,
                        decoration: BoxDecoration(
                          color: CustomColors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
