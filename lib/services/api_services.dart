import 'dart:convert';
import 'package:mvvm_state_management/constants/api_constants.dart';
import 'package:http/http.dart' as https;
import 'package:mvvm_state_management/models/movies_genres.dart';
import 'package:mvvm_state_management/models/movies_modal.dart';

class ApiServices {
  Future<List<MoviesModal>> fetchMovies({int page = 1}) async {
    final url =
        "${ApiConstants.baseUrl}/movie/popular?language=en-US&page=$page";
    final response = await https
        .get(Uri.parse(url), headers: ApiConstants.header)
        .timeout(Duration(seconds: 10));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // log("data: $data");
      return List.from(
        data['results'].map((element) => MoviesModal.fromJson(element)),
      );
    } else {
      throw Exception("Failed to load movies ${response.statusCode}");
    }
  }

  Future<List<MoviesGenres>> fetchGenres() async {
    final url = Uri.parse(
      "${ApiConstants.baseUrl}/genre/movie/list?language=en/",
    );
    final response = await https
        .get(url, headers: ApiConstants.header)
        .timeout(Duration(seconds: 10));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List.from(
        data['genres'].map((element) => MoviesGenres.fromJson(element)),
      );
    } else {
      throw Exception("Failed to load genres ${response.statusCode}");
    }
  }
}
