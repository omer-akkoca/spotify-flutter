import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/create_user_req.dart';
import 'package:spotify/domain/repository/auth.dart';
import "package:spotify/service_locator.dart";

class SignUpUseCase implements UseCase<Either, CreateUserRequest> {
  @override
  Future<Either> call({CreateUserRequest? params}) {
    return sl<AuthRepository>().signUp(params!);
  }
}
