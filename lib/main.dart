import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:football_apps/bindings/initial_binding.dart';
import 'package:football_apps/navigations/navigation_routes.dart';
import 'package:football_apps/screen/league_detail_screen/league_detail_screen.dart';
import 'package:football_apps/screen/league_list_screen/league_list_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  String? apiKey = dotenv.env['API_FOOTBALL_KEY'];
  print('KEY = $apiKey');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      initialRoute: NavigationRoutes.leagueList,
      getPages: [
        GetPage(
          name: NavigationRoutes.leagueList,
          page: () => const LeagueListScreen(),
        ),
        GetPage(
          name: NavigationRoutes.leagueDetail,
          page: () => const LeagueDetailScreen(),
        ),
      ],
    );
  }
}
