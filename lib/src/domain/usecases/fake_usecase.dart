import 'package:clean_block_api_dec22/src/core/usecaces/fake_usecase.dart';
import 'package:clean_block_api_dec22/src/data/respository/fake_repo.dart';
import 'package:clean_block_api_dec22/src/domain/entities/post_entity.dart';

class FakeUsecase extends UseCase {
  FakeRepo repo;
  FakeUsecase({required this.repo});

  @override
  Future<List<PostEntity>> call(params) async {
    final result = await repo.getPosts(params);
    return result;
  }
}
