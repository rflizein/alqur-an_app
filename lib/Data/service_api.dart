import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_ahlul_quran_app/Data/model/detail_surah.dart';
import 'package:flutter_ahlul_quran_app/Data/model/surah_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final http.Client client;
  ApiService({required this.client});

  Future<Either<String, List<SurahModel>>> getAllsurah() async {
    try {
      final response =
          await client.get(Uri.parse('https://equran.id/api/surat'));
      return Right(
        List<SurahModel>.from(jsonDecode(response.body).map(
          (x) => SurahModel.fromJson(x),
        )).toList(),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, DetailSurah>> getDetailSurah(int nomorSurah) async {
    try{
      final response = await client
      .get(Uri.parse('https://equran.id/api/surat/$nomorSurah'));
      return Right(DetailSurah.fromJson(jsonDecode(response.body)));
    }catch (e){
      return Left(e.toString());
    }
  }
}
