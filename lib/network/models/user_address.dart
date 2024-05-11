// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserAddress {

  final int id;
  final int userId;
  final String type;
  final String address;
  final String pincode;
  final String? alternativePhone;

  UserAddress({
    required this.id,
    required this.userId,
    required this.type,
    required this.address,
    required this.pincode,
    required this.alternativePhone,
  });

  UserAddress copyWith({
    int? id,
    int? userId,
    String? type,
    String? address,
    String? pincode,
    String? alternativePhone,
  }) {
    return UserAddress(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      address: address ?? this.address,
      pincode: pincode ?? this.pincode,
      alternativePhone: alternativePhone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'type': type,
      'address': address,
      'pincode': pincode,
      'alternative_phone': alternativePhone,
    };
  }

  factory UserAddress.fromMap(map) {
    return UserAddress(
      id: map['id'] as int,
      userId: map['user_id'] as int,
      type: map['type'] as String,
      address: map['address'] as String,
      pincode: map['pincode'] as String,
      alternativePhone: map['alternative_phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAddress.fromJson(String source) => UserAddress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserAddress(id: $id, userId: $userId, type: $type, address: $address, pincode: $pincode, alternativePhone: $alternativePhone)';
  }

  @override
  bool operator ==(covariant UserAddress other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.userId == userId &&
      other.type == type &&
      other.address == address &&
      other.pincode == pincode &&
      other.alternativePhone == alternativePhone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userId.hashCode ^
      type.hashCode ^
      address.hashCode ^
      pincode.hashCode ^
      alternativePhone.hashCode;
  }
}
