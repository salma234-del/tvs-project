import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvs_app/tvs/presentation/components/custom_tv_image.dart';
import 'package:tvs_app/tvs/presentation/controller/get_top_rated_tvs_cubit/get_top_rated_tvs_cubit.dart';
import 'package:tvs_app/tvs/presentation/controller/get_top_rated_tvs_cubit/get_top_rated_tvs_state.dart';
import 'package:tvs_app/tvs/presentation/screens/tv_details_screen.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTopRatedTvsCubit, GetTopRatedTvsState>(
      builder: (context, state) {
        switch (state) {
          case GetTopRatedTvsLoading():
            return const SizedBox(
              height: 170.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case GetTopRatedTvsSuccess():
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.tvs.length,
                  itemBuilder: (context, index) {
                    final tv = state.tvs[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TvDetailsScreen(
                                id: tv.id,
                              ),
                            ),
                          );
                        },
                        child: CustomTvImage(
                          width: 120.0,
                          image: tv.backdropPath,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case GetTopRatedTvsFailure():
            return SizedBox(
              height: 170.0,
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
