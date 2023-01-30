import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/error/failures.dart';
import 'package:number_trivia/features/trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  //This returns Either a Failure object or the NumberTrivia entity
  Future<Either<Failure, NumberTrivia>> getConcreteNumber(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumber();
}
