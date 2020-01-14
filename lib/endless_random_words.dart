import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/saved_word.dart';

class EndlessRandomWordsState extends State<EndlessRandomWord> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _font = TextStyle(fontSize: 20);

  Widget _showSuggestion() {
    return ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) {
        return Divider();
      }
      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySave = _saved.contains(pair);
    var txt = pair.asCamelCase;
    return ListTile(
      title: Text(txt, style: _font,),
      trailing: Icon(
        alreadySave ? Icons.favorite : Icons.favorite_border,
        color: alreadySave ? Colors.red : null,
      ),
      onTap: () {
        setTap(pair);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: onPress,
          ),
        ],
      ),
      body: _showSuggestion(),
    );
  }

  onPress() {
    Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SavedWordsState(),
          settings: RouteSettings(arguments: _saved),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(1.0, 0.0);
            var end = Offset.zero;
            var curve = Curves.ease;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        )
    );
  }

  setTap(WordPair pair) {
    setState(() {
      if (_saved.contains(pair)) {
        _saved.remove(pair);
      } else {
        _saved.add(pair);
      }
    });
  }
}

class EndlessRandomWord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EndlessRandomWordsState();
}
