// ignore: file_names

class Users {
  final int? id;
  final String? name;
  final String? username;
  final String? mail;
  final String? password;
  final int? roleId;
  final bool? isActive;
  final String? createdAt;
  final String? updatedAt;
  final bool? isConnected;
  final String? lastLogin;
  final String? lastLogout;
  final int? failedAttempts;
  final String? lastAttempt;

  const Users({
    this.id,
    this.name,
    this.username,
    this.mail,
    this.password,
    this.roleId,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.isConnected,
    this.lastLogin,
    this.lastLogout,
    this.failedAttempts,
    this.lastAttempt,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'] as int?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      mail: json['mail'] as String?,
      password: json['password'] as String?,
      roleId: json['roleid'] as int?,
      isActive: json['isActive'] as bool?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      isConnected: json['isConnected'] as bool?,
      lastLogin: json['last_login'] as String?,
      lastLogout: json['last_logout'] as String?,
      failedAttempts: json['failed_attempts'] as int?,
      lastAttempt: json['last_attempt'] as String?,
    );
  }
}
