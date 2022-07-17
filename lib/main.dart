import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:query_builder/api/fetch_data.dart';
import 'package:query_builder/controller/user_controller.dart';
import 'package:query_builder/view/search_screen.dart';

void main() async {
  await UserData().getUsers();
  // UserData().fu();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<UserController>(
      create: (context) => UserController(),
      child: MaterialApp(
        home: SearchScreen(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.outfitTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
      ),
    );
  }
}
