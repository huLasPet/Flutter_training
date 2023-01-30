import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/error/failures.dart';
import 'package:number_trivia/features/trivia/domain/repositories/number_trivia_repository.dart';

import '../entities/number_trivia.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;
  GetConcreteNumberTrivia(this.repository);
  Future<Either<Failure, NumberTrivia>> execute({required int number}) async {
    return await repository.getConcreteNumber(number);
  }
}
