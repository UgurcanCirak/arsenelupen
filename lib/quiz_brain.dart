import 'package:flutterproject/question.dart';
import 'package:flutter/material.dart';

class QuizBrain {
  int questionNumber = 0;
  List<Question> currentQuestionBank = [];

  // Soruları ayarla
  void setQuestions(List<Question> questions) {
    currentQuestionBank = questions;
    questionNumber = 0;
  }

  // Bir sonraki soruya geç
  void nextQuestion() {
    if (questionNumber < currentQuestionBank.length - 1) {
      questionNumber++;
    }
  }

  // Şu anki sorunun metnini al
  String getQuestionText() {
    if (currentQuestionBank.isEmpty || questionNumber >= currentQuestionBank.length) {
      return "No question available"; // Varsayılan bir mesaj
    }
    return currentQuestionBank[questionNumber].questionText;
  }

  // Şu anki sorunun doğru cevabını al
  bool getCorrectAnswer() {
    if (currentQuestionBank.isEmpty || questionNumber >= currentQuestionBank.length) {
      throw Exception("No valid question available."); // Hata fırlat
    }
    return currentQuestionBank[questionNumber].questionAnswer;
  }

  // Soru setinin bitip bitmediğini kontrol et
  bool isFinished() {
    return questionNumber > currentQuestionBank.length - 1;
  }

  // Soru setini sıfırla
  void reset() {
    questionNumber = 0;
  }
}
