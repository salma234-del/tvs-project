import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvs_app/tvs/presentation/components/custom_tv_image.dart';
import 'package:tvs_app/tvs/presentation/controller/get_popular_tvs_cubit/get_popular_tvs_cubit.dart';
import 'package:tvs_app/tvs/presentation/controller/get_popular_tvs_cubit/get_popular_tvs_state.dart';
import 'package:tvs_app/tvs/presentation/screens/tv_details_screen.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPopularTvsCubit, GetPopularTvsState>(
      builder: (context, state) {
        switch (state) {
          case GetPopularTvsLoading():
            return const SizedBox(
              height: 170.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case GetPopularTvsSuccess():
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
          case GetPopularTvsFailure():
            return SizedBox(
              height: 170.0,
              child: Center(
                child: Text(state.message),
              ),
            );
        }

        return const SizedBox();
      },
    );
  }
}
