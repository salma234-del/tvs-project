import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tvs_app/core/services/services_locator.dart';
import 'package:tvs_app/core/utils/app_constants.dart';
import 'package:tvs_app/core/utils/app_string.dart';
import 'package:tvs_app/tvs/presentation/components/on_the_air_component.dart';
import 'package:tvs_app/tvs/presentation/components/popular_component.dart';
import 'package:tvs_app/tvs/presentation/components/top_rated_component.dart';
import 'package:tvs_app/tvs/presentation/controller/get_on_the_air_tvs_cubit/get_on_air_tvs_cubit.dart';
import 'package:tvs_app/tvs/presentation/controller/get_popular_tvs_cubit/get_popular_tvs_cubit.dart';
import 'package:tvs_app/tvs/presentation/controller/get_top_rated_tvs_cubit/get_top_rated_tvs_cubit.dart';
import 'package:tvs_app/tvs/presentation/screens/popular_tvs_screen.dart';
import 'package:tvs_app/tvs/presentation/screens/top_rated_tvs_screen.dart';

class TvsScreen extends StatelessWidget {
  const TvsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetOnAirTvsCubit(sl())..getOnTheAirTvs(),
          ),
          BlocProvider(
            create: (context) => GetPopularTvsCubit(sl())..getPopularTvs(),
          ),
          BlocProvider(
            create: (context) => GetTopRatedTvsCubit(sl())..getTopRatedTvs(),
          )
        ],
        child: Scaffold(
          body: SingleChildScrollView(
            key: const Key(AppConstants.tvsViewScrollKey),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OnTheAirComponent(),
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.popular,
                        style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const PopularTvsScreen(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                AppString.seeMore,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const PopularComponent(),
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    16.0,
                    24.0,
                    16.0,
                    8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.topRated,
                        style: GoogleFonts.poppins(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const TopRatedTvsScreen(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                AppString.seeMore,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const TopRatedComponent(),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ));
  }
}
