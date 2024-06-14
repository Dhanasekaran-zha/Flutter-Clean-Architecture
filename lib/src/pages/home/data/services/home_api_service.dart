import 'package:dio/dio.dart';
import 'package:flutter_pokedex/src/constants/api_constants.dart';
import 'package:flutter_pokedex/src/pages/home/data/models/responses/pokemon_list_response/pokemon_response.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi()
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;


  @GET(ApiUrl.POKEMON_LIST)
  @FormUrlEncoded()
  Future<HttpResponse<PokemonResponse>> getPokemonList();
}
