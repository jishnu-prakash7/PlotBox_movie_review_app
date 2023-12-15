import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:plotbox/model/comment.dart';
import 'package:plotbox/model/movie.dart';
import 'package:plotbox/model/user.dart';
import 'package:plotbox/model/watchlist.dart';
import 'package:plotbox/screens/movie/splash_screen.dart';

const KEY = "UserLoggedIn";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await path.getApplicationDocumentsDirectory(); 
  Hive.init(dir.path);
  Hive.initFlutter('hive_db');
  Hive.registerAdapter(moviesAdapter());
  await Hive.openBox('movies');
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox('user');
  Hive.registerAdapter(CommentAdapter());
  await Hive.openBox('comment');
  Hive.registerAdapter(WatchlistAdapter());
  await Hive.openBox('watchlist');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'moviefriend',
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
