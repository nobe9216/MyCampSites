// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camp_site_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$campSiteServiceHash() => r'e0d61e13c604828bcc1495be803894bce3ae1684';

/// See also [campSiteService].
@ProviderFor(campSiteService)
final campSiteServiceProvider = FutureProvider<CampSiteService>.internal(
  campSiteService,
  name: r'campSiteServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$campSiteServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CampSiteServiceRef = FutureProviderRef<CampSiteService>;
String _$campSiteDetailHash() => r'9a8600fe1bc58d7e30553525e516ab51245d1e34';

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

/// See also [campSiteDetail].
@ProviderFor(campSiteDetail)
const campSiteDetailProvider = CampSiteDetailFamily();

/// See also [campSiteDetail].
class CampSiteDetailFamily extends Family<AsyncValue<CampSite>> {
  /// See also [campSiteDetail].
  const CampSiteDetailFamily();

  /// See also [campSiteDetail].
  CampSiteDetailProvider call(
    int id,
  ) {
    return CampSiteDetailProvider(
      id,
    );
  }

  @override
  CampSiteDetailProvider getProviderOverride(
    covariant CampSiteDetailProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'campSiteDetailProvider';
}

/// See also [campSiteDetail].
class CampSiteDetailProvider extends AutoDisposeStreamProvider<CampSite> {
  /// See also [campSiteDetail].
  CampSiteDetailProvider(
    int id,
  ) : this._internal(
          (ref) => campSiteDetail(
            ref as CampSiteDetailRef,
            id,
          ),
          from: campSiteDetailProvider,
          name: r'campSiteDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$campSiteDetailHash,
          dependencies: CampSiteDetailFamily._dependencies,
          allTransitiveDependencies:
              CampSiteDetailFamily._allTransitiveDependencies,
          id: id,
        );

  CampSiteDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    Stream<CampSite> Function(CampSiteDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CampSiteDetailProvider._internal(
        (ref) => create(ref as CampSiteDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<CampSite> createElement() {
    return _CampSiteDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CampSiteDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CampSiteDetailRef on AutoDisposeStreamProviderRef<CampSite> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CampSiteDetailProviderElement
    extends AutoDisposeStreamProviderElement<CampSite> with CampSiteDetailRef {
  _CampSiteDetailProviderElement(super.provider);

  @override
  int get id => (origin as CampSiteDetailProvider).id;
}

String _$campSiteListHash() => r'bbcb513406769eb06304f265fbcc09cd1654764e';

/// See also [campSiteList].
@ProviderFor(campSiteList)
final campSiteListProvider = AutoDisposeStreamProvider<List<CampSite>>.internal(
  campSiteList,
  name: r'campSiteListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$campSiteListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CampSiteListRef = AutoDisposeStreamProviderRef<List<CampSite>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
