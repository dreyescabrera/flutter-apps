// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_now_playing_movies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getNowPlayingMoviesHash() =>
    r'4461148268e9c646241370864fc0864985aa9368';

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

/// See also [getNowPlayingMovies].
@ProviderFor(getNowPlayingMovies)
const getNowPlayingMoviesProvider = GetNowPlayingMoviesFamily();

/// See also [getNowPlayingMovies].
class GetNowPlayingMoviesFamily extends Family<AsyncValue<List<Movie>>> {
  /// See also [getNowPlayingMovies].
  const GetNowPlayingMoviesFamily();

  /// See also [getNowPlayingMovies].
  GetNowPlayingMoviesProvider call(
    int page,
  ) {
    return GetNowPlayingMoviesProvider(
      page,
    );
  }

  @override
  GetNowPlayingMoviesProvider getProviderOverride(
    covariant GetNowPlayingMoviesProvider provider,
  ) {
    return call(
      provider.page,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getNowPlayingMoviesProvider';
}

/// See also [getNowPlayingMovies].
class GetNowPlayingMoviesProvider
    extends AutoDisposeFutureProvider<List<Movie>> {
  /// See also [getNowPlayingMovies].
  GetNowPlayingMoviesProvider(
    int page,
  ) : this._internal(
          (ref) => getNowPlayingMovies(
            ref as GetNowPlayingMoviesRef,
            page,
          ),
          from: getNowPlayingMoviesProvider,
          name: r'getNowPlayingMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getNowPlayingMoviesHash,
          dependencies: GetNowPlayingMoviesFamily._dependencies,
          allTransitiveDependencies:
              GetNowPlayingMoviesFamily._allTransitiveDependencies,
          page: page,
        );

  GetNowPlayingMoviesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final int page;

  @override
  Override overrideWith(
    FutureOr<List<Movie>> Function(GetNowPlayingMoviesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetNowPlayingMoviesProvider._internal(
        (ref) => create(ref as GetNowPlayingMoviesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Movie>> createElement() {
    return _GetNowPlayingMoviesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetNowPlayingMoviesProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetNowPlayingMoviesRef on AutoDisposeFutureProviderRef<List<Movie>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _GetNowPlayingMoviesProviderElement
    extends AutoDisposeFutureProviderElement<List<Movie>>
    with GetNowPlayingMoviesRef {
  _GetNowPlayingMoviesProviderElement(super.provider);

  @override
  int get page => (origin as GetNowPlayingMoviesProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
