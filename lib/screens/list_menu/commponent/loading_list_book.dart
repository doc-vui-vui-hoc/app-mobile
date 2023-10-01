import 'package:ar_book/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingListBook extends StatelessWidget {
  const LoadingListBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: CustomColors.blackC7C7C7,
      highlightColor: CustomColors.grayFAFAFA,
      enabled: true,
      child: GridView.builder(
        itemCount: 15,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 0.6,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          maxCrossAxisExtent: 150,
        ),
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
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
                      border:
                          Border.all(color: const Color(0xFFECECEC), width: 1),
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
        },
      ),
    );
  }
}
