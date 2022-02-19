import 'package:golivin/constants/icons.dart';
import 'package:golivin/models/building.dart';
import 'package:golivin/ui/building/views/list_building.dart';
import 'package:golivin/ui/detail/views/detail.dart';
import 'package:golivin/ui/home/components/recommendation_card.dart';
import 'package:golivin/ui/home/components/nearby_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../controllers/auth/auth_controller.dart';
import '../../../controllers/auth/user_controller.dart';
import '../../../controllers/building/nearby_controller.dart';
import '../../../controllers/building/recommendation_controller.dart';
import '../../../models/user.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authC = AuthController();
  final userC = UserController();
  final nearbyC = NearbyController();
  final recommendationC = RecommendationController();
  final homeC = HomeController();

  UserM? user;
  List<Building?> nearbyBuilding = List<Building>.empty(growable: true);
  List<Building?> recommendationBuilding = List<Building>.empty(growable: true);

  @override
  void initState() {
    getCurrentUserData();
    getNearbyBuildingData();
    getRocommendationBuildingData();
    super.initState();
  }

  void getCurrentUserData() async {
    final res = await userC.getCurrentUser();
    setState(() {
      user = res;
    });
  }

  void getNearbyBuildingData() async {
    final res = await nearbyC.getNearbyBuilding();
    setState(() {
      nearbyBuilding = res;
    });
  }

  void getRocommendationBuildingData() async {
    final res = await recommendationC.getRecommendationBuilding();
    setState(() {
      recommendationBuilding = res;
    });
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
              buildNearbyList(),
              SizedBox(height: 24),
              buildTextSection("Recommendation"),
              SizedBox(height: 16),
              buildRecommendationList(),
            ],
          ),
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
          fontSize: 18,
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
            "Hello, ${user?.displayName ?? ""}!",
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

  Container buildSearchField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        controller: homeC.searchC,
        onChanged: (string) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListBuildingScreen(keyword: string),
            ),
          );

          homeC.searchC.clear();
          FocusScope.of(context).requestFocus(FocusNode());
        },
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
                backgroundColor: AppColors.silverCity,
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
                backgroundColor: AppColors.silverCity,
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
                backgroundColor: AppColors.silverCity,
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

  Container buildNearbyList() {
    return Container(
      height: 150,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: nearbyBuilding.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    buildingData: nearbyBuilding[index],
                  ),
                ),
              );
            },
            child: Container(
              margin: index == 0
                  ? EdgeInsets.only(left: 24)
                  : index == nearbyBuilding.length - 1
                      ? EdgeInsets.only(left: 24, right: 24)
                      : EdgeInsets.only(left: 24),
              child: nearbyCard(
                "${nearbyBuilding[index]?.buildingName}",
                "${nearbyBuilding[index]?.city}",
                "IDR ${nearbyBuilding[index]?.price}",
                "${nearbyBuilding[index]?.rating}",
                "${nearbyBuilding[index]?.imgThumbnail}",
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildRecommendationList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: recommendationBuilding.length,
        itemBuilder: (context, index) {
          return InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    buildingData: recommendationBuilding[index],
                  ),
                ),
              );
            },
            child: recommendationCard(
              "${recommendationBuilding[index]?.buildingName}",
              "${recommendationBuilding[index]?.city}",
              "IDR ${recommendationBuilding[index]?.price}",
              "${recommendationBuilding[index]?.rating}",
              "${recommendationBuilding[index]?.imgThumbnail}",
            ),
          );
        },
      ),
    );
  }
}
