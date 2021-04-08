import 'questions.dart';

class QuizBrain {
  int _questionNumber = 0;
  int _score = 0;
  int questionCount = 1;

  List<Question> _questionBank = [
    Question('New Delhi is the capital of India', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Android Studio is better than VS Code.', false),
    Question('A Octopus\'s blood is blue.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'F.R.I.E.N.D.S is the best T.V show in the history.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true)
  ];

  String getQuestionBank() {
    //Get the quetsions on the screen
    return _questionBank[_questionNumber].question;
  }

  void nextQuestion() {
    //For the next question
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool getAnswers() {
    //Get the Answers
    return _questionBank[_questionNumber].answer;
  }

  String getScore() {
    //Get the score on the screen
    return 'Score:$_score';
  }

  int scoreCounter() {
    //Increament the score
    return _score++;
  }

  String getQuestionCount() {
    return 'Question: $questionCount/10';
  }

  int checkQuestionCount() {
    if (_questionNumber <= _questionBank.length - 1) {
      return questionCount++;
    } else {
      return questionCount;
    }
  }

  bool isFinished() {
    //Check if the questions are finished
    if (_questionNumber >= _questionBank.length - 1) {
      print('returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    //Reset the score after the quiz
    _questionNumber = 0;
    _score = 0;
    questionCount = 0;
  }
}
