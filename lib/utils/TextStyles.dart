import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors/app_colors.dart';

class TextStyles {
  static TextStyle get subtitleSmall => const TextStyle(
      color: CustomColor.primaryBlack,
      fontSize: 14,
      fontFamily: "SFCompact"
  );
  static TextStyle get splashTitleBlue => TextStyle(
      color: CustomColor.primaryBlue,
      fontSize: 15,
      fontWeight: FontWeight.w700,
      fontFamily: "SFCompact");
  static TextStyle get titleBold => const TextStyle(
      color: CustomColor.primaryBlack,
      fontSize: 14,
      fontFamily: "SFCompact"
  );
  static TextStyle get buttonText => const TextStyle(
      color: CustomColor.white,
      fontSize: 14,
      fontFamily: "SFCompact"
  );
  static TextStyle get splashTitleBlack => TextStyle(
      color: CustomColor.primaryBlack,
      fontSize: 15,
      fontWeight: FontWeight.w700,
      fontFamily: "SFCompact");
  static TextStyle get titleWhite => TextStyle(
      color: CustomColor.white,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontFamily: "SFCompact");
  static TextStyle get universalButtonWidgetWhiteText => TextStyle(
      color: CustomColor.white,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      fontFamily: "SFCompact");
  static TextStyle get universalButtonWidgetBlackText => TextStyle(
      color: CustomColor.primaryBlack.withOpacity(0.5),
      fontSize: 18,
      fontWeight: FontWeight.w700,
      fontFamily: "SFCompact");
  static TextStyle get carousalTitleWidgetBlueText => TextStyle(
      color: CustomColor.primaryBlue,
      fontSize: 28,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w700,
      fontFamily: "SFCompact");
  static TextStyle get carousalSubTitleWidgetBlueText => TextStyle(
      color: CustomColor.white,
      fontSize: 19,
      fontWeight: FontWeight.w600,
      fontFamily: "SFCompact");
  static TextStyle get carousalMidTitleWidgetBlueText => TextStyle(
      color: CustomColor.white,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: "SFCompact");
  static TextStyle get homeTabStyleSemiBold => TextStyle(
      color: CustomColor.secondaryBlack,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: "SFCompact");
  static TextStyle get homeTabCardTitleStyleBold => TextStyle(
      color: CustomColor.white,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontFamily: "SFCompact");
  static TextStyle get homeTabCardSubTitleStyleBold => TextStyle(
      color: CustomColor.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: "SFCompact");
  static TextStyle get homeTabSecondCardTitleStyleBold => TextStyle(
      color: CustomColor.primaryDeepblue,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontFamily: "SFCompact");
  static TextStyle get homeTabSecondCardSubTitleStyleBold => TextStyle(
      color: CustomColor.primaryDeepblue,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: "SFCompact");
  static TextStyle get homeViewAllStyleSemiBold => TextStyle(
      color: CustomColor.primaryBlue,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: "SFCompact");
  static TextStyle get homeBottomFirstTitleStyleSemiBold => TextStyle(
      color: CustomColor.white,
      fontSize: 30,
      fontWeight: FontWeight.w900,
      fontFamily: "SFCompact");
  static TextStyle get homeBottomSecondTitleStyleSemiBold => TextStyle(
      color: CustomColor.primaryBlue,
      fontSize: 30,
      fontWeight: FontWeight.w900,
      fontFamily: "SFCompact");
  static TextStyle get homeBottomSubtitleTitleStyleSemiBold => TextStyle(
      color: CustomColor.primaryBlack,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: "SFCompact");
  static TextStyle get homeBottomButtonTextStyleStyleSemiBold => TextStyle(
      color: CustomColor.customWhite,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: "SFCompact");
  static TextStyle get landingBottomText => TextStyle(
      color: CustomColor.white,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: "SFCompact");
  static TextStyle get landingBottomUnderlinedText => TextStyle(
      color: CustomColor.white,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline,
      decorationColor: CustomColor.white,
      fontFamily: "SFCompact");

  static TextStyle get textStyleRegular => TextStyle(
      color: CustomColor.colorTextHint,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: "SFCompact");

  static TextStyle get textStyleSemiBold => TextStyle(
      color: CustomColor.white,
      fontSize: 13,
      fontWeight: FontWeight.w600,
      fontFamily: "SFCompact");

  static TextStyle get languageSelectionTextStyle => TextStyle(
    fontFamily: "SFCompact",
    fontWeight: FontWeight.w700,
    color: CustomColor.homeGrey,
  );
  static TextStyle get editProfileTitleStyleBold => TextStyle(
      color: CustomColor.primaryBlack,
      fontSize: 29,
      fontWeight: FontWeight.w500,
      fontFamily: "SFCompact");
  static TextStyle get appbarTitleStyleBold => TextStyle(
      color: CustomColor.primaryBlack,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      fontFamily: "SFCompact");
  static TextStyle get editProfileSubtitleTitleStyleSemiBold => TextStyle(
      color: CustomColor.primaryBlack,
      fontSize: 17,
      fontWeight: FontWeight.w500,
      fontFamily: "SFCompact");
  static TextStyle get editProfileUnderlinedTitleStyleSemiBold => TextStyle(
      color: CustomColor.secondaryBlue,
      fontSize: 17,
      fontWeight: FontWeight.w800,
      decorationColor: CustomColor.secondaryBlue,
      decoration: TextDecoration.underline,
      fontFamily: "SFCompact");
  static TextStyle get textFieldTextStyleSemiBold => TextStyle(
  letterSpacing: 0,
  color: CustomColor.primaryBlue,
  fontSize: 14,
  fontWeight: FontWeight.w300);
  static TextStyle get tabSelectedStyleSemiBold => TextStyle(
      color: CustomColor.primaryBlue,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: "SFCompact");
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
      fontFamily: "SFCompact");
  static TextStyle get drawerTitleBold => TextStyle(
      color: CustomColor.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: "SFCompact");
  static TextStyle get drawerSubTitleBold => TextStyle(
      color: CustomColor.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: "SFCompact");
  static TextStyle get textFieldTitleRegular => TextStyle(
      color: CustomColor.colorTextHint,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: "SFCompact");
  static TextStyle get walletSubTitleWhiteRegular => TextStyle(
      color: CustomColor.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: "SFCompact");
  static TextStyle get appbarSmallTitleStyleBold => TextStyle(
  color: CustomColor.homeGrey,
  fontSize: 13,
  fontWeight: FontWeight.w400,
      fontFamily: "SFCompact");
  static TextStyle get redHeartTextStyleStyleBold => TextStyle(
      color: CustomColor.white,
      fontSize: 48,
      fontWeight: FontWeight.w400,
      fontFamily: "SFCompact");
  static TextStyle get walletBalanceTopUpCardTopTextStyleStyleBold => TextStyle(
      color: CustomColor.white,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: "SFCompact");

}
