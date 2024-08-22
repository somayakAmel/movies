import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'expand_text_state.dart';

class ExpandTextCubit extends Cubit<ExpandTextState> {
  ExpandTextCubit() : super(ExpandTextInitial());
  static ExpandTextCubit get(context) => BlocProvider.of(context);

  bool isExpended = false;

  void expandText() {
    isExpended = !isExpended;
    emit(ExpandTextSuccess(isExpended: isExpended));
  }

  void reset() {
    isExpended = false;
    emit(ExpandTextSuccess(isExpended: isExpended));
  }
}
