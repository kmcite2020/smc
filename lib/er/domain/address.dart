// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String country;
  final String province;
  final String city;
  final String area;
  const Address({
    this.country = '',
    this.province = '',
    this.city = '',
    this.area = '',
  });

  Address copyWith({
    String? country,
    String? province,
    String? city,
    String? area,
  }) {
    return Address(
      country: country ?? this.country,
      province: province ?? this.province,
      city: city ?? this.city,
      area: area ?? this.area,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'province': province,
      'city': city,
      'area': area,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      country: map['country'] as String,
      province: map['province'] as String,
      city: map['city'] as String,
      area: map['area'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [country, province, city, area];
}
