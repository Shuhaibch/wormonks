
import 'dart:convert';

class UserModel {
    final UserDetails userDetails;
    final List<Role> roles;
    final List<Permission> permissions;

    UserModel({
        required this.userDetails,
        required this.roles,
        required this.permissions,
    });

    UserModel copyWith({
        UserDetails? userDetails,
        List<Role>? roles,
        List<Permission>? permissions,
    }) => 
        UserModel(
            userDetails: userDetails ?? this.userDetails,
            roles: roles ?? this.roles,
            permissions: permissions ?? this.permissions,
        );

    factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userDetails: UserDetails.fromJson(json["User Details"]),
        roles: List<Role>.from(json["Roles"].map((x) => Role.fromJson(x))),
        permissions: List<Permission>.from(json["Permissions"].map((x) => Permission.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "User Details": userDetails.toJson(),
        "Roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "Permissions": List<dynamic>.from(permissions.map((x) => x.toJson())),
    };
}

class Permission {
    final int id;
    final String name;
    final String slug;
    final String httpMethod;
    final String httpPath;
    final PermissionPivot pivot;

    Permission({
        required this.id,
        required this.name,
        required this.slug,
        required this.httpMethod,
        required this.httpPath,
        required this.pivot,
    });

    Permission copyWith({
        int? id,
        String? name,
        String? slug,
        String? httpMethod,
        String? httpPath,
        PermissionPivot? pivot,
    }) => 
        Permission(
            id: id ?? this.id,
            name: name ?? this.name,
            slug: slug ?? this.slug,
            httpMethod: httpMethod ?? this.httpMethod,
            httpPath: httpPath ?? this.httpPath,
            pivot: pivot ?? this.pivot,
        );

    factory Permission.fromRawJson(String str) => Permission.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        httpMethod: json["http_method"],
        httpPath: json["http_path"],
        pivot: PermissionPivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "http_method": httpMethod,
        "http_path": httpPath,
        "pivot": pivot.toJson(),
    };
}

class PermissionPivot {
    final String userId;
    final String permissionId;

    PermissionPivot({
        required this.userId,
        required this.permissionId,
    });

    PermissionPivot copyWith({
        String? userId,
        String? permissionId,
    }) => 
        PermissionPivot(
            userId: userId ?? this.userId,
            permissionId: permissionId ?? this.permissionId,
        );

    factory PermissionPivot.fromRawJson(String str) => PermissionPivot.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PermissionPivot.fromJson(Map<String, dynamic> json) => PermissionPivot(
        userId: json["user_id"],
        permissionId: json["permission_id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "permission_id": permissionId,
    };
}

class Role {
    final int id;
    final String name;
    final String slug;
    final RolePivot pivot;

    Role({
        required this.id,
        required this.name,
        required this.slug,
        required this.pivot,
    });

    Role copyWith({
        int? id,
        String? name,
        String? slug,
        RolePivot? pivot,
    }) => 
        Role(
            id: id ?? this.id,
            name: name ?? this.name,
            slug: slug ?? this.slug,
            pivot: pivot ?? this.pivot,
        );

    factory Role.fromRawJson(String str) => Role.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        pivot: RolePivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "pivot": pivot.toJson(),
    };
}

class RolePivot {
    final String userId;
    final String roleId;

    RolePivot({
        required this.userId,
        required this.roleId,
    });

    RolePivot copyWith({
        String? userId,
        String? roleId,
    }) => 
        RolePivot(
            userId: userId ?? this.userId,
            roleId: roleId ?? this.roleId,
        );

    factory RolePivot.fromRawJson(String str) => RolePivot.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RolePivot.fromJson(Map<String, dynamic> json) => RolePivot(
        userId: json["user_id"],
        roleId: json["role_id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "role_id": roleId,
    };
}

class UserDetails {
    final String id;
    final String username;
    final String password;
    final String name;
    final String phoneNumber;
    final String address;
    final dynamic avatar;
    final String token;
    final String rememberToken;
    final DateTime createdAt;
    final DateTime updatedAt;

    UserDetails({
        required this.id,
        required this.username,
        required this.password,
        required this.name,
        required this.phoneNumber,
        required this.address,
        required this.avatar,
        required this.token,
        required this.rememberToken,
        required this.createdAt,
        required this.updatedAt,
    });

    UserDetails copyWith({
        String? id,
        String? username,
        String? password,
        String? name,
        String? phoneNumber,
        String? address,
        dynamic avatar,
        String? token,
        String? rememberToken,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        UserDetails(
            id: id ?? this.id,
            username: username ?? this.username,
            password: password ?? this.password,
            name: name ?? this.name,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            address: address ?? this.address,
            avatar: avatar ?? this.avatar,
            token: token ?? this.token,
            rememberToken: rememberToken ?? this.rememberToken,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory UserDetails.fromRawJson(String str) => UserDetails.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        avatar: json["avatar"],
        token: json["token"],
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "name": name,
        "phone_number": phoneNumber,
        "address": address,
        "avatar": avatar,
        "token": token,
        "remember_token": rememberToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
