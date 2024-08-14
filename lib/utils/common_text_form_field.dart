import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../device_manager/screen_constants.dart';
import '../utils/TextStyles.dart';
import '../utils/colors/app_colors.dart';
import 'image_utils/image_utils.dart';

enum Type {
  textFieldWithOutSuffix,
  textFieldWithSuffix,
  searchField,
  emailFieldWithOutPrefixAndSuffix,
  stageName,
  description,
}

class DefaultEditText extends StatefulWidget {
  final Type type;
  final String hintText;
  final bool? obscureText;
  final bool autofocus;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextStyle? style;
  final TextAlign? textAlign;
  final IconData? iconData;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? suffix;
  final String? errorText;
  final TextEditingController? controller;
  final caption;
  final FocusNode? myFocusNode;
  final prefixText;
  final mobileNumber;
  final readWriteStatus;
  final onTap;
  final labelText;
  final autoValidate;
  final autoSubmit;
  final verified;
  final suggestions;
  final autoKey;
  final isPast;
  late final initialValue;
  final double? boxHeight;
  final double? boxWidth;
  final bool? isReadOnly;
  final bool? showDecoration;
  final bool? suffixEnabled;
  final bool? prefixEnabled;
  final bool? showDecorationForCall;
  final validationFunction;
  bool onSubmit;
  bool? showCountryFlag;

  DefaultEditText(
      {super.key,
      this.obscureText = false,
      this.validationFunction,
      this.showCountryFlag,
      this.onSubmit = false,
      this.errorText,
      this.suffix,
      this.suffixIcon,
      this.prefixIcon,
      this.iconData,
      this.textAlign,
      this.style,
      this.hintText = '',
      this.autofocus = false,
      this.keyboardType = TextInputType.text,
      this.onSaved,
      this.onChanged,
      this.validator,
      this.readOnly = false,
      required this.type,
      this.controller,
      this.caption,
      this.myFocusNode,
      this.prefixText,
      this.mobileNumber,
      this.readWriteStatus,
      this.onTap,
      this.labelText,
      this.autoValidate,
      this.autoSubmit,
      this.verified,
      this.suggestions,
      this.autoKey,
      this.isPast,
      this.initialValue,
      this.boxHeight,
      this.boxWidth,
      this.isReadOnly = false,
      this.showDecoration = false,
      this.suffixEnabled = false,
      this.prefixEnabled = false,
      this.showDecorationForCall = false});

  @override
  _DefaultEditTextState createState() => _DefaultEditTextState();
}

class _DefaultEditTextState extends State<DefaultEditText> {
  late TextEditingController _controller;
  late Type type;

  var _value;

  bool _errorFree = true;

  bool validate = false;

  get errorFree => _errorFree;

  Type get _type => widget.type;
  var searchTextField;

  TextEditingController get _thisController =>
      widget.controller ?? TextEditingController();
  late GlobalKey<NavigatorState> navigatorKey;
  bool indicator = true;

  @override
  void initState() {
    super.initState();
    navigatorKey = GlobalKey<NavigatorState>();
  }

  void _handleControllerChanged() {
    if (_thisController.text != _value || _value.trim().isNotEmpty)
      didChange(_thisController.text);
  }

  void didChange(var value) {
    setState(() {
      _value = value;
    });
  }

