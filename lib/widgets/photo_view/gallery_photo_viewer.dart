import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';

class GalleryPhotoViewer extends StatelessWidget {
  const GalleryPhotoViewer({
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
              child: PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: CachedNetworkImageProvider(image),
                    heroAttributes: PhotoViewHeroAttributes(tag: "$index"),
                  );
                },
                itemCount: 10,
                // backgroundDecoration: BoxDecoration(color: Colors.white),
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
