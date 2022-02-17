import 'package:app/constants/icons.dart';
import 'package:app/ui/home/components/nearby_card.dart';
import 'package:app/ui/home/components/popular_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../controllers/auth/auth_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // User? user = userCredential.user;

  final authC = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildProfile(),
              SizedBox(height: 24),
              buildHeader(),
              SizedBox(height: 24),
              buildSearchField(),
              SizedBox(height: 24),
              buildOption(),
              SizedBox(height: 24),
              buildTextSection("Nearby"),
              SizedBox(height: 16),
              buildRecommendationList(),
              SizedBox(height: 24),
              buildTextSection("Recommendation"),
              SizedBox(height: 16),
              buildNearbyList()
            ],
          ),
        ),
      ),
    );
  }

  Container buildSearchField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.all(14),
          hintText: "Search destination",
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

  Container buildRecommendationList() {
    return Container(
      height: 150,
      child: ListView(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          popularCard(
            "Kost Mantap",
            "Bandung",
            "IDR 299.000.month",
            "4.9",
            "https://images.unsplash.com/photo-1570586254197-d58a4a0fa274?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80",
          ),
          popularCard(
            "Kost Keren",
            "Jakarta",
            "IDR 299.000/monts",
            "4.7",
            "https://images.unsplash.com/photo-1506126279646-a697353d3166?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
          ),
          popularCard(
            "Kost Keren",
            "Jakarta",
            "IDR 299.000/monts",
            "4.9",
            "https://images.unsplash.com/photo-1506126279646-a697353d3166?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
          )
        ],
      ),
    );
  }

  Container buildNearbyList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: ListView(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          nearbyCard(
            "Kost Mantap",
            "Bandung",
            "IDR 299.000",
            "4.8",
            "https://images.unsplash.com/photo-1570586254197-d58a4a0fa274?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80",
          ),
          nearbyCard(
            "Kost Keren",
            "Jakarta",
            "IDR 299.000",
            "4.8",
            "https://images.unsplash.com/photo-1506126279646-a697353d3166?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
          ),
          nearbyCard(
            "Kost Mantul",
            "Jakarta",
            "IDR 299.000",
            "4.9",
            "https://images.unsplash.com/photo-1506126279646-a697353d3166?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
          )
        ],
      ),
    );
  }

  Container buildOption() {
    return Container(
      child: Row(
        children: [
          SizedBox(width: 24),
          Container(
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Appartement",
                style: FontFamily.regular.copyWith(
                  color: AppColors.text,
                  fontSize: 12,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: AppColors.grey,
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
              ),
              // color: AppColors.grey,
            ),
          ),
          SizedBox(width: 8),
          Container(
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Kost",
                style: FontFamily.regular.copyWith(
                  color: AppColors.text,
                  fontSize: 12,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: AppColors.grey,
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
              ),
              // color: AppColors.grey,
            ),
          ),
          SizedBox(width: 8),
          Container(
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Kontrakan",
                style: FontFamily.regular.copyWith(
                  color: AppColors.text,
                  fontSize: 12,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: AppColors.grey,
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
              ),
              // color: AppColors.grey,
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
          fontSize: 18,
        ),
      ),
    );
  }

  Container buildHeader() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        "Where do you want\nto go?",
        style: FontFamily.bold.copyWith(
          color: AppColors.text,
          fontSize: 24,
        ),
      ),
    );
  }

  Container buildProfile() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hello, Faww!",
            style: FontFamily.medium.copyWith(
              color: AppColors.greyText,
              fontSize: 18,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppIcons.notifiaction,
              color: AppColors.iconGrey,
            ),
          )
        ],
      ),
    );
  }
}
