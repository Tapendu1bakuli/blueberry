import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors/app_colors.dart';

class TextStyles {
  static TextStyle get headingBold => const TextStyle(
      color: CustomColor.primaryDark,
      fontSize: 24,
      fontFamily: "PoppinsSemiBold");
  static TextStyle get subtitleSmall => const TextStyle(
      color: CustomColor.primaryBlack,
      fontSize: 14,
      fontFamily: "PoppinsRegular"
      );
  static TextStyle get titleBold => const TextStyle(
      color: CustomColor.primaryBlack,
      fontSize: 14,
      fontFamily: "PoppinsBold"
  );
  static TextStyle get buttonText => const TextStyle(
      color: CustomColor.white,
      fontSize: 14,
      fontFamily: "PoppinsMedium"
  );
  static TextStyle get subtitleExtraSmall => const TextStyle(
      color: CustomColor.primaryBlack,
      fontSize: 12,
      fontFamily: "PoppinsRegular"
  );
  static TextStyle get appbarTitle => const TextStyle(
      color: CustomColor.buttonDarkColor,
      fontSize: 16,
      fontFamily: "PoppinsBold"
  );
  static TextStyle get homeBold => const TextStyle(
    color: CustomColor.buttonDarkColor,
    fontSize: 24,
    fontFamily: "PoppinsBold",
  );
  static TextStyle get homeLight => const TextStyle(
      color: CustomColor.primaryBlack,
      fontSize: 14,
      fontFamily: "PoppinsMedium",
      );
  static TextStyle get smallHintText => TextStyle(
    color: CustomColor.primaryBlack,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static TextStyle get universalButtonWidgetWhiteText => TextStyle(
      color: CustomColor.white,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      );
  static TextStyle get universalButtonWidgetBlackText => TextStyle(
      color: CustomColor.primaryBlack.withOpacity(0.5),
      fontSize: 18,
      fontWeight: FontWeight.w700,
      );
  static TextStyle get carousalTitleWidgetBlueText => TextStyle(
      color: CustomColor.primaryBlue,
      fontSize: 28,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w700,
      );
  static TextStyle get carousalSubTitleWidgetBlueText => TextStyle(
      color: CustomColor.white,
      fontSize: 19,
      fontWeight: FontWeight.w600,
      );
  static TextStyle get carousalMidTitleWidgetBlueText => TextStyle(
      color: CustomColor.white,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      );
  static TextStyle get homeTabStyleSemiBold => TextStyle(
      color: CustomColor.secondaryBlack,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      );
  static TextStyle get homeTabCardTitleStyleBold => TextStyle(
      color: CustomColor.white,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      );
  static TextStyle get homeTabCardSubTitleStyleBold => TextStyle(
      color: CustomColor.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      );
  static TextStyle get homeTabSecondCardTitleStyleBold => TextStyle(
      color: CustomColor.primaryDeepblue,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      );
  static TextStyle get homeTabSecondCardSubTitleStyleBold => TextStyle(
      color: CustomColor.primaryDeepblue,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      );
  static TextStyle get homeViewAllStyleSemiBold => TextStyle(
      color: CustomColor.primaryBlue,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      );
  static TextStyle get homeBottomFirstTitleStyleSemiBold => TextStyle(
      color: CustomColor.white,
      fontSize: 30,
      fontWeight: FontWeight.w900,
      );
  static TextStyle get homeBottomSecondTitleStyleSemiBold => TextStyle(
      color: CustomColor.primaryBlue,
      fontSize: 30,
      fontWeight: FontWeight.w900,
      );
  static TextStyle get homeBottomSubtitleTitleStyleSemiBold => TextStyle(
      color: CustomColor.primaryBlack,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      );
  static TextStyle get homeBottomButtonTextStyleStyleSemiBold => TextStyle(
      color: CustomColor.customWhite,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      );
  static TextStyle get landingBottomText => TextStyle(
      color: CustomColor.white,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      );
  static TextStyle get landingBottomUnderlinedText => TextStyle(
      color: CustomColor.white,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline,
      decorationColor: CustomColor.white,
      );

  static TextStyle get textStyleRegular => TextStyle(
      color: CustomColor.colorTextHint,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      );

  static TextStyle get textStyleSemiBold => TextStyle(
      color: CustomColor.white,
      fontSize: 13,
      fontWeight: FontWeight.w600,
      );

  static TextStyle get languageSelectionTextStyle => TextStyle(
    fontWeight: FontWeight.w700,
    color: CustomColor.homeGrey,
  );
  static TextStyle get editProfileTitleStyleBold => TextStyle(
      color: CustomColor.primaryBlack,
      fontSize: 29,
      fontWeight: FontWeight.w500,
      );
  static TextStyle get appbarTitleStyleBold => TextStyle(
      color: CustomColor.primaryBlack,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      );
  static TextStyle get editProfileSubtitleTitleStyleSemiBold => TextStyle(
      color: CustomColor.primaryBlack,
      fontSize: 17,
      fontWeight: FontWeight.w500,
      );
  static TextStyle get editProfileUnderlinedTitleStyleSemiBold => TextStyle(
      color: CustomColor.secondaryBlue,
      fontSize: 17,
      fontWeight: FontWeight.w800,
      decorationColor: CustomColor.secondaryBlue,
      decoration: TextDecoration.underline,
      );
  static TextStyle get textFieldTextStyleSemiBold => TextStyle(
  letterSpacing: 0,
  color: CustomColor.primaryBlue,
  fontSize: 14,
  fontWeight: FontWeight.w300);
  static TextStyle get tabSelectedStyleSemiBold => TextStyle(
      color: CustomColor.primaryBlue,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      );
  static TextStyle get hintTextStyle =>
      TextStyle(
          letterSpacing: 0,
          color: CustomColor.primaryBlue,
          fontSize: 14,
          fontWeight: FontWeight.w300);
  static TextStyle get mediumLargeRegular => TextStyle(
      color: CustomColor.colorTextHint,
      fontSize: 19,
      fontWeight: FontWeight.w500,
      );
  static TextStyle get drawerTitleBold => TextStyle(
      color: CustomColor.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      );
  static TextStyle get drawerSubTitleBold => TextStyle(
      color: CustomColor.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      );
  static TextStyle get textFieldTitleRegular => TextStyle(
      color: CustomColor.colorTextHint,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      );
  static TextStyle get walletSubTitleWhiteRegular => TextStyle(
      color: CustomColor.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      );
  static TextStyle get appbarSmallTitleStyleBold => TextStyle(
  color: CustomColor.homeGrey,
  fontSize: 13,
  fontWeight: FontWeight.w400,
      );
  static TextStyle get redHeartTextStyleStyleBold => TextStyle(
      color: CustomColor.white,
      fontSize: 48,
      fontWeight: FontWeight.w400,
      );
  static TextStyle get walletBalanceTopUpCardTopTextStyleStyleBold => TextStyle(
      color: CustomColor.white,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      );

}
