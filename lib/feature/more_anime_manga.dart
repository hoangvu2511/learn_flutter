import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/anime/anime_bloc.dart';
import 'package:flutter_app/bloc/anime/anime_event.dart';
import 'package:flutter_app/bloc/anime/anime_state.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/feature/type.dart';
import 'package:flutter_app/widget/dropdownlist.dart';
import 'package:flutter_app/widget/feed_view.dart';
import 'package:flutter_app/widget/loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class MoreAnimeManga extends StatefulWidget {
  @override
  _MoreAnimeMangaState createState() => _MoreAnimeMangaState();
}

class _MoreAnimeMangaState extends State<MoreAnimeManga> {
  final _scrollController = ScrollController();
  final _scrollThreshHold = 200.0;
  AnimeBloc _animBloc = AnimeBloc(httpClient: http.Client());
  var curState;
  var count = 1;
  var filterBody = <String, String>{
    "page[limit]": "$PAGE_SIZE",
  };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _animBloc.add(NewCall(mapParam: filterBody));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll < _scrollThreshHold && curState is! Loading) {
      _animBloc.add(Fetch(mapParam: filterBody));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("${(ModalRoute.of(context).settings.arguments as TypeAorM)?.toString()?.split(".")?.last}"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0.0,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 500),
          );
        },
        child: Icon(Icons.arrow_upward),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: DropDownItems(
                    items: ['Winter', 'Spring', 'Summer', 'Fall'],
                    typeDropDown: TypeDropDown.season,
                    filter: handleFilter,
                  ),
                ),
                Expanded(
                  child: DropDownItems(
                    items: generateListYear(),
                    typeDropDown: TypeDropDown.seasonYear,
                    filter: handleFilter,
                  ),
                ),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (count == 1) {
                          count = 2;
                        } else {
                          count = 1;
                        }
                      });
                    },
                    child: Icon(Icons.grid_on)
                )
              ],
            ),
          ),
          BlocBuilder<AnimeBloc, ListState>(
            bloc: _animBloc,
            builder: (context, state) {
              curState = state;
              if (state is ListError) {
                return Center(
                  child: Text("hello"),
                );
              }

              if (state is ListLoaded || state is Loading) {
                log("${state.feeds.length}  ${state.hasReachedMax}");
                return Expanded(
                    child: count == 2
                        ? GridViewFeed(feeds: state.feeds, scrollController: _scrollController,)
                        : ListViewFeed(feeds: state.feeds, scrollController: _scrollController, hasReachedMax: state.hasReachedMax,)
                );
              }

              return CustomLoading();
            },
          ),
        ],
      ),
    );
  }

  void handleFilter(TypeDropDown typeDropDown, dynamic text) {
    switch (typeDropDown) {
      case TypeDropDown.season:
        {
          filterBody[FILTER_SEASON] = text.toString().toLowerCase();
          break;
        }
      case TypeDropDown.seasonYear :
        {
          filterBody[FILTER_SEASON_YEAR] = text.toString();
          break;
        }
      case TypeDropDown.ageRating :
        {
          filterBody[FILTER_AGE_RATING] = text.toString();
          break;
        }
    }
    log(filterBody.toString());
    _animBloc.add(NewCall(mapParam: filterBody));
  }

  generateListYear(){
    var date = DateTime.now();
    var listYear = <String>[];
    for(var i = 1970; i <= date.year; i++){
      listYear.add("$i");
    }

    return listYear.reversed.toList();
  }
}
