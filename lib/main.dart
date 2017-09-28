import 'package:flutter/material.dart';
import 'movie_list.dart';
import 'dart:convert';
import 'movie_data.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final String jsonString = '''
    [
      {
        "source": "HotStar",
        "name": "S3",
        "image": "https://secure-media2.hotstar.com/r1/thumbs/PCTV/10/1770015710/PCTV-1770015710-hd.jpg"
      },
      {
        "source": "NetFlix",
        "name": "S/O Sathya Murthy",
        "image": "https://secure-media2.hotstar.com/r1/thumbs/PCTV/28/1000074328/PCTV-1000074328-hd.jpg"
      },
      {
        "source": "Amazon Prime",
        "name": "24",
        "image": "https://secure-media0.hotstar.com/r1/thumbs/PCTV/44/1770004244/PCTV-1770004244-hd.jpg"
      },
      {
        "source": "Amazon Prime",
        "name": "Janatha Garrage",
        "image": "https://secure-media1.hotstar.com/r1/thumbs/PCTV/71/1000155071/PCTV-1000155071-hd.jpg"
      },
      {
        "source": "HotStar",
        "name": "24",
        "image": "https://secure-media0.hotstar.com/r1/thumbs/PCTV/44/1770004244/PCTV-1770004244-hd.jpg"
      },
      {
        "source": "Amazon Prime",
        "name": "Bahubali 2",
        "image": "https://secure-media1.hotstar.com/r1/thumbs/PCTV/37/1770016137/PCTV-1770016137-hd.jpg"
      }
    ]
    ''';
    JsonDecoder decoder = new JsonDecoder();
    List movieList = decoder.convert(jsonString);
    return new MaterialApp(
      title: 'Movies Finder',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(movieList, title: 'Movies Finder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.movieData, {Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final List<MovieData> movieData;

  @override
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String searchQuery = "";

  void searchMovies(searchQuery) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      this.searchQuery = searchQuery;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(widget.title),
        ),
        body: new Column(children: <Widget>[
          new TextField(
            decoration: new InputDecoration(
              hintText: 'Search movie',
            ),
          ),
          new Expanded(
            child: new MovieList(widget.movieData, this.searchQuery),
          ),
        ]));
  }
}
