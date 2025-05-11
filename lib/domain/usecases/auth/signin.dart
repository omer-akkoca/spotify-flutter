import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/sign_in_user_req.dart';
import 'package:spotify/domain/repository/auth.dart';
import "package:spotify/service_locator.dart";

class SignInUseCase implements UseCase<Either, SignInUserRequest> {
  @override
  Future<Either> call({SignInUserRequest? params}) {
    return sl<AuthRepository>().signIn(params!);
  }
}
