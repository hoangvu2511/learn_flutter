import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/feature/type.dart';
import 'package:flutter_app/repository/anime_repository.dart';
import 'package:flutter_app/util.dart';
import 'package:flutter_app/widget/dropdownlist.dart';
import 'package:flutter_app/widget/feed_view.dart';
import 'package:flutter_app/widget/loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'bloc/bloc.dart';
import 'bloc/event.dart';
import 'bloc/state.dart';

class MoreAnimeManga extends StatefulWidget {
  @override
  _MoreAnimeMangaState createState() => _MoreAnimeMangaState();
}

class _MoreAnimeMangaState extends State<MoreAnimeManga> {
  AnimeBloc _animBloc = AnimeBloc(AnimeRepository(http.Client()));
  var type = ListType.LIST;
  var filterBody = <String, String>{
    "page[limit]": "$PAGE_SIZE",
  };

  @override
  void initState() {
    super.initState();
    _animBloc.add(NewCall(mapParam: filterBody));
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

        },
        child: Icon(Icons.arrow_upward),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                DropDownItems(
                  items: ['Winter', 'Spring', 'Summer', 'Fall'],
                  typeDropDown: TypeDropDown.season,
                  filter: handleFilter,
                ),
                DropDownItems(
                  items: generateListYear(),
                  typeDropDown: TypeDropDown.seasonYear,
                  filter: handleFilter,
                ),
                DropDownItems(
                  items: ['G', 'PG', 'R', 'R18'],
                  typeDropDown: TypeDropDown.ageRating,
                  filter: handleFilter,
                ),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        type = type.change;
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
              if (state is ListError) {
                return Center(
                  child: Text("hello"),
                );
              }
              if (state is ListLoaded || state is Loading) {
                return Expanded(
                    child: EndlessList(curState: state, onEndScroll: _onEndCall,type: type,)
                );
              }
              return CustomLoading();
            },
          ),
        ],
      ),
    );
  }

  _onEndCall(){
    _animBloc.add(Fetch());
  }

  void handleFilter(TypeDropDown typeDropDown, dynamic text) {
    if(text == null){
      filterBody.remove(typeDropDown.filter);
    }else{
      filterBody[typeDropDown.filter] = text.toString().toLowerCase();
    }
    _animBloc.add(NewCall(mapParam: filterBody));
  }
}
