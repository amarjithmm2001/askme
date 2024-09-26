// lib/features/chat/presentation/widgets/chat_input_field.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:askme/core/providers/gemini_provider.dart';
import 'package:askme/core/error_handler.dart';

class ChatInputField extends StatefulWidget {

  const ChatInputField({super.key});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController _userMessageController = TextEditingController();

  void _sendMessage(BuildContext context) async {
    final text = _userMessageController.text;
    _userMessageController.clear();
    if (text.isNotEmpty) {
      final geminiProvider = Provider.of<GeminiProvider>(context, listen: false);
      try {
        await geminiProvider.sendMessage(text);
      } catch (e) {
        ErrorHandler.showError(context, 'Failed to send message.');
        ErrorHandler.logError(e.toString());
      }
    }
  }

  @override
  void dispose() {
    _userMessageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey
                : Colors.black54,
            blurRadius: 3.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: _userMessageController,
                  decoration: InputDecoration(
                    hintText: 'Type your message...',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.grey),
                    fillColor: const Color.fromARGB(255, 232, 224, 224),
                    filled: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15.0),
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.green,
              child: IconButton(
                icon: const Icon(Icons.send),
                color: Colors.white,
                onPressed: () => _sendMessage(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
