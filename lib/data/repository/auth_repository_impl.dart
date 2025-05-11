import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/create_user_req.dart';
import 'package:spotify/data/models/sign_in_user_req.dart';
import 'package:spotify/data/sources/auth_firebase_service.dart';
import 'package:spotify/domain/repository/auth.dart';
import "../../service_locator.dart";

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SignInUserRequest signInUserReq) async {
    return await sl<AuthFirebaseService>().signIn(signInUserReq);
  }

  @override
  Future<Either> signUp(CreateUserRequest createUserReq) async {
    return await sl<AuthFirebaseService>().signUp(createUserReq);
  }
}
