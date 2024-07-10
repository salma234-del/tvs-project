import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tvs_app/core/services/services_locator.dart';
import 'package:tvs_app/core/utils/app_constants.dart';
import 'package:tvs_app/core/utils/app_string.dart';
import 'package:tvs_app/tvs/presentation/components/custom_pagination_list_view.dart';
import 'package:tvs_app/tvs/presentation/components/tvs_list_view_element.dart';
import 'package:tvs_app/tvs/presentation/controller/get_top_rated_tvs_cubit/get_top_rated_tvs_cubit.dart';
import 'package:tvs_app/tvs/presentation/controller/get_top_rated_tvs_cubit/get_top_rated_tvs_state.dart';

class TopRatedTvsScreen extends StatelessWidget {
  const TopRatedTvsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetTopRatedTvsCubit(sl())..getTopRatedTvs(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppString.topRatedTvs,
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<GetTopRatedTvsCubit, GetTopRatedTvsState>(
          builder: (context, state) {
            var cubit = BlocProvider.of<GetTopRatedTvsCubit>(context);
            switch (state) {
              case GetTopRatedTvsSuccess() || GetTopRatedTvsLoadingMore():
                return CustomPaginationListView(
                  list: cubit.tvs,
                  nextPage: cubit.currentPage,
                  hasReachedMax: cubit.hasReachedMax,
                  getData: () {
                    return cubit.getTopRatedTvs(page: cubit.currentPage);
                  },
                  pageStorageKey: AppConstants.topRatedTvsKey,
                  itemBuilder: (context, index) {
                    return TvsListViewElement(tv: cubit.tvs[index]);
                  },
                );
              case GetTopRatedTvsFailure():
                return const Center(
                  child: Text('Error'),
                );
              default:
                return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
