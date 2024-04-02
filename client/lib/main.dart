import 'package:flutter/material.dart';
import 'package:memories/components/app_bar_title.dart';
import 'package:memories/components/home_loader.dart';
import 'package:memories/components/navigation.dart';
import 'package:memories/http/http_client.dart';
import 'package:memories/pages/pick_your_memory.dart';
import 'package:memories/pages/profile.dart';
import 'package:memories/repositories/user_repository.dart';
import 'package:provider/provider.dart';

final httpClient = HttpClient(baseUrl: "http://127.0.0.1:3000");

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserRepository(httpClient: httpClient)..fetch(),
      ),
      Provider(create: (context) => httpClient)
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;

  handleDestinationSelected(int? nextIndex) {
    if (nextIndex != null) {
      setState(() {
        currentPageIndex = nextIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<UserRepository>(context).getUser == null) {
      return const Scaffold(
        body: Center(
          child: HomeLoader(),
        ),
      );
    }

    return (Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const AppBarTitle(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: [
            const PickYourMemory(),
            const Profile(),
          ][currentPageIndex],
        ),
      ),
      bottomNavigationBar: Navigation(
        onDestinationSelected: handleDestinationSelected,
        selectedIndex: currentPageIndex,
      ),
    ));
  }
}
