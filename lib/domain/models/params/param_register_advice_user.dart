import 'package:equatable/equatable.dart';

class ParamRegisterAdviceUser extends Equatable {
  final String name;
  final String address;
  final String email;
  final bool isMale;

  const ParamRegisterAdviceUser({
    this.name = '',
    this.address = '',
    this.email = '',
    this.isMale = true,
  });

  bool get isValid => name.isNotEmpty;

  ParamRegisterAdviceUser copyWith({
    String? name,
    String? address,
    String? email,
    bool? isMale,
  }) {
    return ParamRegisterAdviceUser(
      name: name ?? this.name,
      address: address ?? this.address,
      email: email ?? this.email,
      isMale: isMale ?? this.isMale,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'address': address,
      'email': email,
      // 'isMale': isMale,
    };
  }

  @override
  List<Object?> get props => [name, address, email, isMale];
}
