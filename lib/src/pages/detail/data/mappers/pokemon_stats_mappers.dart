import 'package:flutter_pokedex/src/pages/detail/data/models/responses/stats_response.dart';
import 'package:flutter_pokedex/src/pages/detail/data/models/responses/stats_response_item.dart';
import 'package:flutter_pokedex/src/pages/detail/domain/entities/stat_item_entity.dart';
import 'package:flutter_pokedex/src/pages/detail/domain/entities/stats_entity.dart';

extension StatsModelExtensions on StatsResponse {
  StatsEntity toStatsEntity() {
    List<StatsResponseItem>? res = this.stats;
    List<StatItemEntity>? result = [];
    res?.forEach((item) {
      // print("DHANA MAPPER");
      // print(item);
      result.add(StatItemEntity(name: item.stat?.name, stat: item.base_stat));
    });
    print(StatsEntity(stats: result));
    return StatsEntity(stats: result);
  }
}
