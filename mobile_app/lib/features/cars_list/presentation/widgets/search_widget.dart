import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/core/constats/color_constants.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.lightBlueColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const TextField(
        decoration: InputDecoration(
          prefix: Icon(
            CupertinoIcons.search,
          ),
        ),
      ),
    );
  }
}
