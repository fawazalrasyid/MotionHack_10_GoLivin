import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';

Container friendCard(String menu, String icon) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            Container(
              height: 44,
              width: 44,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.silverCity,
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.all(
                //   Radius.circular(12),
                // ),
              ),
              // child: SvgPicture.asset(
              //   icon,
              //   color: AppColors.icon,
              // ),
            ),
            SizedBox(width: 16),
            Text(
              menu,
              style: FontFamily.medium.copyWith(
                color: AppColors.text,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        Icon(
          Icons.radio_button_off,
          color: AppColors.icon,
        )
      ],
    ),
  );
}
