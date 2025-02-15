import 'dart:convert';

class Account {
  final Avatar avatar;
  final int id;
  final String iso_639_1;
  final String iso_3166_1;
  final String name;
  final bool include_adult;
  final String username;
  Account({
    required this.avatar,
    required this.id,
    required this.iso_639_1,
    required this.iso_3166_1,
    required this.name,
    required this.include_adult,
    required this.username,
  });

  Account copyWith({
    Avatar? avatar,
    int? id,
    String? iso_639_1,
    String? iso_3166_1,
    String? name,
    bool? include_adult,
    String? username,
  }) {
    return Account(
      avatar: avatar ?? this.avatar,
      id: id ?? this.id,
      iso_639_1: iso_639_1 ?? this.iso_639_1,
      iso_3166_1: iso_3166_1 ?? this.iso_3166_1,
      name: name ?? this.name,
      include_adult: include_adult ?? this.include_adult,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'avatar': avatar.toMap(),
      'id': id,
      'iso_639_1': iso_639_1,
      'iso_3166_1': iso_3166_1,
      'name': name,
      'include_adult': include_adult,
      'username': username,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      avatar: Avatar.fromMap(map['avatar'] as Map<String, dynamic>),
      id: map['id'].toInt() as int,
      iso_639_1: map['iso_639_1'] as String,
      iso_3166_1: map['iso_3166_1'] as String,
      name: map['name'] as String,
      include_adult: map['include_adult'] as bool,
      username: map['username'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Account.empty() => Account(
        avatar:
            Avatar(gravatar: Gravatar(hash: ''), tmdb: Tmdb(avatar_path: '')),
        id: 0,
        iso_639_1: '',
        iso_3166_1: '',
        name: '',
        include_adult: false,
        username: '',
      );

  @override
  String toString() {
    return 'Account(avatar: $avatar, id: $id, iso_639_1: $iso_639_1, iso_3166_1: $iso_3166_1, name: $name, include_adult: $include_adult, username: $username)';
  }

  @override
  bool operator ==(covariant Account other) {
    if (identical(this, other)) return true;

    return other.avatar == avatar &&
        other.id == id &&
        other.iso_639_1 == iso_639_1 &&
        other.iso_3166_1 == iso_3166_1 &&
        other.name == name &&
        other.include_adult == include_adult &&
        other.username == username;
  }

  @override
  int get hashCode {
    return avatar.hashCode ^
        id.hashCode ^
        iso_639_1.hashCode ^
        iso_3166_1.hashCode ^
        name.hashCode ^
        include_adult.hashCode ^
        username.hashCode;
  }
}

class Avatar {
  final Gravatar gravatar;
  final Tmdb tmdb;
  Avatar({
    required this.gravatar,
    required this.tmdb,
  });

  Avatar copyWith({
    Gravatar? gravatar,
    Tmdb? tmdb,
  }) {
    return Avatar(
      gravatar: gravatar ?? this.gravatar,
      tmdb: tmdb ?? this.tmdb,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gravatar': gravatar.toMap(),
      'tmdb': tmdb.toMap(),
    };
  }

  factory Avatar.fromMap(Map<String, dynamic> map) {
    return Avatar(
      gravatar: Gravatar.fromMap(map['gravatar'] as Map<String, dynamic>),
      tmdb: Tmdb.fromMap(map['tmdb'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Avatar.fromJson(String source) =>
      Avatar.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Avatar(gravatar: $gravatar, tmdb: $tmdb)';

  @override
  bool operator ==(covariant Avatar other) {
    if (identical(this, other)) return true;

    return other.gravatar == gravatar && other.tmdb == tmdb;
  }

  @override
  int get hashCode => gravatar.hashCode ^ tmdb.hashCode;
}

class Gravatar {
  final String hash;
  Gravatar({
    required this.hash,
  });

  Gravatar copyWith({
    String? hash,
  }) {
    return Gravatar(
      hash: hash ?? this.hash,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hash': hash,
    };
  }

  factory Gravatar.fromMap(Map<String, dynamic> map) {
    return Gravatar(
      hash: map['hash'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Gravatar.fromJson(String source) =>
      Gravatar.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Gravatar(hash: $hash)';

  @override
  bool operator ==(covariant Gravatar other) {
    if (identical(this, other)) return true;

    return other.hash == hash;
  }

  @override
  int get hashCode => hash.hashCode;
}

class Tmdb {
  final String avatar_path;
  Tmdb({
    required this.avatar_path,
  });

  Tmdb copyWith({
    String? avatar_path,
  }) {
    return Tmdb(
      avatar_path: avatar_path ?? this.avatar_path,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'avatar_path': avatar_path,
    };
  }

  factory Tmdb.fromMap(Map<String, dynamic> map) {
    return Tmdb(
      avatar_path: map['avatar_path'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Tmdb.fromJson(String source) =>
      Tmdb.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Tmdb(avatar_path: $avatar_path)';

  @override
  bool operator ==(covariant Tmdb other) {
    if (identical(this, other)) return true;

    return other.avatar_path == avatar_path;
  }

  @override
  int get hashCode => avatar_path.hashCode;
}
