import 'package:dio/dio.dart';
import 'package:movie_db/constants/api_constants.dart';
import 'package:movie_db/data/vos/actor_vo/actor_vo.dart';
import 'package:movie_db/network/data_agent/actor_data_agent/actor_data_agent.dart';

import '../../api/actor/actor_api.dart';

class ActorDataAgentImpl extends ActorDataAgent {
  late ActorApi _api;

  ActorDataAgentImpl._() {
    _api = ActorApi(Dio());
  }

  static final ActorDataAgentImpl _singleton = ActorDataAgentImpl._();

  factory ActorDataAgentImpl() => _singleton;

  @override
  Future<List<ActorVo>?> getActor(int page) => _api
      .getActor(kApiToken, page)
      .asStream()
      .map((event) => event.results)
      .first;
}
