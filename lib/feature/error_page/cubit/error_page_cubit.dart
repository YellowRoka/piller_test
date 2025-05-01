import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'error_page_state.dart';
part 'error_page_cubit.freezed.dart';

@injectable
class ErrorPageCubit extends Cubit<ErrorPageState> {
  ErrorPageCubit() : super(ErrorPageState.initial());
}
