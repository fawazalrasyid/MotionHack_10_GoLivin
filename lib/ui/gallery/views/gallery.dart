import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../constants/icons.dart';
import '../../../widgets/photo_view/gallery_photo_viewer.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildNavigation(context),
              SizedBox(height: 16),
              buildTextSection("Building Photos"),
              SizedBox(height: 16),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GalleryPhotoViewer(
                              image: widget.image,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(widget.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),
              buildTextSection("Facility Photos"),
              SizedBox(height: 16),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GalleryPhotoViewer(
                              image: widget.image,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(widget.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),
              buildTextSection("Bedroom Photos"),
              SizedBox(height: 16),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GalleryPhotoViewer(
                              image: widget.image,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(widget.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildNavigation(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(
              AppIcons.arrow_left_outline,
              color: AppColors.icon,
            ),
          ),
        ],
      ),
    );
  }

  Container buildTextSection(String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        title,
        style: FontFamily.semiBold.copyWith(
          color: AppColors.text,
          fontSize: 16,
        ),
      ),
    );
  }
}
