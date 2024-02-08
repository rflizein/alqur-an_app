import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ahlul_quran_app/Data/model/surah_model.dart';
import 'package:flutter_ahlul_quran_app/Data/service_api.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit(this.apiService) : super(SurahInitial());

  final ApiService apiService;

  void getAllSurah() async {
    emit(SurahLoading());
    final result = await apiService.getAllsurah();
    result.fold(
      (error) => emit(SurahError(message: error)),
      (r) => emit(SurahLoaded(listSurah: r)),
    );
  }
}
