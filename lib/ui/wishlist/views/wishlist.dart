import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../components/wishlist_card.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
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
              buildWishlistList(),
            ],
          ),
        ),
      ),
    );
  }

  Container buildHeaderTitle() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        "Wishlist",
        style: FontFamily.bold.copyWith(
          color: AppColors.text,
          fontSize: 24,
        ),
      ),
    );
  }

  Container buildWishlistList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return wishlistCard(
            "Kost Omah ${index}",
            "Bandung",
            "IDR 1.239.000",
            "4.9",
            "https://images.unsplash.com/photo-1523899789132-057ccfa38a7a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80",
          );
        },
      ),
    );
  }
}
