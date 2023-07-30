class GitEvent {
  String? id;
  String? type;
  Actor? actor;
  Repo? repo;
  Payload? payload;
  bool? public;
  String? createdAt;

  GitEvent(
      {this.id,
      this.type,
      this.actor,
      this.repo,
      this.payload,
      this.public,
      this.createdAt});

  GitEvent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    actor = json['actor'] != null ? Actor?.fromJson(json['actor']) : null;
    repo = json['repo'] != null ? Repo?.fromJson(json['repo']) : null;
    payload =
        json['payload'] != null ? Payload?.fromJson(json['payload']) : null;
    public = json['public'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    if (actor != null) {
      data['actor'] = actor?.toJson();
    }
    if (repo != null) {
      data['repo'] = repo?.toJson();
    }
    if (payload != null) {
      data['payload'] = payload?.toJson();
    }
    data['public'] = public;
    data['created_at'] = createdAt;
    return data;
  }
}

class Actor {
  int? id;
  String? login;
  String? displayLogin;
  String? gravatarId;
  String? url;
  String? avatarUrl;

  Actor(
      {this.id,
      this.login,
      this.displayLogin,
      this.gravatarId,
      this.url,
      this.avatarUrl});

  Actor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    displayLogin = json['display_login'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['login'] = login;
    data['display_login'] = displayLogin;
    data['gravatar_id'] = gravatarId;
    data['url'] = url;
    data['avatar_url'] = avatarUrl;
    return data;
  }
}

class Repo {
  int? id;
  String? name;
  String? url;

  Repo({this.id, this.name, this.url});

  Repo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Payload {
  int? repositoryId;
  int? pushId;
  int? size;
  int? distinctSize;
  String? ref;
  String? head;
  String? before;
  List<Commits>? commits;

  Payload(
      {this.repositoryId,
      this.pushId,
      this.size,
      this.distinctSize,
      this.ref,
      this.head,
      this.before,
      this.commits});

  Payload.fromJson(Map<String, dynamic> json) {
    repositoryId = json['repository_id'];
    pushId = json['push_id'];
    size = json['size'];
    distinctSize = json['distinct_size'];
    ref = json['ref'];
    head = json['head'];
    before = json['before'];
    if (json['commits'] != null) {
      commits = <Commits>[];
      json['commits'].forEach((v) {
        commits?.add(Commits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['repository_id'] = repositoryId;
    data['push_id'] = pushId;
    data['size'] = size;
    data['distinct_size'] = distinctSize;
    data['ref'] = ref;
    data['head'] = head;
    data['before'] = before;
    if (commits != null) {
      data['commits'] = commits?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Commits {
  String? sha;
  Author? author;
  String? message;
  bool? distinct;
  String? url;

  Commits({this.sha, this.author, this.message, this.distinct, this.url});

  Commits.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    author = json['author'] != null ? Author?.fromJson(json['author']) : null;
    message = json['message'];
    distinct = json['distinct'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['sha'] = sha;
    if (author != null) {
      data['author'] = author?.toJson();
    }
    data['message'] = message;
    data['distinct'] = distinct;
    data['url'] = url;
    return data;
  }
}

class Author {
  String? email;
  String? name;

  Author({this.email, this.name});

  Author.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    return data;
  }
}
