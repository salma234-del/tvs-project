import 'package:flutter/material.dart';

class CustomPaginationListView extends StatefulWidget {
  const CustomPaginationListView({
    required this.list,
    required this.nextPage,
    required this.hasReachedMax,
    required this.getData,
    required this.pageStorageKey,
    required this.itemBuilder,
    super.key,
  });
  final List list;
  final int nextPage;
  final bool hasReachedMax;
  final Future Function() getData;
  final String pageStorageKey;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  State<CustomPaginationListView> createState() =>
      _CustomPaginationListViewState();
}

class _CustomPaginationListViewState extends State<CustomPaginationListView> {
  late ScrollController _scrollController;
  bool isLoading = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() async {
    if (!widget.hasReachedMax &&
        _scrollController.position.pixels >=
            0.7 * _scrollController.position.maxScrollExtent) {
      if (!isLoading) {
        isLoading = true;
        await widget.getData();
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      key: PageStorageKey(widget.pageStorageKey),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
      itemBuilder: (context, index) {
        return widget.itemBuilder(context, index);
      },
      itemCount: widget.list.length,
      physics: const BouncingScrollPhysics(),
    );
  }
}
