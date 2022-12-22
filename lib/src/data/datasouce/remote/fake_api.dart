import 'package:clean_block_api_dec22/src/data/dto/post_dto.dart';
import 'package:dio/dio.dart';

class FakeApiS {
  static Future<List<PostDto>> fetchPost(int pageKey) async {
    const limit = 10;
    final rerponse = await Dio().get('https://jsonplaceholder.typicode.com/posts?_limit=$limit&_start=${pageKey*limit}');
    final data = rerponse.data as List;
    List<PostDto> post = data.map((e) => PostDto.fromJson(e)).toList();
    return post;
  }
}