  @override
  void didUpdateWidget(DefaultEditText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller!.removeListener(_handleControllerChanged);
      widget.controller!.addListener(_handleControllerChanged);

      if (widget.controller == null) {
        _controller =
            TextEditingController.fromValue(oldWidget.controller!.value);
      }
      _thisController.text = widget.controller!.text;
      if (oldWidget.controller == null) _controller;
    }
  }

  @override
  void dispose() {
    // widget.controller!.removeListener(_handleControllerChanged);
    super.dispose();
  }

  Widget build(BuildContext _context) {
    switch (_type) {
      case Type.textFieldWithOutSuffix:
        {
          return TextFormField(
              onSaved: widget.onSaved,
              onChanged: widget.onChanged,
              //validator: widget.validationFunction ?? validatePassword,
              maxLines:
                  widget.keyboardType == TextInputType.multiline ? null : 1,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              readOnly: widget.readOnly!,
              keyboardType: widget.keyboardType ?? TextInputType.text,
              obscureText: indicator,
              obscuringCharacter: '●',
              controller: widget.controller,
              cursorColor: CustomColor.chatPaymentBackground,
              style: widget.style ?? Get.textTheme.bodyMedium,
              textAlign: widget.textAlign ?? TextAlign.start,
              decoration: InputDecoration(
                fillColor: CustomColor.primaryOffWhiteColor,
                filled: true,
                hintText: widget.hintText ?? '',
                hintStyle: TextStyles.hintTextStyle,
                prefixIcon: widget.prefixIcon,
                prefixIconConstraints: widget.iconData != null
                    ? BoxConstraints.expand(
                        width: ScreenConstant.defaultWidthTwenty,
                        height: ScreenConstant.defaultWidthTwenty)
                    : BoxConstraints.expand(
                        width: ScreenConstant.defaultWidthTwenty, height: 0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: EdgeInsets.symmetric(
                    vertical: ScreenConstant.defaultHeightTwentyThree),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: CustomColor.homeGrey.withOpacity(0.6),
                      width: 2,
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: CustomColor.homeGrey.withOpacity(0.4), width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: CustomColor.homeGrey.withOpacity(0.1), width: 2),
                ),
                suffixIcon: widget.suffixIcon,
                suffix: widget.suffix,
                counterText: widget.errorText,
              ));
        }
      case Type.description: {
        return TextFormField(
          onSaved: widget.onSaved,
          onChanged: widget.onChanged,
          initialValue: widget.initialValue,
          controller: widget.controller,
          //validator: passwordValidator,
          keyboardType: TextInputType.text,
          autofocus: false,
          maxLines: 4,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: Get.textTheme.bodySmall,
          decoration: InputDecoration(
            fillColor: Get.theme.canvasColor,
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: widget.labelText,
            hintText: widget.hintText ?? '',
            hintStyle: Get.textTheme.bodyMedium,
            prefixIcon: widget.prefixIcon,
            prefixIconConstraints: widget.iconData != null
                ? BoxConstraints.expand(
                width: ScreenConstant.defaultWidthTwenty,
                height: ScreenConstant.defaultWidthTwenty)
                : BoxConstraints.expand(
                width: ScreenConstant.defaultWidthTwenty, height: 0),
            labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Get.theme.colorScheme.onSurface,
                fontFamily: 'NunitoSans'),
            contentPadding: EdgeInsets.symmetric(
                vertical: ScreenConstant.defaultHeightTwentyThree-5),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: CustomColor.primaryBlue.withOpacity(0.6),
                  width: 2,
                )),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: CustomColor.primaryBlue.withOpacity(0.4), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: CustomColor.primaryBlue, width: 2),
            ),
          ),
        );
      }
      case Type.textFieldWithSuffix:
        {
          return TextFormField(
            onSaved: widget.onSaved,
            onChanged: widget.onChanged,
            initialValue: widget.initialValue,
            //validator: passwordValidator,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: indicator,
            obscuringCharacter: '●',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Get.theme.colorScheme.onSurface,
                fontFamily: 'NunitoSans'),
            decoration: InputDecoration(
              fillColor: CustomColor.primaryOffWhiteColor,
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: widget.labelText,
              hintText: widget.hintText ?? '',
              hintStyle: TextStyles.hintTextStyle,
              prefixIcon: widget.prefixIcon,
              prefixIconConstraints: widget.iconData != null
                  ? BoxConstraints.expand(
                      width: ScreenConstant.defaultWidthTwenty,
                      height: ScreenConstant.defaultWidthTwenty)
                  : BoxConstraints.expand(
                      width: ScreenConstant.defaultWidthTwenty, height: 0),
              suffixIcon: IconButton(
                icon: indicator
                    ? Image.asset(
                        ImageUtils.passwordIcon,
                        width: 20,
                      )
                    : Image.asset(
                        ImageUtils.passwordVisible,
                        width: 20,
                      ),
                onPressed: toggle,
              ),
              labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Get.theme.colorScheme.onSurface,
                  fontFamily: 'NunitoSans'),
              contentPadding: EdgeInsets.symmetric(
                  vertical: ScreenConstant.defaultHeightTwentyThree),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: CustomColor.homeGrey.withOpacity(0.6),
                    width: 2,
                  )),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: CustomColor.homeGrey.withOpacity(0.4), width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: CustomColor.homeGrey.withOpacity(0.1), width: 2),
              ),
            ),
          );
        }
      case Type.searchField:
        {
          return TextFormField(
            onSaved: widget.onSaved,
            onChanged: widget.onChanged,
            initialValue: widget.initialValue,
            //validator: passwordValidator,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: indicator,
            obscuringCharacter: '●',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Get.theme.colorScheme.onSurface,
                fontFamily: 'NunitoSans'),
            decoration: InputDecoration(
              fillColor: CustomColor.white,
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: widget.labelText,
              hintText: widget.hintText ?? '',
              hintStyle: TextStyles.hintTextStyle,
              prefixIcon: widget.prefixIcon,
              prefixIconConstraints: widget.iconData != null
                  ? BoxConstraints.expand(
                  width: ScreenConstant.defaultWidthTwenty,
                  height: ScreenConstant.defaultWidthTwenty)
                  : BoxConstraints.expand(
                  width: ScreenConstant.defaultWidthTwenty, height: 0),
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: ScreenConstant.defaultHeightFifteen),
                child: Image.asset(ImageUtils.searchIcon,fit: BoxFit.contain,width: ScreenConstant.defaultWidthTen,),
              ),
              labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Get.theme.colorScheme.onSurface,
                  fontFamily: 'NunitoSans'),
              contentPadding: EdgeInsets.symmetric(
                  vertical: ScreenConstant.defaultHeightTen),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: CustomColor.homeGrey.withOpacity(0.6),
                    width: 2,
                  )),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: CustomColor.homeGrey.withOpacity(0.4), width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: CustomColor.white, width: 2),
              ),
            ),
          );
        }
      case Type.emailFieldWithOutPrefixAndSuffix:
        {
          return TextFormField(
            onSaved: widget.onSaved,
            onChanged: widget.onChanged,
            initialValue: widget.initialValue,
            //validator: passwordValidator,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: indicator,
            obscuringCharacter: '●',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Get.theme.colorScheme.onSurface,
                fontFamily: 'NunitoSans'),
            decoration: InputDecoration(
              fillColor: CustomColor.fillOffWhiteColor,
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: widget.labelText,
              hintText: widget.hintText ?? '',
              hintStyle: TextStyles.hintTextStyle.copyWith(color: CustomColor.secondaryBlack,fontSize: 16),
              prefixIcon: widget.prefixIcon,
              prefixIconConstraints: widget.iconData != null
                  ? BoxConstraints.expand(
                  width: ScreenConstant.defaultWidthTwenty,
                  height: ScreenConstant.defaultWidthTwenty)
                  : BoxConstraints.expand(
                  width: ScreenConstant.defaultWidthTwenty, height: 0),
              labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Get.theme.colorScheme.onSurface,
                  fontFamily: 'NunitoSans'),
              contentPadding: EdgeInsets.symmetric(
                  vertical: ScreenConstant.defaultHeightTwentyThree),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: CustomColor.homeGrey.withOpacity(0.6),
                    width: 2,
                  )),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: CustomColor.homeGrey.withOpacity(0.4), width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: CustomColor.white, width: 2),
              ),
            ),
          );
        }
      case Type.stageName:
        {
          return TextFormField(
            onSaved: widget.onSaved,
            onChanged: widget.onChanged,
            initialValue: widget.initialValue,
            controller: widget.controller,
            //validator: passwordValidator,
            keyboardType: widget.keyboardType,
            autofocus: false,
            maxLines: 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: Get.textTheme.bodySmall,
            decoration: InputDecoration(
              fillColor: Get.theme.canvasColor,
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: widget.labelText,
              hintText: widget.hintText ?? '',
              hintStyle: Get.textTheme.bodyMedium,
              prefixIcon: widget.prefixIcon,
              prefixIconConstraints: widget.iconData != null
                  ? BoxConstraints.expand(
                  width: ScreenConstant.defaultWidthTwenty,
                  height: ScreenConstant.defaultWidthTwenty)
                  : BoxConstraints.expand(
                  width: ScreenConstant.defaultWidthTwenty, height: 0),
              labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Get.theme.colorScheme.onSurface,
                  fontFamily: 'NunitoSans'),
              contentPadding: EdgeInsets.symmetric(
                  vertical: ScreenConstant.defaultHeightTwentyThree-5),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: CustomColor.primaryBlue.withOpacity(0.6),
                    width: 2,
                  )),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: CustomColor.primaryBlue.withOpacity(0.4), width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: CustomColor.primaryBlue, width: 2),
              ),
            ),
          );
        }
    }
  }

  void toggle() {
    setState(() {
      indicator = !indicator;
    });
  }

  String? get validatePassword {
    final value = widget.initialValue;
    String pattern =
        r"(^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&.*':;â‚¬#])[A-Za-z\d@$!%*?&.*':;â‚¬#]{8,}$)";
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      if (widget.onSubmit) {
        return "Password field can not be blank.";
      } else {
        return null;
      }
    }
    return null;
  }
}
