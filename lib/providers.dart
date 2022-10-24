import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:newgen_flutter/models/commodity.dart';
import 'package:newgen_flutter/models/price_region.dart';
import 'package:newgen_flutter/state_notifiers/commodity_fetch.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'providers.g.dart';

@riverpod
Dio dioClientG(DioClientGRef ref) => Dio();

@riverpod
Future<Isar> isarClient(IsarClientRef ref) async =>
    await Isar.open([CommoditySchema]);

@riverpod
Future<List<Commodity>> getPriceDataEntity(GetPriceDataEntityRef ref) async {
  final Dio dio = ref.read(dioClientGProvider);

  final result = await dio.get('https://jibs.my.id/api/harga_komoditas');
  final decoded = json.decode(result.data);

  final data = <Commodity>[];
  for (MapEntry element in decoded['national_commodity_price'].entries) {
    data.add(
      Commodity(
        name: element.key,
        priceRegional: [for (var e in element.value) PriceRegion.fromJson(e)],
      ),
    );
  }

  return data;
}

/// handle loading for `getPriceDataEntityProvider`
final fetchCommodityProvider =
    StateNotifierProvider<CommodityFetch, AsyncValue<List<Commodity>>>(
  (ref) => CommodityFetch(ref),
);

@riverpod
Future<PriceRegion?> getPrice(
  GetPriceRef ref,
  Commodity inputCommodity,
) async {
  final entity = ref.watch(getCommodityProvider);
  final region = ref.watch(selectedRegionProvider);

  return await entity.when(
    data: (value) {
      return value
          .firstWhere(
            (element) => element.name == inputCommodity.name,
            orElse: () => Commodity(name: region, priceRegional: []),
          )
          .priceRegional
          .firstWhere(
            (element) => element.regionName == region,
            orElse: () => PriceRegion(display: 'Not Found'),
          );
    },
    error: (Object error, StackTrace stackTrace) =>
        PriceRegion(display: 'Error $error'),
    loading: () => PriceRegion(display: 'loading..'),
  );
}

@riverpod
Future<int> saveCommodity(SaveCommodityRef ref) async {
  final entity = ref.watch(fetchCommodityProvider);
  final isar = await ref.watch(isarClientProvider.future);

  print('-------called .......');

  if (entity.isLoading || entity.hasError) return 0;

  final result = await entity.maybeWhen<Future<int>>(
    data: (data) async {
      return await isar.writeTxn<int>(() async {
        for (var element in data) {
          await isar.commoditys.put(element);
        }

        ref.invalidate(getCommodityProvider);

        return 1;
      });
    },
    orElse: () async => 0,
  );

  return result;
}

@riverpod
Future<List<Commodity>> getCommodity(GetCommodityRef ref) async {
  final isar = await ref.watch(isarClientProvider.future);

  return await isar.commoditys.where().findAll();
}

@riverpod
Future<List<String>?> getListRegion(GetListRegionRef ref) async {
  final entity = ref.watch(getCommodityProvider);
  return await entity.when(
    data: (value) {
      if (value.isEmpty) return null;

      return [
        for (var e in value.first.priceRegional) e.regionName,
      ].whereType<String>().toList();
    },
    error: (Object error, StackTrace stackTrace) => null,
    loading: () => null,
  );
}

final selectedRegionProvider = StateProvider<String>((ref) {
  final entity = ref.watch(fetchCommodityProvider);

  return entity.maybeWhen<String>(
    data: (value) {
      if (value.isEmpty) return 'DKI Jakarta';
      return [
            for (var e in value.first.priceRegional) e.regionName,
          ].first ??
          'DKI Jakarta';
    },
    orElse: () => 'DKI Jakarta',
  );
});
