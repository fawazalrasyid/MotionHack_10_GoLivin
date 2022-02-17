import 'package:app/constants/colors.dart';
import 'package:app/constants/fonts.dart';
import 'package:app/constants/icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Container popularCard(
  String name,
  String location,
  String price,
  String rating,
  String image,
) {
  return Container(
    margin: EdgeInsets.only(
      left: 24,
    ),
    height: 100,
    width: 280,
    child: Stack(
      children: [
        CachedNetworkImage(
          height: 150,
          width: 280,
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
        Container(
          height: 150.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.grey.withOpacity(0.0),
                Colors.black.withOpacity(0.8),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.all(14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: FontFamily.regular.copyWith(
                      fontSize: 14,
                      color: AppColors.textOnBg,
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.location,
                        height: 16,
                        color: AppColors.iconWhite,
                      ),
                      SizedBox(width: 4),
                      Text(
                        location,
                        style: FontFamily.medium.copyWith(
                          fontSize: 16,
                          color: AppColors.textOnBg,
                        ),
                      ),
                    ],
                  ),
                ],
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
                    rating,
                    style: FontFamily.medium.copyWith(
                      fontSize: 14,
                      color: AppColors.textOnBg,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
