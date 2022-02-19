import 'package:app/ui/building/controller/list_building_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../constants/icons.dart';
import '../../../controllers/building/search_controller.dart';
import '../../../models/building.dart';
import '../../detail/views/detail.dart';
import '../components/building_card.dart';

class ListBuildingScreen extends StatefulWidget {
  const ListBuildingScreen({
    Key? key,
    required this.keyword,
  }) : super(key: key);

  final String keyword;

  @override
  _ListBuildingScreenState createState() => _ListBuildingScreenState();
}

class _ListBuildingScreenState extends State<ListBuildingScreen> {
  final listBuildingC = ListBuildingController();
  final searchC = SearchController();

  List<Building?> building = List<Building>.empty(growable: true);
  List<Building?> filteredBuilding = List<Building>.empty(growable: true);

  @override
  void initState() {
    listBuildingC.serachC.text = widget.keyword;
    getRocommendationBuildingData();
    super.initState();
  }

  void getRocommendationBuildingData() async {
    final res = await searchC.getBuilding();
    setState(() {
      building = res;
      filteredBuilding = building;
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
              buildNavigation(context),
              SizedBox(height: 16),
              buildSearchField(),
              SizedBox(height: 24),
              buildBuildingList()
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

  Container buildSearchField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        autofocus: true,
        controller: listBuildingC.serachC,
        onChanged: (string) {
          setState(() {
            filteredBuilding = building
                .where(
                  (b) => (b!.city.toLowerCase().contains(string.toLowerCase())),
                )
                .toList();
          });
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

  Container buildBuildingList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: filteredBuilding.length,
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
                    buildingData: filteredBuilding[index],
                  ),
                ),
              );
            },
            child: buildingCard(
              "${filteredBuilding[index]?.buildingName}",
              "${filteredBuilding[index]?.city}",
              "IDR ${filteredBuilding[index]?.price}",
              "${filteredBuilding[index]?.rating}",
              "${filteredBuilding[index]?.imgThumbnail}",
            ),
          );
        },
      ),
    );
  }
}
