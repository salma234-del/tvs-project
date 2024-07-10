import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvs_app/core/network/api_constants.dart';
import 'package:tvs_app/core/utils/app_string.dart';
import 'package:tvs_app/tvs/presentation/controller/get_on_the_air_tvs_cubit/get_on_air_tvs_cubit.dart';
import 'package:tvs_app/tvs/presentation/controller/get_on_the_air_tvs_cubit/get_on_air_tvs_state.dart';
import 'package:tvs_app/tvs/presentation/screens/tv_details_screen.dart';

class OnTheAirComponent extends StatelessWidget {
  const OnTheAirComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOnAirTvsCubit, GetOnAirTvsState>(
      builder: (context, state) {
        switch (state) {
          case GetOnAirTvsLoading():
            return const SizedBox(
              height: 400.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case GetOnAirTvsSuccess():
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {},
                ),
                items: state.tvs.map(
                  (item) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => TvDetailsScreen(
                              id: item.id,
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.3, 0.5, 1],
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                              height: 560.0,
                              imageUrl:
                                  ApiConstants.imageUrl(item.backdropPath),
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => Container(
                                width: double.infinity,
                                color: Colors.grey,
                                child: const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.redAccent,
                                        size: 16.0,
                                      ),
                                      SizedBox(width: 4.0),
                                      Text(
                                        AppString.onTheAir,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Text(
                                    item.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          case GetOnAirTvsFailure():
            return SizedBox(
              height: 400.0,
              child: Center(
                child: Text(state.message),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
