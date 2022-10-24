import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class FetchApi<T> extends StateNotifier<AsyncValue<T>> {
  FetchApi(
    this.ref, {
    AsyncValue<T>? defaultState,
  }) : super(defaultState ?? const AsyncValue.loading());

  final StateNotifierProviderRef ref;

  Future<void> get();
}
