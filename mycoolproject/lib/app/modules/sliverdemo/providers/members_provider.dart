import 'package:get/get.dart';

import '../members_model.dart';

class MembersProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Members.fromJson(map);
      if (map is List)
        return map.map((item) => Members.fromJson(item)).toList();
    };
    httpClient.baseUrl =
        'https://h5.48.cn/resource/jsonp/allmembers.php?gid=10';
  }

  Future<Members?> getMembers(int id) async {
    final response = await get('members/$id');
    return response.body;
  }

  Future<Response<Members>> postMembers(Members members) async =>
      await post('members', members);
  Future<Response> deleteMembers(int id) async => await delete('members/$id');
}
