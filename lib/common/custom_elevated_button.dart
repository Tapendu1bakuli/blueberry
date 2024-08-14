
import 'package:flutter/material.dart';
import '../device_manager/screen_constants.dart';
import '../utils/colors/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconBackColor;
  final Color? iconColor;
  final bool iconEnable;
  final EdgeInsets? padding;
   const CustomElevatedButton({Key? key, this.onTap, this.text = "", this.backgroundColor = CustomColor.white, this.textColor = CustomColor.primaryBlack, this.textStyle, this.iconBackColor, this.iconColor, this.iconEnable = true, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor, backgroundColor: backgroundColor, padding: padding??ScreenConstant.spacingAllSmall, // foreground
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)),
      ),
      onPressed: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: ScreenConstant.defaultHeightTen),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 8,
                child: Text(text,style: textStyle,textAlign: TextAlign.center,)),
        iconEnable?Expanded(
              flex: 1,
              child: Container(
                padding: ScreenConstant.spacingAllExtraSmall,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: iconBackColor??textColor
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: iconColor??backgroundColor,
                  size: ScreenConstant.sizeLarge,
                ),
              ),
            ):const Offstage(),
          ],
        ),
      ),
    );
  }
}


