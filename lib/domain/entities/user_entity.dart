import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{


  late final String uid;
  final String email;
  final String username;

  UserEntity({ this.uid="", required this.email, required this.username});

  @override

  List<Object?> get props => [uid,email,username];

}