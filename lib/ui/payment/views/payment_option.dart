import 'package:app/ui/payment/views/payment_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../constants/icons.dart';
import '../components/friend_card.dart';
import '../components/payment_option_card.dart';

class PaymentOptionScreen extends StatefulWidget {
  @override
  _PaymentOptionScreenState createState() => _PaymentOptionScreenState();
}

class _PaymentOptionScreenState extends State<PaymentOptionScreen> {
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
                        alignment: Alignment.center,
                        child: Text(
                          "Please select\npayment method",
                          textAlign: TextAlign.center,
                          style: FontFamily.bold.copyWith(
                            color: AppColors.text,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      buildTextSection("Bank Transfer"),
                      SizedBox(height: 8),
                      Container(
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: paymentOptionComponent(
                                "Bank BCA",
                                AppIcons.bank_bca,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: paymentOptionComponent(
                                "Bank MANDIRI",
                                AppIcons.bank_mandiri,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: paymentOptionComponent(
                                "Bank BNI",
                                AppIcons.bank_bni,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: paymentOptionComponent(
                                "Bank BRI",
                                AppIcons.bank_bri,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      buildTextSection("Credit Card"),
                      SizedBox(height: 8),
                      Container(
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: paymentOptionComponent(
                                "Credit Card",
                                AppIcons.visa,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      buildTextSection("Sharing Payments"),
                      SizedBox(height: 8),
                      Container(
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () => showInviteFriendBottomSheet(context),
                              child: paymentOptionComponent(
                                "Invite Friend",
                                AppIcons.sharing,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 100),
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
                              "Confirm Payment",
                              style: FontFamily.semiBold.copyWith(
                                color: AppColors.textOnBg,
                                fontSize: 18,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentSuccessScreen(),
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

  void showInviteFriendBottomSheet(BuildContext context) {
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
              padding: EdgeInsets.fromLTRB(24, 12, 24, 24),
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
                    "Invite friend",
                    style: FontFamily.bold.copyWith(
                      color: AppColors.text,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 24),
                  buildSearchField(),
                  SizedBox(height: 24),
                  Column(
                    children: [
                      friendCard("John Doe", ""),
                      friendCard("Oliver", ""),
                      friendCard("Harry", ""),
                      friendCard("Mark", ""),
                    ],
                  ),
                  SizedBox(height: 24),
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
                          "Invite",
                          style: FontFamily.semiBold.copyWith(
                            color: AppColors.textOnBg,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
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

  Container buildSearchField() {
    return Container(
      child: TextField(
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.all(14),
          hintText: "Search friend",
          hintStyle: FontFamily.regular.copyWith(
            color: AppColors.hintText,
            fontSize: 16,
          ),
          hoverColor: AppColors.formOutline,
          fillColor: AppColors.formOutlineActive,
        ),
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
