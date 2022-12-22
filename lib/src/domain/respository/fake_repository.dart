import 'package:clean_block_api_dec22/src/domain/entities/post_entity.dart';

abstract class FakeRepository<T, P> {
  Future<List<PostEntity>> getPosts(int pageKey);
}
