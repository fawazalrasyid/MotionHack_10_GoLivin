import 'package:app/controllers/auth/user_controller.dart';
import 'package:app/models/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../constants/icons.dart';
import '../../../controllers/auth/auth_controller.dart';
import '../components/menu_component.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final authC = AuthController();
  final userC = UserController();

  UserM? user;

  @override
  void initState() {
    getCurrentUserData();
    super.initState();
  }

  Future<void> getCurrentUserData() async {
    user = await userC.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeaderTitle(),
              SizedBox(height: 24),
              buildProfile(),
              SizedBox(height: 48),
              buildMenu(),
              SizedBox(height: 48),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(12),
                    backgroundColor: AppColors.button,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Logout",
                    style: FontFamily.semiBold.copyWith(
                      color: AppColors.textOnBg,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () => authC.signout(context),
                ),
              ),
              SizedBox(height: 48),
              Center(
                child: Container(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Text(
                    "0.0.1-beta",
                    textAlign: TextAlign.center,
                    style: FontFamily.regular.copyWith(
                      color: AppColors.text,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildMenu() {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          InkWell(
            child: menuComponent(
              "Privacy & Setting",
              AppIcons.location_outline,
            ),
            onTap: () {},
          ),
          InkWell(
            child: menuComponent(
              "Privacy & Setting",
              AppIcons.location_outline,
            ),
            onTap: () {},
          ),
          InkWell(
            child: menuComponent(
              "Privacy & Setting",
              AppIcons.location_outline,
            ),
            onTap: () {},
          ),
          InkWell(
            child: menuComponent(
              "Go Points",
              AppIcons.star,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Container buildProfile() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CachedNetworkImage(
              height: 130,
              width: 130,
              imageUrl:
                  "https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            "${user?.displayName}",
            style: FontFamily.semiBold.copyWith(
              color: AppColors.text,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Container buildHeaderTitle() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        "Profile",
        style: FontFamily.bold.copyWith(
          color: AppColors.text,
          fontSize: 24,
        ),
      ),
    );
  }
}
