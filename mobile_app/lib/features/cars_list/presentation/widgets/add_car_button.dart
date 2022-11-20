import 'package:flutter/cupertino.dart';
import 'package:mobile_app/core/constats/color_constants.dart';

class AddCarButton extends StatelessWidget {
  const AddCarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: ColorConstants.lightBlueColor,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: const Icon(CupertinoIcons.plus),
    );
  }
}
