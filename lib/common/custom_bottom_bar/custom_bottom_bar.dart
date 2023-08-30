import 'package:ar_book/services/api_provider.dart';
import 'package:ar_book/styles/colors.dart';
import 'package:ar_book/styles/images/images.dart';
import 'package:ar_book/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({
    required this.iconData,
    required this.text,
  });
  final String iconData;
  final String text;
}

class FABBottomAppBar extends ConsumerStatefulWidget {
  FABBottomAppBar({
    Key? key,
    required this.items,
    this.height = 60.0,
    required this.backgroundColor,
    this.color,
    required this.selectedColor,
    this.notchedShape,
    required this.onTabSelected,
  }) : super(key: key) {
    assert(items.length == 2 || items.length == 3);
  }
  final List<FABBottomAppBarItem> items;
  final double? height;
  final Color backgroundColor;
  final Color? color;
  final Color selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  ConsumerState<FABBottomAppBar> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends ConsumerState<FABBottomAppBar> {
  _updateIndex(int index) {
    widget.onTabSelected(index);
    ref.read(indexSelectBottomBar.notifier).state = index;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return BottomAppBar(
      elevation: 2,
      shape: widget.notchedShape,
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0x00000000).withOpacity(0.08),
              blurRadius: 5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items,
        ),
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    final selectedIndex = ref.watch(indexSelectBottomBar);
    Color? color = selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Images.imageAssets(
                  item.iconData,
                  color: color,
                  fit: BoxFit.scaleDown,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
