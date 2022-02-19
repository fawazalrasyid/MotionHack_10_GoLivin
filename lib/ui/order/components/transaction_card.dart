import 'package:golivin/constants/colors.dart';
import 'package:golivin/constants/fonts.dart';
import 'package:golivin/constants/icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Container transactionCard(
  String name,
  String location,
  String price,
  String rating,
  String image,
) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 24,
    ),
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                height: 70,
                width: 70,
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
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
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
                                color: AppColors.text,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.spandexGreen,
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                child: Text(
                  "Paid",
                  style: FontFamily.semiBold.copyWith(
                    fontSize: 12,
                    color: AppColors.textOnBg,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Total payment",
                style: FontFamily.medium.copyWith(
                  fontSize: 16,
                  color: AppColors.greyText,
                ),
              ),
              Text(
                price,
                style: FontFamily.medium.copyWith(
                  fontSize: 16,
                  color: AppColors.blueText,
                ),
              ),
            ],
          ),
          Divider()
        ],
      ),
    ),
  );
}

// Container transactionCard(
//   String name,
//   String location,
//   String price,
//   String rating,
//   String image,
// ) {
//   return Container(
//     margin: EdgeInsets.only(
//       bottom: 24,
//     ),
//     height: 120,
//     child: Row(
//       children: [
//         CachedNetworkImage(
//           height: 130,
//           width: 110,
//           imageUrl: image,
//           imageBuilder: (context, imageProvider) => Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(12),
//               ),
//               image: DecorationImage(
//                 image: imageProvider,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Container(
//             margin: EdgeInsets.only(left: 16, top: 4, bottom: 4),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             name,
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 2,
//                             style: FontFamily.medium.copyWith(
//                               fontSize: 16,
//                               color: AppColors.text,
//                             ),
//                           ),
//                           Text(
//                             location,
//                             style: FontFamily.regular.copyWith(
//                               fontSize: 14,
//                               color: AppColors.greyText,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Text(
//                         price,
//                         style: FontFamily.medium.copyWith(
//                           fontSize: 16,
//                           color: AppColors.blueText,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     SvgPicture.asset(
//                       AppIcons.star,
//                       height: 16,
//                       color: AppColors.iconYellow,
//                     ),
//                     SizedBox(width: 4),
//                     Text(
//                       rating,
//                       style: FontFamily.medium.copyWith(
//                         fontSize: 14,
//                         color: AppColors.text,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
