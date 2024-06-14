import 'package:dio/dio.dart';
import 'package:flutter_pokedex/src/constants/api_constants.dart';
import 'package:flutter_pokedex/src/pages/detail/data/models/responses/stats_response.dart';
import 'package:retrofit/retrofit.dart';

part 'detail_api_service.g.dart';

@RestApi(baseUrl: ApiUrl.BASE_URL)
abstract class DetailApiService {
  factory DetailApiService(Dio dio) = _DetailApiService;

  @GET(ApiUrl.POKEMON_STAT)
  Future<HttpResponse<StatsResponse>> getPokemonStats(@Path("pokemonId") int pokemonId);
}
