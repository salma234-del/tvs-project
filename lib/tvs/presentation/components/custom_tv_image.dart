import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tvs_app/core/global/theme/dart_theme/app_colors_dark.dart';
import 'package:tvs_app/core/network/api_constants.dart';

class CustomTvImage extends StatelessWidget {
  const CustomTvImage({
    super.key,
    required this.width,
    required this.image,
  });

  final String image;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: CachedNetworkImage(
        width: width,
        fit: BoxFit.cover,
        imageUrl: ApiConstants.imageUrl(image),
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[850]!,
          highlightColor: Colors.grey[800]!,
          child: Container(
            height: 170.0,
            width: width,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          color: AppColorsDark.red,
        ),
      ),
    );
  }
}
