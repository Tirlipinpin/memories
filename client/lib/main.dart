import 'package:flutter/material.dart';
import 'package:memories/components/app_bar_title.dart';
import 'package:memories/http/http_client.dart';
import 'package:memories/pages/pick_your_memory.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Home());
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const AppBarTitle(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.
            mainAxisAlignment: MainAxisAlignment.start,
            children: Provider.of<UserRepository>(context).getUser == null
                ? [const Text("Fetching the user...")]
                : [
                    Text(
                      "Welcome ${Provider.of<UserRepository>(context).getUser?.getFirstName}",
                    ),
                    FilledButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PickYourMemory(),
                          ),
                        );
                      },
                      child: const Text("Take me somewhere"),
                    ),
                  ],
          ),
        ),
      ),
    ));
  }
}
