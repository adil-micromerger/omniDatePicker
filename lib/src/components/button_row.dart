import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key, required this.onSavePressed});

  final void Function() onSavePressed;

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 5,
          child: Padding(padding: EdgeInsets.only(left: 20),
            child: BButton(
              backgroundColor: Colors.white,
              borderColor: Color(0xffE5E8EB) ,
              borderRadius: 4,
              onTap: () {
                Navigator.pop<DateTime>(
                  context,
                  DateTime.now(),
                );
              },
              child: Text('Now', style: TextStyle(
                  color: Color(0xff2E528D),
                  fontWeight: FontWeight.w700,
                  fontSize: 16
              ),),
            ),),
        ),
        SizedBox(width: 15,),
        Expanded(
            flex: 7,
            child: Padding(padding: EdgeInsets.only(right: 20),
              child: CButton(
                onTap: onSavePressed,
                buttonColor: Color(0xff2E528D),
                child: Text('Save', style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16)),
              ),)
        ),
      ],
    );
  }
}

class CButton extends StatelessWidget {
  Widget child;
  Function? onTap;
  double? verticalPadding;
  double? horizontalPadding;
  Color? buttonColor;
  bool? isLoading;
  Color? textColor;
  String? iconPath;
  bool? isIconButton = false;
  CButton({
    super.key,
    this.isLoading,
    required this.child,
    required this.onTap,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonColor,
    this.textColor,
    this.iconPath,
    this.isIconButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (onTap == null) {
              } else {
                onTap!();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor!,
              shadowColor: Colors.transparent,
              elevation: 0.0,
              splashFactory: NoSplash.splashFactory,
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding ?? 17,
                  vertical: verticalPadding ?? 16),
              textStyle: TextStyle(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child,
              ],
            ),
          ),
        ),
      ],
    );
  }
}



class BButton extends StatelessWidget {
  Widget child;
  Function? onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  double? verticalPadding;
  double? horizontalPadding;

  BButton({
    super.key,
    required this.child,
    required this.onTap,
    this.backgroundColor,
    this.borderColor = Colors.white,
    this.borderRadius = 0,
    this.horizontalPadding,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 17, vertical: verticalPadding ?? 14),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: borderColor!,
              ),
              borderRadius: BorderRadius.circular(
                borderRadius!,
              )),
          backgroundColor: backgroundColor,
          surfaceTintColor: Colors.transparent),
      onPressed: () {
        if (onTap == null) {
        } else {
          onTap!();
        }
      },
      child: child,
    );
  }
}

