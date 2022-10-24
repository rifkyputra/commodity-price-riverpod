// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $dioClientGHash() => r'391990dddee4cd335e65f7263424bd2529f4d2af';

/// See also [dioClientG].
final dioClientGProvider = AutoDisposeProvider<Dio>(
  dioClientG,
  name: r'dioClientGProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $dioClientGHash,
);
typedef DioClientGRef = AutoDisposeProviderRef<Dio>;
String $isarClientHash() => r'c6c89f62f46da477e0fd68d982cf01e54fa83433';

/// See also [isarClient].
final isarClientProvider = AutoDisposeFutureProvider<Isar>(
  isarClient,
  name: r'isarClientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $isarClientHash,
);
typedef IsarClientRef = AutoDisposeFutureProviderRef<Isar>;
String $getPriceDataEntityHash() => r'3e437608c4db560c356a45181d535abbccfdb9a4';

/// See also [getPriceDataEntity].
final getPriceDataEntityProvider = AutoDisposeFutureProvider<List<Commodity>>(
  getPriceDataEntity,
  name: r'getPriceDataEntityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $getPriceDataEntityHash,
);
typedef GetPriceDataEntityRef = AutoDisposeFutureProviderRef<List<Commodity>>;
String $getPriceHash() => r'970612b3bcdc5058ed5f372795e7d335a4b5b9c1';

/// See also [getPrice].
class GetPriceProvider extends AutoDisposeFutureProvider<PriceRegion?> {
  GetPriceProvider(
    this.inputCommodity,
  ) : super(
          (ref) => getPrice(
            ref,
            inputCommodity,
          ),
          from: getPriceProvider,
          name: r'getPriceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $getPriceHash,
        );

  final Commodity inputCommodity;

  @override
  bool operator ==(Object other) {
    return other is GetPriceProvider && other.inputCommodity == inputCommodity;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, inputCommodity.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetPriceRef = AutoDisposeFutureProviderRef<PriceRegion?>;

/// See also [getPrice].
final getPriceProvider = GetPriceFamily();

class GetPriceFamily extends Family<AsyncValue<PriceRegion?>> {
  GetPriceFamily();

  GetPriceProvider call(
    Commodity inputCommodity,
  ) {
    return GetPriceProvider(
      inputCommodity,
    );
  }

  @override
  AutoDisposeFutureProvider<PriceRegion?> getProviderOverride(
    covariant GetPriceProvider provider,
  ) {
    return call(
      provider.inputCommodity,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getPriceProvider';
}

String $saveCommodityHash() => r'516c85e42e7521665e0fc10e8c451bcf912cda03';

/// See also [saveCommodity].
final saveCommodityProvider = AutoDisposeFutureProvider<int>(
  saveCommodity,
  name: r'saveCommodityProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $saveCommodityHash,
);
typedef SaveCommodityRef = AutoDisposeFutureProviderRef<int>;
String $getCommodityHash() => r'66cc95df2bd27f6d848cdb3a0440613338af0968';

/// See also [getCommodity].
final getCommodityProvider = AutoDisposeFutureProvider<List<Commodity>>(
  getCommodity,
  name: r'getCommodityProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $getCommodityHash,
);
typedef GetCommodityRef = AutoDisposeFutureProviderRef<List<Commodity>>;
String $getListRegionHash() => r'9456e32855190ca7ddac837703b19e6d21bb96dd';

/// See also [getListRegion].
final getListRegionProvider = AutoDisposeFutureProvider<List<String>?>(
  getListRegion,
  name: r'getListRegionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $getListRegionHash,
);
typedef GetListRegionRef = AutoDisposeFutureProviderRef<List<String>?>;
