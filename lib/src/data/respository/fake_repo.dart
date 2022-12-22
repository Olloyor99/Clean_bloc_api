import 'package:clean_block_api_dec22/src/data/datasouce/remote/fake_api.dart';
import 'package:clean_block_api_dec22/src/domain/entities/post_entity.dart';
import 'package:clean_block_api_dec22/src/domain/respository/fake_repository.dart';

class FakeRepo extends FakeRepository {
  @override
   Future<List<PostEntity>> getPosts(int pageKey) async {
    final datas = await FakeApiS.fetchPost(pageKey);
    final posts = datas
        .map((e) => PostEntity(e.userId!, e.id!, e.title!, e.body!))
        .toList();
    return posts;
  }
}
