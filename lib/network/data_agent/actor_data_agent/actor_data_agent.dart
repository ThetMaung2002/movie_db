import 'package:movie_db/data/vos/actor_vo/actor_vo.dart';

abstract class ActorDataAgent {
  Future<List<ActorVo>?> getActor(int page);
}
