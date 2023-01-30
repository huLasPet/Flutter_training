// Mocks generated by Mockito 5.3.2 from annotations
// in number_trivia/test/features/trivia/domain/use_cases/get_concrete_number_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:number_trivia/core/error/failures.dart' as _i5;
import 'package:number_trivia/features/trivia/domain/entities/number_trivia.dart'
    as _i6;

import 'get_concrete_number_test.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MockNumberTriviaRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMockNumberTriviaRepository extends _i1.Mock
    implements _i3.MockNumberTriviaRepository {
  MockMockNumberTriviaRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.NumberTrivia>> getConcreteNumber(
          int? number) =>
      (super.noSuchMethod(
        Invocation.method(
          #getConcreteNumber,
          [number],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.NumberTrivia>>.value(
                _FakeEither_0<_i5.Failure, _i6.NumberTrivia>(
          this,
          Invocation.method(
            #getConcreteNumber,
            [number],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.NumberTrivia>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.NumberTrivia>> getRandomNumber() =>
      (super.noSuchMethod(
        Invocation.method(
          #getRandomNumber,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.NumberTrivia>>.value(
                _FakeEither_0<_i5.Failure, _i6.NumberTrivia>(
          this,
          Invocation.method(
            #getRandomNumber,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.NumberTrivia>>);
}