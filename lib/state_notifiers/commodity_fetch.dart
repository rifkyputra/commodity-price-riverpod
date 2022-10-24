import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newgen_flutter/models/commodity.dart';
import 'package:newgen_flutter/providers.dart';

import 'fetch_api_state_notifier.dart';

class CommodityFetch extends FetchApi<List<Commodity>> {
  CommodityFetch(
    super.ref,
  ) : super(defaultState: const AsyncValue.data([]));

  @override
  Future<void> get() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () async => await ref.read(getPriceDataEntityProvider.future));
    ref.refresh(saveCommodityProvider);
  }
}
