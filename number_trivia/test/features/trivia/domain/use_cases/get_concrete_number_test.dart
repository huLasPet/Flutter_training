import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/features/trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia/features/trivia/domain/use_cases/get_concrete_number_trivia.dart';

import 'get_concrete_number_test.mocks.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

@GenerateMocks([MockNumberTriviaRepository])
void main() {
  late final GetConcreteNumberTrivia useCase;
  late final MockMockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockMockNumberTriviaRepository();
    useCase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(text: 'Test', number: 1);

  group('Successful tests:', () {
    test('Should get trivia for the number from the repository', () async {
// Arrange
      when(mockNumberTriviaRepository.getConcreteNumber(any))
          .thenAnswer((_) async => const Right(tNumberTrivia));

// Act
      final result = await useCase.execute(number: tNumber);

// Assert
      verify(mockNumberTriviaRepository.getConcreteNumber(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
      expect(result, const Right(tNumberTrivia));
    });
  });
}
