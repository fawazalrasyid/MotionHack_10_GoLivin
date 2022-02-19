import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:panorama/panorama.dart';

import '../../constants/assets.dart';
import '../../constants/colors.dart';
import '../../constants/icons.dart';

class PanoramaViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Panorama(
              child: Image.asset(Assets.panorama),
            ),
          ),
          SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: SvgPicture.asset(
                      AppIcons.arrow_left_outline,
                      color: AppColors.iconWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
