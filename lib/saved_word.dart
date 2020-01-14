import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SavedWordsState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final words = ModalRoute.of(context).settings.arguments as Set<WordPair>;
    final tiles = words.map((WordPair pair) {
      return ItemViewHolder(pair: pair);
    });
    final divided =
        ListTile.divideTiles(tiles: tiles, context: context).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: GridView.count(
        children: divided,
        crossAxisCount: 2,
      ),
    );
  }
}

class ItemViewHolder extends StatelessWidget {
  final WordPair pair;

  ItemViewHolder({this.pair});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Center(
        child: Text(
          pair.asPascalCase,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
