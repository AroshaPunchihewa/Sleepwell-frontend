import 'package:flutter/material.dart';
import 'package:sleepwellfrontend/widget/tapEfect.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final String? buttonText;
  final Widget? buttonTextWidget;
  final Color? textColor, backgroundColor;
  final bool? isClickable;
  final double radius;
  final double buttonWidth;
  final double buttonHight;
  final IconData icone;
  //final icon icondeta;
  const CommonButton({
    Key? key,
    this.onTap,
    this.buttonText,
    this.buttonTextWidget,
    this.textColor = Colors.white,
    this.backgroundColor,
    this.padding,
    this.isClickable = true,
    this.radius = 24,
    this.buttonWidth= 300,
    this.buttonHight=48,
    required this.icone,
    //this.icondeta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(),
      child: TapEffect(
        isClickable: isClickable!,
        onClick: onTap ?? () {},
        child: SizedBox(
          height: buttonHight,
          width: buttonWidth,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            color: backgroundColor ?? Theme.of(context).primaryColor,
            shadowColor: Colors.black12.withOpacity(
              Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.2,
            ),
            child: Center(
               child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icone,color: Colors.white,),
                        
                        //Icon(Icon.icondeta),

                        SizedBox(width: 10,),
              
              //child: buttonTextWidget ??
                  Text(
                    buttonText ?? "",
                    style: TextStyle(
                          color: textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                      ]
               )
            ),
          ),
        ),
      ),
    );
  }
}
