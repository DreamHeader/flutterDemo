import 'package:get/get.dart';

import '../git_event_model.dart';

class GitEventProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return GitEvent.fromJson(map);
      if (map is List)
        return map.map((item) => GitEvent.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<GitEvent?> getGitEvent(int id) async {
    final response = await get('gitevent/$id');
    return response.body;
  }

  Future<Response<GitEvent>> postGitEvent(GitEvent gitevent) async =>
      await post('gitevent', gitevent);
  Future<Response> deleteGitEvent(int id) async => await delete('gitevent/$id');
}
