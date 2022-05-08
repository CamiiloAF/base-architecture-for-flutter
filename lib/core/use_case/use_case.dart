/// Abstract class for create use cases
///
/// [R] is for Response type
/// [P] is the type of param
abstract class UseCase<R, P> {
  R call(final P params);
}
