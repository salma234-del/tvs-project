import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tvs_app/core/global/theme/dart_theme/app_colors_dark.dart';
import 'package:tvs_app/tvs/domain/entities/tv.dart';
import 'package:tvs_app/tvs/presentation/components/custom_tv_image.dart';
import 'package:tvs_app/tvs/presentation/screens/tv_details_screen.dart';

class TvsListViewElement extends StatelessWidget {
  const TvsListViewElement({
    required this.tv,
    super.key,
  });

  final Tv tv;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => TvDetailsScreen(
              id: tv.id,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColorsDark.tvItemBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 170,
              child: CustomTvImage(
                width: 110,
                image: tv.backdropPath,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tv.name,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: AppColorsDark.red,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          tv.releaseDate.split('-')[0],
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColorsDark.star,
                            size: 20.0,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            (tv.voteAverage / 2).toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    tv.overview,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
