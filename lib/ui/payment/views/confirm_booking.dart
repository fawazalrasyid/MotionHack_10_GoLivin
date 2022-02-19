import 'package:app/ui/payment/views/payment_option.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../constants/icons.dart';
import '../../../controllers/auth/user_controller.dart';
import '../../../models/building.dart';
import '../../../models/user.dart';

class ConfirmBookingScreen extends StatefulWidget {
  const ConfirmBookingScreen({
    Key? key,
    required this.buildingData,
  }) : super(key: key);

  final Building? buildingData;

  @override
  _ConfirmBookingScreenState createState() => _ConfirmBookingScreenState();
}

class _ConfirmBookingScreenState extends State<ConfirmBookingScreen> {
  final userC = UserController();

  UserM? user;

  @override
  void initState() {
    getCurrentUserData();
    super.initState();
  }

  void getCurrentUserData() async {
    final res = await userC.getCurrentUser();
    setState(() {
      user = res;
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
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildNavigation(context),
                      SizedBox(height: 16),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          "Booking Info",
                          style: FontFamily.bold.copyWith(
                            color: AppColors.text,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      boookingInfoCard(
                        widget.buildingData!.buildingName,
                        widget.buildingData!.city,
                        widget.buildingData!.imgThumbnail,
                      ),
                      SizedBox(height: 24),
                      buildBookingDateInfo(),
                      SizedBox(height: 24),
                      buildTextSection("Contact Details"),
                      SizedBox(height: 8),
                      buildContactDetail(),
                      SizedBox(height: 24),
                      buildTextSection("Price Details"),
                      SizedBox(height: 8),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${widget.buildingData!.buildingName} Regular Room",
                                      style: FontFamily.regular.copyWith(
                                        color: AppColors.text,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "x1 month ",
                                      style: FontFamily.regular.copyWith(
                                        color: AppColors.greyText,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "IDR ${widget.buildingData!.price}",
                                  style: FontFamily.regular.copyWith(
                                    color: AppColors.text,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Extra Bed",
                                      style: FontFamily.regular.copyWith(
                                        color: AppColors.text,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "x1 pcs",
                                      style: FontFamily.regular.copyWith(
                                        color: AppColors.greyText,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "IDR 100000",
                                  style: FontFamily.regular.copyWith(
                                    color: AppColors.text,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Price",
                                  style: FontFamily.regular.copyWith(
                                    color: AppColors.text,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "IDR ${widget.buildingData!.price + 100000}",
                                  style: FontFamily.regular.copyWith(
                                    color: AppColors.text,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                              "Go to Payment",
                              style: FontFamily.semiBold.copyWith(
                                color: AppColors.textOnBg,
                                fontSize: 18,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentOptionScreen(),
                                ),
                              );
                            },
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

  Container buildContactDetail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${user?.displayName}",
            style: FontFamily.regular.copyWith(
              color: AppColors.text,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "${user?.email}",
            style: FontFamily.regular.copyWith(
              color: AppColors.text,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "${user?.phoneNumber}",
            style: FontFamily.regular.copyWith(
              color: AppColors.text,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Container buildBookingDateInfo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Start",
                  style: FontFamily.medium.copyWith(
                    color: AppColors.text,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "20 Feb 2022",
                  style: FontFamily.regular.copyWith(
                    color: AppColors.text,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "End",
                  style: FontFamily.medium.copyWith(
                    color: AppColors.text,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "20 Mar 2022",
                  style: FontFamily.regular.copyWith(
                    color: AppColors.text,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
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

  Container boookingInfoCard(
    String name,
    String location,
    String image,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      height: 100,
      child: Row(
        children: [
          CachedNetworkImage(
            height: 95,
            width: 85,
            imageUrl: image,
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
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16, top: 4, bottom: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: FontFamily.medium.copyWith(
                            fontSize: 16,
                            color: AppColors.text,
                          ),
                        ),
                        Text(
                          location,
                          style: FontFamily.regular.copyWith(
                            fontSize: 14,
                            color: AppColors.greyText,
                          ),
                        ),
                      ],
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
