class Members {
  String? total;
  List<Rows>? rows;

  Members({this.total, this.rows});

  Members.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows?.add(Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total'] = total;
    if (rows != null) {
      data['rows'] = rows?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  String? sid;
  String? gid;
  String? gname;
  String? sname;
  String? fname;
  String? pinyin;
  String? abbr;
  String? tid;
  String? tname;
  String? pid;
  String? pname;
  String? nickname;
  String? company;
  String? joinDay;
  String? height;
  String? birthDay;
  String? starSign12;
  String? starSign48;
  String? birthPlace;
  String? speciality;
  String? hobby;
  String? experience;
  String? catchPhrase;
  String? weiboUid;
  String? weiboVerifier;
  String? bloodType;
  String? tiebaKw;
  String? status;
  String? ranking;
  String? pocketId;
  String? tcolor;
  String? gcolor;

  Rows(
      {this.sid,
      this.gid,
      this.gname,
      this.sname,
      this.fname,
      this.pinyin,
      this.abbr,
      this.tid,
      this.tname,
      this.pid,
      this.pname,
      this.nickname,
      this.company,
      this.joinDay,
      this.height,
      this.birthDay,
      this.starSign12,
      this.starSign48,
      this.birthPlace,
      this.speciality,
      this.hobby,
      this.experience,
      this.catchPhrase,
      this.weiboUid,
      this.weiboVerifier,
      this.bloodType,
      this.tiebaKw,
      this.status,
      this.ranking,
      this.pocketId,
      this.tcolor,
      this.gcolor});

  Rows.fromJson(Map<String, dynamic> json) {
    sid = json['sid'];
    gid = json['gid'];
    gname = json['gname'];
    sname = json['sname'];
    fname = json['fname'];
    pinyin = json['pinyin'];
    abbr = json['abbr'];
    tid = json['tid'];
    tname = json['tname'];
    pid = json['pid'];
    pname = json['pname'];
    nickname = json['nickname'];
    company = json['company'];
    joinDay = json['join_day'];
    height = json['height'];
    birthDay = json['birth_day'];
    starSign12 = json['star_sign_12'];
    starSign48 = json['star_sign_48'];
    birthPlace = json['birth_place'];
    speciality = json['speciality'];
    hobby = json['hobby'];
    experience = json['experience'];
    catchPhrase = json['catch_phrase'];
    weiboUid = json['weibo_uid'];
    weiboVerifier = json['weibo_verifier'];
    bloodType = json['blood_type'];
    tiebaKw = json['tieba_kw'];
    status = json['status'];
    ranking = json['ranking'];
    pocketId = json['pocket_id'];
    tcolor = json['tcolor'];
    gcolor = json['gcolor'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['sid'] = sid;
    data['gid'] = gid;
    data['gname'] = gname;
    data['sname'] = sname;
    data['fname'] = fname;
    data['pinyin'] = pinyin;
    data['abbr'] = abbr;
    data['tid'] = tid;
    data['tname'] = tname;
    data['pid'] = pid;
    data['pname'] = pname;
    data['nickname'] = nickname;
    data['company'] = company;
    data['join_day'] = joinDay;
    data['height'] = height;
    data['birth_day'] = birthDay;
    data['star_sign_12'] = starSign12;
    data['star_sign_48'] = starSign48;
    data['birth_place'] = birthPlace;
    data['speciality'] = speciality;
    data['hobby'] = hobby;
    data['experience'] = experience;
    data['catch_phrase'] = catchPhrase;
    data['weibo_uid'] = weiboUid;
    data['weibo_verifier'] = weiboVerifier;
    data['blood_type'] = bloodType;
    data['tieba_kw'] = tiebaKw;
    data['status'] = status;
    data['ranking'] = ranking;
    data['pocket_id'] = pocketId;
    data['tcolor'] = tcolor;
    data['gcolor'] = gcolor;
    return data;
  }
}
