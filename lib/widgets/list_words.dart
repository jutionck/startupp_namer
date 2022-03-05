import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_startup_namer/data/data_fetcher.dart';

class ListWords extends StatefulWidget {
  const ListWords({Key? key}) : super(key: key);

  @override
  State<ListWords> createState() => _ListWordsState();
}

class _ListWordsState extends State<ListWords> {
  final _wordData = <WordPair>[];
  bool _isLoading = true;
  bool _isMoreData = true;
  final _dataFetcher = DataFetcher();

  // lifecycle stateful
  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _isMoreData = true;
    _loadDataMore();
  }

  @override
  Widget build(BuildContext context) {
    return _buildListWord();
  }

  Widget _buildListWord() {
    return ListView.builder(
        itemCount: _isMoreData ? _wordData.length + 1 : _wordData.length,
        itemBuilder: (context, i) {
          if (i >= _wordData.length) {
            if (!_isLoading) {
              _loadDataMore();
            }
            return const Center(
              child: SizedBox(
                child: CircularProgressIndicator(),
                width: 25,
                height: 25,
              ),
            );
          }
          return ListTile(
            leading: Text(i.toString(), style: TextStyle(fontSize: 25)),
            title: Text(
              _wordData[i].asPascalCase,
              style: TextStyle(fontSize: 25),
            ),
          );
        });
  }

  // Widget _buildItemRow(WordPair wordData) {
  //   return ListTile(
  //     title: Text(
  //       wordData.asPascalCase,
  //       style: TextStyle(fontSize: 25),
  //     ),
  //   );
  // }

  void _loadDataMore() {
    _isLoading = true;
    _dataFetcher.fetch().then((List<WordPair> fetchedListData) {
      if (fetchedListData.isEmpty) {
        setState(() {
          _isLoading = false;
          _isMoreData = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _wordData.addAll(fetchedListData);
        });
      }
    });
  }
}
