/// Use this for create your endpoints before send a http request
class PathUri {
  const PathUri({
    required this.context,
    required this.service,
  });

  final String context;
  final String service;

  /// [toString] returns the full endpoint
  @override
  String toString() => context + service;
}
