part of 'expand_text_cubit.dart';

// sealed class ExpandTextState {
//   const ExpandTextState();
// }

// final class ExpandTextInitial extends ExpandTextState {}

// final class ExpandTextSuccess extends ExpandTextState {
//   final bool isExpended;
//   const ExpandTextSuccess({required this.isExpended});
// }

sealed class ExpandTextState extends Equatable {
  const ExpandTextState();

  @override
  List<Object> get props => [];
}

final class ExpandTextInitial extends ExpandTextState {}

final class ExpandTextSuccess extends ExpandTextState {
  final bool isExpended;
  const ExpandTextSuccess({required this.isExpended});
  @override
  List<Object> get props => [isExpended];
}
