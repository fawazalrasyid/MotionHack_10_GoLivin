import 'package:app/constants/assets.dart';
import 'package:app/ui/gallery/views/gallery.dart';
import 'package:app/ui/payment/views/confirm_booking.dart';
import 'package:app/widgets/photo_view/panorama_viewer.dart';
import 'package:app/widgets/photo_view/photo_viewer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../constants/icons.dart';
import '../../../models/building.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
    required this.buildingData,
  }) : super(key: key);

  final Building? buildingData;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _inWishlist = false;

  void toggleWishlist() {
    setState(() {
      _inWishlist = !_inWishlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeaderPhoto(context),
                    SizedBox(height: 24),
                    buildBuildingInfo(),
                    SizedBox(height: 24),
                    buildTextSection("Description"),
                    SizedBox(height: 8),
                    buildDescription(),
                    SizedBox(height: 24),
                    buildImageList(context),
                    SizedBox(height: 24),
                    buildTextSection("Facilities"),
                    SizedBox(height: 8),
                    buildFacilities(),
                    SizedBox(height: 24),
                    buildTextSection("Locations"),
                    SizedBox(height: 8),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          image: DecorationImage(
                            image: AssetImage(Assets.map),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
              color: AppColors.bottomNavBgColor,
              child: SafeArea(
                top: false,
                child: Row(
                  children: [
                    Container(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          backgroundColor: AppColors.silverCity,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Image.asset(
                          AppIcons.virtual_tour,
                          color: AppColors.icon,
                          height: 24,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PanoramaViewer(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        child: Builder(
                          builder: (context) => TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.all(12),
                              backgroundColor: AppColors.button,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Book",
                              style: FontFamily.semiBold.copyWith(
                                color: AppColors.textOnBg,
                                fontSize: 18,
                              ),
                            ),
                            onPressed: () => showBottomSheet(context),
                          ),
                        ),
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

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            // color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
              decoration: BoxDecoration(
                color: AppColors.bottomNavBgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 8,
                      width: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.silverCity,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Great! Let’s pick a date",
                    style: FontFamily.bold.copyWith(
                      color: AppColors.text,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 24),
                  SfDateRangePicker(
                    view: DateRangePickerView.month,
                    headerHeight: 48,
                    headerStyle: DateRangePickerHeaderStyle(
                      textStyle: FontFamily.semiBold.copyWith(
                        color: AppColors.text,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Builder(
                      builder: (context) => TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          backgroundColor: AppColors.button,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Continue",
                          style: FontFamily.semiBold.copyWith(
                            color: AppColors.textOnBg,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConfirmBookingScreen(
                                buildingData: widget.buildingData,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container buildFacilities() {
    return Container(
      height: 50,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            width: 60,
            margin: index == 0
                ? EdgeInsets.only(left: 24)
                : index == 5
                    ? EdgeInsets.only(left: 16, right: 24)
                    : EdgeInsets.only(left: 16),
            child: Column(
              children: [
                SvgPicture.asset(
                  AppIcons.document_outline,
                  color: AppColors.icon,
                ),
                SizedBox(height: 8),
                Text(
                  "Facility $index",
                  style: FontFamily.regular.copyWith(
                    color: AppColors.text,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Container buildDescription() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        widget.buildingData!.buildingDesc,
        style: FontFamily.regular.copyWith(
          color: AppColors.text,
          fontSize: 14,
        ),
      ),
    );
  }

  Container buildImageList(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.width - 48) / 5,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhotoViewer(
                        image: widget.buildingData!.imgThumbnail,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(right: 16),
                  child: CachedNetworkImage(
                    height: (MediaQuery.of(context).size.width - 48) / 5,
                    width: (MediaQuery.of(context).size.width - 48) / 5,
                    imageUrl: widget.buildingData!.imgThumbnail,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Container(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GalleryScreen(
                      image: widget.buildingData!.imgThumbnail,
                    ),
                  ),
                );
              },
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    child: CachedNetworkImage(
                      height: (MediaQuery.of(context).size.width - 48) / 5,
                      width: (MediaQuery.of(context).size.width - 48) / 5,
                      imageUrl: widget.buildingData!.imgThumbnail,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.width - 48) / 5,
                    width: (MediaQuery.of(context).size.width - 48) / 5,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: Text(
                        "5+",
                        style: FontFamily.medium.copyWith(
                          color: AppColors.textOnBg,
                          fontSize: 16,
                        ),
                      ),
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

  Container buildBuildingInfo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.buildingData!.buildingName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: FontFamily.semiBold.copyWith(
                    color: AppColors.text,
                    fontSize: 22,
                  ),
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.star,
                    height: 16,
                    color: AppColors.iconYellow,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "${widget.buildingData!.rating}",
                    style: FontFamily.medium.copyWith(
                      fontSize: 14,
                      color: AppColors.text,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.location,
                height: 16,
                color: AppColors.iconGrey,
              ),
              SizedBox(width: 4),
              Text(
                widget.buildingData!.city,
                style: FontFamily.regular.copyWith(
                  color: AppColors.greyText,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            "IDR ${widget.buildingData!.price}/month",
            style: FontFamily.medium.copyWith(
              color: AppColors.blueText,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Stack buildHeaderPhoto(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          height: 300,
          width: MediaQuery.of(context).size.width,
          imageUrl: widget.buildingData!.imgThumbnail,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
              colors: [
                Colors.grey.withOpacity(0.0),
                Colors.black.withOpacity(0.8),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              buildNavigation(context),
            ],
          ),
        ),
      ],
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
              color: AppColors.iconWhite,
            ),
          ),
          IconButton(
            onPressed: () => toggleWishlist(),
            icon: SvgPicture.asset(
              _inWishlist ? AppIcons.bookmark : AppIcons.bookmark_outline,
              color: _inWishlist ? AppColors.iconActive : AppColors.iconWhite,
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
