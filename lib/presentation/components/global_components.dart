import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fydaa_assignment/core/constants.dart';

SizedBox fHorizontalSpace({double space = 12}) => SizedBox(width: space);
SizedBox fVerticalSpace({double space = 12}) => SizedBox(height: space);

Scaffold fScaffold(
        {required BuildContext context,
        required Widget child,
        bool enableBack = true}) =>
    Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: enableBack ? () => Navigator.pop(context) : null,
          icon: SvgPicture.string(backArrowSVG),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(fPadding),
        child: child,
      ),
    );
