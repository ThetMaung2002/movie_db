import 'package:movie_db/data/vos/actor_vo/actor_vo.dart';

abstract class ActorApply {
  Future<List<ActorVo>?> getActor(int page);
}
