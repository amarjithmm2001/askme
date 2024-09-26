import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:askme/core/providers/gemini_provider.dart';
import 'package:askme/features/chat/presentation/widgets/my_drawer.dart';
import 'package:askme/features/chat/presentation/widgets/chat_input_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final geminiProvider = Provider.of<GeminiProvider>(context, listen: false);
      geminiProvider.addListener(_scrollToBottom);
    });
  }

  @override
  void dispose() {
    final geminiProvider = Provider.of<GeminiProvider>(context, listen: false);
    geminiProvider.removeListener(_scrollToBottom);
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final messages = Provider.of<GeminiProvider>(context).messages;

    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "AskMe.!",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final message = messages[index];
                      return ListTile(
                        title: Align(
                          alignment: message.isUser
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: message.isUser
                                  ? Colors.green
                                  : const Color.fromARGB(255, 232, 224, 224),
                              borderRadius: message.isUser
                                  ? const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    )
                                  : const BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                            ),
                            child: Text(
                              message.message,
                              style: TextStyle(
                                color: message.isUser
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: messages.length,
                  ),
                ),
              ],
            ),
          ),
          if (messages.isEmpty)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 160.0,
                    child: Image.asset(
                      "assets/images/AskMe_app_logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    "AskMe.!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    "Ask your any question .!",
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                  ),
                  const Text(
                    "A personal AI Assistant for help",
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 50.0),
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: ChatInputField(),
    );
  }
}
