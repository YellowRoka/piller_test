import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:piller_test/data/repository/home_repository/home_repository.dart';
import 'package:piller_test/data/service/home_service/model/home_data_model.dart';
part 'details_page_state.dart';
part 'details_page_cubit.freezed.dart';

@injectable
class DetailsPageCubit extends Cubit<DetailsPageState> {
  final HomeRepository homeRepository;

  late StreamSubscription<HomeDataModel?> selectedDataSubscription;

  @override
  Future<void> close() {
    selectedDataSubscription.cancel();
    return super.close();
  }
  
  DetailsPageCubit(this.homeRepository) : super(DetailsPageState.initial()){
    selectedDataSubscription = homeRepository.selectedDataStream.listen(
      (data) {
        ( data == null )?
        emit( DetailsPageState.error() ):
        emit( DetailsPageState.update(data) );
      }
    );
  }
}
