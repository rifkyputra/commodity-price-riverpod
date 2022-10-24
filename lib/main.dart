import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newgen_flutter/models/commodity.dart';
import 'package:newgen_flutter/providers.dart';

void main() => runApp(const MyApp());

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return const ProviderScope(
      child: MaterialApp(
        title: 'Material App',
        home: Home(),
      ),
    );
  }
}

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(getCommodityProvider);
    final selectedRegion = ref.watch(selectedRegionProvider);
    final listRegion = ref.watch(getListRegionProvider);
    final listRegionData = listRegion.whenOrNull<List<String>?>(
          data: (data) => data,
        ) ??
        [selectedRegion];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: ListView(
        children: [
          DropdownButton<String>(
            value: selectedRegion,
            items: [
              for (String e in listRegionData)
                DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ),
            ],
            onChanged: (s) =>
                ref.read(selectedRegionProvider.notifier).update((state) => s!),
          ),
          FilledButton(
            onPressed: () {
              ref.read(fetchCommodityProvider.notifier).get();
            },
            child: Text('Get Data'),
          ),
          const SizedBox(height: 18),
          state.when(
              data: (d) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: d.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(d[index].name),
                        subtitle: ref
                            .watch(
                              getPriceProvider.call(d[index]),
                            )
                            .whenData((value) => Text(value!.display!))
                            .value,
                      );
                    },
                  ),
              error: (e, s) => Text(e.toString()),
              loading: () => Center(child: CircularProgressIndicator())),
        ],
      ),
    );
  }
}
