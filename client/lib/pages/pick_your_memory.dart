import 'package:flutter/material.dart';
import 'package:memories/components/app_bar_title.dart';
import 'package:memories/components/memories_form.dart';
import 'package:memories/http/http_client.dart';
import 'package:memories/repositories/memories_repository.dart';
import 'package:provider/provider.dart';

class PickYourMemory extends StatelessWidget {
  const PickYourMemory({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<HttpClient, MemoriesRepository>(
      // Use a ProxyProvider
      create: (context) => MemoriesRepository(),
      update: (_, httpClient, repository) =>
          MemoriesRepository(httpClient: Provider.of<HttpClient>(context)),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const AppBarTitle(),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
                  Provider.of<MemoriesRepository>(context).memories.isNotEmpty
                      ? [
                          const Text(
                            "Please select your memory",
                            style: TextStyle(fontSize: 20),
                          ),
                          const MemoriesForm(),
                        ]
                      : [
                          const Text("Fetch memories"),
                          FilledButton(
                            onPressed: Provider.of<MemoriesRepository>(context,
                                    listen: false)
                                .fetchMemories,
                            child: const Icon(Icons.refresh),
                          )
                        ],
            ),
          ],
        ),
      ),
    );
  }
}
