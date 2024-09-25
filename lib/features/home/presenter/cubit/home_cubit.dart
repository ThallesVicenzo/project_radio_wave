import 'package:radio_wave/core/utils/base_cubit.dart';
import 'package:radio_wave/features/home/domain/usecase/home_usecase.dart';
import 'package:radio_wave/features/home/presenter/cubit/home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit(this._usecase) : super(const HomeInitialState());

  final HomeUsecase _usecase;

  Future<void> getStationByUserCountry() async {
    emit(const HomeLoadingState());
    final result = await _usecase.requestStationByUserCountry();

    result.fold(
      (l) => emit(
        HomeErrorState(l),
      ),
      (r) => emit(HomeSuccessState(r)),
    );
  }
}
