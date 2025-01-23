// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visited_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$visitServiceHash() => r'abef3e18a0e6f4f870e709deb639dcee621d6caa';

/// See also [visitService].
@ProviderFor(visitService)
final visitServiceProvider = FutureProvider<VisitService>.internal(
  visitService,
  name: r'visitServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$visitServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VisitServiceRef = FutureProviderRef<VisitService>;
String _$visitDetailHash() => r'04e600ce59c3f471da57b761bcc845a9e43c8acf';

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

/// See also [visitDetail].
@ProviderFor(visitDetail)
const visitDetailProvider = VisitDetailFamily();

/// See also [visitDetail].
class VisitDetailFamily extends Family<AsyncValue<Visit>> {
  /// See also [visitDetail].
  const VisitDetailFamily();

  /// See also [visitDetail].
  VisitDetailProvider call(
    int id,
  ) {
    return VisitDetailProvider(
      id,
    );
  }

  @override
  VisitDetailProvider getProviderOverride(
    covariant VisitDetailProvider provider,
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
  String? get name => r'visitDetailProvider';
}

/// See also [visitDetail].
class VisitDetailProvider extends AutoDisposeStreamProvider<Visit> {
  /// See also [visitDetail].
  VisitDetailProvider(
    int id,
  ) : this._internal(
          (ref) => visitDetail(
            ref as VisitDetailRef,
            id,
          ),
          from: visitDetailProvider,
          name: r'visitDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$visitDetailHash,
          dependencies: VisitDetailFamily._dependencies,
          allTransitiveDependencies:
              VisitDetailFamily._allTransitiveDependencies,
          id: id,
        );

  VisitDetailProvider._internal(
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
    Stream<Visit> Function(VisitDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VisitDetailProvider._internal(
        (ref) => create(ref as VisitDetailRef),
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
  AutoDisposeStreamProviderElement<Visit> createElement() {
    return _VisitDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VisitDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VisitDetailRef on AutoDisposeStreamProviderRef<Visit> {
  /// The parameter `id` of this provider.
  int get id;
}

class _VisitDetailProviderElement
    extends AutoDisposeStreamProviderElement<Visit> with VisitDetailRef {
  _VisitDetailProviderElement(super.provider);

  @override
  int get id => (origin as VisitDetailProvider).id;
}

String _$visitListHash() => r'f6568e07a1351996aa415538fd0ea8fbf48fb214';

/// See also [visitList].
@ProviderFor(visitList)
final visitListProvider = AutoDisposeStreamProvider<List<Visit>>.internal(
  visitList,
  name: r'visitListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$visitListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VisitListRef = AutoDisposeStreamProviderRef<List<Visit>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
