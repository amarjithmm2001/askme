
import 'package:askme/core/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:askme/features/chat/data/models/message.dart'; // Adjust path as needed

class GeminiProvider with ChangeNotifier {
  final List<Message> _messages = [];
  List<Message> get messages => _messages;

  Future<void> sendMessage(String prompt) async {
    _messages.add(Message(message: prompt, isUser: true));
    notifyListeners();
    final responseText = await _callGeminiModel(prompt);
    if (responseText != null) {
      _messages.add(Message(message: responseText, isUser: false));
      notifyListeners();
    }
  }

  Future<String?> _callGeminiModel(String prompt) async {
    final apiKey = apikey;
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
    );
    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);
    return response.text;
  }
}
