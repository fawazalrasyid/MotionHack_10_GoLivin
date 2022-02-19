import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';

class PhotoViewer extends StatelessWidget {
  const PhotoViewer({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: PhotoView(
                imageProvider: CachedNetworkImageProvider(image),
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
      ),
    );
  }
}
