import 'package:html_unescape/html_unescape.dart';

class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;


  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    // Decode options by combining incorrect answers with the correct answer and shuffling them.
    List<String> options = List<String>.from(json['incorrect_answers']);
    var unescape = HtmlUnescape();

    options.add(json['correct_answer']);
    options.shuffle();

    for(int i = 0; i < options.length; i++){
      options[i] = unescape.convert(options[i]);
    }

    return Question(
      question: unescape.convert(json['question']),
      options: options,
      correctAnswer: unescape.convert(json['correct_answer']),
    );
  }
}
