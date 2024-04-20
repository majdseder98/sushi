import 'package:flutter/material.dart';

extension MediaQueryValue on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
  double get topPadding => MediaQuery.viewPaddingOf(this).top;
  double get bottomPadding => MediaQuery.viewPaddingOf(this).bottom;
  double get radius => width * 0.033;
  double get toolBarHeight => 50 / height * height;
  double get statusHeight => 1 / height * height;
  EdgeInsets get margin =>
      EdgeInsets.symmetric(horizontal: paddingSW, vertical: paddingL);
  double get paddingS => height * 0.0093;
  double get paddingL => height * 0.037;
  double get paddingM => height * 0.0187;
  double get paddingSW => height * 0.02;
  double get paddingLW => height * 0.0814;
  double get paddingMW => height * 0.040;
  EdgeInsets get padding =>
      EdgeInsets.symmetric(horizontal: paddingSW, vertical: paddingM);
       EdgeInsets get paddingSmall =>
      EdgeInsets.symmetric(horizontal: paddingSW, vertical: paddingS);
}

