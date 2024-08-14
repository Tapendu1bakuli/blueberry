

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../device_manager/screen_constants.dart';
import '../../utils/image_utils/image_utils.dart';
class UniversalButtonWidget extends StatelessWidget {
   const UniversalButtonWidget({Key? key,this.firstTextStyle,this.secondTextStyle,this.isRichText = false,this.firstText,this.secondText,this.trailingIconHeight,this.trailingIconColor,this.trailingIconVisible = false,this.trailingIcon,this.height,this.width,this.borderRadius,this.padding,this.leadingIconvisible = false,this.margin,this.color = Colors.transparent,this.ontap,this.titleTextStyle,this.title,this.prefixIcon,this.prefixIconHeight,this.borderColor,this.prefixIconColor}) : super(key: key);
final Color color;
final Function()? ontap;
final EdgeInsets? margin;
final EdgeInsets? padding;
final Color? borderColor;
final Color? prefixIconColor;
final Color? trailingIconColor;
final String? title;
final double? height;
final double? width;
final String? prefixIcon;
final Icon? trailingIcon;
final double? prefixIconHeight;
final double? trailingIconHeight;
final TextStyle? titleTextStyle;
final bool? leadingIconvisible;
final bool? trailingIconVisible;
final bool? isRichText;
final String? firstText;
final TextStyle? firstTextStyle;
final String? secondText;
final TextStyle? secondTextStyle;
final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: ontap,
      child: Container(
        height: height,
        width: width,
        padding: padding??ScreenConstant.spacingAllMedium,
        margin: margin??EdgeInsets.symmetric(horizontal: ScreenConstant.screenWidthSixth),
        decoration: BoxDecoration(borderRadius: borderRadius??BorderRadius.circular(10),color: color,border: Border.all(color: borderColor??color,width: 2)),
        child: isRichText??false?Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(prefixIcon??ImageUtils.appIcon,height: prefixIconHeight,color: prefixIconColor,),
            Container(width: ScreenConstant.screenWidthMinimum,),
            RichText(
              text: TextSpan(
                text: firstText,
                style: firstTextStyle??const TextStyle(
                    color:  Colors.black,
                    fontSize: 16,
                    height: 1.5,
                    fontFamily: 'GorditaMedium'),
                children: <TextSpan>[
                  TextSpan(
                      text: secondText,
                      style:secondTextStyle?? const TextStyle(
                          color: const Color(0xFF111A24),
                          fontSize: 14,
                          fontFamily: 'Gordita')),
                ],
              ),
            )
          ],
        ):Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           leadingIconvisible??false?const Offstage(): Image.asset(prefixIcon??ImageUtils.appIcon,height: prefixIconHeight,color: prefixIconColor,),
            leadingIconvisible??false?const Offstage():Container(width: ScreenConstant.defaultWidthTen,),
            Flexible(child: Text(title??"",style: titleTextStyle,)),
            trailingIconVisible??false?Container(width: ScreenConstant.defaultWidthTen,):const Offstage(),
            trailingIconVisible??false?trailingIcon?? Icon(Icons.account_circle_outlined):const Offstage(),
          ],
        ),
      ),
    );
  }
}
