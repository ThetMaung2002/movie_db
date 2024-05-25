import 'package:movie_db/data/apply/actor_apply/actor_apply.dart';
import 'package:movie_db/data/vos/actor_vo/actor_vo.dart';
import 'package:movie_db/network/data_agent/actor_data_agent/actor_data_agent_impl.dart';

import '../../../network/data_agent/actor_data_agent/actor_data_agent.dart';

class ActorApplyImpl extends ActorApply {
  final ActorDataAgent dataAgent = ActorDataAgentImpl();

  ActorApplyImpl._();

  static final ActorApplyImpl _singleton = ActorApplyImpl._();

  factory ActorApplyImpl() => _singleton;

  @override
  Future<List<ActorVo>?> getActor(int page) =>
      dataAgent.getActor(page).then((value) {
        var temp = value;
        temp = temp?.map((e) {
          return e;
        }).toList();
        return temp;
      });
}
